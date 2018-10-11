Received: from mail-am5eur02on0602.outbound.protection.outlook.com
 ([2a01:111:f400:fe07::602]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAW8R-0004kY-T5
 for linux-mtd@lists.infradead.org; Thu, 11 Oct 2018 08:16:00 +0000
From: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>
CC: "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Yogesh Narayan
 Gaur <yogeshnarayan.gaur@nxp.com>
Subject: [PATCH v2 2/2] mtd: spi-nor: add entry for mt35xu512aba flash
Date: Thu, 11 Oct 2018 08:15:45 +0000
Message-ID: <1539245630-26611-3-git-send-email-yogeshnarayan.gaur@nxp.com>
References: <1539245630-26611-1-git-send-email-yogeshnarayan.gaur@nxp.com>
In-Reply-To: <1539245630-26611-1-git-send-email-yogeshnarayan.gaur@nxp.com>
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

Add entry for mt35xu512aba Micron NOR flash.
This flash is having uniform sector erase size of 128KB, have
support of FSR(flag status register), flash size is 64MB and
supports 4-byte commands.

Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
---
Changes for v2:
- Removed checkpatch warning, 80 character limit.

 drivers/mtd/spi-nor/spi-nor.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b8b494f..e0d95ac 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1405,6 +1405,10 @@ static const struct flash_info spi_nor_ids[] =3D {
 	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048, SECT_4K | USE_FSR | S=
PI_NOR_QUAD_READ | NO_CHIP_ERASE) },
 	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096, SECT_4K | USE_FSR | S=
PI_NOR_QUAD_READ | NO_CHIP_ERASE) },
=20
+	/* Micron */
+	{ "mt35xu512aba", INFO(0x2c5b1a, 0, 128 * 1024, 512,
+		SECT_4K | USE_FSR | SPI_NOR_4B_OPCODES) },
+
 	/* PMC */
 	{ "pm25lv512",   INFO(0,        0, 32 * 1024,    2, SECT_4K_PMC) },
 	{ "pm25lv010",   INFO(0,        0, 32 * 1024,    4, SECT_4K_PMC) },
--=20
2.7.4
