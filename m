Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKi9n-0000Pc-1H
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:07:33 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 3/7] mtd: spi-nor: add restriction for nmaps in smpt parser
Date: Thu, 8 Nov 2018 11:07:11 +0000
Message-ID: <20181108110653.21063-4-tudor.ambarus@microchip.com>
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

The map selector is limited to a maximum of 8 bits, allowing
for a maximum of 256 possible map configurations. The total
number of map configurations should be addressable by the
total number of bits described by the detection commands.

For example: if there are five to eight possible sector map
configurations, at least three configuration detection commands
will be needed to extract three bits of configuration selection
information from the device in order to identify which configuration
is currently in use.

Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 59dcedb08691..bd1866d714f2 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2868,7 +2868,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 	const u32 *ret =3D NULL;
 	u32 addr;
 	int err;
-	u8 i;
+	u8 i, ncmds, nmaps;
 	u8 addr_width, read_opcode, read_dummy;
 	u8 read_data_mask, data_byte, map_id;
=20
@@ -2877,6 +2877,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 	read_opcode =3D nor->read_opcode;
=20
 	map_id =3D 0;
+	ncmds =3D 0;
 	/* Determine if there are any optional Detection Command Descriptors */
 	for (i =3D 0; i < smpt_len; i +=3D 2) {
 		if (smpt[i] & SMPT_DESC_TYPE_MAP)
@@ -2896,6 +2897,7 @@ static const u32 *spi_nor_get_map_in_use(struct spi_n=
or *nor, const u32 *smpt,
 		 * Configuration that is currently in use.
 		 */
 		map_id =3D map_id << 1 | !!(data_byte & read_data_mask);
+		ncmds++;
 	}
=20
 	/*
@@ -2905,7 +2907,16 @@ static const u32 *spi_nor_get_map_in_use(struct spi_=
nor *nor, const u32 *smpt,
 	 *
 	 * Find the matching configuration map.
 	 */
-	while (i < smpt_len) {
+	for (nmaps =3D 0; i < smpt_len; nmaps++) {
+		/*
+		 * The map selector is limited to a maximum of 8 bits, allowing
+		 * for a maximum of 256 possible map configurations. The total
+		 * number of map configurations should be addressable by the
+		 * total number of bits described by the detection commands.
+		 */
+		if (ncmds && nmaps >=3D (1 << (ncmds + 1)))
+			break;
+
 		if (SMPT_MAP_ID(smpt[i]) =3D=3D map_id) {
 			ret =3D smpt + i;
 			break;
--=20
2.9.4
