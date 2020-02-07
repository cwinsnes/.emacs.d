;;; package --- Org mode transclusion
;;; Commentary:
;;; Code:
(defun org-dblock-write:transclusion (params)
  "Transclude a file into a dynamic block.
PARAMS must contain :filename and may contain :min and/or :max which specify which lines should be transcluded."
  (progn
    (with-temp-buffer
      (insert-file-contents (or (plist-get params :filename) (nth 1 params)))
      (let ((range-start (or (plist-get params :min) (line-number-at-pos (point-min))))
	    (range-end (or (plist-get params :max) (line-number-at-pos (point-max)))))
	(copy-region-as-kill (line-beginning-position range-start)
			     (line-end-position range-end))))
    (yank)))

(provide 'transclusion)
;;; transclusion.el ends here
