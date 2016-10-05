Received: from mail1.bemta8.messagelabs.com ([216.82.243.199])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1brhTy-0001zO-LX
 for linux-mtd@lists.infradead.org; Wed, 05 Oct 2016 08:23:21 +0000
From: IWAMOTO Masahiko <iwamoto@allied-telesis.co.jp>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>
CC: IWAMOTO Masahiko <iwamoto@allied-telesis.co.jp>, PACKHAM Chris
 <chris.packham@alliedtelesis.co.nz>, YAMAMOTO Hiroyuki
 <hyamamo@allied-telesis.co.jp>
Subject: [PATCH] mtd: spi-nor: Add support for mr25h40
Date: Wed, 5 Oct 2016 08:22:52 +0000
Message-ID: <OS2PR01MB007355EE4F7CBD8647D65CD8DFC50@OS2PR01MB0073.jpnprd01.prod.outlook.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
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


Add Everspin mr25h40 512KB MRAM to the list of supported chips.

Signed-off-by: Masahiko Iwamoto <iwamoto@allied-telesis.co.jp>
---
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index d0fc165..bbdbbd7 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -825,6 +825,7 @@ static const struct flash_info spi_nor_ids[] =3D {
        /* Everspin */
        { "mr25h256", CAT25_INFO( 32 * 1024, 1, 256, 2, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
        { "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
+       { "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3, SPI_NOR_NO_ERASE | =
SPI_NOR_NO_FR) },
=20
        /* Fujitsu */
        { "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE) }=
,
--=20
2.7.4
