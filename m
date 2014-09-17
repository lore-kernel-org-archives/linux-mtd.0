Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUAgr-00007G-2s
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 08:34:17 +0000
Received: by mail-pa0-f44.google.com with SMTP id kx10so1746509pab.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 01:33:56 -0700 (PDT)
Date: Wed, 17 Sep 2014 01:33:53 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
Message-ID: <20140917083353.GB7362@norris-Latitude-E6410>
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com> <540D8A92.2040209@ti.com>
 <20140910124849.GA25308@arch.hh.imgtec.org>
 <54104CB4.4020703@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54104CB4.4020703@ti.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 10, 2014 at 04:05:56PM +0300, Roger Quadros wrote:
> On 09/10/2014 03:48 PM, Ezequiel Garcia wrote:
> > On 08 Sep 01:53 PM, Roger Quadros wrote:
> >> On 09/08/2014 11:45 AM, Roger Quadros wrote:
> >>> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> >> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
> >> CONFIG_MTD_NAND_OMAP_BCH to m.
> >>
> >> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be limited to
> >> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
> >>
> > 
> > Hm, yup. Any ideas on how to accomplish that? My Kconfig-foo is not strong enough :(
>
> Mine neither ;). I'm unaware of any other method than making CONFIG_MTD_NAND_OMAP_BCH to bool.

That could be part of the solution. Does the following patch work? It
now forces elm and omap to be built the same -- either both as modules
or both built-in -- but it solves the rest of the problem I think.

(This also has the side effect of causing transition pains for any
.config file that had CONFIG_MTD_NAND_OMAP_BCH=m, since this becomes
boolean now.)

diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index c68868f60588..4dc8990898dc 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -12,7 +12,7 @@ obj-$(CONFIG_MTD_LART)		+= lart.o
 obj-$(CONFIG_MTD_BLOCK2MTD)	+= block2mtd.o
 obj-$(CONFIG_MTD_DATAFLASH)	+= mtd_dataflash.o
 obj-$(CONFIG_MTD_M25P80)	+= m25p80.o
-obj-$(CONFIG_MTD_NAND_OMAP_BCH)	+= elm.o
+obj-$(CONFIG_MTD_NAND_OMAP_BCH_BUILD) += elm.o
 obj-$(CONFIG_MTD_SPEAR_SMI)	+= spear_smi.o
 obj-$(CONFIG_MTD_SST25L)	+= sst25l.o
 obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f1cf503517fd..6390b2b58edb 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -96,9 +96,8 @@ config MTD_NAND_OMAP2
 
 config MTD_NAND_OMAP_BCH
 	depends on MTD_NAND_OMAP2
-	tristate "Support hardware based BCH error correction"
+	bool "Support hardware based BCH error correction"
 	default n
-	select BCH
 	help
 	  This config enables the ELM hardware engine, which can be used to
 	  locate and correct errors when using BCH ECC scheme. This offloads
@@ -106,6 +105,12 @@ config MTD_NAND_OMAP_BCH
 	  legacy OMAP families like OMAP2xxx, OMAP3xxx do not have ELM engine
 	  so they should not enable this config symbol.
 
+config MTD_NAND_OMAP_BCH_BUILD
+	tristate
+	depends on MTD_NAND_OMAP_BCH
+	default MTD_NAND_OMAP2
+	select BCH
+
 config MTD_NAND_IDS
 	tristate
 
