Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1F8C-0005GV-6l
	for linux-mtd@lists.infradead.org; Mon, 12 Apr 2010 08:36:33 +0000
Received: by mail-pw0-f49.google.com with SMTP id 4so487987pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Apr 2010 01:36:22 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 12 Apr 2010 14:06:22 +0530
Message-ID: <x2k6b5362aa1004120136ub7b320c9re54413ff6a6e35da@mail.gmail.com>
Subject: PATCH 5/7] ubi: logging feature for ubi
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, rohit.dongre@samsung.com,
	brijesh.s.singh@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Note: debug functions for logging feature

Signed-off-by: Rohit Dongre <rohit.dongre@samsung.com>
---
--- ubi_old/drivers/mtd/ubi/debug.h	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/debug.h	2010-04-09 21:54:02.635580892 +0530
@@ -94,6 +94,28 @@
 #define UBI_IO_DEBUG 0
 #endif

+
+#ifdef CONFIG_MTD_UBI_DEBUG_MSG_SB
+/* Messages from sb module of UBI with log */
+#define dbg_sb(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
+#else
+#define dbg_sb(fmt, ...) ({})
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_MSG_CMT
+/* Messages from commit module of UBI with log */
+#define dbg_cmt(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
+#else
+#define dbg_cmt(fmt, ...) ({})
+#endif
+
+#ifdef CONFIG_MTD_UBI_DEBUG_MSG_EL
+/* Messages from el module of UBI with log */
+#define dbg_el(fmt, ...) dbg_msg(fmt, ##__VA_ARGS__)
+#else
+#define dbg_el(fmt, ...) ({})
+#endif
+
 #ifdef CONFIG_MTD_UBI_DEBUG_PARANOID
 int ubi_dbg_check_all_ff(struct ubi_device *ubi, int pnum, int
offset, int len);
 int ubi_dbg_check_write(struct ubi_device *ubi, const void *buf, int pnum,
@@ -163,6 +185,9 @@
 #define dbg_wl(fmt, ...)                 ({})
 #define dbg_io(fmt, ...)                 ({})
 #define dbg_bld(fmt, ...)                ({})
+#define dbg_sb(fmt, ...)                 ({})
+#define dbg_cmt(fmt, ...)                ({})
+#define dbg_el(fmt, ...)                 ({})
 #define ubi_dbg_dump_stack()             ({})
 #define ubi_dbg_dump_ec_hdr(ec_hdr)      ({})
 #define ubi_dbg_dump_vid_hdr(vid_hdr)    ({})
--- ubi_old/drivers/mtd/ubi/scan.h	2010-04-09 21:54:13.955581334 +0530
+++ ubi_new/drivers/mtd/ubi/scan.h	2010-04-09 21:54:02.645580870 +0530
@@ -89,6 +89,7 @@
  * @corr: list of corrupted physical eraseblocks
  * @free: list of free physical eraseblocks
  * @erase: list of physical eraseblocks which have to be erased
+ * @resvd: list of physical eraseblocks which are resrvd for special use
  * @alien: list of physical eraseblocks which should not be used by UBI (e.g.,
  *         those belonging to "preserve"-compatible internal volumes)
  * @bad_peb_count: count of bad physical eraseblocks
@@ -113,6 +114,9 @@
 	struct list_head corr;
 	struct list_head free;
 	struct list_head erase;
+#ifdef CONFIG_MTD_UBI_LOGGED
+	struct list_head resvd;
+#endif
 	struct list_head alien;
 	int bad_peb_count;
 	int vols_found;
