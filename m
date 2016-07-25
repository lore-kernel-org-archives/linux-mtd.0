Received: from relay1.mentorg.com ([192.94.38.131])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRcTu-0003A0-Kb
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 09:47:28 +0000
From: Rajeev Kumar <rajeev_kumar@mentor.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>
CC: <dedekind1@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <stable@vger.kernel.org>, <rajeev_kumar@mentor.com>
Subject: [PATCH 1/2] MTD: UBI: speed up init by moving status messages to
 debugfs
Date: Mon, 25 Jul 2016 15:16:58 +0530
Message-ID: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch simply moves the verbose status messages associated with
UBI's fastmap feature to debugfs, thereby decreasing UBI
initialization time from 97 mS to 16 mS. Note that the first time
fastmap is invoked, building the fastmap took 146 mS. In order to
reproduce the test conditions, build with CONFIG_MTD_UBI_FASTMAP=y and
CONFIG_DYNAMIC_DEBUG=y and append the following to bootargs:

initcall_debug ubi.mtd=0 ubi.fm_autoconvert=1

ubi.mtd=0 is needed at every boot if you want ubi to be
autoloaded. ubi.fm_autoconvert switch is needed only once, when
fastmap is created.

How to restore the verbose output for testing:
-----------------------------------------------
root:~# ubidetach -p /dev/mtd0
root:~# mount -t debugfs none /mnt/dyndbg
root:~# echo 'file build.c +p' > /mnt/dyndbg/dynamic_debug/control
root:~# echo 'file fastmap.c +p' > /mnt/dyndbg/dynamic_debug/control
root:~# ubiattach -p /dev/mtd0
root:~# mount -t ubifs /dev/ubi0_0 /mnt/card
-----------------------------------------------
This patch is tested against 3.14 kernel and only build test is performed
against current upstream master branch.

Signed-off-by: Rajeev Kumar <rajeev_kumar@mentor.com>
---
 drivers/mtd/ubi/build.c   |   20 ++++++++++----------
 drivers/mtd/ubi/fastmap.c |    6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index ef36182..59229c4 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -949,8 +949,8 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		ubi->fm_disabled = 1;
 	}
 
-	ubi_msg(ubi, "default fastmap pool size: %d", ubi->fm_pool.max_size);
-	ubi_msg(ubi, "default fastmap WL pool size: %d",
+	dbg_gen("default fastmap pool size: %d", ubi->fm_pool.max_size);
+	dbg_gen("default fastmap WL pool size: %d",
 		ubi->fm_wl_pool.max_size);
 #else
 	ubi->fm_disabled = 1;
@@ -1008,23 +1008,23 @@ int ubi_attach_mtd_dev(struct mtd_info *mtd, int ubi_num,
 		goto out_debugfs;
 	}
 
-	ubi_msg(ubi, "attached mtd%d (name \"%s\", size %llu MiB)",
+	dbg_gen("attached mtd%d (name \"%s\", size %llu MiB)",
 		mtd->index, mtd->name, ubi->flash_size >> 20);
-	ubi_msg(ubi, "PEB size: %d bytes (%d KiB), LEB size: %d bytes",
+	dbg_gen("PEB size: %d bytes (%d KiB), LEB size: %d bytes",
 		ubi->peb_size, ubi->peb_size >> 10, ubi->leb_size);
-	ubi_msg(ubi, "min./max. I/O unit sizes: %d/%d, sub-page size %d",
+	dbg_gen("min./max. I/O unit sizes: %d/%d, sub-page size %d",
 		ubi->min_io_size, ubi->max_write_size, ubi->hdrs_min_io_size);
-	ubi_msg(ubi, "VID header offset: %d (aligned %d), data offset: %d",
+	dbg_gen("VID header offset: %d (aligned %d), data offset: %d",
 		ubi->vid_hdr_offset, ubi->vid_hdr_aloffset, ubi->leb_start);
-	ubi_msg(ubi, "good PEBs: %d, bad PEBs: %d, corrupted PEBs: %d",
+	dbg_gen("good PEBs: %d, bad PEBs: %d, corrupted PEBs: %d",
 		ubi->good_peb_count, ubi->bad_peb_count, ubi->corr_peb_count);
-	ubi_msg(ubi, "user volume: %d, internal volumes: %d, max. volumes count: %d",
+	dbg_gen("user volume: %d, internal volumes: %d, max. volumes count: %d",
 		ubi->vol_count - UBI_INT_VOL_COUNT, UBI_INT_VOL_COUNT,
 		ubi->vtbl_slots);
-	ubi_msg(ubi, "max/mean erase counter: %d/%d, WL threshold: %d, image sequence number: %u",
+	dbg_gen("max/mean erase counter: %d/%d, WL threshold: %d, image sequence number: %u",
 		ubi->max_ec, ubi->mean_ec, CONFIG_MTD_UBI_WL_THRESHOLD,
 		ubi->image_seq);
-	ubi_msg(ubi, "available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
+	dbg_gen("available PEBs: %d, total reserved PEBs: %d, PEBs reserved for bad PEB handling: %d",
 		ubi->avail_pebs, ubi->rsvd_pebs, ubi->beb_rsvd_pebs);
 
 	/*
diff --git a/drivers/mtd/ubi/fastmap.c b/drivers/mtd/ubi/fastmap.c
index 990898b..285a65a 100644
--- a/drivers/mtd/ubi/fastmap.c
+++ b/drivers/mtd/ubi/fastmap.c
@@ -1053,9 +1053,9 @@ int ubi_scan_fastmap(struct ubi_device *ubi, struct ubi_attach_info *ai,
 	ubi->fm = fm;
 	ubi->fm_pool.max_size = ubi->fm->max_pool_size;
 	ubi->fm_wl_pool.max_size = ubi->fm->max_wl_pool_size;
-	ubi_msg(ubi, "attached by fastmap");
-	ubi_msg(ubi, "fastmap pool size: %d", ubi->fm_pool.max_size);
-	ubi_msg(ubi, "fastmap WL pool size: %d",
+	dbg_bld("attached by fastmap");
+	dbg_bld("fastmap pool size: %d", ubi->fm_pool.max_size);
+	dbg_bld("fastmap WL pool size: %d",
 		ubi->fm_wl_pool.max_size);
 	ubi->fm_disabled = 0;
 	ubi->fast_attach = 1;
-- 
1.7.9.5
