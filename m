Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O4IQh-00033b-RX
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 18:44:17 +0000
Date: Tue, 20 Apr 2010 20:44:12 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: attaching UBI while getting read errors from NAND driver fails.
Message-ID: <20100420184412.GA19928@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Attaching empty nand with a block which contains a RS-Error which can't
be fixed:

| UBI: attaching mtd9 to ubi0
| UBI: physical eraseblock size:   131072 bytes (128 KiB)
| UBI: logical eraseblock size:    129024 bytes
| UBI: smallest flash I/O unit:    2048
| UBI: sub-page size:              512
| UBI: VID header offset:          512 (aligned 512)
| UBI: data offset:                2048
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

ubi_io_read() calls ubi->mtd->read() which ends in nand_do_read_ops() at
some point. The NAND controller was not able to read the page and
incremented mtd->ecc_stats.failed. The tail of nand_do_read_ops():

|      if (mtd->ecc_stats.failed - stats.failed)
|                return -EBADMSG;

So we return with -EBADMSG as you can see in the error message. This
error is then converted by ubi_io_read() into -EIO:
|                /*
|                 * The driver should never return -EBADMSG if it failed to read
|                 * all the requested data. But some buggy drivers might do
|                 * this, so we change it to -EIO.
|                 */
|                if (read != len && err == -EBADMSG) {
|                        ubi_assert(0);
|                        err = -EIO;
|                }

At this point we leave ubi_scan() and the mtd partition remains
unattached. No really sure how we ended up with -EINVAL in
ubi_attach_mtd_dev().

I guess this is not wanted, is it?

The following patch led to:
| UBI: empty MTD device detected
| UBI: create volume table (copy #1)
| UBI: create volume table (copy #2)
| UBI: attached mtd9 to ubi0
| UBI: MTD device name:            "ubi"
| UBI: MTD device size:            512 MiB
| UBI: number of good PEBs:        4092
| UBI: number of bad PEBs:         4
| UBI: max. allowed volumes:       128
| UBI: wear-leveling threshold:    4096
| UBI: number of internal volumes: 1
| UBI: number of user volumes:     0
| UBI: available PEBs:             4048
| UBI: total number of reserved PEBs: 44
| UBI: number of PEBs reserved for bad PEB handling: 40
| UBI: max/mean erase counter: 0/0
| UBI: image sequence number: 0
| UBI: background thread "ubi_bgt0d" started, PID 1986

ubimkvol gave me:
| UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3399:0, read 64 bytes
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| nand_erase: Failed erase, page 0x000751c0
| UBI error: do_sync_erase: cannot erase PEB 3399, error -5
| UBI error: erase_worker: failed to erase PEB 3399, error -5
| UBI: mark PEB 3399 as bad
| UBI: 39 PEBs left in the reserve

This looks good so far I guess. Is there much I break with patch? Should
this case be handled at another level?

Sebastian

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 533b1a4..710d069 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -181,10 +181,12 @@ retry:
 		 * all the requested data. But some buggy drivers might do
 		 * this, so we change it to -EIO.
 		 */
+#if 0
 		if (read != len && err == -EBADMSG) {
 			ubi_assert(0);
 			err = -EIO;
 		}
+#endif
 	} else {
 		ubi_assert(len == read);
 
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
