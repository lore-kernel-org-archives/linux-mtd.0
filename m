Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SrSgI-00058S-Lp
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2012 11:44:41 +0000
Received: by lbbgg6 with SMTP id gg6so2076926lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jul 2012 04:44:36 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 2/3] UBI: limit amount of reserved eraseblocks for bad PEB
 handling
Date: Wed, 18 Jul 2012 14:38:44 +0300
Message-Id: <1342611525-25539-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1342611525-25539-1-git-send-email-dedekind1@gmail.com>
References: <1342611525-25539-1-git-send-email-dedekind1@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Shmulik Ladkani <shmulik.ladkani@gmail.com>

The existing mechanism of reserving PEBs for bad PEB handling has two
flaws:
- It is calculated as a percentage of good PEBs instead of total PEBs.
- There's no limit on the amount of PEBs UBI reserves for future bad
  eraseblock handling.

This patch changes the mechanism to overcome these flaws.

The desired level of PEBs reserved for bad PEB handling (beb_rsvd_level)
is set to the maximum expected bad eraseblocks (bad_peb_limit) minus the
existing number of bad eraseblocks (bad_peb_count).

The actual amount of PEBs reserved for bad PEB handling is usually set
to the desired level (but in some circumstances may be lower than the
desired level, e.g. when attaching to a device that has too few
available PEBs to satisfy the desired level).

In the case where the device has too many bad PEBs (above the expected
limit), then the desired level, and the actual amount of PEBs reserved
are set to zero. No PEBs will be set aside for future bad eraseblock
handling - even if some PEBs are made available (e.g. by shrinking a
volume).
If another PEB goes bad, and there are available PEBs, then the
eraseblock will be marked bad (consuming one available PEB). But if
there are no available PEBs, ubi will go into readonly mode.

Artem: reworked the erase_worker() changes a bit.

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/Kconfig |   17 ++++++++++++-----
 drivers/mtd/ubi/misc.c  |   16 ++++++++++++----
 drivers/mtd/ubi/wl.c    |   38 +++++++++++++++-----------------------
 3 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 76195ac..d747b0f 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -48,11 +48,18 @@ config MTD_UBI_BEB_LIMIT
 	default 2
 	range 0 25
 	help
-	  This option specifies the maximum bad physical eraseblocks UBI
-	  expects on the UBI device (percents of total number of physical
-	  eraseblocks on this MTD partition). If the underlying flash does not
-	  admit of bad eraseblocks (e.g. NOR flash), this value is ignored.
-	  Leave the default value if unsure.
+	  If the MTD device admits of bad eraseblocks (e.g. NAND flash), UBI
+	  reserves some amount of physical eraseblocks to handle new bad
+	  eraseblocks. This option specifies the maximum bad physical
+	  eraseblocks UBI expects on the UBI device (percents of total number
+	  of physical eraseblocks on this MTD partition). If the device has
+	  more bad eraseblocks than this limit, UBI does not reserve any more
+	  physical eraseblocks for new bad eraseblocks, but attempts to use
+	  available physical eraseblocks (if any), i.e., those ones which are
+	  not reserved for any UBI volume.
+
+	  If the underlying flash does not admit of bad eraseblocks (e.g. NOR
+	  flash), this value is ignored. Leave the default value if unsure.
 
 config MTD_UBI_GLUEBI
 	tristate "MTD devices emulation driver (gluebi)"
diff --git a/drivers/mtd/ubi/misc.c b/drivers/mtd/ubi/misc.c
index 8bbfb44..d089df0 100644
--- a/drivers/mtd/ubi/misc.c
+++ b/drivers/mtd/ubi/misc.c
@@ -121,10 +121,18 @@ void ubi_update_reserved(struct ubi_device *ubi)
  */
 void ubi_calculate_reserved(struct ubi_device *ubi)
 {
-	ubi->beb_rsvd_level = ubi->good_peb_count/100;
-	ubi->beb_rsvd_level *= CONFIG_MTD_UBI_BEB_RESERVE;
-	if (ubi->beb_rsvd_level < MIN_RESEVED_PEBS)
-		ubi->beb_rsvd_level = MIN_RESEVED_PEBS;
+	/*
+	 * Calculate the actual number of PEBs currently needed to be reserved
+	 * for future bad eraseblock handling.
+	 */
+	ubi->beb_rsvd_level = ubi->bad_peb_limit - ubi->bad_peb_count;
+	if (ubi->beb_rsvd_level < 0) {
+		ubi->beb_rsvd_level = 0;
+		ubi_warn("number of bad PEBs (%d) is above the expected limit "
+			 "(%d), not reserving any PEBs for bad PEB handling, "
+			 "will use available PEBs (if any)",
+			 ubi->bad_peb_count, ubi->bad_peb_limit);
+	}
 }
 
 /**
diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
index b6be644..5908881 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -978,7 +978,7 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 			int cancel)
 {
 	struct ubi_wl_entry *e = wl_wrk->e;
-	int pnum = e->pnum, err, need;
+	int pnum = e->pnum, err;
 	int vol_id = wl_wrk->vol_id;
 	int lnum = wl_wrk->lnum;
 
@@ -1044,40 +1044,32 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		goto out_ro;
 	}
 
-	spin_lock(&ubi->volumes_lock);
-	need = ubi->beb_rsvd_level - ubi->beb_rsvd_pebs + 1;
-	if (need > 0) {
-		need = ubi->avail_pebs >= need ? need : ubi->avail_pebs;
-		ubi->avail_pebs -= need;
-		ubi->rsvd_pebs += need;
-		ubi->beb_rsvd_pebs += need;
-		if (need > 0)
-			ubi_msg("reserve more %d PEBs", need);
-	}
-
-	if (ubi->beb_rsvd_pebs == 0) {
-		spin_unlock(&ubi->volumes_lock);
-		ubi_err("no reserved physical eraseblocks");
-		goto out_ro;
-	}
-	spin_unlock(&ubi->volumes_lock);
-
 	ubi_msg("mark PEB %d as bad", pnum);
 	err = ubi_io_mark_bad(ubi, pnum);
 	if (err)
 		goto out_ro;
 
 	spin_lock(&ubi->volumes_lock);
-	ubi->beb_rsvd_pebs -= 1;
+	if (ubi->beb_rsvd_pebs > 0) {
+		ubi->beb_rsvd_pebs -= 1;
+	} else if (ubi->beb_rsvd_pebs == 0) {
+		if (ubi->avail_pebs == 0) {
+			spin_unlock(&ubi->volumes_lock);
+			ubi_err("no reserved/available physical eraseblocks");
+			goto out_ro;
+		}
+		ubi->avail_pebs -= 1;
+	}
+
 	ubi->bad_peb_count += 1;
 	ubi->good_peb_count -= 1;
 	ubi_calculate_reserved(ubi);
+	spin_unlock(&ubi->volumes_lock);
+
 	if (ubi->beb_rsvd_pebs)
 		ubi_msg("%d PEBs left in the reserve", ubi->beb_rsvd_pebs);
 	else
-		ubi_warn("last PEB from the reserved pool was used");
-	spin_unlock(&ubi->volumes_lock);
-
+		ubi_warn("last PEB from the reserve was used");
 	return err;
 
 out_ro:
-- 
1.7.7.6
