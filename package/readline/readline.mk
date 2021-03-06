################################################################################
#
# readline
#
################################################################################

READLINE_VERSION = 6.3
READLINE_SITE = $(BR2_GNU_MIRROR)/readline
READLINE_INSTALL_STAGING = YES
READLINE_DEPENDENCIES = ncurses host-autoconf
READLINE_CONF_ENV = bash_cv_func_sigsetjmp=yes \
	bash_cv_wcwidth_broken=no
READLINE_LICENSE = GPLv3+
READLINE_LICENSE_FILES = COPYING

define READLINE_PURGE_EXAMPLES
	rm -rf $(TARGET_DIR)/usr/share/readline
endef

READLINE_POST_INSTALL_TARGET_HOOKS += READLINE_PURGE_EXAMPLES

$(eval $(autotools-package))
