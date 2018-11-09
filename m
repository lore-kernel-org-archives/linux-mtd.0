Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLA5l-00064E-KX
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 16:57:10 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 4/5] mtd: spi_nor: pass DMA-able buffer to
 spi_nor_read_raw()
Date: Fri, 9 Nov 2018 16:56:54 +0000
Message-ID: <20181109165644.30534-5-tudor.ambarus@microchip.com>
References: <20181109165644.30534-1-tudor.ambarus@microchip.com>
In-Reply-To: <20181109165644.30534-1-tudor.ambarus@microchip.com>
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

Fixes: b038e8e3be72 ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
v2: drop GFP_DMA, rename buf, add comment

 drivers/mtd/spi-nor/spi-nor.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 04a1c5b825e6..458ca8321999 100644
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
@@ -2868,11 +2868,17 @@ static const u32 *spi_nor_get_map_in_use(struct spi=
_nor *nor, const u32 *smpt,
 					 u8 smpt_len)
 {
 	const u32 *ret;
+	u8 *buf;
 	u32 addr;
 	int err;
 	u8 i;
 	u8 addr_width, read_opcode, read_dummy;
-	u8 read_data_mask, data_byte, map_id;
+	u8 read_data_mask, map_id;
+
+	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
+	buf =3D kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return ERR_PTR(-ENOMEM);
=20
 	addr_width =3D nor->addr_width;
 	read_dummy =3D nor->read_dummy;
@@ -2890,7 +2896,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 		nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
 		addr =3D smpt[i + 1];
=20
-		err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
+		err =3D spi_nor_read_raw(nor, addr, 1, buf);
 		if (err) {
 			ret =3D ERR_PTR(err);
 			goto out;
@@ -2900,7 +2906,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 		 * Build an index value that is used to select the Sector Map
 		 * Configuration that is currently in use.
 		 */
-		map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
+		map_id =3D map_id << 1 | !!(*buf & read_data_mask);
 	}
=20
 	/*
@@ -2931,6 +2937,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
=20
 	/* fall through */
 out:
+	kfree(buf);
 	nor->addr_width =3D addr_width;
 	nor->read_dummy =3D read_dummy;
 	nor->read_opcode =3D read_opcode;
--=20
2.9.4
