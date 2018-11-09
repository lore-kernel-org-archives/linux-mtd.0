Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLA5m-0001Qp-1b
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2018 16:57:29 +0000
From: <Tudor.Ambarus@microchip.com>
To: <boris.brezillon@bootlin.com>, <marek.vasut@gmail.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <yogeshnarayan.gaur@nxp.com>, <cyrille.pitchen@wedev4u.fr>,
 <Tudor.Ambarus@microchip.com>
Subject: [PATCH v2 5/5] mtd: spi-nor: remove unneeded smpt zeroization
Date: Fri, 9 Nov 2018 16:56:56 +0000
Message-ID: <20181109165644.30534-6-tudor.ambarus@microchip.com>
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

The entire smpt array is initialized with data read from sfdp,
there is no need to init it with zeroes before.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 458ca8321999..f9c657867e5a 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -3044,7 +3044,7 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
=20
 	/* Read the Sector Map Parameter Table. */
 	len =3D smpt_header->length * sizeof(*smpt);
-	smpt =3D kzalloc(len, GFP_KERNEL);
+	smpt =3D kmalloc(len, GFP_KERNEL);
 	if (!smpt)
 		return -ENOMEM;
=20
--=20
2.9.4
