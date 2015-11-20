Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzttx-0007a2-BO
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 22:11:29 +0000
Received: by pacdm15 with SMTP id dm15so128508484pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 14:11:08 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>
Cc: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] UBI: fix use of "VID" vs. "EC" in header self-check
Date: Fri, 20 Nov 2015 14:10:54 -0800
Message-Id: <1448057454-32664-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Looks like a typo, using UBI_EC_HDR_SIZE_CRC (note the "EC") to compute
the CRC for the VID header.

This shouldn't cause any functional change, as both structures are 64
bytes. Verified with:

	BUILD_BUG_ON(UBI_VID_HDR_SIZE_CRC != UBI_EC_HDR_SIZE_CRC);

Reported here:
http://lists.infradead.org/pipermail/linux-mtd/2013-September/048570.html

Reported by: Bill Pringlemeir <bpringlemeir@gmail.com>
Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
I was sorting through really old email. Don't ask.

 drivers/mtd/ubi/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 1fc23e48fe8e..10cf3b549959 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1299,7 +1299,7 @@ static int self_check_peb_vid_hdr(const struct ubi_device *ubi, int pnum)
 	if (err && err != UBI_IO_BITFLIPS && !mtd_is_eccerr(err))
 		goto exit;
 
-	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_EC_HDR_SIZE_CRC);
+	crc = crc32(UBI_CRC32_INIT, vid_hdr, UBI_VID_HDR_SIZE_CRC);
 	hdr_crc = be32_to_cpu(vid_hdr->hdr_crc);
 	if (hdr_crc != crc) {
 		ubi_err(ubi, "bad VID header CRC at PEB %d, calculated %#08x, read %#08x",
-- 
2.6.0.rc2.230.g3dd15c0
