Received: from mail-db5eur01on0057.outbound.protection.outlook.com
 ([104.47.2.57] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ecDvD-0007JM-48
 for linux-mtd@lists.infradead.org; Thu, 18 Jan 2018 17:24:17 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <fabio.estevam@nxp.com>,
 "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "David
 Wolfe" <david.wolfe@nxp.com>
Subject: Re: [PATCH v6 1/2] mtd: fsl-quadspi: Distinguish the mtd device names
Date: Thu, 18 Jan 2018 17:23:56 +0000
Message-ID: <DB5PR0401MB2214FBCDA5FF1B0C2B3BC93697E80@DB5PR0401MB2214.eurprd04.prod.outlook.com>
References: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
In-Reply-To: <1516285721-32294-1-git-send-email-fabio.estevam@nxp.com>
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


________________________________________
From: Fabio Estevam <fabio.estevam@nxp.com>
Sent: Thursday, January 18, 2018 8:28 AM
To: boris.brezillon@free-electrons.com
Cc: linux-mtd@lists.infradead.org; Han Xu; David Wolfe; Fabio Estevam
Subject: [PATCH v6 1/2] mtd: fsl-quadspi: Distinguish the mtd device names

Currently on a imx6sx-sdb board, which has two SPI NOR chips connected
to QSPI2 the following output from /proc/mtd is seen:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00010000 "21e4000.qspi"
mtd1: 01000000 00010000 "21e4000.qspi"

Attempts to partition them on the kernel command line result in both
chips with identical (and identically named) partitions, which is
an inconvenient behavior.

Assign a different mtd->name for each mtd device to avoid this problem.

After this change the output from /proc/mtd becomes:

# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 01000000 00010000 "21e4000.qspi-0"
mtd1: 01000000 00010000 "21e4000.qspi-1"

In order to keep mtdparts compatibility keep the mtd->name
unchanged when a single SPI NOR is present.

Reported-by: David Wolfe <david.wolfe@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
Changes since v5:
- Preserve the label value, if any. (Boris)

 drivers/mtd/spi-nor/fsl-quadspi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-qu=
adspi.c
index 2901c7b..1038842 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1051,6 +1051,24 @@ static int fsl_qspi_probe(struct platform_device *pd=
ev)
                spi_nor_set_flash_node(nor, np);
                nor->priv =3D q;

+               if (q->nor_num > 1 && !mtd->name) {
+                       int spiflash_idx;
+
+                       ret =3D of_property_read_u32(np, "reg", &spiflash_i=
dx);
+                       if (!ret) {
+                               mtd->name =3D devm_kasprintf(dev, GFP_KERNE=
L,
+                                                          "%s-%d",
+                                                          dev_name(dev),
+                                                          spiflash_idx);
+                               if (!mtd->name) {
+                                       ret =3D -ENOMEM;
+                                       goto mutex_failed;
+                               }
+                       } else {
+                               dev_warn(dev, "reg property is missing\n");
+                       }
+               }
+
                /* fill the hooks */
                nor->read_reg =3D fsl_qspi_read_reg;
                nor->write_reg =3D fsl_qspi_write_reg;
--
2.7.4

Acked-by: Han Xu <han.xu@nxp.com>=
