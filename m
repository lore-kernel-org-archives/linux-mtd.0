Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8g1-0006mo-6l
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:49:33 +0000
Received: by mail-pd0-f174.google.com with SMTP id g10so4434041pdj.5
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 11:49:12 -0700 (PDT)
Date: Mon, 22 Sep 2014 11:49:09 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v4 4/5] mtd: nand: Rename OMAP NAND driver
Message-ID: <20140922184909.GS1193@ld-irv-0074>
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1411231996-6387-5-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411231996-6387-5-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 20, 2014 at 05:53:15PM +0100, Ezequiel Garcia wrote:
> Rename it to a less generic name, so the module is built with a meaningful
> name instead of the previous 'omap2.ko'.

You mention renaming only so that you can change the module name, but
you also (partly at my prompting) argued for future merging of omap_nand
and omap_elm into a single module. So it seems like you might have to do
several renamings, in that case, right?

omap2.c => omap_nand.c (this patch)

omap_nand.c => <somethingelse>.c (later)
 ...so you can link somethingelse.o and omap_elm.o into omap_nand.{o,ko}

If I'm right here, then maybe (rather than multiple renames), you just
want this patch for now? (untested)

diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
index b3237b742eb5..1a4d5e9db75b 100644
--- a/drivers/mtd/nand/Makefile
+++ b/drivers/mtd/nand/Makefile
@@ -26,7 +26,7 @@ obj-$(CONFIG_MTD_NAND_CS553X)		+= cs553x_nand.o
 obj-$(CONFIG_MTD_NAND_NDFC)		+= ndfc.o
 obj-$(CONFIG_MTD_NAND_ATMEL)		+= atmel_nand.o
 obj-$(CONFIG_MTD_NAND_GPIO)		+= gpio.o
-obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap2.o
+obj-$(CONFIG_MTD_NAND_OMAP2) 		+= omap_nand.o
 obj-$(CONFIG_MTD_NAND_OMAP_BCH)		+= omap_elm.o
 obj-$(CONFIG_MTD_NAND_CM_X270)		+= cmx270_nand.o
 obj-$(CONFIG_MTD_NAND_PXA3xx)		+= pxa3xx_nand.o
@@ -52,3 +52,4 @@ obj-$(CONFIG_MTD_NAND_XWAY)		+= xway_nand.o
 obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)	+= bcm47xxnflash/
 
 nand-objs := nand_base.o nand_bbt.o nand_timings.o
+omap_nand-objs := omap2.o

> Acked-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/Makefile                  | 2 +-
>  drivers/mtd/nand/{omap2.c => omap2_nand.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (100%)

[snip]

Brian
