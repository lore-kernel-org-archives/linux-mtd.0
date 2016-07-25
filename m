Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRhQR-00071S-7z
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 15:04:19 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: richard@nod.at, computersforpeace@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 2/5] Integrate tests into autotools build system
Date: Mon, 25 Jul 2016 17:02:31 +0200
Message-Id: <20160725150234.5276-3-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
References: <20160725150234.5276-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add automake files for the test binaries. If configured to do so,
install the test binaries to libexec/mtd-utils and use autoconf to
fix the paths in the test scripts.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 Makefile.am                                        |  12 +-
 common.mk                                          |  91 ----
 configure.ac                                       |  38 ++
 m4/ax_pthread.m4                                   | 486 +++++++++++++++++++++
 nand-utils/Makemodule.am                           |  11 +
 tests/Makefile                                     |   8 -
 tests/checkfs/Makefile                             |   5 -
 tests/checkfs/Makemodule.am                        |  14 +
 tests/fs-tests/Makefile                            |   8 -
 tests/fs-tests/Makemodule.am                       |  81 ++++
 tests/fs-tests/{help_all.sh => fs_help_all.sh.in}  |  30 +-
 tests/fs-tests/fs_run_all.sh.in                    |  51 +++
 tests/fs-tests/integrity/Makefile                  |  31 --
 tests/fs-tests/lib/Makefile                        |  18 -
 tests/fs-tests/run_all.sh                          |  49 ---
 tests/fs-tests/simple/Makefile                     |  30 --
 tests/fs-tests/stress/Makefile                     |  11 -
 tests/fs-tests/stress/atoms/Makefile               |  40 --
 .../stress/{stress00.sh => fs_stress00.sh.in}      |  18 +-
 .../stress/{stress01.sh => fs_stress01.sh.in}      |  16 +-
 tests/fs-tests/utils/Makefile                      |  19 -
 tests/jittertest/Makefile                          |  46 --
 tests/jittertest/Makemodule.am                     |  19 +
 tests/ubi-tests/Makefile                           |  24 -
 tests/ubi-tests/Makefile.am                        |   7 -
 tests/ubi-tests/Makemodule.am                      |  60 +++
 tests/ubi-tests/{runtests.sh => runubitests.sh.in} |   8 +-
 .../{stress-test.sh => ubi-stress-test.sh.in}      |  13 +-
 28 files changed, 827 insertions(+), 417 deletions(-)
 delete mode 100644 common.mk
 create mode 100644 m4/ax_pthread.m4
 delete mode 100644 tests/Makefile
 delete mode 100644 tests/checkfs/Makefile
 create mode 100644 tests/checkfs/Makemodule.am
 delete mode 100644 tests/fs-tests/Makefile
 create mode 100644 tests/fs-tests/Makemodule.am
 rename tests/fs-tests/{help_all.sh => fs_help_all.sh.in} (73%)
 create mode 100755 tests/fs-tests/fs_run_all.sh.in
 delete mode 100644 tests/fs-tests/integrity/Makefile
 delete mode 100644 tests/fs-tests/lib/Makefile
 delete mode 100755 tests/fs-tests/run_all.sh
 delete mode 100644 tests/fs-tests/simple/Makefile
 delete mode 100644 tests/fs-tests/stress/Makefile
 delete mode 100644 tests/fs-tests/stress/atoms/Makefile
 rename tests/fs-tests/stress/{stress00.sh => fs_stress00.sh.in} (74%)
 rename tests/fs-tests/stress/{stress01.sh => fs_stress01.sh.in} (63%)
 delete mode 100644 tests/fs-tests/utils/Makefile
 delete mode 100644 tests/jittertest/Makefile
 create mode 100644 tests/jittertest/Makemodule.am
 delete mode 100644 tests/ubi-tests/Makefile
 delete mode 100644 tests/ubi-tests/Makefile.am
 create mode 100644 tests/ubi-tests/Makemodule.am
 rename tests/ubi-tests/{runtests.sh => runubitests.sh.in} (75%)
 rename tests/ubi-tests/{stress-test.sh => ubi-stress-test.sh.in} (94%)

diff --git a/Makefile.am b/Makefile.am
index 5d00227..de164fa 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -1,3 +1,5 @@
+ACLOCAL_AMFLAGS = -I m4
+
 AM_CPPFLAGS = -D_GNU_SOURCE -I$(top_srcdir)/include
 
 if WITHOUT_XATTR
@@ -12,6 +14,9 @@ sbin_PROGRAMS =
 sbin_SCRIPTS =
 noinst_LIBRARIES =
 noinst_PROGRAMS =
+noinst_SCRIPTS =
+pkglibexec_PROGRAMS =
+pkglibexec_SCRIPTS =
 man1_MANS =
 
 include lib/Makemodule.am
@@ -22,4 +27,9 @@ include nand-utils/Makemodule.am
 include nor-utils/Makemodule.am
 include jffsX-utils/Makemodule.am
 
