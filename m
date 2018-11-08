Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKi9x-0000Pn-Gz
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:07:39 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 6/7] mtd: spi-nor: ensure memory used for nor->read() is DMA
 safe
Date: Thu, 8 Nov 2018 11:07:18 +0000
Message-ID: <20181108110653.21063-7-tudor.ambarus@microchip.com>
References: <20181108110653.21063-1-tudor.ambarus@microchip.com>
In-Reply-To: <20181108110653.21063-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Use GFP_DMA to ensure that the memory we allocate for transfers in
nor->read() can be DMAed.

spi_nor_read_sfdp() calls spi_nor_read_raw(), which calls nor-read().
The latter might be implemented by the m25p80 driver which is on top
of the spi-mem layer. spi-mem requires DMA-able in/out buffers, let's
make sure they are.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 2eaa21c85483..a13fc82bade5 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2238,7 +2238,7 @@ static int spi_nor_read_sfdp_dma_unsafe(struct spi_no=
r *nor, u32 addr,
 	void *dma_safe_buf;
 	int ret;
=20
-	dma_safe_buf =3D kmalloc(len, GFP_KERNEL);
+	dma_safe_buf =3D kmalloc(len, GFP_KERNEL | GFP_DMA);
 	if (!dma_safe_buf)
 		return -ENOMEM;
=20
@@ -3053,7 +3053,7 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
=20
 	/* Read the Sector Map Parameter Table. */
 	len =3D smpt_header->length * sizeof(*smpt);
-	smpt =3D kzalloc(len, GFP_KERNEL);
+	smpt =3D kzalloc(len, GFP_KERNEL | GFP_DMA);
 	if (!smpt)
 		return -ENOMEM;
=20
@@ -3140,7 +3140,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	if (header.nph) {
 		psize =3D header.nph * sizeof(*param_headers);
=20
-		param_headers =3D kmalloc(psize, GFP_KERNEL);
+		param_headers =3D kmalloc(psize, GFP_KERNEL | GFP_DMA);
 		if (!param_headers)
 			return -ENOMEM;
=20
--=20
2.9.4
