Received: from de01.mail.all-tld.net ([195.140.232.8])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O1eLf-00043Y-RD
	for linux-mtd@lists.infradead.org; Tue, 13 Apr 2010 11:32:08 +0000
Date: Tue, 13 Apr 2010 13:31:55 +0200
From: Anders Larsen <al@alarsen.net>
Subject: [PATCH] Fix Oops with Atmel SPI
To: linux-mtd@lists.infradead.org
Message-Id: <1271158315l.25331l.9l@i-dmzi_al.realan.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Ian McDonnell <ian@brightstareng.com>,
	Nicolas Pitre <nico@fluxnic.net>, linux-kernel@vger.kernel.org,
	Matthias Kaehlcke <matthias@kaehlcke.net>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tweak MTD's cache allocation to make it work with the atmel DMA'ed SPI.
Substitute kmalloc for vmalloc so the cache buffer is mappable as per
the Atmel SPI driver's requirements, otherwise an Oops would occur.

The original patch by Ian McDonnell <ian@brightstareng.com> was found here:
http://lists.infradead.org/pipermail/linux-mtd/2007-December/020184.html

Signed-off-by: Anders Larsen <al@alarsen.net>
Cc: Ian McDonnell <ian@brightstareng.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Matthias Kaehlcke <matthias@kaehlcke.net>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Cc: Nicolas Pitre <nico@fluxnic.net>
---
 drivers/mtd/mtdblock.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: b/drivers/mtd/mtdblock.c
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
--- a/drivers/mtd/mtdblock.c
+++ b/drivers/mtd/mtdblock.c
@@ -253,7 +253,11 @@ static int mtdblock_writesect(struct mtd
 {
 	struct mtdblk_dev *mtdblk =3D mtdblks[dev->devnum];
 	if (unlikely(!mtdblk->cache_data && mtdblk->cache_size)) {
+#ifdef CONFIG_SPI_ATMEL
+		mtdblk->cache_data =3D kmalloc(mtdblk->mtd->erasesize, GFP_KERNEL);
+#else
 		mtdblk->cache_data =3D vmalloc(mtdblk->mtd->erasesize);
+#endif
 		if (!mtdblk->cache_data)
 			return -EINTR;
 		/* -EINTR is not really correct, but it is the best match
@@ -322,7 +326,11 @@ static int mtdblock_release(struct mtd_b
 		mtdblks[dev] =3D NULL;
 		if (mtdblk->mtd->sync)
 			mtdblk->mtd->sync(mtdblk->mtd);
+#ifdef CONFIG_SPI_ATMEL
+		kfree(mtdblk->cache_data);
+#else
 		vfree(mtdblk->cache_data);
+#endif
 		kfree(mtdblk);
 	}
=20
