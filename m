Received: from cam-admin0.cambridge.arm.com ([193.131.176.58])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MJS55-0001U9-Fa
	for linux-mtd@lists.infradead.org; Wed, 24 Jun 2009 13:00:07 +0000
Subject: Re: BUS_ID_SIZE is going away
From: Catalin Marinas <catalin.marinas@arm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1245842095.25547.5380.camel@macbook.infradead.org>
References: <1245527124.30962.14.camel@yio.site>
	<1245675383.25547.50.camel@macbook.infradead.org>
	<1245832038.2483.3.camel@yio.site>
	<1245842095.25547.5380.camel@macbook.infradead.org>
Content-Type: text/plain
Date: Wed, 24 Jun 2009 13:59:16 +0100
Message-Id: <1245848356.32629.14.camel@pc1117.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, Takashi Iwai <tiwai@suse.de>,
	Greg KH <greg@kroah.com>, Kay Sievers <kay.sievers@vrfy.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-mtd@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-06-24 at 12:14 +0100, David Woodhouse wrote:
> On Wed, 2009-06-24 at 10:27 +0200, Kay Sievers wrote:
> > On Mon, 2009-06-22 at 13:56 +0100, David Woodhouse wrote:
> > > I have this queued for 2.6.31 but have been on jury duty for the last 2
> > > weeks so I'm hoping to get the pull request to Linus today now that I'm
> > > free.
> > 
> > The old one is gone, but seems you merged a new one with BUS_ID_SIZE :)
> > 
> >   ./drivers/mtd/maps/integrator-flash.c:#define SUBDEV_NAME_SIZE	(BUS_ID_SIZE + 2)
> 
> Hm, true :)
> 
> Catalin, can you test the following? 

Yes, it still works (with some remarks below).

> Btw, I'm unconvinced by the existing error handling -- if
> armflash_subdev_probe() fails, it doesn't look like _that_ subdev
> actually gets cleaned up in the loop at 'subdev_err:'. So we don't
> release the memory region (and neither do we free the newly-kmalloced
> name).

If armflash_subdev_probe() fails, it cleans up after itself so there is
no need to handle it in the subdev_err loop. With your patch, however,
this should be done explicitly if the subdev probing fails. Something
like below:

diff --git a/drivers/mtd/maps/integrator-flash.c b/drivers/mtd/maps/integrator-flash.c
index b9fac5b..2aac41b 100644
--- a/drivers/mtd/maps/integrator-flash.c
+++ b/drivers/mtd/maps/integrator-flash.c
@@ -188,8 +188,11 @@ static int armflash_probe(struct platform_device *dev)
 		subdev->plat = plat;
 
 		err = armflash_subdev_probe(subdev, res);
-		if (err)
+		if (err) {
+			kfree(subdev->name);
+			subdev->name = NULL;
 			break;
+		}
 	}
 	info->nr_subdev = i;
 

> In fact, do we still need a separate platform device and driver for ARM
> systems? What does it provide that the physmap driver does (and can)
> not?

(I cc'ed Russell as well since he wrote the integrator-flash driver and
may have comments)

I gave physmap a quick try on RealView boards and it seems to work fine
with the patch below. The only difference is the AFS partition parsing
probes string, though this is no longer used on ARM Ltd platforms (some
old ones still use it).

I'll test it a bit more and, if there are no other comments, I'll push a
patch to convert the ARM Ltd platforms to physmap (but that's for the
next merging window as I don't think I have time to test it well enough
now).


RealView: Convert the platform code to use the physmap flash driver

From: Catalin Marinas <catalin.marinas@arm.com>

This platform was still using the integrator-flash driver but this
pretty much duplicates the physmap one.

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm/mach-realview/core.c |   31 ++++---------------------------
 1 files changed, 4 insertions(+), 27 deletions(-)

diff --git a/arch/arm/mach-realview/core.c b/arch/arm/mach-realview/core.c
index 0cc6f42..ef33872 100644
--- a/arch/arm/mach-realview/core.c
+++ b/arch/arm/mach-realview/core.c
@@ -30,6 +30,7 @@
 #include <linux/io.h>
 #include <linux/smsc911x.h>
 #include <linux/ata_platform.h>
+#include <linux/mtd/physmap.h>
 
 #include <asm/clkdev.h>
 #include <asm/system.h>
@@ -41,7 +42,6 @@
 #include <asm/hardware/icst307.h>
 
 #include <asm/mach/arch.h>
-#include <asm/mach/flash.h>
 #include <asm/mach/irq.h>
 #include <asm/mach/map.h>
 #include <asm/mach/mmc.h>
@@ -76,27 +76,7 @@ unsigned long long sched_clock(void)
 
 #define REALVIEW_FLASHCTRL    (__io_address(REALVIEW_SYS_BASE) + REALVIEW_SYS_FLASH_OFFSET)
 
-static int realview_flash_init(void)
-{
-	u32 val;
-
-	val = __raw_readl(REALVIEW_FLASHCTRL);
-	val &= ~REALVIEW_FLASHPROG_FLVPPEN;
-	__raw_writel(val, REALVIEW_FLASHCTRL);
-
-	return 0;
-}
-
-static void realview_flash_exit(void)
-{
-	u32 val;
-
-	val = __raw_readl(REALVIEW_FLASHCTRL);
-	val &= ~REALVIEW_FLASHPROG_FLVPPEN;
-	__raw_writel(val, REALVIEW_FLASHCTRL);
-}
-
-static void realview_flash_set_vpp(int on)
+static void realview_flash_set_vpp(struct map_info *map, int on)
 {
 	u32 val;
 
@@ -108,16 +88,13 @@ static void realview_flash_set_vpp(int on)
 	__raw_writel(val, REALVIEW_FLASHCTRL);
 }
 
-static struct flash_platform_data realview_flash_data = {
-	.map_name		= "cfi_probe",
+static struct physmap_flash_data realview_flash_data = {
 	.width			= 4,
-	.init			= realview_flash_init,
-	.exit			= realview_flash_exit,
 	.set_vpp		= realview_flash_set_vpp,
 };
 
 struct platform_device realview_flash_device = {
-	.name			= "armflash",
+	.name			= "physmap-flash",
 	.id			= 0,
 	.dev			= {
 		.platform_data	= &realview_flash_data,


-- 
Catalin
