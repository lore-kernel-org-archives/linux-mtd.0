Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKi9p-0000PR-DA
 for linux-mtd@lists.infradead.org; Thu, 08 Nov 2018 11:07:30 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH 1/7] mtd: spi-nor: don't drop sfdp data if optional parsers
 fail
Date: Thu, 8 Nov 2018 11:07:07 +0000
Message-ID: <20181108110653.21063-2-tudor.ambarus@microchip.com>
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

JESD216C states that just the Basic Flash Parameter Table is mandatory.
Already defined (or future) additional parameter headers and tables are
optional.

Don't drop already collected sfdp data in case an optional table
parser fails. In case of failing, each optional parser is responsible
to roll back to the previously known spi_nor data.

Fixes: 5390a8df769e ("mtd: spi-nor: add support to non-uniform SFDP SPI NOR=
 flash memories")
Reported-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
Suggested-by: Boris Brezillon <boris.brezillon@bootlin.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 4a96ee719e5a..2cdf96013689 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3130,7 +3130,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 	if (err)
 		goto exit;
=20
-	/* Parse other parameter headers. */
+	/* Parse optional parameter tables. */
 	for (i =3D 0; i < header.nph; i++) {
 		param_header =3D &param_headers[i];
=20
@@ -3143,8 +3143,17 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
 			break;
 		}
=20
-		if (err)
-			goto exit;
+		if (err) {
+			dev_warn(dev, "Failed to parse optional parameter table: %04x\n",
+				 SFDP_PARAM_HEADER_ID(param_header));
+			/*
+			 * Let's not drop all information we extracted so far
+			 * if optional table parsers fail. In case of failing,
+			 * each optional parser is responsible to roll back to
+			 * the previously known spi_nor data.
+			 */
+			err =3D 0;
+		}
 	}
=20
 exit:
--=20
2.9.4
