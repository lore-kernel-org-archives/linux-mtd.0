Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q77mI-0005hn-Gu
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 15:02:50 +0000
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: linux-mtd@lists.infradead.org,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Florian Fainelli <ffainelli@freebox.fr>
Subject: [PATCHv2] tests: introduce new target tests in Makefile
Date: Tue,  5 Apr 2011 18:03:19 +0300
Message-Id: <2016ea1c9296efd368a37e4f869bd8a51f20c537.1302015688.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
References: <BANLkTimsfEKUMGBAfyLoeqSQnB-6u-jWPw@mail.gmail.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch appends Makefile to the tests subdirectory and introduces tests
target in the root Makefile.

Additionally the clean target removes temporary stuff under tests subdirectory
as well.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 Makefile       |    7 ++++++-
 tests/Makefile |    8 ++++++++
 2 files changed, 14 insertions(+), 1 deletions(-)
 create mode 100644 tests/Makefile

diff --git a/Makefile b/Makefile
index 7ab9743..b4d4170 100644
--- a/Makefile
+++ b/Makefile
@@ -8,6 +8,7 @@ ifeq ($(WITHOUT_XATTR), 1)
 endif
 
 SUBDIRS = lib ubi-utils mkfs.ubifs
+TESTS = tests
 
 TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
@@ -38,6 +39,7 @@ ifneq ($(BUILDDIR),$(CURDIR))
 endif
 endif
 endif
+	$(MAKE) -C $(TESTS) clean
 
 $(SYMLINKS):
 	ln -sf ../fs/jffs2/$@ $@
@@ -52,10 +54,13 @@ $(BUILDDIR)/jffs2reader: $(BUILDDIR)/jffs2reader.o
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_jffs2reader  = -lz -llzo2
 
-$(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
+$(BUILDDIR)/lib/libmtd.a: subdirs_lib_all
 
 install:: ${TARGETS} ${SCRIPTS}
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 ${TARGETS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
 	gzip -9c mkfs.jffs2.1 > ${DESTDIR}/${MANDIR}/man1/mkfs.jffs2.1.gz
+
+tests::
+	$(MAKE) -C $(TESTS)
diff --git a/tests/Makefile b/tests/Makefile
new file mode 100644
index 0000000..05b37e9
--- /dev/null
+++ b/tests/Makefile
@@ -0,0 +1,8 @@
+
+SUBDIRS = checkfs fs-tests jittertest ubi-tests
+
+all clean tests: $(SUBDIRS)
+
+.PHONY: $(SUBDIRS)
+$(SUBDIRS):
+	$(MAKE) -C $@ $(MAKECMDGOALS)
-- 
1.6.3.3
