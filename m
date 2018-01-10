Received: from mail-he1eur01on0068.outbound.protection.outlook.com
 ([104.47.0.68] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZOGw-0005cw-9J
 for linux-mtd@lists.infradead.org; Wed, 10 Jan 2018 21:51:00 +0000
From: Han Xu <han.xu@nxp.com>
To: Fabio Estevam <festevam@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Fabio
 Estevam" <fabio.estevam@nxp.com>
Subject: Re: [PATCH] mtd: nand: gpmi: Release DMA channels on failure
Date: Wed, 10 Jan 2018 21:50:41 +0000
Message-ID: <VI1PR0401MB2221AF8D517BDDC52F5B550497110@VI1PR0401MB2221.eurprd04.prod.outlook.com>
References: <1514484420-19344-1-git-send-email-festevam@gmail.com>
In-Reply-To: <1514484420-19344-1-git-send-email-festevam@gmail.com>
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
Sent: Thursday, December 28, 2017 12:07 PM
To: boris.brezillon@free-electrons.com
Cc: Han Xu; linux-mtd@lists.infradead.org; Fabio Estevam
Subject: [PATCH] mtd: nand: gpmi: Release DMA channels on failure

From: Fabio Estevam <fabio.estevam@nxp.com>

release_dma_channels() should be called in the case of error in
gpmi_init() or bch_set_geometry(), because acquire_dma_channels() has
been called previously.

Handle the error cases correctly.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi=
-nand/gpmi-nand.c
index 2ef8979..acfa5f5 100644
--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
@@ -2137,20 +2137,25 @@ static int gpmi_pm_resume(struct device *dev)
        ret =3D gpmi_init(this);
        if (ret) {
                dev_err(this->dev, "Error setting GPMI : %d\n", ret);
-               return ret;
+               goto release_dma_channels;
        }

        /* re-init the BCH registers */
        ret =3D bch_set_geometry(this);
        if (ret) {
                dev_err(this->dev, "Error setting BCH : %d\n", ret);
-               return ret;
+               goto release_dma_channels;
        }

        /* re-init others */
        gpmi_extra_init(this);

        return 0;
+
+release_dma_channels:
+       release_dma_channels(this);
+       return ret;
+
 }
 #endif /* CONFIG_PM_SLEEP */

Acked-by: Han Xu <han.xu@nxp.com>

--
2.7.4
