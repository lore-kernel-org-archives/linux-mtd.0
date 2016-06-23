Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bG4hZ-0002Bf-AR
 for linux-mtd@lists.infradead.org; Thu, 23 Jun 2016 13:29:50 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH] UBI: only read UBI_VID_HDR_SIZE when reading the vid_hdr
Date: Thu, 23 Jun 2016 15:29:21 +0200
Message-Id: <1466688561-16103-1-git-send-email-s.hauer@pengutronix.de>
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
subpages.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---

Please review carefully. It obviously works and speeds up UBI attachment
from 3s to 2s here in one case and I have not found places where this patch
makes problems, but there might be a reason I haven't seen why in case of
the ec header only the header is read while in case of the vid header the
whole page is read.

 drivers/mtd/ubi/io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
index 10cf3b5..31918a0 100644
--- a/drivers/mtd/ubi/io.c
+++ b/drivers/mtd/ubi/io.c
@@ -1019,7 +1019,7 @@ int ubi_io_read_vid_hdr(struct ubi_device *ubi, int pnum,
 
 	p = (char *)vid_hdr - ubi->vid_hdr_shift;
 	read_err = ubi_io_read(ubi, p, pnum, ubi->vid_hdr_aloffset,
-			  ubi->vid_hdr_alsize);
+			  UBI_VID_HDR_SIZE);
 	if (read_err && read_err != UBI_IO_BITFLIPS && !mtd_is_eccerr(read_err))
 		return read_err;
 
-- 
2.8.1
