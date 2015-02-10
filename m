Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL1ij-0003TS-FQ
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 03:42:42 +0000
Message-ID: <54D97D9E.3040606@huawei.com>
Date: Tue, 10 Feb 2015 11:40:14 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Subject: [PATCH] UBI: improve messages in ubi_eba_read_leb()
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If an error occur while reading from PEBs, for example, an ECC error,
ubi_io_read() will print some error messages. But it's not enough for
debugging. These messages don't show the mapping info for a read from
UBIFS layer.

Although UBIFS will soon print its error messages after catching the
return value from UBI layer,  multi-path reading will confuse the
relationship between LEBs and PEBs showed by these messages, like:

[   38.442770] UBI error: ubi_io_read: error -74 (ECC error) while reading 26624 bytes from PEB 54:104448, read 26624 bytes
[   38.852461] UBI error: ubi_io_read: error -74 (ECC error) while reading 77824 bytes from PEB 346:53248, read 77824 bytes
[   38.864142] UBIFS error (pid 1444): ubifs_recover_leb: corruption -3
[   38.870487] UBIFS error (pid 1444): ubifs_scanned_corruption: corruption at LEB 928:55280
[   38.878625] UBIFS error (pid 1444): ubifs_scanned_corruption: first 8192 bytes from LEB 928:55280
[   38.892117] UBIFS error (pid 1444): ubifs_recover_leb: LEB 928 scanning failed
mount: mounting ubi1:bak on /mountpoint: failed: Structure needs cleaning

This patch improve the output of ubi_eba_read_leb() by printing the
mapping of LEB and PEB if an ECC error occur. And also, print PEB
and LEB number if a CRC error occur.

Signed-off-by: hujianyang <hujianyang@huawei.com>
---
 drivers/mtd/ubi/eba.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index da4c792..349fe5d 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -445,8 +445,11 @@ retry:
 		if (err == UBI_IO_BITFLIPS)
 			scrub = 1;
 		else if (mtd_is_eccerr(err)) {
-			if (vol->vol_type == UBI_DYNAMIC_VOLUME)
+			if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
+				ubi_warn(ubi, "ECC error while reading %d bytes from offset %d of LEB %d:%d, PEB %d",
+					 len, offset, vol_id, lnum, pnum);
 				goto out_unlock;
+			}
 			scrub = 1;
 			if (!check) {
 				ubi_msg(ubi, "force data checking");
@@ -460,8 +463,8 @@ retry:
 	if (check) {
 		uint32_t crc1 = crc32(UBI_CRC32_INIT, buf, len);
 		if (crc1 != crc) {
-			ubi_warn(ubi, "CRC error: calculated %#08x, must be %#08x",
-				 crc1, crc);
+			ubi_warn(ubi, "CRC error at PEB %d, LEB %d:%d: calculated %#08x, must be %#08x",
+				 pnum, vol_id, lnum, crc1, crc);
 			err = -EBADMSG;
 			goto out_unlock;
 		}
-- 
1.6.0.2
