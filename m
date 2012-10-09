Received: from dalsmrelay2.nai.com ([205.227.136.216])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TLQW7-0002Q4-RF
 for linux-mtd@lists.infradead.org; Tue, 09 Oct 2012 03:30:01 +0000
Message-ID: <50739A2A.9070405@snapgear.com>
Date: Tue, 9 Oct 2012 13:29:46 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] [RFC] mtd/uclinux: support ROM and allow passing the
 base address
References: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
In-Reply-To: <1349709952-4332-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de,
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

On 09/10/12 01:25, Uwe Kleine-K=F6nig wrote:
> This allows to put the filesystem at a defined address in ROM allowing
> to save more precious RAM.
>
> I think it's save to default to ROM because the intention of using the
> uclinux map is to use a romfs and so mtd-ram doesn't give you anything
> that mtd-rom doesn't.
>
> Signed-off-by: Uwe Kleine-K=C3=B7nig <u.kleine-koenig@pengutronix.de>

Looks good to me, so:

Acked-by: Greg Ungerer <gerg@uclinux.org>

Couple of things to be aware of. Artem currently has a couple of
patches against this file (looks like at least 1 of them is currently
in linux-next). It will probably conflict with your changes, should
be easy enough to fix up.

The change to this file in linux-next changes the call to ioremap
to be a phys_to_virt - which is because it was always going to be
in real RAM. This may no longer be true with your change, it could
be in ROM. For non-MMU I expect no problems. But this could be an
issue if used on systems with MMU enabled. (And one of the other
changes that I generated for this allows this for at least one
architecture type - ColdFire/m68k). Just flagging this, I don't expect
it will cause any current users any problems.

Regards
Greg



> ---
>   drivers/mtd/maps/Kconfig   |    2 +-
>   drivers/mtd/maps/uclinux.c |   30 +++++++++++++++++++++++-------
>   2 files changed, 24 insertions(+), 8 deletions(-)
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
> index c3bb304..a8a5929 100644
> --- a/drivers/mtd/maps/uclinux.c
> +++ b/drivers/mtd/maps/uclinux.c
> @@ -23,12 +23,13 @@
>
>   /**********************************************************************=
******/
>
> -struct map_info uclinux_ram_map =3D {
> -	.name =3D "RAM",
> -	.phys =3D (unsigned long)__bss_stop,
> +static struct map_info uclinux_ram_map =3D {
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
> +	}
> +
>   	if (!mtd) {
> -		printk("uclinux[mtd]: failed to find a mapping?\n");
> +		printk("uclinux[mtd]: failed to find a rom/ram mapping?\n");
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
