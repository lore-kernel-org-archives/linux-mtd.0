Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZuTTH-0005I6-GT
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 22:57:33 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, alex@nextthing.co,
 Richard Weinberger <richard@nod.at>
Subject: [PATCH 4/5] UBI: Add basic read counter support
Date: Thu,  5 Nov 2015 23:56:56 +0100
Message-Id: <1446764217-15021-5-git-send-email-richard@nod.at>
In-Reply-To: <1446764217-15021-1-git-send-email-richard@nod.at>
References: <1446764217-15021-1-git-send-email-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Read counters allow to deal better with read disturb.
If the thresholds are known, jeopardized PEBs can be
re-erased before data is lost.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/Kconfig | 12 ++++++++++++
 drivers/mtd/ubi/io.c    |  1 +
 drivers/mtd/ubi/ubi.h   |  5 +++++
 drivers/mtd/ubi/wl.c    | 37 +++++++++++++++++++++++++++++++++++++
 4 files changed, 55 insertions(+)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index f0855ce..7a33cbf 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -103,4 +103,16 @@ config MTD_UBI_BLOCK
 
 	   If in doubt, say "N".
 
+config MTD_UBI_READ_COUNTER
+	bool "Maintain a per block read counter"
+	default n
+	help
+	   This option enables a per block read counter such that userspace can
+	   query how often a block has been read since erasure.
+	   Enable this if you plan to use UBI on MLC NAND in conjunction with
+	   ubihealthd. It will increase UBI's memory footprint by
+	   sizeof(unsigned int) * number of eraseblocks.
+
+	   If in doubt, say "N".
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 1fc23e4..2018bd1 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -164,6 +164,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
 
 	addr = (loff_t)pnum * ubi->peb_size + offset;
 retry:
+	ubi_wl_update_rc((struct ubi_device *)ubi, pnum);
 	err = mtd_read(ubi->mtd, addr, len, &read, buf);
 	if (err) {
 		const char *errstr = mtd_is_eccerr(err) ? " (ECC error)" : "";
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 40c9eeb..9bfede0 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -168,6 +168,7 @@ enum {
  * @u.list: link in the protection queue
  * @ec: erase counter
  * @pnum: physical eraseblock number
+ * @rc: number reads since last erasure
  *
  * This data structure is used in the WL sub-system. Each physical eraseblock
  * has a corresponding &struct wl_entry object which may be kept in different
@@ -180,6 +181,9 @@ struct ubi_wl_entry {
 	} u;
 	int ec;
 	int pnum;
+#ifdef CONFIG_MTD_UBI_READ_COUNTER
+	unsigned int rc;
+#endif
 };
 
 /**
@@ -860,6 +864,7 @@ int ubi_is_erase_work(struct ubi_work *wrk);
 void ubi_refill_pools(struct ubi_device *ubi);
 int ubi_ensure_anchor_pebs(struct ubi_device *ubi);
 int ubi_bitrot_check(struct ubi_device *ubi, int pnum, int force_scrub);
+void ubi_wl_update_rc(struct ubi_device *ubi, int pnum);
 
 /* io.c */
 int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index ad02c46..43466d4 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -447,6 +447,41 @@ static int prot_queue_del(struct ubi_device *ubi, int pnum)
 	return 0;
 }
 
+void ubi_wl_update_rc(struct ubi_device *ubi, int pnum)
+{
+#ifdef CONFIG_MTD_UBI_READ_COUNTER
+	struct ubi_wl_entry *e;
+
+	/*
+	 * WL not initialized yet.
+	 */
+	if (!ubi->lookuptbl)
+		return;
+
+	spin_lock(&ubi->wl_lock);
+	e = ubi->lookuptbl[pnum];
+	if (e)
+		e->rc++;
+	spin_unlock(&ubi->wl_lock);
+#endif
+}
+
+static void ubi_wl_clear_rc(struct ubi_wl_entry *e)
+{
+#ifdef CONFIG_MTD_UBI_READ_COUNTER
+	e->rc = 0;
+#endif
+}
+
+static void ubi_wl_get_rc(struct ubi_wl_entry *e, struct ubi_stats_entry *se)
+{
+#ifdef CONFIG_MTD_UBI_READ_COUNTER
+	se->rc = e->rc;
+#else
+	se->rc = -1;
+#endif
+}
+
 /**
  * sync_erase - synchronously erase a physical eraseblock.
  * @ubi: UBI device description object
@@ -477,6 +512,8 @@ static int sync_erase(struct ubi_device *ubi, struct ubi_wl_entry *e,
 	if (err < 0)
 		goto out_free;
 
+	ubi_wl_clear_rc(e);
+
 	ec += err;
 	if (ec > UBI_MAX_ERASECOUNTER) {
 		/*
-- 
1.8.4.5
