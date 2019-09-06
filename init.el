(require 'package)                                                                                       
(add-to-list 'package-archives                                                                           
             '("melpa" . "https://melpa.org/packages/") t)                                               
(package-initialize)                                                                                     
                                                                                                         
                                                                                                         
(custom-set-variables                                                                                    
 ;; custom-set-variables was added by Custom.                                                            
 ;; If you edit it by hand, you could mess it up, so be careful.                                         
 ;; Your init file should contain only one such instance.                                                
 ;; If there is more than one, they won't work right.                                                    
 '(package-selected-packages                                                                             
   (quote                                                                                                
    (highlight-parentheses color-theme-modern flycheck flycheck-rust lsp-mode toml-mode company rust-mod\
e))))                                                                                                    
(custom-set-faces                                                                                        
 ;; custom-set-faces was added by Custom.                                                                
 ;; If you edit it by hand, you could mess it up, so be careful.                                         
 ;; Your init file should contain only one such instance.                                                
 ;; If there is more than one, they won't work right.                                                    
 )                                                                                                       
                                                                                                         
;; Enable company globally for all mode                                                                  
(global-company-mode)                                                                                    
                                                                                                         
;; Reduce the time after which the company auto completion popup opens                                   
(setq company-idle-delay 0.2)                                                                            
                                                                                                         
;; Reduce the number of characters before company kicks in                                               
(setq company-minimum-prefix-length 2)                                                                   
                                                                                                         
(setq auto-save-default nil)                                                                             
                                                                                                         
(load-theme 'montz t)                                                                                    
                                                                                                         
(modify-syntax-entry ?_ "w")                                                                             
                                                                                                         
(defun my-comment-or-uncomment-region (beg end &optional arg)                                            
  (interactive (if (use-region-p)                                                                        
                   (list (region-beginning) (region-end) nil)                                            
                 (list (line-beginning-position)                                                         
                       (line-beginning-position 2))))                                                    
  (comment-or-uncomment-region beg end arg)                                                              
)                                                                                                        
;; (global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)                  
                                                                                                         
(global-set-key (kbd "C-x C-m") 'my-comment-or-uncomment-region)                                         

;; Highlight parentheses                                                                                 
(define-globalized-minor-mode global-highlight-parentheses-mode                                          
  highlight-parentheses-mode                                                                             
  (lambda ()                                                                                             
    (highlight-parentheses-mode t)))                                                                     
(global-highlight-parentheses-mode t)

(add-hook 'before-save-hook (lambda () (whitespace-cleanup)))
