Received: from mail-eopbgr80125.outbound.protection.outlook.com
 ([40.107.8.125] helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSQqp-0004YA-EH
 for linux-mtd@lists.infradead.org; Thu, 29 Nov 2018 18:15:48 +0000
From: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
CC: "Sverdlin, Alexander (Nokia - DE/Ulm)" <alexander.sverdlin@nokia.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, Tudor
 Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH] mtd: spi-nor: Provide default address width and latency for
 map selection
Date: Thu, 29 Nov 2018 18:15:34 +0000
Message-ID: <20181129181519.15681-1-alexander.sverdlin@nokia.com>
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

JESD216 allows "variable address length" and "variable latency" in
Configuration Detection Command Descriptors, in other words "as-is".
And they are still unset during Sector Map Parameter Table parsing,
which led to "map_id" determined erroneously as 0 for, e.g. S25FS128S.

Fixes: b038e8e3b ("mtd: spi-nor: parse SFDP Sector Map Parameter Table")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 828d03e..5557c89 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2893,6 +2893,16 @@ static const u32 *spi_nor_get_map_in_use(struct spi_=
nor *nor, const u32 *smpt)
 		nor->read_opcode =3D SMPT_CMD_OPCODE(smpt[i]);
 		addr =3D smpt[i + 1];
=20
+		/*
+		 * JESD216 allows to omit particular address length or latency
+		 * specification in the header and at this point they are still
+		 * unset, so we need some heuristics. One example is S25FS128S.
+		 */
+		if (!nor->addr_width)
+			nor->addr_width =3D 3;
+		if (!nor->read_dummy)
+			nor->read_dummy =3D 8;
+
 		err =3D spi_nor_read_raw(nor, addr, 1, &data_byte);
 		if (err)
 			goto out;
--=20
2.4.6
