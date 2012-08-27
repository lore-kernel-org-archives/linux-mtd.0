Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1T60Cc-000804-Ng
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 14:22:07 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD Maling List <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: print less
Date: Mon, 27 Aug 2012 17:22:19 +0300
Message-Id: <1346077339-20071-1-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1345451602-22494-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

UBI currently prints a lot of information when it mounts a volume, which
bothers some people. Make it less chatty - print only important information
by default.

Reported-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
---
 drivers/mtd/ubi/build.c |   51 +++++++++++++++++++----------------------------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 998a0bf..91a7647a 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -619,6 +619,9 @@ static int get_bad_peb_limit(const struct ubi_device *ubi, int max_beb_per1024)
  */
 static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 {
+	dbg_msg("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
+	dbg_msg("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
+
 	if (ubi->mtd->numeraseregions != 0) {
 		/*
 		 * Some flashes have several erase regions. Different regions
@@ -760,17 +763,6 @@ static int io_init(struct ubi_device *ubi, int max_beb_per1024)
 		ubi->ro_mode = 1;
 	}
 
-	ubi_msg("physical eraseblock size:   %d bytes (%d KiB)",
-		ubi->peb_size, ubi->peb_size >> 10);
-	ubi_msg("logical eraseblock size:    %d bytes", ubi->leb_size);
-	ubi_msg("smallest flash I/O unit:    %d", ubi->min_io_size);
-	if (ubi->hdrs_min_io_size != ubi->min_io_size)
-		ubi_msg("sub-page size:              %d",
-			ubi->hdrs_min_io_size);
-	ubi_msg("VID header offset:          %d (aligned %d)",
-		ubi->vid_hdr_offset, ubi->vid_hdr_aloffset);
-	ubi_msg("data offset:                %d", ubi->leb_start);
-
 	/*
 	 * Note, ideally, we have to initialize @ubi->bad_peb_count here. But
 	 * unfortunately, MTD does not provide this information. We should loop
@@ -932,8 +924,6 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 	spin_lock_init(&ubi->volumes_lock);
 
 	ubi_msg("attaching mtd%d to ubi%d", mtd->index, ubi_num);
-	dbg_msg("sizeof(struct ubi_ainf_peb) %zu", sizeof(struct ubi_ainf_peb));
-	dbg_msg("sizeof(struct ubi_wl_entry) %zu", sizeof(struct ubi_wl_entry));
 
 	err = io_init(ubi, max_beb_per1024);
 	if (err)
@@ -976,23 +966,24 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		goto out_debugfs;
 	}
 
-	ubi_msg("attached mtd%d to ubi%d", mtd->index, ubi_num);
-	ubi_msg("MTD device name:            \"%s\"", mtd->name);
-	ubi_msg("MTD device size:            %llu MiB", ubi->flash_size >> 20);
-	ubi_msg("number of good PEBs:        %d", ubi->good_peb_count);
-	ubi_msg("number of bad PEBs:         %d", ubi->bad_peb_count);
-	ubi_msg("number of corrupted PEBs:   %d", ubi->corr_peb_count);
-	ubi_msg("max. allowed volumes:       %d", ubi->vtbl_slots);
-	ubi_msg("wear-leveling threshold:    %d", CONFIG_MTD_UBI_WL_THRESHOLD);
-	ubi_msg("number of internal volumes: %d", UBI_INT_VOL_COUNT);
-	ubi_msg("number of user volumes:     %d",
-		ubi->vol_count - UBI_INT_VOL_COUNT);
-	ubi_msg("available PEBs:             %d", ubi->avail_pebs);
-	ubi_msg("total number of reserved PEBs: %d", ubi->rsvd_pebs);
-	ubi_msg("number of PEBs reserved for bad PEB handling: %d",
-		ubi->beb_rsvd_pebs);
-	ubi_msg("max/mean erase counter: %d/%d", ubi->max_ec, ubi->mean_ec);
-	ubi_msg("image sequence number:  %u", ubi->image_seq);
+	ubi_msg("attached mtd%d (name \"%s\", size %llu MiB) to ubi%d",
+		mtd->index, mtd->name, ubi->flash_size >> 20, ubi_num);
+	ubi_msg("PEB size: %d bytes (%d KiB), LEB size: %d bytes",
+		ubi->peb_size, ubi->peb_size >> 10, ubi->leb_size);
+	ubi_msg("min./max_I/O unit_sizes: %d/%d, sub-page size %d",
+		ubi->min_io_size, ubi->max_write_size, ubi->hdrs_min_io_size);
+	ubi_msg("VID header offset: %d (aligned %d), data offset: %d",
+		ubi->vid_hdr_offset, ubi->vid_hdr_aloffset, ubi->leb_start);
+	ubi_msg("good PEBs: %d, bad PEBs: %d, corrupted PEBs: %d",
+		ubi->good_peb_count, ubi->bad_peb_count, ubi->corr_peb_count);
+	ubi_msg("user volume: %d, internal volumes: %d, max. volumes count: %d",
+		ubi->vol_count - UBI_INT_VOL_COUNT, UBI_INT_VOL_COUNT,
+		ubi->vtbl_slots);
+	ubi_msg("max/mean erase counter: %d/%d, WL threshold: %d, image sequence number: %u",
+		ubi->max_ec, ubi->mean_ec, CONFIG_MTD_UBI_WL_THRESHOLD,
+		ubi->image_seq);
+	ubi_msg("available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
+		ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
 
 	/*
 	 * The below lock makes sure we do not race with 'ubi_thread()' which
-- 
1.7.10.4