-SUBDIRS = tests/ubi-tests
+if BUILD_TESTS
+include tests/ubi-tests/Makemodule.am
+include tests/jittertest/Makemodule.am
+include tests/checkfs/Makemodule.am
+include tests/fs-tests/Makemodule.am
+endif
diff --git a/common.mk b/common.mk
deleted file mode 100644
index 6bfe8de..0000000
--- a/common.mk
+++ /dev/null
@@ -1,91 +0,0 @@
-CC := $(CROSS)gcc
-AR := $(CROSS)ar
-RANLIB := $(CROSS)ranlib
-
-# Stolen from Linux build system
-comma = ,
-try-run = $(shell set -e; ($(1)) >/dev/null 2>&1 && echo "$(2)" || echo "$(3)")
-cc-option = $(call try-run, $(CC) $(1) -c -xc /dev/null -o /dev/null,$(1),$(2))
-
-CFLAGS ?= -O2 -g
-WFLAGS := -Wall \
-	$(call cc-option,-Wextra) \
-	$(call cc-option,-Wwrite-strings) \
-	$(call cc-option,-Wno-sign-compare)
-CFLAGS += $(WFLAGS)
-SECTION_CFLAGS := $(call cc-option,-ffunction-sections -fdata-sections -Wl$(comma)--gc-sections)
-CFLAGS += $(SECTION_CFLAGS)
-
-ifneq ($(WITHOUT_LARGEFILE), 1)
-  CPPFLAGS += -D_FILE_OFFSET_BITS=64
-endif
-
-DESTDIR?=
-PREFIX=/usr
-EXEC_PREFIX=$(PREFIX)
-SBINDIR=$(EXEC_PREFIX)/sbin
-MANDIR=$(PREFIX)/share/man
-INCLUDEDIR=$(PREFIX)/include
-
-ifndef BUILDDIR
-ifeq ($(origin CROSS),undefined)
-  BUILDDIR := $(CURDIR)
-else
-# Remove the trailing slash to make the directory name
-  BUILDDIR := $(CURDIR)/$(CROSS:-=)
-endif
-endif
-override BUILDDIR := $(patsubst %/,%,$(BUILDDIR))
-
-override TARGETS := $(addprefix $(BUILDDIR)/,$(TARGETS))
-
-ifeq ($(V),1)
-XECHO = @:
-XPRINTF = @:
-Q =
-else
-XECHO = @echo
-XPRINTF = @printf
-Q = @
-endif
-define BECHO
-$(XPRINTF) '  %-7s %s\n' "$1" "$(subst $(BUILDDIR)/,,$@)"
-endef
-
-all:: $(TARGETS)
-
-clean::
-	rm -f $(BUILDDIR)/*.o $(TARGETS) $(BUILDDIR)/.*.c.dep
-
-install:: $(TARGETS)
-
-define _mkdep
-$(BUILDDIR)/$1$2: $(addprefix $(BUILDDIR)/$1,$(obj-$2) $3) $(addprefix $(BUILDDIR)/,$4)
-endef
-define mkdep
-$(call _mkdep,$1,$2,$3 $2.o,$4 lib/libmtd.a)
-endef
-
-%: %.o $(LDDEPS)
-	$(call BECHO,LD)
-	$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))
-
-$(BUILDDIR)/%.a:
-	$(call BECHO,AR)
-	$(Q)$(AR) cr $@ $^
-	$(Q)$(RANLIB) $@
-
-$(BUILDDIR)/%.o: %.c $(OBJDEPS)
-ifneq ($(BUILDDIR),$(CURDIR))
-	$(Q)mkdir -p $(dir $@)
-endif
-	$(call BECHO,CC)
-	$(Q)$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $< -g -MMD -MF $(BUILDDIR)/.$(<F).dep
-
-.SUFFIXES:
-
-IGNORE=${wildcard $(BUILDDIR)/.*.c.dep}
--include ${IGNORE}
-
-PHONY += all clean install
-.PHONY: $(PHONY)
diff --git a/configure.ac b/configure.ac
index 37675b7..c6f558a 100644
--- a/configure.ac
+++ b/configure.ac
@@ -1,6 +1,7 @@
 AC_PREREQ([2.60])
 
 AC_INIT([mtd-utils], 1.5.2, [linux-mtd@lists.infradead.org], mtd-utils)
+AC_CONFIG_MACRO_DIRS([m4])
 AM_INIT_AUTOMAKE([foreign subdir-objects dist-bzip2])
 AM_SILENT_RULES([yes])
 AC_PROG_LIBTOOL
@@ -8,6 +9,43 @@ AC_DISABLE_STATIC
 AC_PROG_CC
 AC_PROG_INSTALL
 
+
+AC_ARG_ENABLE([tests],
+	[AS_HELP_STRING([--disable-tests], [Compile test programs])],
+	[case "${enableval}" in
+	yes) AM_CONDITIONAL([BUILD_TESTS], [true]) ;;
+	no)  AM_CONDITIONAL([BUILD_TESTS], [false]) ;;
+	*) AC_MSG_ERROR([bad value ${enableval} for --disable-tests]) ;;
+	esac],
+	[AM_CONDITIONAL([BUILD_TESTS], [true])])
+
+AM_COND_IF([BUILD_TESTS],
+	[AX_PTHREAD([], [AC_MSG_ERROR([pthread missing])])])
+
+
+AC_ARG_ENABLE([install-tests],
+	[AS_HELP_STRING([--enable-install-tests], [Install test programs])],
+	[case "${enableval}" in
+	yes) AM_CONDITIONAL([INSTALL_TESTS], [true]) ;;
+	no)  AM_CONDITIONAL([INSTALL_TESTS], [false]) ;;
+	*) AC_MSG_ERROR([bad value ${enableval} for --enable-install-tests]) ;;
+	esac],
+	[AM_CONDITIONAL([INSTALL_TESTS], [false])])
+
+
+AM_COND_IF([INSTALL_TESTS],
+	[AC_SUBST(testbindir, ["\$libexecpath"])],
+	[AC_SUBST(testbindir, ["\".\""])])
+
+
+AC_CONFIG_FILES([tests/fs-tests/fs_help_all.sh
+	tests/fs-tests/fs_run_all.sh
+	tests/fs-tests/stress/fs_stress00.sh
+	tests/fs-tests/stress/fs_stress01.sh
+	tests/ubi-tests/runubitests.sh
+	tests/ubi-tests/ubi-stress-test.sh])
+
+
 AC_ARG_WITH([xattr],
 	[AS_HELP_STRING([--without-xattr],
 		[Disable support forextended file attributes])],
diff --git a/m4/ax_pthread.m4 b/m4/ax_pthread.m4
new file mode 100644
index 0000000..82ce2b9
--- /dev/null
+++ b/m4/ax_pthread.m4
@@ -0,0 +1,486 @@
+# ===========================================================================
+#        http://www.gnu.org/software/autoconf-archive/ax_pthread.html
+# ===========================================================================
+#
+# SYNOPSIS
+#
+#   AX_PTHREAD([ACTION-IF-FOUND[, ACTION-IF-NOT-FOUND]])
+#
+# DESCRIPTION
+#
+#   This macro figures out how to build C programs using POSIX threads. It
+#   sets the PTHREAD_LIBS output variable to the threads library and linker
+#   flags, and the PTHREAD_CFLAGS output variable to any special C compiler
+#   flags that are needed. (The user can also force certain compiler
+#   flags/libs to be tested by setting these environment variables.)
+#
+#   Also sets PTHREAD_CC to any special C compiler that is needed for
+#   multi-threaded programs (defaults to the value of CC otherwise). (This
+#   is necessary on AIX to use the special cc_r compiler alias.)
+#
+#   NOTE: You are assumed to not only compile your program with these flags,
+#   but also to link with them as well. For example, you might link with
+#   $PTHREAD_CC $CFLAGS $PTHREAD_CFLAGS $LDFLAGS ... $PTHREAD_LIBS $LIBS
+#
+#   If you are only building threaded programs, you may wish to use these
+#   variables in your default LIBS, CFLAGS, and CC:
+#
+#     LIBS="$PTHREAD_LIBS $LIBS"
+#     CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+#     CC="$PTHREAD_CC"
+#
+#   In addition, if the PTHREAD_CREATE_JOINABLE thread-attribute constant
+#   has a nonstandard name, this macro defines PTHREAD_CREATE_JOINABLE to
+#   that name (e.g. PTHREAD_CREATE_UNDETACHED on AIX).
+#
+#   Also HAVE_PTHREAD_PRIO_INHERIT is defined if pthread is found and the
+#   PTHREAD_PRIO_INHERIT symbol is defined when compiling with
+#   PTHREAD_CFLAGS.
+#
+#   ACTION-IF-FOUND is a list of shell commands to run if a threads library
+#   is found, and ACTION-IF-NOT-FOUND is a list of commands to run it if it
+#   is not found. If ACTION-IF-FOUND is not specified, the default action
+#   will define HAVE_PTHREAD.
+#
+#   Please let the authors know if this macro fails on any platform, or if
+#   you have any other suggestions or comments. This macro was based on work
+#   by SGJ on autoconf scripts for FFTW (http://www.fftw.org/) (with help
+#   from M. Frigo), as well as ac_pthread and hb_pthread macros posted by
+#   Alejandro Forero Cuervo to the autoconf macro repository. We are also
+#   grateful for the helpful feedback of numerous users.
+#
+#   Updated for Autoconf 2.68 by Daniel Richard G.
+#
+# LICENSE
+#
+#   Copyright (c) 2008 Steven G. Johnson <stevenj@alum.mit.edu>
+#   Copyright (c) 2011 Daniel Richard G. <skunk@iSKUNK.ORG>
+#
+#   This program is free software: you can redistribute it and/or modify it
+#   under the terms of the GNU General Public License as published by the
+#   Free Software Foundation, either version 3 of the License, or (at your
+#   option) any later version.
+#
+#   This program is distributed in the hope that it will be useful, but
+#   WITHOUT ANY WARRANTY; without even the implied warranty of
+#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
+#   Public License for more details.
+#
+#   You should have received a copy of the GNU General Public License along
+#   with this program. If not, see <http://www.gnu.org/licenses/>.
+#
+#   As a special exception, the respective Autoconf Macro's copyright owner
+#   gives unlimited permission to copy, distribute and modify the configure
+#   scripts that are the output of Autoconf when processing the Macro. You
+#   need not follow the terms of the GNU General Public License when using
+#   or distributing such scripts, even though portions of the text of the
+#   Macro appear in them. The GNU General Public License (GPL) does govern
+#   all other use of the material that constitutes the Autoconf Macro.
+#
+#   This special exception to the GPL applies to versions of the Autoconf
+#   Macro released by the Autoconf Archive. When you make and distribute a
+#   modified version of the Autoconf Macro, you may extend this special
+#   exception to the GPL to apply to your modified version as well.
+
+#serial 23
+
+AU_ALIAS([ACX_PTHREAD], [AX_PTHREAD])
+AC_DEFUN([AX_PTHREAD], [
+AC_REQUIRE([AC_CANONICAL_HOST])
+AC_REQUIRE([AC_PROG_CC])
+AC_REQUIRE([AC_PROG_SED])
+AC_LANG_PUSH([C])
+ax_pthread_ok=no
+
+# We used to check for pthread.h first, but this fails if pthread.h
+# requires special compiler flags (e.g. on Tru64 or Sequent).
+# It gets checked for in the link test anyway.
+
+# First of all, check if the user has set any of the PTHREAD_LIBS,
+# etcetera environment variables, and if threads linking works using
+# them:
+if test "x$PTHREAD_CFLAGS$PTHREAD_LIBS" != "x"; then
+        ax_pthread_save_CC="$CC"
+        ax_pthread_save_CFLAGS="$CFLAGS"
+        ax_pthread_save_LIBS="$LIBS"
+        AS_IF([test "x$PTHREAD_CC" != "x"], [CC="$PTHREAD_CC"])
+        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+        LIBS="$PTHREAD_LIBS $LIBS"
+        AC_MSG_CHECKING([for pthread_join using $CC $PTHREAD_CFLAGS $PTHREAD_LIBS])
+        AC_LINK_IFELSE([AC_LANG_CALL([], [pthread_join])], [ax_pthread_ok=yes])
+        AC_MSG_RESULT([$ax_pthread_ok])
+        if test "x$ax_pthread_ok" = "xno"; then
+                PTHREAD_LIBS=""
+                PTHREAD_CFLAGS=""
+        fi
+        CC="$ax_pthread_save_CC"
+        CFLAGS="$ax_pthread_save_CFLAGS"
+        LIBS="$ax_pthread_save_LIBS"
+fi
+
+# We must check for the threads library under a number of different
+# names; the ordering is very important because some systems
+# (e.g. DEC) have both -lpthread and -lpthreads, where one of the
+# libraries is broken (non-POSIX).
+
+# Create a list of thread flags to try.  Items starting with a "-" are
+# C compiler flags, and other items are library names, except for "none"
+# which indicates that we try without any flags at all, and "pthread-config"
+# which is a program returning the flags for the Pth emulation library.
+
+ax_pthread_flags="pthreads none -Kthread -pthread -pthreads -mthreads pthread --thread-safe -mt pthread-config"
+
+# The ordering *is* (sometimes) important.  Some notes on the
+# individual items follow:
+
+# pthreads: AIX (must check this before -lpthread)
+# none: in case threads are in libc; should be tried before -Kthread and
+#       other compiler flags to prevent continual compiler warnings
+# -Kthread: Sequent (threads in libc, but -Kthread needed for pthread.h)
+# -pthread: Linux/gcc (kernel threads), BSD/gcc (userland threads), Tru64
+#           (Note: HP C rejects this with "bad form for `-t' option")
+# -pthreads: Solaris/gcc (Note: HP C also rejects)
+# -mt: Sun Workshop C (may only link SunOS threads [-lthread], but it
+#      doesn't hurt to check since this sometimes defines pthreads and
+#      -D_REENTRANT too), HP C (must be checked before -lpthread, which
+#      is present but should not be used directly; and before -mthreads,
+#      because the compiler interprets this as "-mt" + "-hreads")
+# -mthreads: Mingw32/gcc, Lynx/gcc
+# pthread: Linux, etcetera
+# --thread-safe: KAI C++
+# pthread-config: use pthread-config program (for GNU Pth library)
+
+case $host_os in
+
+        freebsd*)
+
+        # -kthread: FreeBSD kernel threads (preferred to -pthread since SMP-able)
+        # lthread: LinuxThreads port on FreeBSD (also preferred to -pthread)
+
+        ax_pthread_flags="-kthread lthread $ax_pthread_flags"
+        ;;
+
+        hpux*)
+
+        # From the cc(1) man page: "[-mt] Sets various -D flags to enable
+        # multi-threading and also sets -lpthread."
+
+        ax_pthread_flags="-mt -pthread pthread $ax_pthread_flags"
+        ;;
+
+        openedition*)
+
+        # IBM z/OS requires a feature-test macro to be defined in order to
+        # enable POSIX threads at all, so give the user a hint if this is
+        # not set. (We don't define these ourselves, as they can affect
+        # other portions of the system API in unpredictable ways.)
+
+        AC_EGREP_CPP([AX_PTHREAD_ZOS_MISSING],
+            [
+#            if !defined(_OPEN_THREADS) && !defined(_UNIX03_THREADS)
+             AX_PTHREAD_ZOS_MISSING
+#            endif
+            ],
+            [AC_MSG_WARN([IBM z/OS requires -D_OPEN_THREADS or -D_UNIX03_THREADS to enable pthreads support.])])
+        ;;
+
+        solaris*)
+
+        # On Solaris (at least, for some versions), libc contains stubbed
+        # (non-functional) versions of the pthreads routines, so link-based
+        # tests will erroneously succeed. (N.B.: The stubs are missing
+        # pthread_cleanup_push, or rather a function called by this macro,
+        # so we could check for that, but who knows whether they'll stub
+        # that too in a future libc.)  So we'll check first for the
+        # standard Solaris way of linking pthreads (-mt -lpthread).
+
+        ax_pthread_flags="-mt,pthread pthread $ax_pthread_flags"
+        ;;
+esac
+
+# GCC generally uses -pthread, or -pthreads on some platforms (e.g. SPARC)
+
+AS_IF([test "x$GCC" = "xyes"],
+      [ax_pthread_flags="-pthread -pthreads $ax_pthread_flags"])
+
+# The presence of a feature test macro requesting re-entrant function
+# definitions is, on some systems, a strong hint that pthreads support is
+# correctly enabled
+
+case $host_os in
+        darwin* | hpux* | linux* | osf* | solaris*)
+        ax_pthread_check_macro="_REENTRANT"
+        ;;
+
+        aix*)
+        ax_pthread_check_macro="_THREAD_SAFE"
+        ;;
+
+        *)
+        ax_pthread_check_macro="--"
+        ;;
+esac
+AS_IF([test "x$ax_pthread_check_macro" = "x--"],
+      [ax_pthread_check_cond=0],
+      [ax_pthread_check_cond="!defined($ax_pthread_check_macro)"])
+
+# Are we compiling with Clang?
+
+AC_CACHE_CHECK([whether $CC is Clang],
+    [ax_cv_PTHREAD_CLANG],
+    [ax_cv_PTHREAD_CLANG=no
+     # Note that Autoconf sets GCC=yes for Clang as well as GCC
+     if test "x$GCC" = "xyes"; then
+        AC_EGREP_CPP([AX_PTHREAD_CC_IS_CLANG],
+            [/* Note: Clang 2.7 lacks __clang_[a-z]+__ */
+#            if defined(__clang__) && defined(__llvm__)
+             AX_PTHREAD_CC_IS_CLANG
+#            endif
+            ],
+            [ax_cv_PTHREAD_CLANG=yes])
+     fi
+    ])
+ax_pthread_clang="$ax_cv_PTHREAD_CLANG"
+
+ax_pthread_clang_warning=no
+
+# Clang needs special handling, because older versions handle the -pthread
+# option in a rather... idiosyncratic way
+
+if test "x$ax_pthread_clang" = "xyes"; then
+
+        # Clang takes -pthread; it has never supported any other flag
+
+        # (Note 1: This will need to be revisited if a system that Clang
+        # supports has POSIX threads in a separate library.  This tends not
+        # to be the way of modern systems, but it's conceivable.)
+
+        # (Note 2: On some systems, notably Darwin, -pthread is not needed
+        # to get POSIX threads support; the API is always present and
+        # active.  We could reasonably leave PTHREAD_CFLAGS empty.  But
+        # -pthread does define _REENTRANT, and while the Darwin headers
+        # ignore this macro, third-party headers might not.)
+
+        PTHREAD_CFLAGS="-pthread"
+        PTHREAD_LIBS=
+
+        ax_pthread_ok=yes
+
+        # However, older versions of Clang make a point of warning the user
+        # that, in an invocation where only linking and no compilation is
+        # taking place, the -pthread option has no effect ("argument unused
+        # during compilation").  They expect -pthread to be passed in only
+        # when source code is being compiled.
+        #
+        # Problem is, this is at odds with the way Automake and most other
+        # C build frameworks function, which is that the same flags used in
+        # compilation (CFLAGS) are also used in linking.  Many systems
+        # supported by AX_PTHREAD require exactly this for POSIX threads
+        # support, and in fact it is often not straightforward to specify a
+        # flag that is used only in the compilation phase and not in
+        # linking.  Such a scenario is extremely rare in practice.
+        #
+        # Even though use of the -pthread flag in linking would only print
+        # a warning, this can be a nuisance for well-run software projects
+        # that build with -Werror.  So if the active version of Clang has
+        # this misfeature, we search for an option to squash it.
+
+        AC_CACHE_CHECK([whether Clang needs flag to prevent "argument unused" warning when linking with -pthread],
+            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG],
+            [ax_cv_PTHREAD_CLANG_NO_WARN_FLAG=unknown
+             # Create an alternate version of $ac_link that compiles and
+             # links in two steps (.c -> .o, .o -> exe) instead of one
+             # (.c -> exe), because the warning occurs only in the second
+             # step
+             ax_pthread_save_ac_link="$ac_link"
+             ax_pthread_sed='s/conftest\.\$ac_ext/conftest.$ac_objext/g'
+             ax_pthread_link_step=`$as_echo "$ac_link" | sed "$ax_pthread_sed"`
+             ax_pthread_2step_ac_link="($ac_compile) && (echo ==== >&5) && ($ax_pthread_link_step)"
+             ax_pthread_save_CFLAGS="$CFLAGS"
+             for ax_pthread_try in '' -Qunused-arguments -Wno-unused-command-line-argument unknown; do
+                AS_IF([test "x$ax_pthread_try" = "xunknown"], [break])
+                CFLAGS="-Werror -Wunknown-warning-option $ax_pthread_try -pthread $ax_pthread_save_CFLAGS"
+                ac_link="$ax_pthread_save_ac_link"
+                AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
+                    [ac_link="$ax_pthread_2step_ac_link"
+                     AC_LINK_IFELSE([AC_LANG_SOURCE([[int main(void){return 0;}]])],
+                         [break])
+                    ])
+             done
+             ac_link="$ax_pthread_save_ac_link"
+             CFLAGS="$ax_pthread_save_CFLAGS"
+             AS_IF([test "x$ax_pthread_try" = "x"], [ax_pthread_try=no])
+             ax_cv_PTHREAD_CLANG_NO_WARN_FLAG="$ax_pthread_try"
+            ])
+
+        case "$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG" in
+                no | unknown) ;;
+                *) PTHREAD_CFLAGS="$ax_cv_PTHREAD_CLANG_NO_WARN_FLAG $PTHREAD_CFLAGS" ;;
+        esac
+
+fi # $ax_pthread_clang = yes
+
+if test "x$ax_pthread_ok" = "xno"; then
+for ax_pthread_try_flag in $ax_pthread_flags; do
+
+        case $ax_pthread_try_flag in
+                none)
+                AC_MSG_CHECKING([whether pthreads work without any flags])
+                ;;
+
+                -mt,pthread)
+                AC_MSG_CHECKING([whether pthreads work with -mt -lpthread])
+                PTHREAD_CFLAGS="-mt"
+                PTHREAD_LIBS="-lpthread"
+                ;;
+
+                -*)
+                AC_MSG_CHECKING([whether pthreads work with $ax_pthread_try_flag])
+                PTHREAD_CFLAGS="$ax_pthread_try_flag"
+                ;;
+
+                pthread-config)
+                AC_CHECK_PROG([ax_pthread_config], [pthread-config], [yes], [no])
+                AS_IF([test "x$ax_pthread_config" = "xno"], [continue])
+                PTHREAD_CFLAGS="`pthread-config --cflags`"
+                PTHREAD_LIBS="`pthread-config --ldflags` `pthread-config --libs`"
+                ;;
+
+                *)
+                AC_MSG_CHECKING([for the pthreads library -l$ax_pthread_try_flag])
+                PTHREAD_LIBS="-l$ax_pthread_try_flag"
+                ;;
+        esac
+
+        ax_pthread_save_CFLAGS="$CFLAGS"
+        ax_pthread_save_LIBS="$LIBS"
+        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+        LIBS="$PTHREAD_LIBS $LIBS"
+
+        # Check for various functions.  We must include pthread.h,
+        # since some functions may be macros.  (On the Sequent, we
+        # need a special flag -Kthread to make this header compile.)
+        # We check for pthread_join because it is in -lpthread on IRIX
+        # while pthread_create is in libc.  We check for pthread_attr_init
+        # due to DEC craziness with -lpthreads.  We check for
+        # pthread_cleanup_push because it is one of the few pthread
+        # functions on Solaris that doesn't have a non-functional libc stub.
+        # We try pthread_create on general principles.
+
+        AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>
+#                       if $ax_pthread_check_cond
+#                        error "$ax_pthread_check_macro must be defined"
+#                       endif
+                        static void routine(void *a) { a = 0; }
+                        static void *start_routine(void *a) { return a; }],
+                       [pthread_t th; pthread_attr_t attr;
+                        pthread_create(&th, 0, start_routine, 0);
+                        pthread_join(th, 0);
+                        pthread_attr_init(&attr);
+                        pthread_cleanup_push(routine, 0);
+                        pthread_cleanup_pop(0) /* ; */])],
+            [ax_pthread_ok=yes],
+            [])
+
+        CFLAGS="$ax_pthread_save_CFLAGS"
+        LIBS="$ax_pthread_save_LIBS"
+
+        AC_MSG_RESULT([$ax_pthread_ok])
+        AS_IF([test "x$ax_pthread_ok" = "xyes"], [break])
+
+        PTHREAD_LIBS=""
+        PTHREAD_CFLAGS=""
+done
+fi
+
+# Various other checks:
+if test "x$ax_pthread_ok" = "xyes"; then
+        ax_pthread_save_CFLAGS="$CFLAGS"
+        ax_pthread_save_LIBS="$LIBS"
+        CFLAGS="$CFLAGS $PTHREAD_CFLAGS"
+        LIBS="$PTHREAD_LIBS $LIBS"
+
+        # Detect AIX lossage: JOINABLE attribute is called UNDETACHED.
+        AC_CACHE_CHECK([for joinable pthread attribute],
+            [ax_cv_PTHREAD_JOINABLE_ATTR],
+            [ax_cv_PTHREAD_JOINABLE_ATTR=unknown
+             for ax_pthread_attr in PTHREAD_CREATE_JOINABLE PTHREAD_CREATE_UNDETACHED; do
+                 AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pthread.h>],
+                                                 [int attr = $ax_pthread_attr; return attr /* ; */])],
+                                [ax_cv_PTHREAD_JOINABLE_ATTR=$ax_pthread_attr; break],
+                                [])
+             done
+            ])
+        AS_IF([test "x$ax_cv_PTHREAD_JOINABLE_ATTR" != "xunknown" && \
+               test "x$ax_cv_PTHREAD_JOINABLE_ATTR" != "xPTHREAD_CREATE_JOINABLE" && \
+               test "x$ax_pthread_joinable_attr_defined" != "xyes"],
+              [AC_DEFINE_UNQUOTED([PTHREAD_CREATE_JOINABLE],
+                                  [$ax_cv_PTHREAD_JOINABLE_ATTR],
+                                  [Define to necessary symbol if this constant
+                                   uses a non-standard name on your system.])
+               ax_pthread_joinable_attr_defined=yes
+              ])
+
+        AC_CACHE_CHECK([whether more special flags are required for pthreads],
+            [ax_cv_PTHREAD_SPECIAL_FLAGS],
+            [ax_cv_PTHREAD_SPECIAL_FLAGS=no
+             case $host_os in
+             solaris*)
+             ax_cv_PTHREAD_SPECIAL_FLAGS="-D_POSIX_PTHREAD_SEMANTICS"
+             ;;
+             esac
+            ])
+        AS_IF([test "x$ax_cv_PTHREAD_SPECIAL_FLAGS" != "xno" && \
+               test "x$ax_pthread_special_flags_added" != "xyes"],
+              [PTHREAD_CFLAGS="$ax_cv_PTHREAD_SPECIAL_FLAGS $PTHREAD_CFLAGS"
+               ax_pthread_special_flags_added=yes])
+
+        AC_CACHE_CHECK([for PTHREAD_PRIO_INHERIT],
+            [ax_cv_PTHREAD_PRIO_INHERIT],
+            [AC_LINK_IFELSE([AC_LANG_PROGRAM([[#include <pthread.h>]],
+                                             [[int i = PTHREAD_PRIO_INHERIT;]])],
+                            [ax_cv_PTHREAD_PRIO_INHERIT=yes],
+                            [ax_cv_PTHREAD_PRIO_INHERIT=no])
+            ])
+        AS_IF([test "x$ax_cv_PTHREAD_PRIO_INHERIT" = "xyes" && \
+               test "x$ax_pthread_prio_inherit_defined" != "xyes"],
+              [AC_DEFINE([HAVE_PTHREAD_PRIO_INHERIT], [1], [Have PTHREAD_PRIO_INHERIT.])
+               ax_pthread_prio_inherit_defined=yes
+              ])
+
+        CFLAGS="$ax_pthread_save_CFLAGS"
+        LIBS="$ax_pthread_save_LIBS"
+
+        # More AIX lossage: compile with *_r variant
+        if test "x$GCC" != "xyes"; then
+            case $host_os in
+                aix*)
+                AS_CASE(["x/$CC"],
+                    [x*/c89|x*/c89_128|x*/c99|x*/c99_128|x*/cc|x*/cc128|x*/xlc|x*/xlc_v6|x*/xlc128|x*/xlc128_v6],
+                    [#handle absolute path differently from PATH based program lookup
+                     AS_CASE(["x$CC"],
+                         [x/*],
+                         [AS_IF([AS_EXECUTABLE_P([${CC}_r])],[PTHREAD_CC="${CC}_r"])],
+                         [AC_CHECK_PROGS([PTHREAD_CC],[${CC}_r],[$CC])])])
+                ;;
+            esac
+        fi
+fi
+
+test -n "$PTHREAD_CC" || PTHREAD_CC="$CC"
+
+AC_SUBST([PTHREAD_LIBS])
+AC_SUBST([PTHREAD_CFLAGS])
+AC_SUBST([PTHREAD_CC])
+
+# Finally, execute ACTION-IF-FOUND/ACTION-IF-NOT-FOUND:
+if test "x$ax_pthread_ok" = "xyes"; then
+        ifelse([$1],,[AC_DEFINE([HAVE_PTHREAD],[1],[Define if you have POSIX threads libraries and header files.])],[$1])
+        :
+else
+        ax_pthread_ok=no
+        $2
+fi
+AC_LANG_POP
+])dnl AX_PTHREAD
+
diff --git a/nand-utils/Makemodule.am b/nand-utils/Makemodule.am
index 2ef5abd..2ceadde 100644
--- a/nand-utils/Makemodule.am
+++ b/nand-utils/Makemodule.am
@@ -16,4 +16,15 @@ nftl_format_LDADD = libmtd.a
 NAND_BINS = \
 	nanddump nandwrite nandtest nftldump nftl_format
 
+NAND_SH = \
+	nand-utils/load_nandsim.sh
+
 sbin_PROGRAMS += $(NAND_BINS)
+
+if BUILD_TESTS
+if INSTALL_TESTS
+pkglibexec_SCRIPTS += $(NAND_SH)
+else
+noinst_SCRIPTS += $(NAND_SH)
+endif
+endif
diff --git a/tests/Makefile b/tests/Makefile
deleted file mode 100644
index 05b37e9..0000000
--- a/tests/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-
-SUBDIRS = checkfs fs-tests jittertest ubi-tests
-
-all clean tests: $(SUBDIRS)
-
-.PHONY: $(SUBDIRS)
-$(SUBDIRS):
-	$(MAKE) -C $@ $(MAKECMDGOALS)
diff --git a/tests/checkfs/Makefile b/tests/checkfs/Makefile
deleted file mode 100644
index 14a83d4..0000000
--- a/tests/checkfs/Makefile
+++ /dev/null
@@ -1,5 +0,0 @@
-TARGETS = checkfs makefiles
-
-include ../../common.mk
-
-$(TARGETS): $(addprefix $(BUILDDIR)/, comm.o)
diff --git a/tests/checkfs/Makemodule.am b/tests/checkfs/Makemodule.am
new file mode 100644
index 0000000..d0ec2b3
--- /dev/null
+++ b/tests/checkfs/Makemodule.am
@@ -0,0 +1,14 @@
+checkfs_SOURCES = tests/checkfs/checkfs.c tests/checkfs/comm.c
+checkfs_CPPFLAGS = $(AM_CPPFLAGS)
+
+makefiles_SOURCES = tests/checkfs/makefiles.c tests/checkfs/comm.c
+makefiles_CPPFLAGS = $(AM_CPPFLAGS)
+
+CHECKFS_BINS = \
+	makefiles checkfs
+
+if INSTALL_TESTS
+pkglibexec_PROGRAMS += $(CHECKFS_BINS)
+else
+noinst_PROGRAMS += $(CHECKFS_BINS)
+endif
diff --git a/tests/fs-tests/Makefile b/tests/fs-tests/Makefile
deleted file mode 100644
index d188796..0000000
--- a/tests/fs-tests/Makefile
+++ /dev/null
@@ -1,8 +0,0 @@
-
-SUBDIRS = lib simple stress integrity utils
-
-all clean tests: $(SUBDIRS)
-
-.PHONY: $(SUBDIRS)
-$(SUBDIRS):
-	$(MAKE) -C $@ $(MAKECMDGOALS)
diff --git a/tests/fs-tests/Makemodule.am b/tests/fs-tests/Makemodule.am
new file mode 100644
index 0000000..0426c78
--- /dev/null
+++ b/tests/fs-tests/Makemodule.am
@@ -0,0 +1,81 @@
+integck_SOURCES = tests/fs-tests/integrity/integck.c
+integck_LDADD = libubi.a
+integck_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+test_1_SOURCES = tests/fs-tests/simple/test_1.c tests/fs-tests/lib/tests.c
+test_1_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+test_2_SOURCES = tests/fs-tests/simple/test_2.c tests/fs-tests/lib/tests.c
+test_2_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+ftrunc_SOURCES = tests/fs-tests/simple/ftrunc.c tests/fs-tests/lib/tests.c
+ftrunc_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+perf_SOURCES = tests/fs-tests/simple/perf.c tests/fs-tests/lib/tests.c
+perf_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+orph_SOURCES = tests/fs-tests/simple/orph.c tests/fs-tests/lib/tests.c
+orph_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+stress_1_SOURCES = tests/fs-tests/stress/atoms/stress_1.c
+stress_1_SOURCES += tests/fs-tests/lib/tests.c
+stress_1_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+stress_2_SOURCES = tests/fs-tests/stress/atoms/stress_2.c
+stress_2_SOURCES += tests/fs-tests/lib/tests.c
+stress_2_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+stress_3_SOURCES = tests/fs-tests/stress/atoms/stress_3.c
+stress_3_SOURCES += tests/fs-tests/lib/tests.c
+stress_3_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+pdfrun_SOURCES = tests/fs-tests/stress/atoms/pdfrun.c
+pdfrun_SOURCES += tests/fs-tests/lib/tests.c
+pdfrun_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+rndwrite00_SOURCES = tests/fs-tests/stress/atoms/rndwrite00.c
+rndwrite00_SOURCES += tests/fs-tests/lib/tests.c
+rndwrite00_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+fwrite00_SOURCES = tests/fs-tests/stress/atoms/fwrite00.c
+fwrite00_SOURCES += tests/fs-tests/lib/tests.c
+fwrite00_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+rmdir00_SOURCES = tests/fs-tests/stress/atoms/rmdir00.c
+rmdir00_SOURCES += tests/fs-tests/lib/tests.c
+rmdir00_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+rndrm00_SOURCES = tests/fs-tests/stress/atoms/rndrm00.c
+rndrm00_SOURCES += tests/fs-tests/lib/tests.c
+rndrm00_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+rndrm99_SOURCES = tests/fs-tests/stress/atoms/rndrm99.c
+rndrm99_SOURCES += tests/fs-tests/lib/tests.c
+rndrm99_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+gcd_hupper_SOURCES = tests/fs-tests/stress/atoms/gcd_hupper.c
+gcd_hupper_SOURCES += tests/fs-tests/lib/tests.c
+gcd_hupper_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/tests/fs-tests/lib
+
+fstest_monitor_SOURCES = tests/fs-tests/utils/fstest_monitor.c
+
+free_space_SOURCES = tests/fs-tests/utils/free_space.c
+
+FSTEST_BINS = \
+	integck test_1 test_2 ftrunc perf orph \
+	stress_1 stress_2 stress_3 pdfrun gcd_hupper \
+	rndwrite00 fwrite00 rmdir00 rndrm00 rndrm99 \
+	fstest_monitor free_space
+
+FSTEST_SH = \
+	tests/fs-tests/fs_help_all.sh tests/fs-tests/fs_run_all.sh \
+	tests/fs-tests/stress/fs_stress00.sh \
+	tests/fs-tests/stress/fs_stress01.sh
+
+if INSTALL_TESTS
+pkglibexec_SCRIPTS += $(FSTEST_SH)
+pkglibexec_PROGRAMS += $(FSTEST_BINS)
+else
+noinst_SCRIPTS += $(FSTEST_SH)
+noinst_PROGRAMS += $(FSTEST_BINS)
+endif
diff --git a/tests/fs-tests/help_all.sh b/tests/fs-tests/fs_help_all.sh.in
similarity index 73%
rename from tests/fs-tests/help_all.sh
rename to tests/fs-tests/fs_help_all.sh.in
index 34b890b..39219b2 100755
--- a/tests/fs-tests/help_all.sh
+++ b/tests/fs-tests/fs_help_all.sh.in
@@ -1,27 +1,33 @@
 #!/bin/sh
 
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
+
 echo -------------------------------------------------------------------------------
-./simple/test_1 -h
+$TESTBINDIR/test_1 -h
 echo -------------------------------------------------------------------------------
-./simple/test_2 -h
+$TESTBINDIR/test_2 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/stress_1 -h
+$TESTBINDIR/stress_1 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/stress_2 -h
+$TESTBINDIR/stress_2 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/stress_3 -h
+$TESTBINDIR/stress_3 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/fwrite00 -h
+$TESTBINDIR/fwrite00 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/gcd_hupper -h
+$TESTBINDIR/gcd_hupper -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/pdfrun -h
+$TESTBINDIR/pdfrun -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/rmdir00 -h
+$TESTBINDIR/rmdir00 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/rndrm00 -h
+$TESTBINDIR/rndrm00 -h
 echo -------------------------------------------------------------------------------
-./stress/atoms/rndwrite00 -h
+$TESTBINDIR/rndwrite00 -h
 echo -------------------------------------------------------------------------------
-./integrity/integck -h
+$TESTBINDIR/integck -h
 echo -------------------------------------------------------------------------------
diff --git a/tests/fs-tests/fs_run_all.sh.in b/tests/fs-tests/fs_run_all.sh.in
new file mode 100755
index 0000000..a3676f9
--- /dev/null
+++ b/tests/fs-tests/fs_run_all.sh.in
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
+
+TEST_DIR=$TEST_FILE_SYSTEM_MOUNT_DIR
+if test -z "$TEST_DIR";
+then
+	TEST_DIR="/mnt/test_file_system"
+fi
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/test_1 || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/test_2 || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/integck $TEST_DIR || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/rndrm00 -z0 || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/rmdir00 -z0 || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/stress_1 -z10000000 -e || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/stress_2 -z10000000 || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/stress_3 -z1000000000 -e || exit 1
+
+rm -rf ${TEST_DIR}/*
+
+$TESTBINDIR/fs_stress00.sh 360 || exit 1
+
+$TESTBINDIR/fs_stress01.sh 360 || exit 1
diff --git a/tests/fs-tests/integrity/Makefile b/tests/fs-tests/integrity/Makefile
deleted file mode 100644
index b64bad9..0000000
--- a/tests/fs-tests/integrity/Makefile
+++ /dev/null
@@ -1,31 +0,0 @@
-
-ifeq ($(origin CC),default)
-CC = gcc
-endif
-
-COMMON_HEADERS_DIR := ../../../include
-LIBUBI_PATH = ../../../ubi-utils/
-LIBUBI_HEADER_PATH = $(LIBUBI_PATH)/include
-
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I$(COMMON_HEADERS_DIR) -I$(LIBUBI_HEADER_PATH)
-
-LDFLAGS := $(LDFLAGS)
-
-TARGETS = integck
-
-all: $(TARGETS)
-
-# Compile ubilib
-libubi.a:
-	$(CC) $(CFLAGS) -c $(LIBUBI_PATH)/libubi.c -o libubi.o
-	$(AR) cr libubi.a libubi.o
-
-$(TARGETS): libubi.a
-
-# Disable optimizations to make it possible to use gdb comfortably
-# Use -rdynamic to have stack backtraces
-debug: libubi.a
-	$(CC) $(CFLAGS) -O0 -D INTEGCK_DEBUG -rdynamic integck.c libubi.a -o integck
-
-clean:
-	rm -f *.o $(TARGETS) libubi.a
diff --git a/tests/fs-tests/lib/Makefile b/tests/fs-tests/lib/Makefile
deleted file mode 100644
index 8d57824..0000000
--- a/tests/fs-tests/lib/Makefile
+++ /dev/null
@@ -1,18 +0,0 @@
-
-ifeq ($(origin CC),default)
-CC = gcc
-endif
-
-CFLAGS := $(CFLAGS) -Wall -g -O2
-
-LDFLAGS := $(LDFLAGS)
-
-all: tests.o
-
-tests.o: tests.h
-
-clean:
-	rm -f *.o
-
-tests:
-	echo
diff --git a/tests/fs-tests/run_all.sh b/tests/fs-tests/run_all.sh
deleted file mode 100755
index 7c82f9a..0000000
--- a/tests/fs-tests/run_all.sh
+++ /dev/null
@@ -1,49 +0,0 @@
-#!/bin/sh
-
-TEST_DIR=$TEST_FILE_SYSTEM_MOUNT_DIR
-if test -z "$TEST_DIR";
-then
-	TEST_DIR="/mnt/test_file_system"
-fi
-
-rm -rf ${TEST_DIR}/*
-
-./simple/test_1 || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./simple/test_2 || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./integrity/integck $TEST_DIR || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./stress/atoms/rndrm00 -z0 || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./stress/atoms/rmdir00 -z0 || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./stress/atoms/stress_1 -z10000000 -e || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./stress/atoms/stress_2 -z10000000 || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-./stress/atoms/stress_3 -z1000000000 -e || exit 1
-
-rm -rf ${TEST_DIR}/*
-
-cd stress || exit 1
-
-./stress00.sh 360 || exit 1
-
-./stress01.sh 360 || exit 1
-
-cd .. || exit 1
diff --git a/tests/fs-tests/simple/Makefile b/tests/fs-tests/simple/Makefile
deleted file mode 100644
index d447da3..0000000
--- a/tests/fs-tests/simple/Makefile
+++ /dev/null
@@ -1,30 +0,0 @@
-
-ifeq ($(origin CC),default)
-CC = gcc
-endif
-
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I../lib
-
-LDFLAGS := $(LDFLAGS)
-
-TARGETS = test_1 \
-	test_2 \
-	ftrunc \
-	orph \
-	perf
-
-all: $(TARGETS)
-
-$(TARGETS): ../lib/tests.o
-
-../lib/tests.o: ../lib/tests.h
-
-clean:
-	rm -f *.o $(TARGETS)
-
-tests: all
-	./test_1 --sync
-	./test_2 --sync
-	./ftrunc
-	./orph --sync
-	./perf
diff --git a/tests/fs-tests/stress/Makefile b/tests/fs-tests/stress/Makefile
deleted file mode 100644
index c24ff3f..0000000
--- a/tests/fs-tests/stress/Makefile
+++ /dev/null
@@ -1,11 +0,0 @@
-
-SUBDIRS = atoms
-
-all tests: $(SUBDIRS)
-
-clean: $(SUBDIRS)
-	rm -rf run_pdf_test_file_*
-
-.PHONY: $(SUBDIRS)
-$(SUBDIRS):
-	$(MAKE) -C $@ $(MAKECMDGOALS)
diff --git a/tests/fs-tests/stress/atoms/Makefile b/tests/fs-tests/stress/atoms/Makefile
deleted file mode 100644
index 9fbfd39..0000000
--- a/tests/fs-tests/stress/atoms/Makefile
+++ /dev/null
@@ -1,40 +0,0 @@
-
-ifeq ($(origin CC),default)
-CC = gcc
-endif
-
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I../../lib
-
-LDFLAGS := $(LDFLAGS)
-
-TARGETS = stress_1 \
-	stress_2 \
-	stress_3 \
-	pdfrun \
-	rndwrite00 \
-	fwrite00 \
-	rmdir00 \
-	rndrm00 \
-	rndrm99 \
-	gcd_hupper
-
-all: $(TARGETS)
-
-$(TARGETS): ../../lib/tests.o
-
-../lib/tests.o: ../../lib/tests.h
-
-clean:
-	rm -f *.o $(TARGETS) run_pdf_test_file
-
-tests: all
-	./stress_1 -e
-	./stress_2
-	./stress_3 -e
-	./pdfrun
-	./rndwrite00 -e
-	./fwrite00
-	./rmdir00
-	./rndrm00
-	./rndrm99
-	./gcd_hupper
diff --git a/tests/fs-tests/stress/stress00.sh b/tests/fs-tests/stress/fs_stress00.sh.in
similarity index 74%
rename from tests/fs-tests/stress/stress00.sh
rename to tests/fs-tests/stress/fs_stress00.sh.in
index 60f8c0d..85ec7a2 100755
--- a/tests/fs-tests/stress/stress00.sh
+++ b/tests/fs-tests/stress/fs_stress00.sh.in
@@ -1,12 +1,18 @@
 #!/bin/sh
 
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
+
 TEST_DIR=$TEST_FILE_SYSTEM_MOUNT_DIR
 if test -z "$TEST_DIR";
 then
 	TEST_DIR="/mnt/test_file_system"
 fi
 
-FREESPACE=`../utils/free_space "$TEST_DIR"`
+FREESPACE=`$TESTBINDIR/free_space "$TEST_DIR"`
 
 if test -z "$FREESPACE";
 then
@@ -21,13 +27,13 @@ else
 	DURATION="";
 fi
 
-FWRITE00=atoms/fwrite00
-RNDWR=atoms/rndwrite00
-GCHUP=atoms/gcd_hupper
-PDFLUSH=atoms/pdfrun
+FWRITE00=$TESTBINDIR/fwrite00
+RNDWR=$TESTBINDIR/rndwrite00
+GCHUP=$TESTBINDIR/gcd_hupper
+PDFLUSH=$TESTBINDIR/pdfrun
 FSIZE=$(( $FREESPACE/15 ));
 
-../utils/fstest_monitor $DURATION \
+$TESTBINDIR/fstest_monitor $DURATION \
 "$FWRITE00 -z $FSIZE -n0 -p 20" \
 "$FWRITE00 -z $FSIZE -n0 -p 10 -s" \
 "$FWRITE00 -z $FSIZE -n0 -p 20 -u" \
diff --git a/tests/fs-tests/stress/stress01.sh b/tests/fs-tests/stress/fs_stress01.sh.in
similarity index 63%
rename from tests/fs-tests/stress/stress01.sh
rename to tests/fs-tests/stress/fs_stress01.sh.in
index 5913c1c..d0ea8f9 100755
--- a/tests/fs-tests/stress/stress01.sh
+++ b/tests/fs-tests/stress/fs_stress01.sh.in
@@ -1,12 +1,18 @@
 #!/bin/sh
 
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
+
 TEST_DIR=$TEST_FILE_SYSTEM_MOUNT_DIR
 if test -z "$TEST_DIR";
 then
 	TEST_DIR="/mnt/test_file_system"
 fi
 
-FREESPACE=`../utils/free_space "$TEST_DIR"`
+FREESPACE=`$TESTBINDIR/free_space "$TEST_DIR"`
 
 if test -z "$FREESPACE";
 then
@@ -21,12 +27,12 @@ else
 	DURATION="";
 fi
 
-FWRITE00=atoms/fwrite00
-RNDWR=atoms/rndwrite00
-PDFLUSH=atoms/pdfrun
+FWRITE00=$TESTBINDIR/fwrite00
+RNDWR=$TESTBINDIR/rndwrite00
+PDFLUSH=$TESTBINDIR/pdfrun
 FSIZE=$(( $FREESPACE/15 ));
 
-../utils/fstest_monitor $DURATION \
+$TESTBINDIR/fstest_monitor $DURATION \
 "$FWRITE00 -z $FSIZE -n0 -p 300" \
 "$FWRITE00 -z $FSIZE -n0 -u" \
 "$FWRITE00 -z $FSIZE -n0 -u -c" \
diff --git a/tests/fs-tests/utils/Makefile b/tests/fs-tests/utils/Makefile
deleted file mode 100644
index 9fb60b5..0000000
--- a/tests/fs-tests/utils/Makefile
+++ /dev/null
@@ -1,19 +0,0 @@
-
-ifeq ($(origin CC),default)
-CC = gcc
-endif
-
-CFLAGS := $(CFLAGS) -Wall -g -O2 -I../lib
-
-LDFLAGS := $(LDFLAGS)
-
-TARGETS = fstest_monitor free_space
-
-all: $(TARGETS)
-
-clean:
-	rm -f *.o $(TARGETS)
-
-tests: all
-	./fstest_monitor
-	./free_space > /dev/null
diff --git a/tests/jittertest/Makefile b/tests/jittertest/Makefile
deleted file mode 100644
index 0209c63..0000000
--- a/tests/jittertest/Makefile
+++ /dev/null
@@ -1,46 +0,0 @@
-CC=gcc
-# uncomment following for performance
-CCFLAGS=-O3 -Wall -fomit-frame-pointer
-
-# uncomment following for debugging. Uncomment either this or the one above. Not both.
-# CCFLAGS=-Wall -g
-
-
-all: JitterTest plotJittervsFill
-
-JitterTest: JitterTest.c Makefile
-	 gcc $(CCFLAGS) -lm JitterTest.c -o JitterTest
-
-plotJittervsFill: plotJittervsFill.c Makefile
-	 gcc $(CCFLAGS) plotJittervsFill.c -o plotJittervsFill
-
-clean:
-	 rm -rf *~
-	 rm -rf core
-	 rm -rf *.o
-	 rm -rf JitterTest
-
-
-dep:
-	makedepend -I./ *.c
-# DO NOT DELETE
-
-JitterTest.o: /usr/include/stdio.h /usr/include/features.h
-JitterTest.o: /usr/include/sys/cdefs.h /usr/include/gnu/stubs.h
-JitterTest.o: /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/include/stddef.h
-JitterTest.o: /usr/lib/gcc-lib/i386-redhat-linux/egcs-2.91.66/include/stdarg.h
-JitterTest.o: /usr/include/bits/types.h /usr/include/libio.h
-JitterTest.o: /usr/include/_G_config.h /usr/include/bits/stdio_lim.h
-JitterTest.o: /usr/include/string.h /usr/include/stdlib.h
-JitterTest.o: /usr/include/sys/types.h /usr/include/time.h
-JitterTest.o: /usr/include/endian.h /usr/include/bits/endian.h
-JitterTest.o: /usr/include/sys/select.h /usr/include/bits/select.h
-JitterTest.o: /usr/include/bits/sigset.h /usr/include/sys/sysmacros.h
-JitterTest.o: /usr/include/alloca.h /usr/include/sys/time.h
-JitterTest.o: /usr/include/bits/time.h /usr/include/signal.h
-JitterTest.o: /usr/include/bits/signum.h /usr/include/bits/siginfo.h
-JitterTest.o: /usr/include/bits/sigaction.h /usr/include/bits/sigcontext.h
-JitterTest.o: /usr/include/asm/sigcontext.h /usr/include/bits/sigstack.h
-JitterTest.o: /usr/include/sched.h /usr/include/bits/sched.h
-JitterTest.o: /usr/include/unistd.h /usr/include/bits/posix_opt.h
-JitterTest.o: /usr/include/bits/confname.h /usr/include/getopt.h
diff --git a/tests/jittertest/Makemodule.am b/tests/jittertest/Makemodule.am
new file mode 100644
index 0000000..93d711c
--- /dev/null
+++ b/tests/jittertest/Makemodule.am
@@ -0,0 +1,19 @@
+JitterTest_SOURCES = tests/jittertest/JitterTest.c
+JitterTest_CPPFLAGS = $(AM_CPPFLAGS)
+
+plotJittervsFill_SOURCES = tests/jittertest/plotJittervsFill.c
+plotJittervsFill_CPPFLAGS = $(AM_CPPFLAGS)
+
+JITTEREST_BINS = \
+	JitterTest plotJittervsFill
+
+JITTERTEST_SH = \
+	tests/jittertest/filljffs2.sh
+
+if INSTALL_TESTS
+pkglibexec_SCRIPTS += $(JITTERTEST_SH)
+pkglibexec_PROGRAMS += $(JITTEREST_BINS)
+else
+noinst_SCRIPTS += $(JITTERTEST_SH)
+noinst_PROGRAMS += $(JITTEREST_BINS)
+endif
diff --git a/tests/ubi-tests/Makefile b/tests/ubi-tests/Makefile
deleted file mode 100644
index c434a6f..0000000
--- a/tests/ubi-tests/Makefile
+++ /dev/null
@@ -1,24 +0,0 @@
-LIBUBI_PATH = ../../ubi-utils/
-LIBUBI_HEADER_PATH = $(LIBUBI_PATH)/include
-UBIUTILS_PATH=../../ubi-utils/
-
-KERNELHDR := ../../include
-
-LIBS = libubi
-TARGETS=io_update volrefcnt integ io_paral io_read io_basic \
-          mkvol_basic mkvol_bad mkvol_paral rsvol
-
-CFLAGS += -I$(LIBUBI_HEADER_PATH) -I $(KERNELHDR)
-LDLIBS += -lpthread
-
-include ../../common.mk
-
-# Compile ubilib with the udevsettle hack
-libubi.a: $(LIBUBI_PATH)/libubi.c  $(LIBUBI_HEADER_PATH)/libubi.h  $(LIBUBI_PATH)/libubi_int.h
-	$(CC) $(CFLAGS) -I $(LIBUBI_PATH) -I../../include -DUDEV_SETTLE_HACK -c $(LIBUBI_PATH)/libubi.c -o libubi.o
-	ar cr libubi.a libubi.o
-
-$(TARGETS): $(addprefix $(BUILDDIR)/, helpers.o) libubi.a
-
-clean::
-	rm -f libubi.a
diff --git a/tests/ubi-tests/Makefile.am b/tests/ubi-tests/Makefile.am
deleted file mode 100644
index d57316a..0000000
--- a/tests/ubi-tests/Makefile.am
+++ /dev/null
@@ -1,7 +0,0 @@
-io_basic_SOURCES = io_basic.c helpers.c
-io_basic_LDADD = libmtd.a libubi.a
-io_basic_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
-
-UBITEST_BINS = io_basic
-
-noinst_PROGRAMS += $(UBITEST_BINS)
diff --git a/tests/ubi-tests/Makemodule.am b/tests/ubi-tests/Makemodule.am
new file mode 100644
index 0000000..bc0171c
--- /dev/null
+++ b/tests/ubi-tests/Makemodule.am
@@ -0,0 +1,60 @@
+io_basic_SOURCES = tests/ubi-tests/io_basic.c tests/ubi-tests/helpers.c
+io_basic_LDADD = libubi.a
+io_basic_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+io_update_SOURCES = tests/ubi-tests/io_update.c tests/ubi-tests/helpers.c
+io_update_LDADD = libubi.a
+io_update_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+io_paral_SOURCES = tests/ubi-tests/io_paral.c tests/ubi-tests/helpers.c
+io_paral_LDADD = libubi.a $(PTHREAD_LIBS)
+io_paral_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+io_paral_LDADD += $(PTHREAD_CFLAGS)
+io_paral_CPPFLAGS += $(PTHREAD_CFLAGS)
+
+io_read_SOURCES = tests/ubi-tests/io_read.c tests/ubi-tests/helpers.c
+io_read_LDADD = libubi.a
+io_read_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+volrefcnt_SOURCES = tests/ubi-tests/volrefcnt.c tests/ubi-tests/helpers.c
+volrefcnt_LDADD = libubi.a
+volrefcnt_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+integ_SOURCES = tests/ubi-tests/integ.c tests/ubi-tests/helpers.c
+integ_LDADD = libubi.a
+integ_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+mkvol_basic_SOURCES = tests/ubi-tests/mkvol_basic.c tests/ubi-tests/helpers.c
+mkvol_basic_LDADD = libubi.a
+mkvol_basic_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+mkvol_bad_SOURCES = tests/ubi-tests/mkvol_bad.c tests/ubi-tests/helpers.c
+mkvol_bad_LDADD = libubi.a
+mkvol_bad_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+mkvol_paral_SOURCES = tests/ubi-tests/mkvol_paral.c tests/ubi-tests/helpers.c
+mkvol_paral_LDADD = libubi.a $(PTHREAD_LIBS)
+mkvol_paral_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+mkvol_paral_LDADD += $(PTHREAD_CFLAGS)
+mkvol_paral_CPPFLAGS += $(PTHREAD_CFLAGS)
+
+rsvol_SOURCES = tests/ubi-tests/rsvol.c tests/ubi-tests/helpers.c
+rsvol_LDADD = libubi.a
+rsvol_CPPFLAGS = $(AM_CPPFLAGS) -I$(top_srcdir)/ubi-utils/include
+
+UBITEST_BINS = \
+	io_basic io_update io_paral io_read volrefcnt integ \
+	mkvol_basic mkvol_bad mkvol_paral rsvol
+
+UBITEST_SH = \
+	tests/ubi-tests/runubitests.sh tests/ubi-tests/ubi-stress-test.sh
+
+if INSTALL_TESTS
+pkglibexec_SCRIPTS += $(UBITEST_SH)
+pkglibexec_PROGRAMS += $(UBITEST_BINS)
+else
+noinst_SCRIPTS += $(UBITEST_SH)
+noinst_PROGRAMS += $(UBITEST_BINS)
+endif
diff --git a/tests/ubi-tests/runtests.sh b/tests/ubi-tests/runubitests.sh.in
similarity index 75%
rename from tests/ubi-tests/runtests.sh
rename to tests/ubi-tests/runubitests.sh.in
index 539ef9d..a1b23c4 100755
--- a/tests/ubi-tests/runtests.sh
+++ b/tests/ubi-tests/runubitests.sh.in
@@ -1,5 +1,11 @@
 #!/bin/sh -euf
 
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
+
 tests="mkvol_basic mkvol_bad mkvol_paral rsvol io_basic io_read io_update io_paral volrefcnt"
 
 fatal()
@@ -30,7 +36,7 @@ ubidev="$1"
 
 for t in $tests; do
 	echo "Running $t $ubidev"
-	"./$t" "$ubidev" || fatal "$t failed"
+	"$TESTBINDIR/$t" "$ubidev" || fatal "$t failed"
 done
 
 echo "SUCCESS"
diff --git a/tests/ubi-tests/stress-test.sh b/tests/ubi-tests/ubi-stress-test.sh.in
similarity index 94%
rename from tests/ubi-tests/stress-test.sh
rename to tests/ubi-tests/ubi-stress-test.sh.in
index a150495..42ccec5 100755
--- a/tests/ubi-tests/stress-test.sh
+++ b/tests/ubi-tests/ubi-stress-test.sh.in
@@ -1,7 +1,10 @@
 #!/bin/sh -euf
 
-srcdir="$(readlink -ev -- ${0%/*})"
-PATH="$srcdir:$srcdir/../..:$PATH"
+prefix=@prefix@
+exec_prefix=@exec_prefix@
+bindir=@bindir@
+libexecpath=@libexecdir@/mtd-utils
+TESTBINDIR=@testbindir@
 
 fatal()
 {
@@ -13,7 +16,7 @@ usage()
 {
 	cat 1>&2 <<EOF
 Stress-test an UBI device. This test is basically built on top of
-'runtests.sh' and runs it several times for different configurations.
+'runubitests.sh' and runs it several times for different configurations.
 
 The nandsim and mtdram drivers have to be compiled as kernel modules.
 
@@ -123,7 +126,7 @@ run_test()
 	if [ "$module" = "nandsim" ]; then
 		print_params "$@"
 
-		load_nandsim.sh "$size" "$peb_size" "$page_size" ||
+		$TESTBINDIR/load_nandsim.sh "$size" "$peb_size" "$page_size" ||
 			echo "Cannot load nandsim, test skipped"
 
 		mtdnum="$(find_mtd_device "$nandsim_patt")"
@@ -139,7 +142,7 @@ run_test()
 	fi
 
 	modprobe ubi mtd="$mtdnum,$vid_offs" $fm_param
-	runtests.sh /dev/ubi0 ||:
+	$TESTBINDIR/runubitests.sh /dev/ubi0 ||:
 
 	sudo rmmod ubi
 	sudo rmmod "$module"
-- 
2.9.0
