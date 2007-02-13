Received: from mail.emacinc.com ([63.245.244.68])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HH5TE-0001R8-L6
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 16:45:56 -0500
From: NZG <ngustavson@emacinc.com>
To: linux-mtd@lists.infradead.org,
 linux-cirrus@freelists.org
Date: Tue, 13 Feb 2007 15:45:34 -0600
References: <200702131517.41184.ngustavson@emacinc.com>
In-Reply-To: <200702131517.41184.ngustavson@emacinc.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200702131545.34057.ngustavson@emacinc.com>
Subject: Re: kobject_add failed for physmap-flash.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A little grepping yielded

#ifdef CONFIG_MTD_PHYSMAP_LEN
#if CONFIG_MTD_PHYSMAP_LEN != 0
#warning using PHYSMAP compat code
#define PHYSMAP_COMPAT
#endif
#endif

and

static int __init physmap_init(void)
{
	int err;

	err = platform_driver_register(&physmap_flash_driver);
#ifdef PHYSMAP_COMPAT
	if (err == 0)
		platform_device_register(&physmap_flash);
#endif

	return err;
}

which looks suspicious as the crash claims something is being registered 
twice.

Indeed, setting 

CONFIG_MTD_PHYSMAP_LEN = 0

fixes the problem, the flash autodetects to the correct size and everything 
works.

I guess the problem is solved but I'm not sure why.
What is PHYSMAP_COMPAT supposed to do?
Any why is it wrong to specify the size of your flash?

NZG




On Tuesday 13 February 2007 3:17 pm, NZG wrote:
> I'm booting with JFFS2 on an ARM processor using 2.6.20-rc7.
> I'm parsing the Redboot partition table to allocate the flash.
> It works, but always spits out the crazy error message shown below.
> I've googled around but haven't found any reference to it.
> Has anyone else seen this?
>
>
> Searching for RedBoot partition table in physmap-flash.0 at offset 0xfc0000
> 5 RedBoot partitions found on MTD device physmap-flash.0
> Creating 5 MTD partitions on "physmap-flash.0":
> 0x00000000-0x00040000 : "RedBoot"
> 0x00040000-0x00a40000 : "rootfs"
> 0x00a40000-0x00bc0000 : "zImage"
> 0x00fa0000-0x00fa1000 : "RedBoot config"
> mtd: partition "RedBoot config" doesn't end on an erase block -- force
> read-only
> 0x00fc0000-0x00fe0000 : "FIS directory"
> kobject_add failed for physmap-flash.0 with -EEXIST, don't try to register
> things with the same name in the.
> [<c0027778>] (dump_stack+0x0/0x14) from [<c0140948>]
> (kobject_add+0x174/0x1b4) [<c01407d4>] (kobject_add+0x0/0x1b4) from
> [<c015bfec>] (device_add+0x78/0x4b0) [<c015bf74>] (device_add+0x0/0x4b0)
> from [<c0160314>]
> (platform_device_add+0x100/0x154)
> [<c0160214>] (platform_device_add+0x0/0x154) from [<c016038c>]
> (platform_device_register+0x24/0x28)
>  r7 = 00000000  r6 = C0332000  r5 = C001EBFC  r4 = C02F15D0
> [<c0160368>] (platform_device_register+0x0/0x28) from [<c0019424>]
> (physmap_init+0x24/0x34)
>  r4 = 00000000
> [<c0019400>] (physmap_init+0x0/0x34) from [<c00220c0>] (init+0x94/0x270)
>  r4 = C001F144
> [<c002202c>] (init+0x0/0x270) from [<c0040974>] (do_exit+0x0/0x7d0)
>  r7 = 00000000  r6 = 00000000  r5 = 00000000  r4 = 00000000
>
> thx,
> NZG
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
