Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrEru-0007N0-Uj
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2015 00:45:35 +0000
Received: by pacfv9 with SMTP id fv9so248590779pac.3
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 17:45:14 -0700 (PDT)
Date: Tue, 27 Oct 2015 17:45:11 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Han Xu <han.xu@freescale.com>, Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 2/5] mtd: nand: drop unnecessary partition parser data
Message-ID: <20151028004511.GA13239@google.com>
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <1445913070-17950-3-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445913070-17950-3-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Oct 26, 2015 at 07:31:07PM -0700, Brian Norris wrote:
> All of these drivers set up a parser data struct just to communicate DT
> partition data. This field has been deprecated and is instead supported
> by telling nand_scan_ident() about the 'flash_node'.
> 
> This patch:
>  * sets chip->flash_node for those drivers that didn't already (but used
>    OF partitioning)
>  * drops the parser data
>  * switches to the simpler mtd_device_register() where possible, now
>    that we've eliminated one of the auxiliary parameters
> 
> Now that we've assigned chip->flash_node for these drivers, we can
> probably rely on nand_dt_init() to do more of the DT parsing for us, but
> for now, I don't want to fiddle with each of these drivers. The parsing
> is done in duplicate for now on some drivers. I don't think this should
> break things. (Famous last words.)
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/nand/atmel_nand.c                 |  7 +++----
>  drivers/mtd/nand/brcmnand/brcmnand.c          |  3 +--
>  drivers/mtd/nand/davinci_nand.c               | 10 +++-------
>  drivers/mtd/nand/fsl_elbc_nand.c              |  5 ++---
>  drivers/mtd/nand/fsl_ifc_nand.c               |  5 ++---

Found some compile errors in the above 2 FSL drivers. Will squash the
below (or similar) into v2.

>  drivers/mtd/nand/fsl_upm.c                    |  5 ++---
>  drivers/mtd/nand/fsmc_nand.c                  |  7 +++----
>  drivers/mtd/nand/gpio.c                       |  8 +++-----
>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c        |  5 ++---
>  drivers/mtd/nand/hisi504_nand.c               |  5 ++---
>  drivers/mtd/nand/lpc32xx_mlc.c                |  7 +++----
>  drivers/mtd/nand/lpc32xx_slc.c                |  7 +++----
>  drivers/mtd/nand/mpc5121_nfc.c                |  5 ++---
>  drivers/mtd/nand/mxc_nand.c                   |  5 ++---
>  drivers/mtd/nand/ndfc.c                       |  5 ++---
>  drivers/mtd/nand/omap2.c                      |  6 ++----
>  drivers/mtd/nand/orion_nand.c                 |  6 ++----
>  drivers/mtd/nand/plat_nand.c                  |  5 ++---
>  drivers/mtd/nand/pxa3xx_nand.c                | 10 +++++-----
>  drivers/mtd/nand/sh_flctl.c                   |  6 ++----
>  drivers/mtd/nand/socrates_nand.c              |  5 ++---
>  drivers/mtd/nand/sunxi_nand.c                 |  4 +---
>  drivers/mtd/nand/vf610_nfc.c                  |  6 +-----
>  drivers/staging/mt29f_spinand/mt29f_spinand.c |  5 ++---
>  24 files changed, 54 insertions(+), 88 deletions(-)

Brian

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index f3d6e83e193b..850546dc98c8 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -748,7 +748,7 @@ static int fsl_elbc_chip_init(struct fsl_elbc_mtd *priv)
 	/* Fill in fsl_elbc_mtd structure */
 	priv->mtd.priv = chip;
 	priv->mtd.dev.parent = priv->dev;
-	chip->flash_node = priv->dev.of_node;
+	chip->flash_node = priv->dev->of_node;
 
 	/* set timeout to maximum */
 	priv->fmr = 15 << FMR_CWTO_SHIFT;
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 60978b737cac..8ae2a237ed4d 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -883,7 +883,7 @@ static int fsl_ifc_chip_init(struct fsl_ifc_mtd *priv)
 	/* Fill in fsl_ifc_mtd structure */
 	priv->mtd.priv = chip;
 	priv->mtd.dev.parent = priv->dev;
-	chip->flash_node = priv->dev.of_node;
+	chip->flash_node = priv->dev->of_node;
 
 	/* fill in nand_chip structure */
 	/* set up function call table */
