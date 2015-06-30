Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z9pSb-0004Pq-89
 for linux-mtd@lists.infradead.org; Tue, 30 Jun 2015 06:56:03 +0000
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
To: <linux-mtd@lists.infradead.org>, <richard.weinberger@gmail.com>,
 <computersforpeace@gmail.com>, <dedekind1@gmail.com>
Subject: [RFC PATCH RESEND] mtd-utils: Restructure the mtd-utils source.
Date: Tue, 30 Jun 2015 14:50:22 +0800
Message-ID: <1435647022-7318-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* There is no code modification in this commit, only moving
* the files to proper place.

The user tools looks a little messy as we place almost
the all tools in the root directory of mtd-utils. To make
it more clear, I propose to introduce the following structure
for our source code.

mtd-utils/
	|-- lib
	|-- include
	|-- misc-utils
	|-- flash-utils
	|-- jffsX-utils
	|-- nand-utils
	|-- nor-utils
	|-- ubi-utils
	|-- ubifs-utils
	`-- tests

Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
---
RESEND:
	use -M in git format-patch.

 Makefile                                           | 66 +++++++++++++---------
 flash_erase.c => flash-utils/flash_erase.c         |  0
 flash_eraseall => flash-utils/flash_eraseall       |  0
 flash_lock.c => flash-utils/flash_lock.c           |  0
 flash_otp_dump.c => flash-utils/flash_otp_dump.c   |  0
 flash_otp_info.c => flash-utils/flash_otp_info.c   |  0
 flash_otp_lock.c => flash-utils/flash_otp_lock.c   |  0
 flash_otp_write.c => flash-utils/flash_otp_write.c |  0
 flash_unlock.c => flash-utils/flash_unlock.c       |  0
 flashcp.c => flash-utils/flashcp.c                 |  0
 compr.c => jffsX-utils/compr.c                     |  0
 compr.h => jffsX-utils/compr.h                     |  0
 compr_lzo.c => jffsX-utils/compr_lzo.c             |  0
 compr_rtime.c => jffsX-utils/compr_rtime.c         |  0
 compr_zlib.c => jffsX-utils/compr_zlib.c           |  0
 device_table.txt => jffsX-utils/device_table.txt   |  0
 jffs-dump.c => jffsX-utils/jffs-dump.c             |  0
 jffs2dump.c => jffsX-utils/jffs2dump.c             |  0
 jffs2reader.c => jffsX-utils/jffs2reader.c         |  0
 mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1           |  0
 mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c           |  0
 rbtree.c => jffsX-utils/rbtree.c                   |  0
 rbtree.h => jffsX-utils/rbtree.h                   |  0
 summary.h => jffsX-utils/summary.h                 |  0
 sumtool.c => jffsX-utils/sumtool.c                 |  0
 MAKEDEV => misc-utils/MAKEDEV                      |  0
 doc_loadbios.c => misc-utils/doc_loadbios.c        |  0
 docfdisk.c => misc-utils/docfdisk.c                |  0
 fectest.c => misc-utils/fectest.c                  |  0
 ftl_check.c => misc-utils/ftl_check.c              |  0
 ftl_format.c => misc-utils/ftl_format.c            |  0
 mcast_image.h => misc-utils/mcast_image.h          |  0
 mtd_debug.c => misc-utils/mtd_debug.c              |  0
 recv_image.c => misc-utils/recv_image.c            |  0
 serve_image.c => misc-utils/serve_image.c          |  0
 load_nandsim.sh => nand-utils/load_nandsim.sh      |  0
 nanddump.c => nand-utils/nanddump.c                |  0
 nandtest.c => nand-utils/nandtest.c                |  0
 nandwrite.c => nand-utils/nandwrite.c              |  0
 nftl_format.c => nand-utils/nftl_format.c          |  0
 nftldump.c => nand-utils/nftldump.c                |  0
 rfddump.c => nor-utils/rfddump.c                   |  0
 rfdformat.c => nor-utils/rfdformat.c               |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore  |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/COPYING     |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/README      |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/compr.c     |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/compr.h     |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/crc16.c     |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/crc16.h     |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/defs.h      |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/devtable.c  |  0
 .../mkfs.ubifs}/hashtable/hashtable.c              |  0
 .../mkfs.ubifs}/hashtable/hashtable.h              |  0
 .../mkfs.ubifs}/hashtable/hashtable_itr.c          |  0
 .../mkfs.ubifs}/hashtable/hashtable_itr.h          |  0
 .../mkfs.ubifs}/hashtable/hashtable_private.h      |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/key.h       |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/lpt.c       |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/lpt.h       |  0
 .../mkfs.ubifs}/mkfs.ubifs.c                       |  0
 .../mkfs.ubifs}/mkfs.ubifs.h                       |  0
 {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/ubifs.h     |  0
 63 files changed, 39 insertions(+), 27 deletions(-)
 rename flash_erase.c => flash-utils/flash_erase.c (100%)
 rename flash_eraseall => flash-utils/flash_eraseall (100%)
 rename flash_lock.c => flash-utils/flash_lock.c (100%)
 rename flash_otp_dump.c => flash-utils/flash_otp_dump.c (100%)
 rename flash_otp_info.c => flash-utils/flash_otp_info.c (100%)
 rename flash_otp_lock.c => flash-utils/flash_otp_lock.c (100%)
 rename flash_otp_write.c => flash-utils/flash_otp_write.c (100%)
 rename flash_unlock.c => flash-utils/flash_unlock.c (100%)
 rename flashcp.c => flash-utils/flashcp.c (100%)
 rename compr.c => jffsX-utils/compr.c (100%)
 rename compr.h => jffsX-utils/compr.h (100%)
 rename compr_lzo.c => jffsX-utils/compr_lzo.c (100%)
 rename compr_rtime.c => jffsX-utils/compr_rtime.c (100%)
 rename compr_zlib.c => jffsX-utils/compr_zlib.c (100%)
 rename device_table.txt => jffsX-utils/device_table.txt (100%)
 rename jffs-dump.c => jffsX-utils/jffs-dump.c (100%)
 rename jffs2dump.c => jffsX-utils/jffs2dump.c (100%)
 rename jffs2reader.c => jffsX-utils/jffs2reader.c (100%)
 rename mkfs.jffs2.1 => jffsX-utils/mkfs.jffs2.1 (100%)
 rename mkfs.jffs2.c => jffsX-utils/mkfs.jffs2.c (100%)
 rename rbtree.c => jffsX-utils/rbtree.c (100%)
 rename rbtree.h => jffsX-utils/rbtree.h (100%)
 rename summary.h => jffsX-utils/summary.h (100%)
 rename sumtool.c => jffsX-utils/sumtool.c (100%)
 rename MAKEDEV => misc-utils/MAKEDEV (100%)
 rename doc_loadbios.c => misc-utils/doc_loadbios.c (100%)
 rename docfdisk.c => misc-utils/docfdisk.c (100%)
 rename fectest.c => misc-utils/fectest.c (100%)
 rename ftl_check.c => misc-utils/ftl_check.c (100%)
 rename ftl_format.c => misc-utils/ftl_format.c (100%)
 rename mcast_image.h => misc-utils/mcast_image.h (100%)
 rename mtd_debug.c => misc-utils/mtd_debug.c (100%)
 rename recv_image.c => misc-utils/recv_image.c (100%)
 rename serve_image.c => misc-utils/serve_image.c (100%)
 rename load_nandsim.sh => nand-utils/load_nandsim.sh (100%)
 rename nanddump.c => nand-utils/nanddump.c (100%)
 rename nandtest.c => nand-utils/nandtest.c (100%)
 rename nandwrite.c => nand-utils/nandwrite.c (100%)
 rename nftl_format.c => nand-utils/nftl_format.c (100%)
 rename nftldump.c => nand-utils/nftldump.c (100%)
 rename rfddump.c => nor-utils/rfddump.c (100%)
 rename rfdformat.c => nor-utils/rfdformat.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/.gitignore (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/COPYING (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/README (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/compr.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/compr.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/crc16.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/crc16.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/defs.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/devtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/hashtable/hashtable.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/hashtable/hashtable.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/hashtable/hashtable_itr.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/hashtable/hashtable_itr.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/hashtable/hashtable_private.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/key.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/lpt.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/lpt.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/mkfs.ubifs.c (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/mkfs.ubifs.h (100%)
 rename {mkfs.ubifs => ubifs-utils/mkfs.ubifs}/ubifs.h (100%)

diff --git a/Makefile b/Makefile
index eade234..6abf0e9 100644
--- a/Makefile
+++ b/Makefile
@@ -16,24 +16,32 @@ endif
 
 TESTS = tests
 
-MTD_BINS = \
-	ftl_format flash_erase nanddump doc_loadbios \
-	ftl_check mkfs.jffs2 flash_lock flash_unlock \
-	flash_otp_info flash_otp_dump flash_otp_lock flash_otp_write \
-	mtd_debug flashcp nandwrite nandtest \
-	jffs2dump \
-	nftldump nftl_format docfdisk \
-	rfddump rfdformat \
-	serve_image recv_image \
-	sumtool jffs2reader
+MISC_BINS = \
+	ftl_format doc_loadbios ftl_check mtd_debug docfdisk \
+	serve_image recv_image
 UBI_BINS = \
 	ubiupdatevol ubimkvol ubirmvol ubicrc32 ubinfo ubiattach \
 	ubidetach ubinize ubiformat ubirename mtdinfo ubirsvol ubiblock
-
-BINS = $(MTD_BINS)
-BINS += mkfs.ubifs/mkfs.ubifs
+UBIFS_BINS = \
+	mkfs.ubifs/mkfs.ubifs
+JFFSX_BINS = \
+	mkfs.jffs2 sumtool jffs2reader jffs2dump
+FLASH_BINS = \
+	flash_erase flash_lock flash_unlock flash_otp_info flash_otp_dump \
+	flash_otp_lock flash_otp_write flashcp
+NAND_BINS = \
+	nanddump nandwrite nandtest nftldump nftl_format
+NOR_BINS = \
+	rfddump rfdformat
+
+BINS = $(addprefix misc-utils/,$(MISC_BINS))
 BINS += $(addprefix ubi-utils/,$(UBI_BINS))
-SCRIPTS = flash_eraseall
+BINS += $(addprefix ubifs-utils/,$(UBIFS_BINS))
+BINS += $(addprefix jffsX-utils/,$(JFFSX_BINS))
+BINS += $(addprefix flash-utils/,$(FLASH_BINS))
+BINS += $(addprefix nand-utils/,$(NAND_BINS))
+BINS += $(addprefix nor-utils/,$(NOR_BINS))
+SCRIPTS = $(addprefix flash-utils/,flash_eraseall)
 
 TARGETS = $(BINS)
 TARGETS += lib/libmtd.a
@@ -61,11 +69,11 @@ endif
 	rm -f $(BUILDDIR)/include/version.h
 	$(MAKE) -C $(TESTS) clean
 
-install:: $(addprefix $(BUILDDIR)/,${BINS}) ${SCRIPTS}
+install:: $(addprefix $(BUILDDIR)/,${BINS} ${SCRIPTS})
 	mkdir -p ${DESTDIR}/${SBINDIR}
 	install -m 0755 $^ ${DESTDIR}/${SBINDIR}/
 	mkdir -p ${DESTDIR}/${MANDIR}/man1
-	install -m 0644 mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
+	install -m 0644 jffsX-utils/mkfs.jffs2.1 ${DESTDIR}/${MANDIR}/man1/
 	-gzip -9f ${DESTDIR}/${MANDIR}/man1/*.1
 
 tests::
@@ -85,13 +93,17 @@ $(BUILDDIR)/include/version.h.tmp:
 # Utils in top level
 #
 obj-mkfs.jffs2 = compr_rtime.o compr_zlib.o compr_lzo.o compr.o rbtree.o
-LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
+LDFLAGS_mkfs.jffs2 = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(CPPFLAGS)
 LDLIBS_mkfs.jffs2  = -lz $(LZOLDLIBS)
 
 LDFLAGS_jffs2reader = $(ZLIBLDFLAGS) $(LZOLDFLAGS)
 LDLIBS_jffs2reader  = -lz $(LZOLDLIBS)
 
-$(foreach v,$(MTD_BINS),$(eval $(call mkdep,,$(v))))
+$(foreach v,$(MISC_BINS),$(eval $(call mkdep,misc-utils/,$(v))))
+$(foreach v,$(JFFSX_BINS),$(eval $(call mkdep,jffsX-utils/,$(v))))
+$(foreach v,$(FLASH_BINS),$(eval $(call mkdep,flash-utils/,$(v))))
+$(foreach v,$(NAND_BINS),$(eval $(call mkdep,nand-utils/,$(v))))
+$(foreach v,$(NOR_BINS),$(eval $(call mkdep,nor-utils/,$(v))))
 
 #
 # Common libmtd
@@ -100,15 +112,6 @@ obj-libmtd.a = libmtd.o libmtd_legacy.o libcrc32.o libfec.o
 $(call _mkdep,lib/,libmtd.a)
 
 #
-# Utils in mkfs.ubifs subdir
-#
-obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
-	hashtable/hashtable.o hashtable/hashtable_itr.o
-LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
-LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
-$(call mkdep,mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
-
-#
 # Utils in ubi-utils/ subdir
 #
 obj-libiniparser.a = libiniparser.o dictionary.o
@@ -122,3 +125,12 @@ obj-ubiformat = libubigen.a libscan.a
 
 $(foreach v,libubi.a libubigen.a libiniparser.a libscan.a,$(eval $(call _mkdep,ubi-utils/,$(v))))
 $(foreach v,$(UBI_BINS),$(eval $(call mkdep,ubi-utils/,$(v),libubi.a ubiutils-common.o)))
+
+#
+# Utils in ubifs-utils subdir
+#
+obj-mkfs.ubifs = crc16.o lpt.o compr.o devtable.o \
+	hashtable/hashtable.o hashtable/hashtable_itr.o
+LDFLAGS_mkfs.ubifs = $(ZLIBLDFLAGS) $(LZOLDFLAGS) $(UUIDLDFLAGS)
+LDLIBS_mkfs.ubifs = -lz -llzo2 -lm -luuid
+$(call mkdep,ubifs-utils/mkfs.ubifs/,mkfs.ubifs,,ubi-utils/libubi.a)
diff --git a/flash_erase.c b/flash-utils/flash_erase.c
similarity index 100%
rename from flash_erase.c
rename to flash-utils/flash_erase.c
diff --git a/flash_eraseall b/flash-utils/flash_eraseall
similarity index 100%
rename from flash_eraseall
rename to flash-utils/flash_eraseall
diff --git a/flash_lock.c b/flash-utils/flash_lock.c
similarity index 100%
rename from flash_lock.c
rename to flash-utils/flash_lock.c
diff --git a/flash_otp_dump.c b/flash-utils/flash_otp_dump.c
similarity index 100%
rename from flash_otp_dump.c
rename to flash-utils/flash_otp_dump.c
diff --git a/flash_otp_info.c b/flash-utils/flash_otp_info.c
similarity index 100%
rename from flash_otp_info.c
rename to flash-utils/flash_otp_info.c
diff --git a/flash_otp_lock.c b/flash-utils/flash_otp_lock.c
similarity index 100%
rename from flash_otp_lock.c
rename to flash-utils/flash_otp_lock.c
diff --git a/flash_otp_write.c b/flash-utils/flash_otp_write.c
similarity index 100%
rename from flash_otp_write.c
rename to flash-utils/flash_otp_write.c
diff --git a/flash_unlock.c b/flash-utils/flash_unlock.c
similarity index 100%
rename from flash_unlock.c
rename to flash-utils/flash_unlock.c
diff --git a/flashcp.c b/flash-utils/flashcp.c
similarity index 100%
rename from flashcp.c
rename to flash-utils/flashcp.c
diff --git a/compr.c b/jffsX-utils/compr.c
similarity index 100%
rename from compr.c
rename to jffsX-utils/compr.c
diff --git a/compr.h b/jffsX-utils/compr.h
similarity index 100%
rename from compr.h
rename to jffsX-utils/compr.h
diff --git a/compr_lzo.c b/jffsX-utils/compr_lzo.c
similarity index 100%
rename from compr_lzo.c
rename to jffsX-utils/compr_lzo.c
diff --git a/compr_rtime.c b/jffsX-utils/compr_rtime.c
similarity index 100%
rename from compr_rtime.c
rename to jffsX-utils/compr_rtime.c
diff --git a/compr_zlib.c b/jffsX-utils/compr_zlib.c
similarity index 100%
rename from compr_zlib.c
rename to jffsX-utils/compr_zlib.c
diff --git a/device_table.txt b/jffsX-utils/device_table.txt
similarity index 100%
rename from device_table.txt
rename to jffsX-utils/device_table.txt
diff --git a/jffs-dump.c b/jffsX-utils/jffs-dump.c
similarity index 100%
rename from jffs-dump.c
rename to jffsX-utils/jffs-dump.c
diff --git a/jffs2dump.c b/jffsX-utils/jffs2dump.c
similarity index 100%
rename from jffs2dump.c
rename to jffsX-utils/jffs2dump.c
diff --git a/jffs2reader.c b/jffsX-utils/jffs2reader.c
similarity index 100%
rename from jffs2reader.c
rename to jffsX-utils/jffs2reader.c
diff --git a/mkfs.jffs2.1 b/jffsX-utils/mkfs.jffs2.1
similarity index 100%
rename from mkfs.jffs2.1
rename to jffsX-utils/mkfs.jffs2.1
diff --git a/mkfs.jffs2.c b/jffsX-utils/mkfs.jffs2.c
similarity index 100%
rename from mkfs.jffs2.c
rename to jffsX-utils/mkfs.jffs2.c
diff --git a/rbtree.c b/jffsX-utils/rbtree.c
similarity index 100%
rename from rbtree.c
rename to jffsX-utils/rbtree.c
diff --git a/rbtree.h b/jffsX-utils/rbtree.h
similarity index 100%
rename from rbtree.h
rename to jffsX-utils/rbtree.h
diff --git a/summary.h b/jffsX-utils/summary.h
similarity index 100%
rename from summary.h
rename to jffsX-utils/summary.h
diff --git a/sumtool.c b/jffsX-utils/sumtool.c
similarity index 100%
rename from sumtool.c
rename to jffsX-utils/sumtool.c
diff --git a/MAKEDEV b/misc-utils/MAKEDEV
similarity index 100%
rename from MAKEDEV
rename to misc-utils/MAKEDEV
diff --git a/doc_loadbios.c b/misc-utils/doc_loadbios.c
similarity index 100%
rename from doc_loadbios.c
rename to misc-utils/doc_loadbios.c
diff --git a/docfdisk.c b/misc-utils/docfdisk.c
similarity index 100%
rename from docfdisk.c
rename to misc-utils/docfdisk.c
diff --git a/fectest.c b/misc-utils/fectest.c
similarity index 100%
rename from fectest.c
rename to misc-utils/fectest.c
diff --git a/ftl_check.c b/misc-utils/ftl_check.c
similarity index 100%
rename from ftl_check.c
rename to misc-utils/ftl_check.c
diff --git a/ftl_format.c b/misc-utils/ftl_format.c
similarity index 100%
rename from ftl_format.c
rename to misc-utils/ftl_format.c
diff --git a/mcast_image.h b/misc-utils/mcast_image.h
similarity index 100%
rename from mcast_image.h
rename to misc-utils/mcast_image.h
diff --git a/mtd_debug.c b/misc-utils/mtd_debug.c
similarity index 100%
rename from mtd_debug.c
rename to misc-utils/mtd_debug.c
diff --git a/recv_image.c b/misc-utils/recv_image.c
similarity index 100%
rename from recv_image.c
rename to misc-utils/recv_image.c
diff --git a/serve_image.c b/misc-utils/serve_image.c
similarity index 100%
rename from serve_image.c
rename to misc-utils/serve_image.c
diff --git a/load_nandsim.sh b/nand-utils/load_nandsim.sh
similarity index 100%
rename from load_nandsim.sh
rename to nand-utils/load_nandsim.sh
diff --git a/nanddump.c b/nand-utils/nanddump.c
similarity index 100%
rename from nanddump.c
rename to nand-utils/nanddump.c
diff --git a/nandtest.c b/nand-utils/nandtest.c
similarity index 100%
rename from nandtest.c
rename to nand-utils/nandtest.c
diff --git a/nandwrite.c b/nand-utils/nandwrite.c
similarity index 100%
rename from nandwrite.c
rename to nand-utils/nandwrite.c
diff --git a/nftl_format.c b/nand-utils/nftl_format.c
similarity index 100%
rename from nftl_format.c
rename to nand-utils/nftl_format.c
diff --git a/nftldump.c b/nand-utils/nftldump.c
similarity index 100%
rename from nftldump.c
rename to nand-utils/nftldump.c
diff --git a/rfddump.c b/nor-utils/rfddump.c
similarity index 100%
rename from rfddump.c
rename to nor-utils/rfddump.c
diff --git a/rfdformat.c b/nor-utils/rfdformat.c
similarity index 100%
rename from rfdformat.c
rename to nor-utils/rfdformat.c
diff --git a/mkfs.ubifs/.gitignore b/ubifs-utils/mkfs.ubifs/.gitignore
similarity index 100%
rename from mkfs.ubifs/.gitignore
rename to ubifs-utils/mkfs.ubifs/.gitignore
diff --git a/mkfs.ubifs/COPYING b/ubifs-utils/mkfs.ubifs/COPYING
similarity index 100%
rename from mkfs.ubifs/COPYING
rename to ubifs-utils/mkfs.ubifs/COPYING
diff --git a/mkfs.ubifs/README b/ubifs-utils/mkfs.ubifs/README
similarity index 100%
rename from mkfs.ubifs/README
rename to ubifs-utils/mkfs.ubifs/README
diff --git a/mkfs.ubifs/compr.c b/ubifs-utils/mkfs.ubifs/compr.c
similarity index 100%
rename from mkfs.ubifs/compr.c
rename to ubifs-utils/mkfs.ubifs/compr.c
diff --git a/mkfs.ubifs/compr.h b/ubifs-utils/mkfs.ubifs/compr.h
similarity index 100%
rename from mkfs.ubifs/compr.h
rename to ubifs-utils/mkfs.ubifs/compr.h
diff --git a/mkfs.ubifs/crc16.c b/ubifs-utils/mkfs.ubifs/crc16.c
similarity index 100%
rename from mkfs.ubifs/crc16.c
rename to ubifs-utils/mkfs.ubifs/crc16.c
diff --git a/mkfs.ubifs/crc16.h b/ubifs-utils/mkfs.ubifs/crc16.h
similarity index 100%
rename from mkfs.ubifs/crc16.h
rename to ubifs-utils/mkfs.ubifs/crc16.h
diff --git a/mkfs.ubifs/defs.h b/ubifs-utils/mkfs.ubifs/defs.h
similarity index 100%
rename from mkfs.ubifs/defs.h
rename to ubifs-utils/mkfs.ubifs/defs.h
diff --git a/mkfs.ubifs/devtable.c b/ubifs-utils/mkfs.ubifs/devtable.c
similarity index 100%
rename from mkfs.ubifs/devtable.c
rename to ubifs-utils/mkfs.ubifs/devtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.c b/ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.c
rename to ubifs-utils/mkfs.ubifs/hashtable/hashtable.c
diff --git a/mkfs.ubifs/hashtable/hashtable.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable.h
rename to ubifs-utils/mkfs.ubifs/hashtable/hashtable.h
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.c b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.c
rename to ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.c
diff --git a/mkfs.ubifs/hashtable/hashtable_itr.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_itr.h
rename to ubifs-utils/mkfs.ubifs/hashtable/hashtable_itr.h
diff --git a/mkfs.ubifs/hashtable/hashtable_private.h b/ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
similarity index 100%
rename from mkfs.ubifs/hashtable/hashtable_private.h
rename to ubifs-utils/mkfs.ubifs/hashtable/hashtable_private.h
diff --git a/mkfs.ubifs/key.h b/ubifs-utils/mkfs.ubifs/key.h
similarity index 100%
rename from mkfs.ubifs/key.h
rename to ubifs-utils/mkfs.ubifs/key.h
diff --git a/mkfs.ubifs/lpt.c b/ubifs-utils/mkfs.ubifs/lpt.c
similarity index 100%
rename from mkfs.ubifs/lpt.c
rename to ubifs-utils/mkfs.ubifs/lpt.c
diff --git a/mkfs.ubifs/lpt.h b/ubifs-utils/mkfs.ubifs/lpt.h
similarity index 100%
rename from mkfs.ubifs/lpt.h
rename to ubifs-utils/mkfs.ubifs/lpt.h
diff --git a/mkfs.ubifs/mkfs.ubifs.c b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.c
rename to ubifs-utils/mkfs.ubifs/mkfs.ubifs.c
diff --git a/mkfs.ubifs/mkfs.ubifs.h b/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
similarity index 100%
rename from mkfs.ubifs/mkfs.ubifs.h
rename to ubifs-utils/mkfs.ubifs/mkfs.ubifs.h
diff --git a/mkfs.ubifs/ubifs.h b/ubifs-utils/mkfs.ubifs/ubifs.h
similarity index 100%
rename from mkfs.ubifs/ubifs.h
rename to ubifs-utils/mkfs.ubifs/ubifs.h
-- 
1.8.4.2
