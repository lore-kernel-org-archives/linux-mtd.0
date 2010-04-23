Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O5Mfv-00013K-4N
	for linux-mtd@lists.infradead.org; Fri, 23 Apr 2010 17:28:24 +0000
Date: Fri, 23 Apr 2010 19:28:19 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH] mtd/ubi: recognize empty flash with errors as empty
Message-ID: <20100423172819.GA29224@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1271818257.11751.1372.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Attaching empty nand with a block which contains a RS-Error which can't
be fixed resulted in:

| UBI: attaching mtd9 to ubi0
| UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
| Call Trace:
| [cfbd5c60] [c0008558] show_stack+0x48/0x19c (unreliable)
| [cfbd5ca0] [c01a71e8] ubi_io_read+0x188/0x288
| [cfbd5cf0] [c01a76e8] ubi_io_read_ec_hdr+0x74/0x2a4
| [cfbd5d20] [c01abe9c] ubi_scan+0x178/0x10b4
| [cfbd5d80] [c01a1464] ubi_attach_mtd_dev+0x67c/0xe44
| [cfbd5e80] [c01a1fc8] ctrl_cdev_ioctl+0x178/0x210
| [cfbd5ec0] [c008711c] do_ioctl+0x3c/0xc4
| [cfbd5ee0] [c0087224] vfs_ioctl+0x80/0x448
| [cfbd5f10] [c008762c] sys_ioctl+0x40/0x88
| [cfbd5f40] [c000f960] ret_from_syscall+0x0/0x38
| UBI error: ubi_read_volume_table: the layout volume was not found
| UBI error: ubi_attach_mtd_dev: failed to attach by scanning, error -22

Assuming that blocks which can only be read with errors are empty will let
the volume attach. Another access to the block in question resulted here
in:

| UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| UBI error: do_sync_erase: cannot erase PEB 3399, error -5
| UBI error: erase_worker: failed to erase PEB 3399, error -5
| UBI: mark PEB 3399 as bad
| UBI: 39 PEBs left in the reserve

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/mtd/ubi/scan.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
index dc5f688..7529d46 100644
--- a/drivers/mtd/ubi/scan.c
+++ b/drivers/mtd/ubi/scan.c
@@ -756,7 +756,8 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 		bitflips = 1;
 	}
 
-	si->is_empty = 0;
+	if (err != UBI_IO_BAD_EC_HDR)
+		si->is_empty = 0;
 
 	if (!ec_corr) {
 		int image_seq;
@@ -827,6 +828,7 @@ static int process_eb(struct ubi_device *ubi, struct ubi_scan_info *si,
 			return err;
 		goto adjust_mean_ec;
 	}
+	si->is_empty = 0;
 
 	vol_id = be32_to_cpu(vidh->vol_id);
 	if (vol_id > UBI_MAX_VOLUMES && vol_id != UBI_LAYOUT_VOLUME_ID) {
-- 
1.6.6.1
