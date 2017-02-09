Received: from mail-pg0-f66.google.com ([74.125.83.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbe2c-00072V-OO
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 02:01:04 +0000
Received: by mail-pg0-f66.google.com with SMTP id 75so16379818pgf.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 18:00:37 -0800 (PST)
Date: Wed, 8 Feb 2017 17:59:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org
Subject: Re: linux-next: build failure after merge of the l2-mtd tree
Message-ID: <20170209015934.GA135772@google.com>
References: <20170209120839.50a8cfdb@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170209120839.50a8cfdb@canb.auug.org.au>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Thu, Feb 09, 2017 at 12:08:39PM +1100, Stephen Rothwell wrote:
> Hi Brian,
> 
> After merging the l2-mtd tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> ERROR: "of_flash_probe_versatile" [drivers/mtd/maps/physmap_of.ko] undefined!
> ERROR: "of_flash_probe_gemini" [drivers/mtd/maps/physmap_of.ko] undefined!
> 
> Probably caused by commit
> 
>   56ff337ea433 ("mtd: physmap_of: add a hook for Gemini flash probing")
> 
> The config has:
> 
> CONFIG_MTD_PHYSMAP=m
> CONFIG_MTD_PHYSMAP_COMPAT=y
> CONFIG_MTD_PHYSMAP_OF=m
> CONFIG_MTD_PHYSMAP_OF_VERSATILE=y
> CONFIG_MTD_PHYSMAP_OF_GEMINI=y
> 
> I am not sure why this is a problem, but previously physmap_of_versatile.o
> would have been in obj-m and it is now in obj-y.

I think this part of that change does it:

--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -18,9 +18,8 @@ obj-$(CONFIG_MTD_TSUNAMI)     += tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)       += pxa2xx-flash.o
 obj-$(CONFIG_MTD_PHYSMAP)      += physmap.o
 obj-$(CONFIG_MTD_PHYSMAP_OF)   += physmap_of.o
-ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
-obj-$(CONFIG_MTD_PHYSMAP_OF)   += physmap_of_versatile.o
-endif
+obj-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE) += physmap_of_versatile.o
+obj-$(CONFIG_MTD_PHYSMAP_OF_GEMINI)    += physmap_of_gemini.o
 obj-$(CONFIG_MTD_PISMO)                += pismo.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)       += pcmciamtd.o

We were previously just keeping physmap_of_versatile in sync with physmap_of.
So it could be a module, even though CONFIG_MTD_PHYSMAP_OF_VERSATILE was
'bool'.

This is kind of a weird scenario, since physmap_of actually depends on
*_versatile or *_gemini (when enabled). Maybe we should revert to something
like the original logic. We can even actually merge the 3 modules (and then
drop the EXPORT_*s too):

diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 2fec1e0c2371..aef1846b4de2 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -17,9 +17,13 @@ obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
 obj-$(CONFIG_MTD_PHYSMAP)	+= physmap.o
+ifdef CONFIG_MTD_PHYSMAP_OF_VERSATILE
+physmap_of-objs += physmap_of_versatile.o
+endif
+ifdef CONFIG_MTD_PHYSMAP_OF_GEMINI
+physmap_of-objs += physmap_of_gemini.o
+endif
 obj-$(CONFIG_MTD_PHYSMAP_OF)	+= physmap_of.o
-obj-$(CONFIG_MTD_PHYSMAP_OF_VERSATILE)	+= physmap_of_versatile.o
-obj-$(CONFIG_MTD_PHYSMAP_OF_GEMINI)	+= physmap_of_gemini.o
 obj-$(CONFIG_MTD_PISMO)		+= pismo.o
 obj-$(CONFIG_MTD_PMC_MSP_EVM)   += pmcmsp-flash.o
 obj-$(CONFIG_MTD_PCMCIA)	+= pcmciamtd.o

I'll cook that into a proper patch if it seems good.

> I have used the version fo the l2-mtd tree from next-20170208 for today.

Sounds good.

Brian
