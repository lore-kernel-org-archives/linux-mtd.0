Received: from mail-eopbgr60051.outbound.protection.outlook.com ([40.107.6.51]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYazN-0008K0-TY
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 17:13:36 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>, David Wolfe
 <david.wolfe@nxp.com>, Frank Li <frank.li@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Fabio
 Estevam" <fabio.estevam@nxp.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names
Date: Mon, 8 Jan 2018 17:13:17 +0000
Message-ID: <VI1PR0401MB22213B0560C91999E6E22E7197130@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <1515181560-1410-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1515181560-1410-1-git-send-email-festevam@gmail.com>
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
From: Fabio Estevam <festevam@gmail.com>
Sent: Friday, January 5, 2018 1:46 PM
To: Han Xu
Cc: cyrille.pitchen@wedev4u.fr; David Wolfe; Frank Li; linux-mtd@lists.infr=
adead.org; Fabio Estevam
Subject: [PATCH] mtd: fsl-quadspi: Distinguish the mtd device names

From: Fabio Estevam <fabio.estevam@nxp.com>

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
mtd0: 01000000 00010000 "fsl-quadspi.0"
mtd1: 01000000 00010000 "fsl-quadspi.1"

Reported-by: David Wolfe <david.wolfe@nxp.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/spi-nor/fsl-quadspi.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-qu=
adspi.c
index f17d224..7712c63 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -967,7 +967,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
        struct resource *res;
        struct spi_nor *nor;
        struct mtd_info *mtd;
-       int ret, i =3D 0;
+       int ret, i =3D 0, mtd_index =3D 0;

        q =3D devm_kzalloc(dev, sizeof(*q), GFP_KERNEL);
        if (!q)
@@ -1047,6 +1047,13 @@ static int fsl_qspi_probe(struct platform_device *pd=
ev)
                nor =3D &q->nor[i];
                mtd =3D &nor->mtd;

+               mtd->name =3D devm_kasprintf(dev, GFP_KERNEL, "fsl-quadspi.=
%d",
+                                          mtd_index);
+               if (!mtd->name) {
+                       ret =3D -ENOMEM;
+                       goto mutex_failed;
+               }
+
                nor->dev =3D dev;
                spi_nor_set_flash_node(nor, np);
                nor->priv =3D q;
@@ -1098,6 +1105,7 @@ static int fsl_qspi_probe(struct platform_device *pde=
v)
                        nor->page_size =3D q->devtype_data->txfifo;

                i++;
+               mtd_index++;
        }

        /* finish the rest init. */
--
2.7.4

Acked-by: Han Xu <han.xu@nxp.com>
