Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q7oxv-0007FT-S7
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2011 13:09:40 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p37D9css008536
	for <linux-mtd@lists.infradead.org>; Thu, 7 Apr 2011 16:09:38 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv2] tests: introduce new target tests in Makefile
Date: Thu,  7 Apr 2011 16:10:38 +0300
Message-Id: <70d48001851ef7d188d07b2b0846548bd142f246.1302181786.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <1302173079.2407.30.camel@localhost>
References: <1302173079.2407.30.camel@localhost>
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
 Makefile       |    5 +++++
 tests/Makefile |    8 ++++++++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 tests/Makefile

diff --git a/Makefile b/Makefile
index 7ab9743..1f264e9 100644
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
@@ -59,3 +61,6 @@ install:: ${TARGETS} ${SCRIPTS}
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
