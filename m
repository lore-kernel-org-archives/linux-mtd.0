Received: from dnvwsmailout1.mcafee.com ([161.69.31.173])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TNc2h-00029v-O3
 for linux-mtd@lists.infradead.org; Mon, 15 Oct 2012 04:12:40 +0000
Message-ID: <507B8DBF.2030104@snapgear.com>
Date: Mon, 15 Oct 2012 14:14:55 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/2 RFC v2] mtd/uclinux: support ROM and allow passing
 the base address
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1350027693-19528-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, Mike
 Frysinger <vapier.adi@gmail.com>, kernel@pengutronix.de,
 Greg Ungerer <gerg@uclinux.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Uwe,

On 12/10/12 17:41, Uwe Kleine-K=F6nig wrote:
> This allows to put the filesystem at a defined address in ROM allowing
> to save more precious RAM.
>
> I think it's save to default to ROM because the intention of using the
                ^^^^
                safe

> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> that mtd-rom doesn't.
>
> Signed-off-by: Uwe Kleine-K=C3=B7nig <u.kleine-koenig@pengutronix.de>

Unfortunately email to me goes through an exchange server and openchange,
and it manages to often mangle anything more than 7bit ascii. Not too
much I can do about it, sorry.


> Changed since (implicit) v1:
>
>   - don't make uclinux_ram_map static as pointed out by Mike and Greg.
>
>   drivers/mtd/maps/Kconfig   |    2 +-
>   drivers/mtd/maps/uclinux.c |   28 ++++++++++++++++++++++------
>   2 files changed, 23 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
> index 5ba2458..d945950 100644
> --- a/drivers/mtd/maps/Kconfig
> +++ b/drivers/mtd/maps/Kconfig
> @@ -443,7 +443,7 @@ config MTD_GPIO_ADDR
>
>   config MTD_UCLINUX
>   	bool "Generic uClinux RAM/ROM filesystem support"
> -	depends on MTD_RAM=3Dy && !MMU
> +	depends on (MTD_RAM=3Dy || MTD_ROM=3Dy) && !MMU
>   	help
>   	  Map driver to support image based filesystems for uClinux.
>
> diff --git a/drivers/mtd/maps/uclinux.c b/drivers/mtd/maps/uclinux.c
> index c3bb304..f5e8e9a 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -24,11 +24,12 @@
>   /**********************************************************************=
******/
>
>   struct map_info uclinux_ram_map =3D {
> -	.name =3D "RAM",
> -	.phys =3D (unsigned long)__bss_stop,
>   	.size =3D 0,
>   };
>
> +static unsigned long physaddr =3D -1;
> +module_param(physaddr, ulong, S_IRUGO);
> +
>   static struct mtd_info *uclinux_ram_mtdinfo;
>
>   /**********************************************************************=
******/
> @@ -60,11 +61,17 @@ static int __init uclinux_mtd_init(void)
>   	struct map_info *mapp;
>
>   	mapp =3D &uclinux_ram_map;
> +
> +	if (physaddr =3D=3D -1)
> +		mapp->phys =3D (resource_size_t)__bss_stop;
> +	else
> +		mapp->phys =3D physaddr;
> +
>   	if (!mapp->size)
>   		mapp->size =3D PAGE_ALIGN(ntohl(*((unsigned long *)(mapp->phys + 8)))=
);
>   	mapp->bankwidth =3D 4;
>
> -	printk("uclinux[mtd]: RAM probe address=3D0x%x size=3D0x%x\n",
> +	printk("uclinux[mtd]: RAM/ROM probe address=3D0x%x size=3D0x%x\n",
>   	       	(int) mapp->phys, (int) mapp->size);

Is there any value in saying "RAM/ROM"?
Why don't we just drop those chars altogether.


>
>   	mapp->virt =3D ioremap_nocache(mapp->phys, mapp->size);
> @@ -76,9 +83,18 @@ static int __init uclinux_mtd_init(void)
>
>   	simple_map_init(mapp);
>
> -	mtd =3D do_map_probe("map_ram", mapp);
> +	mapp->name =3D "ROM";
> +	mtd =3D do_map_probe("map_rom", mapp);
> +	if (!mtd) {
> +		/* fall back to ram probing for compatibility reasons */
> +		mapp->name =3D "RAM";
> +		mtd =3D do_map_probe("map_ram", mapp);
> +		if (mtd && IS_ENABLED(CONFIG_MTD_ROM))
> +			pr_err("Failed to map rom, but ram succeeded. Please report this issu=
e!\n");

Do we really want this message?
My predominate usage of this code is in RAM mappings. Network
loading kernel+filesystem images on bare boards. Anyone who wants
to know and is looking in the kernel boot messages will see
something like:

     Creating 1 MTD partitions on "RAM":
     0x000000000000-0x0000000d8000 : "ROMfs"

So they will know what type of mapping it was loaded from.


> +	}
> +
>   	if (!mtd) {
> -		printk("uclinux[mtd]: failed to find a mapping?\n");
> +		printk("uclinux[mtd]: failed to find a rom/ram mapping?\n");

Again, is there any point in changing this message?
Adding "rom/ram" doesn't add any value here.

Regards
Greg



>   		iounmap(mapp->virt);
>   		return(-ENXIO);
>   	}
> @@ -115,6 +131,6 @@ module_exit(uclinux_mtd_cleanup);
>
>   MODULE_LICENSE("GPL");
>   MODULE_AUTHOR("Greg Ungerer <gerg@snapgear.com>");
> -MODULE_DESCRIPTION("Generic RAM based MTD for uClinux");
> +MODULE_DESCRIPTION("Generic RAM/ROM based MTD for uClinux");
>
>   /**********************************************************************=
******/
>


--=20
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
