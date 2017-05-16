Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com
 ([52.27.115.49] helo=osg.samsung.com)
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAbQK-0001Lg-KK
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 12:18:57 +0000
From: Mauro Carvalho Chehab <mchehab@s-opensource.com>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@s-opensource.com>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 Jani Nikula <jani.nikula@intel.com>,
 Markus Heiser <markus.heiser@darmarit.de>,
 "Herton R. Krzesinski" <herton@redhat.com>
Subject: [PATCH v2 41/53] docs-rst: convert lsm from DocBook to ReST
Date: Tue, 16 May 2017 09:16:33 -0300
Message-Id: <415008af321999f502c281cae617037b3738d127.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
In-Reply-To: <cover.1494935649.git.mchehab@s-opensource.com>
References: <cover.1494935649.git.mchehab@s-opensource.com>
Sender: Mauro Carvalho Chehab <mchehab@smtp.s-opensource.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This file is outdated. Still, as it is the only one left at
DocBook dir, convert it, and store it, with a .txt extension,
under Documentation/lsm.txt.

This way, we can get rid of DocBook from the building system,
without needing to wait for someone to take care of it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@s-opensource.com>
---
 Documentation/00-INDEX         |   2 +
 Documentation/DocBook/Makefile | 275 -----------------------------------------
 Documentation/DocBook/lsm.tmpl | 265 ---------------------------------------
 Documentation/lsm.txt          | 201 ++++++++++++++++++++++++++++++
 4 files changed, 203 insertions(+), 540 deletions(-)
 delete mode 100644 Documentation/DocBook/lsm.tmpl
 create mode 100644 Documentation/lsm.txt

diff --git a/Documentation/00-INDEX b/Documentation/00-INDEX
index 793acf999e9e..8c2a66e176b9 100644
--- a/Documentation/00-INDEX
+++ b/Documentation/00-INDEX
@@ -264,6 +264,8 @@ logo.gif
 	- full colour GIF image of Linux logo (penguin - Tux).
 logo.txt
 	- info on creator of above logo & site to get additional images from.
+lsm.txt
+	- Linux Security Modules: General Security Hooks for Linux
 lzo.txt
 	- kernel LZO decompressor input formats
 m68k/
diff --git a/Documentation/DocBook/Makefile b/Documentation/DocBook/Makefile
index efba7f980895..8b137891791f 100644
--- a/Documentation/DocBook/Makefile
+++ b/Documentation/DocBook/Makefile
@@ -1,276 +1 @@
-###
-# This makefile is used to generate the kernel documentation,
-# primarily based on in-line comments in various source files.
-# See Documentation/kernel-doc-nano-HOWTO.txt for instruction in how
-# to document the SRC - and how to read it.
-# To add a new book the only step required is to add the book to the
-# list of DOCBOOKS.
 
