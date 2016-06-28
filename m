Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHrYB-0002NV-Mf
 for linux-mtd@lists.infradead.org; Tue, 28 Jun 2016 11:51:32 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: boris.brezillon@free-electrons.com, Richard Weinberger <richard@nod.at>,
 dedekind1@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2] UBI: only read necessary size when reading the VID header
Date: Tue, 28 Jun 2016 13:51:07 +0200
Message-Id: <1467114667-30548-1-git-send-email-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When reading the vid hdr from the device UBI always reads a whole
page. Instead, read only the data we actually need and speed up
attachment of UBI devices by potentially making use of reading
subpages if the NAND driver supports it.

Since the VID header may be at offset vid_hdr_shift in the page and
we can only read from the beginning of a page we have to add that
offset to the read size.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

change since v1:
- properly handle vid_hdr_shift != 0

 drivers/mtd/ubi/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 10cf3b5..ff8cafe 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			  ubi->vid_hdr_alsize);
+			  ubi->vid_hdr_shift + UBI_VID_HDR_SIZE);
 	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
 		return read_err;
 
-- 
2.8.1
