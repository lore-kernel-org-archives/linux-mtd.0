Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNedh-0000Hc-PH
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 06:59:02 +0000
Date: Mon, 15 Oct 2012 08:58:55 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH 1/2 RFC v2] mtd/uclinux: support ROM and allow passing
 the base address
Message-ID: <20121015065855.GG639@pengutronix.de>
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <507B8DBF.2030104@snapgear.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507B8DBF.2030104@snapgear.com>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
 kernel@pengutronix.de, Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Mon, Oct 15, 2012 at 02:14:55PM +1000, Greg Ungerer wrote:
> Hi Uwe,
> 
> On 12/10/12 17:41, Uwe Kleine-König wrote:
> >This allows to put the filesystem at a defined address in ROM allowing
> >to save more precious RAM.
> >
> >I think it's save to default to ROM because the intention of using the
>                ^^^^
>                safe
> 
> >uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> >that mtd-rom doesn't.
> >
> >Signed-off-by: Uwe Kleine-KÃ·nig <u.kleine-koenig@pengutronix.de>
> 
> Unfortunately email to me goes through an exchange server and openchange,
> and it manages to often mangle anything more than 7bit ascii. Not too
> much I can do about it, sorry.
hehe, so openchange is really MS compatible now? :-)
 
> >Changed since (implicit) v1:
> >
> >  - don't make uclinux_ram_map static as pointed out by Mike and Greg.
> >
> >  drivers/mtd/maps/Kconfig   |    2 +-
> >  drivers/mtd/maps/uclinux.c |   28 ++++++++++++++++++++++------
> >  2 files changed, 23 insertions(+), 7 deletions(-)
> >
> >diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> >index 5ba2458..d945950 100644
> >--- a/drivers/mtd/maps/Kconfig
> >+++ b/drivers/mtd/maps/Kconfig
> >@@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
> >
> >  config MTD_UCLINUX
> >  	bool "Generic uClinux RAM/ROM filesystem support"
> >-	depends on MTD_RAM=y && !MMU
> >+	depends on (MTD_RAM=y || MTD_ROM=y) && !MMU
> >  	help
> >  	  Map driver to support image based filesystems for uClinux.
> >
> >diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> >index c3bb304..f5e8e9a 100644
> >--- a/drivers/mtd/maps/uclinux.c
> >+++ b/drivers/mtd/maps/uclinux.c
> >@@ -24,11 +24,12 @@
> >  /****************************************************************************/
> >
> >  struct map_info uclinux_ram_map = {
> >-	.name = "RAM",
> >-	.phys = (unsigned long)__bss_stop,
> >  	.size = 0,
> >  };
> >
> >+static unsigned long physaddr = -1;
> >+module_param(physaddr, ulong, S_IRUGO);
> >+
> >  static struct mtd_info *uclinux_ram_mtdinfo;
> >
> >  /****************************************************************************/
> >@@ -60,11 +61,17 @@ static int __init uclinux_mtd_init(void)
> >  	struct map_info *mapp;
> >
> >  	mapp = &uclinux_ram_map;
> >+
> >+	if (physaddr == -1)
> >+		mapp->phys = (resource_size_t)__bss_stop;
> >+	else
> >+		mapp->phys = physaddr;
> >+
> >  	if (!mapp->size)
> >  		mapp->size = PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8))));
> >  	mapp->bankwidth = 4;
> >
> >-	printk("uclinux[mtd]: RAM probe address=0x%x size=0x%x\n",
> >+	printk("uclinux[mtd]: RAM/ROM probe address=0x%x size=0x%x\n",
> >  	       	(int) mapp->phys, (int) mapp->size);
> 
> Is there any value in saying "RAM/ROM"?
> Why don't we just drop those chars altogether.
ok.

> >  	mapp->virt = ioremap_nocache(mapp->phys, mapp->size);
> >@@ -76,9 +83,18 @@ static int __init uclinux_mtd_init(void)
> >
> >  	simple_map_init(mapp);
> >
> >-	mtd = do_map_probe("map_ram", mapp);
> >+	mapp->name = "ROM";
> >+	mtd = do_map_probe("map_rom", mapp);
> >+	if (!mtd) {
> >+		/* fall back to ram probing for compatibility reasons */
> >+		mapp->name = "RAM";
> >+		mtd = do_map_probe("map_ram", mapp);
> >+		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
> >+			pr_err("Failed to map rom, but ram succeeded. Please report this issue!\n");
> 
> Do we really want this message?
> My predominate usage of this code is in RAM mappings. Network
> loading kernel+filesystem images on bare boards. Anyone who wants
> to know and is looking in the kernel boot messages will see
> something like:
> 
>     Creating 1 MTD partitions on "RAM":
>     0x000000000000-0x0000000d8000 : "ROMfs"
> 
> So they will know what type of mapping it was loaded from.
I want it because if nobody reports it it might well be possible to drop
map_ram support.

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
