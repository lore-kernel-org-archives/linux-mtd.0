Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKiAL-0004E8-Mv
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:08:03 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 5/7] mtd: spi_nor: pass DMA-able buffer to spi_nor_read_raw()
Date: Thu, 8 Nov 2018 11:07:16 +0000
Message-ID: <20181108110653.21063-6-tudor.ambarus@microchip.com>
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

spi_nor_read_raw() calls nor->read() which might be implemented
by the m25p80 driver. m25p80 uses the spi-mem layer which requires
DMA-able in/out buffers. Pass kmalloc'ed dma buffer to spi_nor_read_raw().

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 79ca1102faed..2eaa21c85483 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2161,7 +2161,7 @@ spi_nor_set_pp_settings(struct spi_nor_pp_command *pp=
,
  * @nor:	pointer to a 'struct spi_nor'
  * @addr:	offset in the serial flash memory
  * @len:	number of bytes to read
- * @buf:	buffer where the data is copied into
+ * @buf:	buffer where the data is copied into (dma-safe memory)
  *
  * Return: 0 on success, -errno otherwise.
  */
@@ -2868,11 +2868,16 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
_nor *nor, const u32 *smpt,
 					 u8 smpt_len)
 {
 	const u32 *ret;
+	u8 *dma_safe;
 	u32 addr;
 	int err;
 	u8 i, ncmds, nmaps;
 	u8 addr_width, read_opcode, read_dummy;
-	u8 read_data_mask, data_byte, map_id;
+	u8 read_data_mask, map_id;
+
+	dma_safe =3D kmalloc(sizeof(*dma_safe), GFP_KERNEL | GFP_DMA);
+	if (!dma_safe)
+		return ERR_PTR(-ENOMEM);
=20
 	addr_width =3D nor->addr_width;
 	read_dummy =3D nor->read_dummy;
@@ -2890,7 +2895,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 		nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
 		addr =3D smpt[i + 1];
=20
-		err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
+		err =3D spi_nor_read_raw(nor, addr, 1, dma_safe);
 		if (err) {
 			ret =3D ERR_PTR(err);
 			goto out;
@@ -2900,7 +2905,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 		 * Build an index value that is used to select the Sector Map
 		 * Configuration that is currently in use.
 		 */
-		map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
+		map_id =3D map_id << 1 | !!(*dma_safe & read_data_mask);
 		ncmds++;
 	}
=20
@@ -2941,6 +2946,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
=20
 	/* fall through */
 out:
+	kfree(dma_safe);
 	nor->addr_width =3D addr_width;
 	nor->read_dummy =3D read_dummy;
 	nor->read_opcode =3D read_opcode;
--=20
2.9.4
