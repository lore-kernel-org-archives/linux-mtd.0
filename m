Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvqUE-00030y-Sg
 for linux-mtd@lists.infradead.org; Mon, 30 Jul 2012 13:58:22 +0000
Received: by bkcji2 with SMTP id ji2so2949632bkc.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Jul 2012 06:58:10 -0700 (PDT)
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: [PATCH 3/5] UBI: limit amount of reserved eraseblocks for bad PEB
 handling
Date: Mon, 30 Jul 2012 16:57:39 +0300
Message-Id: <1343656661-8096-3-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
References: <1343656661-8096-1-git-send-email-dedekind1@gmail.com>
Cc: linux-mtd@lists.infradead.org
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

Signed-off-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
---
 drivers/mtd/ubi/misc.c | 16 ++++++++++++----
 drivers/mtd/ubi/wl.c   | 46 +++++++++++++++++++++++++++++-----------------
 2 files changed, 41 insertions(+), 21 deletions(-)

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
index b6be644..bd05276 100644
--- a/drivers/mtd/ubi/wl.c
+++ b/drivers/mtd/ubi/wl.c
@@ -978,9 +978,10 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 			int cancel)
 {
 	struct ubi_wl_entry *e = wl_wrk->e;
-	int pnum = e->pnum, err, need;
+	int pnum = e->pnum;
 	int vol_id = wl_wrk->vol_id;
 	int lnum = wl_wrk->lnum;
+	int err, available_consumed = 0;
 
 	if (cancel) {
 		dbg_wl("cancel erasure of PEB %d EC %d", pnum, e->ec);
@@ -1045,20 +1046,14 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 	}
 
 	spin_lock(&ubi->volumes_lock);
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
 	if (ubi->beb_rsvd_pebs == 0) {
-		spin_unlock(&ubi->volumes_lock);
-		ubi_err("no reserved physical eraseblocks");
-		goto out_ro;
+		if (ubi->avail_pebs == 0) {
+			spin_unlock(&ubi->volumes_lock);
+			ubi_err("no reserved/available physical eraseblocks");
+			goto out_ro;
+		}
+		ubi->avail_pebs -= 1;
+		available_consumed = 1;
 	}
 	spin_unlock(&ubi->volumes_lock);
 
@@ -1068,19 +1063,36 @@ static int erase_worker(struct ubi_device *ubi, struct ubi_work *wl_wrk,
 		goto out_ro;
 
 	spin_lock(&ubi->volumes_lock);
-	ubi->beb_rsvd_pebs -= 1;
+	if (ubi->beb_rsvd_pebs > 0) {
+		if (available_consumed) {
+			/*
+			 * The amount of reserved PEBs increased since we last
+			 * checked.
+			 */
+			ubi->avail_pebs += 1;
+			available_consumed = 0;
+		}
+		ubi->beb_rsvd_pebs -= 1;
+	}
 	ubi->bad_peb_count += 1;
 	ubi->good_peb_count -= 1;
 	ubi_calculate_reserved(ubi);
-	if (ubi->beb_rsvd_pebs)
+	if (available_consumed)
+		ubi_warn("no PEBs in the reserved pool, used an available PEB");
+	else if (ubi->beb_rsvd_pebs)
 		ubi_msg("%d PEBs left in the reserve", ubi->beb_rsvd_pebs);
 	else
-		ubi_warn("last PEB from the reserved pool was used");
+		ubi_warn("last PEB from the reserve was used");
 	spin_unlock(&ubi->volumes_lock);
 
 	return err;
 
 out_ro:
+	if (available_consumed) {
+		spin_lock(&ubi->volumes_lock);
+		ubi->avail_pebs += 1;
+		spin_unlock(&ubi->volumes_lock);
+	}
 	ubi_ro_mode(ubi);
 	return err;
 }
-- 
1.7.11.2
