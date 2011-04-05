Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q74Ut-0002dJ-EN
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 11:32:39 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-sa02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p35BWWvj011974
	for <linux-mtd@lists.infradead.org>; Tue, 5 Apr 2011 14:32:33 +0300
From: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
To: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCHv1 2/3] tests: build tests by default
Date: Tue,  5 Apr 2011 14:33:09 +0300
Message-Id: <d47b1aaa839631e454cbfeb14684ca851d941d43.1302002802.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
In-Reply-To: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
References: <38fa03e74a299568e73f69b03ffcacd5ee38b62b.1302002802.git.ext-andriy.shevchenko@nokia.com>
Cc: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also, append Makefile to the tests subdirectory.

Signed-off-by: Andy Shevchenko <ext-andriy.shevchenko@nokia.com>
---
 Makefile       |    4 ++--
 tests/Makefile |    8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)
 create mode 100644 tests/Makefile

diff --git a/Makefile b/Makefile
index 7ab9743..7269c6a 100644
--- a/Makefile
+++ b/Makefile
@@ -7,7 +7,7 @@ ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
 endif
 
-SUBDIRS = lib ubi-utils mkfs.ubifs
+SUBDIRS = lib ubi-utils mkfs.ubifs tests
 
 TARGETS = ftl_format flash_erase nanddump doc_loadbios \
 	ftl_check mkfs.jffs2 flash_lock flash_unlock flash_info \
@@ -54,7 +54,7 @@ LDLIBS_jffs2reader  = -lz -llzo2
 
 $(BUILDDIR)/lib/libmtd.a: subdirs_lib_all ;
 
-install:: ${TARGETS} ${SCRIPTS}
+install:: ${TARGETS} ${SCRIPTS} tests
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 ${TARGETS} ${SCRIPTS} ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
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
