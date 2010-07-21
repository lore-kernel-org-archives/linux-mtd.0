Subject: Re: [PATCH] drivers/mtd: remove makefile subdirectory processing
	redundancies
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Kyle Spaans <kspaans@uwaterloo.ca>
In-Reply-To: <20100720021718.GA32479@caffeine.csclub.uwaterloo.ca>
References: <20100714042509.GA7775@caffeine.csclub.uwaterloo.ca>
	<1279471590.16247.57.camel@localhost.localdomain>
	<20100720021718.GA32479@caffeine.csclub.uwaterloo.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Jul 2010 13:09:35 +0300
Message-ID: <1279706975.2306.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-07-19 at 22:17 -0400, Kyle Spaans wrote:
> > > +obj-$(CONFIG_MTD_TESTS)		+= tests/
> > > +obj-$(CONFIG_MTD_LPDDR)		+= lpddr/
> > > +obj-$(CONFIG_MTD_NAND)		+= nand/
> > > +obj-$(CONFIG_MTD_ONENAND)	+= onenand/
> > >  obj-$(CONFIG_MTD_BI)		+= ubi/
> > 
> > This cannot be right, because we have UBI, not 'BI'.
> 
> Weird! Mutt seems to have mangled the patch on me. I must have pressed some
> buttons while composing the message. Try it now. Thanks! (Can I resubmit the
> patch like this, or does it need to go in its own email? I can't quite tell
> from looking at linux-mtd and lkml traffic.)

I see the following errors when I apply your patch to my l2-mtd-2.6 [1]
tree and compile on my x86_64 PC:

Kernel: arch/x86/boot/bzImage is ready  (#4)
ERROR: "ubi_open_volume" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_map" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_open_volume_nm" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_change" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_write" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_get_device_info" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_read" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_leb_unmap" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_close_volume" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_get_volume_info" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_open_volume_path" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_sync" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_is_mapped" [fs/ubifs/ubifs.ko] undefined!
ERROR: "ubi_register_volume_notifier" [drivers/mtd/ubi/gluebi.ko]
undefined!
ERROR: "ubi_leb_read" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_write" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_erase" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_leb_unmap" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_open_volume" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_close_volume" [drivers/mtd/ubi/gluebi.ko] undefined!
ERROR: "ubi_unregister_volume_notifier" [drivers/mtd/ubi/gluebi.ko]
undefined!
ERROR: "onenand_scan" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "flexonenand_region" [drivers/mtd/onenand/onenand_sim.ko]
undefined!
ERROR: "onenand_addr" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "onenand_release" [drivers/mtd/onenand/onenand_sim.ko] undefined!
ERROR: "onenand_scan" [drivers/mtd/onenand/generic.ko] undefined!
ERROR: "onenand_release" [drivers/mtd/onenand/generic.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/sm_common.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/sm_common.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/r852.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/plat_nand.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/plat_nand.ko] undefined!
ERROR: "nand_default_bbt" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/nandsim.ko] undefined!
ERROR: "nand_scan" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_scan_bbt" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/diskonchip.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/denali.ko] undefined!
ERROR: "nand_release" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_scan_tail" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_scan_ident" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "nand_wait_ready" [drivers/mtd/nand/cafe_nand.ko] undefined!
ERROR: "lpddr_cmdset" [drivers/mtd/lpddr/qinfo_probe.ko] undefined!
WARNING: modpost: Found 10 section mismatch(es).
To see full details build your kernel with:
'make CONFIG_DEBUG_SECTION_MISMATCH=y'
make[1]: *** [__modpost] Error 1
make: *** [modules] Error 2

[1] git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