-DOCBOOKS := lsm.xml
-
-ifeq ($(DOCBOOKS),)
-
-# Skip DocBook build if the user explicitly requested no DOCBOOKS.
-.DEFAULT:
-	@echo "  SKIP    DocBook $@ target (DOCBOOKS=\"\" specified)."
-else
-ifneq ($(SPHINXDIRS),)
-
-# Skip DocBook build if the user explicitly requested a sphinx dir
-.DEFAULT:
-	@echo "  SKIP    DocBook $@ target (SPHINXDIRS specified)."
-else
-
-
-###
-# The build process is as follows (targets):
-#              (xmldocs) [by docproc]
-# file.tmpl --> file.xml +--> file.ps   (psdocs)   [by db2ps or xmlto]
-#                        +--> file.pdf  (pdfdocs)  [by db2pdf or xmlto]
-#                        +--> DIR=file  (htmldocs) [by xmlto]
-#                        +--> man/      (mandocs)  [by xmlto]
-
-
-# for PDF and PS output you can choose between xmlto and docbook-utils tools
-PDF_METHOD	= $(prefer-db2x)
-PS_METHOD	= $(prefer-db2x)
-
-
-targets += $(DOCBOOKS)
-BOOKS := $(addprefix $(obj)/,$(DOCBOOKS))
-xmldocs: $(BOOKS)
-sgmldocs: xmldocs
-
-PS := $(patsubst %.xml, %.ps, $(BOOKS))
-psdocs: $(PS)
-
-PDF := $(patsubst %.xml, %.pdf, $(BOOKS))
-pdfdocs: $(PDF)
-
-HTML := $(sort $(patsubst %.xml, %.html, $(BOOKS)))
-htmldocs: $(HTML)
-	$(call cmd,build_main_index)
-
-MAN := $(patsubst %.xml, %.9, $(BOOKS))
-mandocs: $(MAN)
-	find $(obj)/man -name '*.9' | xargs gzip -nf
-
-# Default location for installed man pages
-export INSTALL_MAN_PATH = $(objtree)/usr
-
-installmandocs: mandocs
-	mkdir -p $(INSTALL_MAN_PATH)/man/man9/
-	find $(obj)/man -name '*.9.gz' -printf '%h %f\n' | \
-		sort -k 2 -k 1 | uniq -f 1 | sed -e 's: :/:' | \
-		xargs install -m 644 -t $(INSTALL_MAN_PATH)/man/man9/
-
-# no-op for the DocBook toolchain
-epubdocs:
-latexdocs:
-linkcheckdocs:
-
-###
-#External programs used
-KERNELDOCXMLREF = $(srctree)/scripts/kernel-doc-xml-ref
-KERNELDOC       = $(srctree)/scripts/kernel-doc
-DOCPROC         = $(objtree)/scripts/docproc
-CHECK_LC_CTYPE = $(objtree)/scripts/check-lc_ctype
-
-# Use a fixed encoding - UTF-8 if the C library has support built-in
-# or ASCII if not
-LC_CTYPE := $(call try-run, LC_CTYPE=C.UTF-8 $(CHECK_LC_CTYPE),C.UTF-8,C)
-export LC_CTYPE
-
-XMLTOFLAGS = -m $(srctree)/$(src)/stylesheet.xsl
-XMLTOFLAGS += --skip-validation
-
-###
-# DOCPROC is used for two purposes:
-# 1) To generate a dependency list for a .tmpl file
-# 2) To preprocess a .tmpl file and call kernel-doc with
-#     appropriate parameters.
-# The following rules are used to generate the .xml documentation
-# required to generate the final targets. (ps, pdf, html).
-quiet_cmd_docproc = DOCPROC $@
-      cmd_docproc = SRCTREE=$(srctree)/ $(DOCPROC) doc $< >$@
-define rule_docproc
-	set -e;								\
-        $(if $($(quiet)cmd_$(1)),echo '  $($(quiet)cmd_$(1))';) 	\
-        $(cmd_$(1)); 							\
-        ( 								\
-          echo 'cmd_$@ := $(cmd_$(1))'; 				\
-          echo $@: `SRCTREE=$(srctree) $(DOCPROC) depend $<`; 		\
-        ) > $(dir $@).$(notdir $@).cmd
-endef
-
-%.xml: %.tmpl $(KERNELDOC) $(DOCPROC) $(KERNELDOCXMLREF) FORCE
-	$(call if_changed_rule,docproc)
-
-# Tell kbuild to always build the programs
-always := $(hostprogs-y)
-
-notfoundtemplate = echo "*** You have to install docbook-utils or xmlto ***"; \
-		   exit 1
-db2xtemplate = db2TYPE -o $(dir $@) $<
-xmltotemplate = xmlto TYPE $(XMLTOFLAGS) -o $(dir $@) $<
-
-# determine which methods are available
-ifeq ($(shell which db2ps >/dev/null 2>&1 && echo found),found)
-	use-db2x = db2x
-	prefer-db2x = db2x
-else
-	use-db2x = notfound
-	prefer-db2x = $(use-xmlto)
-endif
-ifeq ($(shell which xmlto >/dev/null 2>&1 && echo found),found)
-	use-xmlto = xmlto
-	prefer-xmlto = xmlto
-else
-	use-xmlto = notfound
-	prefer-xmlto = $(use-db2x)
-endif
-
-# the commands, generated from the chosen template
-quiet_cmd_db2ps = PS      $@
-      cmd_db2ps = $(subst TYPE,ps, $($(PS_METHOD)template))
-%.ps : %.xml
-	$(call cmd,db2ps)
-
-quiet_cmd_db2pdf = PDF     $@
-      cmd_db2pdf = $(subst TYPE,pdf, $($(PDF_METHOD)template))
-%.pdf : %.xml
-	$(call cmd,db2pdf)
-
-
-index = index.html
-main_idx = $(obj)/$(index)
-quiet_cmd_build_main_index = HTML    $(main_idx)
-      cmd_build_main_index = rm -rf $(main_idx); \
-		   echo '<h1>Linux Kernel HTML Documentation</h1>' >> $(main_idx) && \
-		   echo '<h2>Kernel Version: $(KERNELVERSION)</h2>' >> $(main_idx) && \
-		   cat $(HTML) >> $(main_idx)
-
-quiet_cmd_db2html = HTML    $@
-      cmd_db2html = xmlto html $(XMLTOFLAGS) -o $(patsubst %.html,%,$@) $< && \
-		echo '<a HREF="$(patsubst %.html,%,$(notdir $@))/index.html"> \
-		$(patsubst %.html,%,$(notdir $@))</a><p>' > $@
-
-###
-# Rules to create an aux XML and .db, and use them to re-process the DocBook XML
-# to fill internal hyperlinks
-       gen_aux_xml = :
- quiet_gen_aux_xml = echo '  XMLREF  $@'
-silent_gen_aux_xml = :
-%.aux.xml: %.xml
-	@$($(quiet)gen_aux_xml)
-	@rm -rf $@
-	@(cat $< | egrep "^<refentry id" | egrep -o "\".*\"" | cut -f 2 -d \" > $<.db)
-	@$(KERNELDOCXMLREF) -db $<.db $< > $@
-.PRECIOUS: %.aux.xml
-
-%.html:	%.aux.xml
-	@(which xmlto > /dev/null 2>&1) || \
-	 (echo "*** You need to install xmlto ***"; \
-	  exit 1)
-	@rm -rf $@ $(patsubst %.html,%,$@)
-	$(call cmd,db2html)
-	@if [ ! -z "$(PNG-$(basename $(notdir $@)))" ]; then \
-            cp $(PNG-$(basename $(notdir $@))) $(patsubst %.html,%,$@); fi
-
-quiet_cmd_db2man = MAN     $@
-      cmd_db2man = if grep -q refentry $<; then xmlto man $(XMLTOFLAGS) -o $(obj)/man/$(*F) $< ; fi
-%.9 : %.xml
-	@(which xmlto > /dev/null 2>&1) || \
-	 (echo "*** You need to install xmlto ***"; \
-	  exit 1)
-	$(Q)mkdir -p $(obj)/man/$(*F)
-	$(call cmd,db2man)
-	@touch $@
-
-###
-# Rules to generate postscripts and PNG images from .fig format files
-quiet_cmd_fig2eps = FIG2EPS $@
-      cmd_fig2eps = fig2dev -Leps $< $@
-
-%.eps: %.fig
-	@(which fig2dev > /dev/null 2>&1) || \
-	 (echo "*** You need to install transfig ***"; \
-	  exit 1)
-	$(call cmd,fig2eps)
-
-quiet_cmd_fig2png = FIG2PNG $@
-      cmd_fig2png = fig2dev -Lpng $< $@
-
-%.png: %.fig
-	@(which fig2dev > /dev/null 2>&1) || \
-	 (echo "*** You need to install transfig ***"; \
-	  exit 1)
-	$(call cmd,fig2png)
-
-###
-# Rule to convert a .c file to inline XML documentation
-       gen_xml = :
- quiet_gen_xml = echo '  GEN     $@'
-silent_gen_xml = :
-%.xml: %.c
-	@$($(quiet)gen_xml)
-	@(                            \
-	   echo "<programlisting>";   \
-	   expand --tabs=8 < $< |     \
-	   sed -e "s/&/\\&amp;/g"     \
-	       -e "s/</\\&lt;/g"      \
-	       -e "s/>/\\&gt;/g";     \
-	   echo "</programlisting>")  > $@
-
-endif # DOCBOOKS=""
-endif # SPHINDIR=...
-
-###
-# Help targets as used by the top-level makefile
-dochelp:
-	@echo  ' Linux kernel internal documentation in different formats (DocBook):'
-	@echo  '  htmldocs        - HTML'
-	@echo  '  pdfdocs         - PDF'
-	@echo  '  psdocs          - Postscript'
-	@echo  '  xmldocs         - XML DocBook'
-	@echo  '  mandocs         - man pages'
-	@echo  '  installmandocs  - install man pages generated by mandocs to INSTALL_MAN_PATH'; \
-	 echo  '                    (default: $(INSTALL_MAN_PATH))'; \
-	 echo  ''
-	@echo  '  cleandocs       - clean all generated DocBook files'
-	@echo
-	@echo  '  make DOCBOOKS="s1.xml s2.xml" [target] Generate only docs s1.xml s2.xml'
-	@echo  '  valid values for DOCBOOKS are: $(DOCBOOKS)'
-	@echo
-	@echo  "  make DOCBOOKS=\"\" [target] Don't generate docs from Docbook"
-	@echo  '     This is useful to generate only the ReST docs (Sphinx)'
-
-
-###
-# Temporary files left by various tools
-clean-files := $(DOCBOOKS) \
-	$(patsubst %.xml, %.dvi,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.aux,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.tex,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.log,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.out,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.ps,      $(DOCBOOKS)) \
-	$(patsubst %.xml, %.pdf,     $(DOCBOOKS)) \
-	$(patsubst %.xml, %.html,    $(DOCBOOKS)) \
-	$(patsubst %.xml, %.9,       $(DOCBOOKS)) \
-	$(patsubst %.xml, %.aux.xml, $(DOCBOOKS)) \
-	$(patsubst %.xml, %.xml.db,  $(DOCBOOKS)) \
-	$(patsubst %.xml, %.xml,     $(DOCBOOKS)) \
-	$(patsubst %.xml, .%.xml.cmd, $(DOCBOOKS)) \
-	$(index)
-
-clean-dirs := $(patsubst %.xml,%,$(DOCBOOKS)) man
-
-cleandocs:
-	$(Q)rm -f $(call objectify, $(clean-files))
-	$(Q)rm -rf $(call objectify, $(clean-dirs))
-
-# Declare the contents of the .PHONY variable as phony.  We keep that
-# information in a variable so we can use it in if_changed and friends.
-
-.PHONY: $(PHONY)
diff --git a/Documentation/DocBook/lsm.tmpl b/Documentation/DocBook/lsm.tmpl
deleted file mode 100644
index fe7664ce9667..000000000000
--- a/Documentation/DocBook/lsm.tmpl
+++ /dev/null
@@ -1,265 +0,0 @@
-<?xml version="1.0" encoding="UTF-8"?>
-<!DOCTYPE article PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
-	"http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd" []>
-
-<article class="whitepaper" id="LinuxSecurityModule" lang="en">
- <articleinfo>
- <title>Linux Security Modules:  General Security Hooks for Linux</title>
- <authorgroup>
- <author>
- <firstname>Stephen</firstname> 
- <surname>Smalley</surname>
- <affiliation>
- <orgname>NAI Labs</orgname>
- <address><email>ssmalley@nai.com</email></address>
- </affiliation>
- </author>
- <author>
- <firstname>Timothy</firstname> 
- <surname>Fraser</surname>
- <affiliation>
- <orgname>NAI Labs</orgname>
- <address><email>tfraser@nai.com</email></address>
- </affiliation>
- </author>
- <author>
- <firstname>Chris</firstname> 
- <surname>Vance</surname>
- <affiliation>
- <orgname>NAI Labs</orgname>
- <address><email>cvance@nai.com</email></address>
- </affiliation>
- </author>
- </authorgroup>
- </articleinfo>
-
-<sect1 id="Introduction"><title>Introduction</title>
-
-<para>
-In March 2001, the National Security Agency (NSA) gave a presentation
-about Security-Enhanced Linux (SELinux) at the 2.5 Linux Kernel
-Summit.  SELinux is an implementation of flexible and fine-grained
-nondiscretionary access controls in the Linux kernel, originally
-implemented as its own particular kernel patch.  Several other
-security projects (e.g. RSBAC, Medusa) have also developed flexible
-access control architectures for the Linux kernel, and various
-projects have developed particular access control models for Linux
-(e.g. LIDS, DTE, SubDomain).  Each project has developed and
-maintained its own kernel patch to support its security needs.
-</para>
-
-<para>
-In response to the NSA presentation, Linus Torvalds made a set of
-remarks that described a security framework he would be willing to
-consider for inclusion in the mainstream Linux kernel.  He described a
-general framework that would provide a set of security hooks to
-control operations on kernel objects and a set of opaque security
-fields in kernel data structures for maintaining security attributes.
-This framework could then be used by loadable kernel modules to
-implement any desired model of security.  Linus also suggested the
-possibility of migrating the Linux capabilities code into such a
-module.
-</para>
-
-<para>
-The Linux Security Modules (LSM) project was started by WireX to
-develop such a framework.  LSM is a joint development effort by
-several security projects, including Immunix, SELinux, SGI and Janus,
-and several individuals, including Greg Kroah-Hartman and James
-Morris, to develop a Linux kernel patch that implements this
-framework.  The patch is currently tracking the 2.4 series and is
-targeted for integration into the 2.5 development series.  This
-technical report provides an overview of the framework and the example
-capabilities security module provided by the LSM kernel patch.
-</para>
-
-</sect1>
-
-<sect1 id="framework"><title>LSM Framework</title>
-
-<para>
-The LSM kernel patch provides a general kernel framework to support
-security modules.  In particular, the LSM framework is primarily
-focused on supporting access control modules, although future
-development is likely to address other security needs such as
-auditing.  By itself, the framework does not provide any additional
-security; it merely provides the infrastructure to support security
-modules.  The LSM kernel patch also moves most of the capabilities
-logic into an optional security module, with the system defaulting
-to the traditional superuser logic.  This capabilities module
-is discussed further in <xref linkend="cap"/>.
-</para>
-
-<para>
-The LSM kernel patch adds security fields to kernel data structures
-and inserts calls to hook functions at critical points in the kernel
-code to manage the security fields and to perform access control.  It
-also adds functions for registering and unregistering security
-modules, and adds a general <function>security</function> system call
-to support new system calls for security-aware applications.
-</para>
-
-<para>
-The LSM security fields are simply <type>void*</type> pointers.  For
-process and program execution security information, security fields
-were added to <structname>struct task_struct</structname> and 
-<structname>struct linux_binprm</structname>.  For filesystem security
-information, a security field was added to 
-<structname>struct super_block</structname>.  For pipe, file, and socket
-security information, security fields were added to 
-<structname>struct inode</structname> and 
-<structname>struct file</structname>.  For packet and network device security
-information, security fields were added to
-<structname>struct sk_buff</structname> and
-<structname>struct net_device</structname>.  For System V IPC security
-information, security fields were added to
-<structname>struct kern_ipc_perm</structname> and
-<structname>struct msg_msg</structname>; additionally, the definitions
-for <structname>struct msg_msg</structname>, <structname>struct 
-msg_queue</structname>, and <structname>struct 
-shmid_kernel</structname> were moved to header files
-(<filename>include/linux/msg.h</filename> and
-<filename>include/linux/shm.h</filename> as appropriate) to allow
-the security modules to use these definitions.
-</para>
-
-<para>
-Each LSM hook is a function pointer in a global table,
-security_ops. This table is a
-<structname>security_operations</structname> structure as defined by
-<filename>include/linux/security.h</filename>.  Detailed documentation
-for each hook is included in this header file.  At present, this
-structure consists of a collection of substructures that group related
-hooks based on the kernel object (e.g. task, inode, file, sk_buff,
-etc) as well as some top-level hook function pointers for system
-operations.  This structure is likely to be flattened in the future
-for performance.  The placement of the hook calls in the kernel code
-is described by the "called:" lines in the per-hook documentation in
-the header file.  The hook calls can also be easily found in the
-kernel code by looking for the string "security_ops->".
-
-</para>
-
-<para>
-Linus mentioned per-process security hooks in his original remarks as a
-possible alternative to global security hooks.  However, if LSM were
-to start from the perspective of per-process hooks, then the base
-framework would have to deal with how to handle operations that
-involve multiple processes (e.g. kill), since each process might have
-its own hook for controlling the operation.  This would require a
-general mechanism for composing hooks in the base framework.
-Additionally, LSM would still need global hooks for operations that
-have no process context (e.g. network input operations).
-Consequently, LSM provides global security hooks, but a security
-module is free to implement per-process hooks (where that makes sense)
-by storing a security_ops table in each process' security field and
-then invoking these per-process hooks from the global hooks.
-The problem of composition is thus deferred to the module.
-</para>
-
-<para>
-The global security_ops table is initialized to a set of hook
-functions provided by a dummy security module that provides
-traditional superuser logic.  A <function>register_security</function>
-function (in <filename>security/security.c</filename>) is provided to
-allow a security module to set security_ops to refer to its own hook
-functions, and an <function>unregister_security</function> function is
-provided to revert security_ops to the dummy module hooks.  This
-mechanism is used to set the primary security module, which is
-responsible for making the final decision for each hook.
-</para>
-
-<para>
-LSM also provides a simple mechanism for stacking additional security
-modules with the primary security module.  It defines
-<function>register_security</function> and
-<function>unregister_security</function> hooks in the
-<structname>security_operations</structname> structure and provides
-<function>mod_reg_security</function> and
-<function>mod_unreg_security</function> functions that invoke these
-hooks after performing some sanity checking.  A security module can
-call these functions in order to stack with other modules.  However,
-the actual details of how this stacking is handled are deferred to the
-module, which can implement these hooks in any way it wishes
-(including always returning an error if it does not wish to support
-stacking).  In this manner, LSM again defers the problem of
-composition to the module.
-</para>
-
-<para>
-Although the LSM hooks are organized into substructures based on
-kernel object, all of the hooks can be viewed as falling into two
-major categories: hooks that are used to manage the security fields
-and hooks that are used to perform access control.  Examples of the
-first category of hooks include the
-<function>alloc_security</function> and
-<function>free_security</function> hooks defined for each kernel data
-structure that has a security field.  These hooks are used to allocate
-and free security structures for kernel objects.  The first category
-of hooks also includes hooks that set information in the security
-field after allocation, such as the <function>post_lookup</function>
-hook in <structname>struct inode_security_ops</structname>.  This hook
-is used to set security information for inodes after successful lookup
-operations.  An example of the second category of hooks is the
-<function>permission</function> hook in 
-<structname>struct inode_security_ops</structname>.  This hook checks
-permission when accessing an inode.
-</para>
-
-</sect1>
-
-<sect1 id="cap"><title>LSM Capabilities Module</title>
-
-<para>
-The LSM kernel patch moves most of the existing POSIX.1e capabilities
-logic into an optional security module stored in the file
-<filename>security/capability.c</filename>.  This change allows
-users who do not want to use capabilities to omit this code entirely
-from their kernel, instead using the dummy module for traditional
-superuser logic or any other module that they desire.  This change
-also allows the developers of the capabilities logic to maintain and
-enhance their code more freely, without needing to integrate patches
-back into the base kernel.
-</para>
-
-<para>
-In addition to moving the capabilities logic, the LSM kernel patch
-could move the capability-related fields from the kernel data
-structures into the new security fields managed by the security
-modules.  However, at present, the LSM kernel patch leaves the
-capability fields in the kernel data structures.  In his original
-remarks, Linus suggested that this might be preferable so that other
-security modules can be easily stacked with the capabilities module
-without needing to chain multiple security structures on the security field.
-It also avoids imposing extra overhead on the capabilities module
-to manage the security fields.  However, the LSM framework could
-certainly support such a move if it is determined to be desirable,
-with only a few additional changes described below.
-</para>
-
-<para>
-At present, the capabilities logic for computing process capabilities
-on <function>execve</function> and <function>set*uid</function>,
-checking capabilities for a particular process, saving and checking
-capabilities for netlink messages, and handling the
-<function>capget</function> and <function>capset</function> system
-calls have been moved into the capabilities module.  There are still a
-few locations in the base kernel where capability-related fields are
-directly examined or modified, but the current version of the LSM
-patch does allow a security module to completely replace the
-assignment and testing of capabilities.  These few locations would
-need to be changed if the capability-related fields were moved into
-the security field.  The following is a list of known locations that
-still perform such direct examination or modification of
-capability-related fields:
-<itemizedlist>
-<listitem><para><filename>fs/open.c</filename>:<function>sys_access</function></para></listitem>
-<listitem><para><filename>fs/lockd/host.c</filename>:<function>nlm_bind_host</function></para></listitem>
-<listitem><para><filename>fs/nfsd/auth.c</filename>:<function>nfsd_setuser</function></para></listitem>
-<listitem><para><filename>fs/proc/array.c</filename>:<function>task_cap</function></para></listitem>
-</itemizedlist>
-</para>
-
-</sect1>
-
-</article>
diff --git a/Documentation/lsm.txt b/Documentation/lsm.txt
new file mode 100644
index 000000000000..ad4dfd020e0d
--- /dev/null
+++ b/Documentation/lsm.txt
@@ -0,0 +1,201 @@
+========================================================
+Linux Security Modules: General Security Hooks for Linux
+========================================================
+
+:Author: Stephen Smalley
+:Author: Timothy Fraser
+:Author: Chris Vance
+
+.. note::
+
+   The APIs described in this book are outdated.
+
+Introduction
+============
+
+In March 2001, the National Security Agency (NSA) gave a presentation
+about Security-Enhanced Linux (SELinux) at the 2.5 Linux Kernel Summit.
+SELinux is an implementation of flexible and fine-grained
+nondiscretionary access controls in the Linux kernel, originally
+implemented as its own particular kernel patch. Several other security
+projects (e.g. RSBAC, Medusa) have also developed flexible access
+control architectures for the Linux kernel, and various projects have
+developed particular access control models for Linux (e.g. LIDS, DTE,
+SubDomain). Each project has developed and maintained its own kernel
+patch to support its security needs.
+
+In response to the NSA presentation, Linus Torvalds made a set of
+remarks that described a security framework he would be willing to
+consider for inclusion in the mainstream Linux kernel. He described a
+general framework that would provide a set of security hooks to control
+operations on kernel objects and a set of opaque security fields in
+kernel data structures for maintaining security attributes. This
+framework could then be used by loadable kernel modules to implement any
+desired model of security. Linus also suggested the possibility of
+migrating the Linux capabilities code into such a module.
+
+The Linux Security Modules (LSM) project was started by WireX to develop
+such a framework. LSM is a joint development effort by several security
+projects, including Immunix, SELinux, SGI and Janus, and several
+individuals, including Greg Kroah-Hartman and James Morris, to develop a
+Linux kernel patch that implements this framework. The patch is
+currently tracking the 2.4 series and is targeted for integration into
+the 2.5 development series. This technical report provides an overview
+of the framework and the example capabilities security module provided
+by the LSM kernel patch.
+
+LSM Framework
+=============
+
+The LSM kernel patch provides a general kernel framework to support
+security modules. In particular, the LSM framework is primarily focused
+on supporting access control modules, although future development is
+likely to address other security needs such as auditing. By itself, the
+framework does not provide any additional security; it merely provides
+the infrastructure to support security modules. The LSM kernel patch
+also moves most of the capabilities logic into an optional security
+module, with the system defaulting to the traditional superuser logic.
+This capabilities module is discussed further in
+`LSM Capabilities Module <#cap>`__.
+
+The LSM kernel patch adds security fields to kernel data structures and
+inserts calls to hook functions at critical points in the kernel code to
+manage the security fields and to perform access control. It also adds
+functions for registering and unregistering security modules, and adds a
+general :c:func:`security()` system call to support new system calls
+for security-aware applications.
+
+The LSM security fields are simply ``void*`` pointers. For process and
+program execution security information, security fields were added to
+:c:type:`struct task_struct <task_struct>` and
+:c:type:`struct linux_binprm <linux_binprm>`. For filesystem
+security information, a security field was added to :c:type:`struct
+super_block <super_block>`. For pipe, file, and socket security
+information, security fields were added to :c:type:`struct inode
+<inode>` and :c:type:`struct file <file>`. For packet and
+network device security information, security fields were added to
+:c:type:`struct sk_buff <sk_buff>` and :c:type:`struct
+net_device <net_device>`. For System V IPC security information,
+security fields were added to :c:type:`struct kern_ipc_perm
+<kern_ipc_perm>` and :c:type:`struct msg_msg
+<msg_msg>`; additionally, the definitions for :c:type:`struct
+msg_msg <msg_msg>`, struct msg_queue, and struct shmid_kernel
+were moved to header files (``include/linux/msg.h`` and
+``include/linux/shm.h`` as appropriate) to allow the security modules to
+use these definitions.
+
+Each LSM hook is a function pointer in a global table, security_ops.
+This table is a :c:type:`struct security_operations
+<security_operations>` structure as defined by
+``include/linux/security.h``. Detailed documentation for each hook is
+included in this header file. At present, this structure consists of a
+collection of substructures that group related hooks based on the kernel
+object (e.g. task, inode, file, sk_buff, etc) as well as some top-level
+hook function pointers for system operations. This structure is likely
+to be flattened in the future for performance. The placement of the hook
+calls in the kernel code is described by the "called:" lines in the
+per-hook documentation in the header file. The hook calls can also be
+easily found in the kernel code by looking for the string
+"security_ops->".
+
+Linus mentioned per-process security hooks in his original remarks as a
+possible alternative to global security hooks. However, if LSM were to
+start from the perspective of per-process hooks, then the base framework
+would have to deal with how to handle operations that involve multiple
+processes (e.g. kill), since each process might have its own hook for
+controlling the operation. This would require a general mechanism for
+composing hooks in the base framework. Additionally, LSM would still
+need global hooks for operations that have no process context (e.g.
+network input operations). Consequently, LSM provides global security
+hooks, but a security module is free to implement per-process hooks
+(where that makes sense) by storing a security_ops table in each
+process' security field and then invoking these per-process hooks from
+the global hooks. The problem of composition is thus deferred to the
+module.
+
+The global security_ops table is initialized to a set of hook functions
+provided by a dummy security module that provides traditional superuser
+logic. A :c:func:`register_security()` function (in
+``security/security.c``) is provided to allow a security module to set
+security_ops to refer to its own hook functions, and an
+:c:func:`unregister_security()` function is provided to revert
+security_ops to the dummy module hooks. This mechanism is used to set
+the primary security module, which is responsible for making the final
+decision for each hook.
+
+LSM also provides a simple mechanism for stacking additional security
+modules with the primary security module. It defines
+:c:func:`register_security()` and
+:c:func:`unregister_security()` hooks in the :c:type:`struct
+security_operations <security_operations>` structure and
+provides :c:func:`mod_reg_security()` and
+:c:func:`mod_unreg_security()` functions that invoke these hooks
+after performing some sanity checking. A security module can call these
+functions in order to stack with other modules. However, the actual
+details of how this stacking is handled are deferred to the module,
+which can implement these hooks in any way it wishes (including always
+returning an error if it does not wish to support stacking). In this
+manner, LSM again defers the problem of composition to the module.
+
+Although the LSM hooks are organized into substructures based on kernel
+object, all of the hooks can be viewed as falling into two major
+categories: hooks that are used to manage the security fields and hooks
+that are used to perform access control. Examples of the first category
+of hooks include the :c:func:`alloc_security()` and
+:c:func:`free_security()` hooks defined for each kernel data
+structure that has a security field. These hooks are used to allocate
+and free security structures for kernel objects. The first category of
+hooks also includes hooks that set information in the security field
+after allocation, such as the :c:func:`post_lookup()` hook in
+:c:type:`struct inode_security_ops <inode_security_ops>`.
+This hook is used to set security information for inodes after
+successful lookup operations. An example of the second category of hooks
+is the :c:func:`permission()` hook in :c:type:`struct
+inode_security_ops <inode_security_ops>`. This hook checks
+permission when accessing an inode.
+
+LSM Capabilities Module
+=======================
+
+The LSM kernel patch moves most of the existing POSIX.1e capabilities
+logic into an optional security module stored in the file
+``security/capability.c``. This change allows users who do not want to
+use capabilities to omit this code entirely from their kernel, instead
+using the dummy module for traditional superuser logic or any other
+module that they desire. This change also allows the developers of the
+capabilities logic to maintain and enhance their code more freely,
+without needing to integrate patches back into the base kernel.
+
+In addition to moving the capabilities logic, the LSM kernel patch could
+move the capability-related fields from the kernel data structures into
+the new security fields managed by the security modules. However, at
+present, the LSM kernel patch leaves the capability fields in the kernel
+data structures. In his original remarks, Linus suggested that this
+might be preferable so that other security modules can be easily stacked
+with the capabilities module without needing to chain multiple security
+structures on the security field. It also avoids imposing extra overhead
+on the capabilities module to manage the security fields. However, the
+LSM framework could certainly support such a move if it is determined to
+be desirable, with only a few additional changes described below.
+
+At present, the capabilities logic for computing process capabilities on
+:c:func:`execve()` and :c:func:`set\*uid()`, checking
+capabilities for a particular process, saving and checking capabilities
+for netlink messages, and handling the :c:func:`capget()` and
+:c:func:`capset()` system calls have been moved into the
+capabilities module. There are still a few locations in the base kernel
+where capability-related fields are directly examined or modified, but
+the current version of the LSM patch does allow a security module to
+completely replace the assignment and testing of capabilities. These few
+locations would need to be changed if the capability-related fields were
+moved into the security field. The following is a list of known
+locations that still perform such direct examination or modification of
+capability-related fields:
+
+-  ``fs/open.c``::c:func:`sys_access()`
+
+-  ``fs/lockd/host.c``::c:func:`nlm_bind_host()`
+
+-  ``fs/nfsd/auth.c``::c:func:`nfsd_setuser()`
+
+-  ``fs/proc/array.c``::c:func:`task_cap()`
-- 
2.9.3
