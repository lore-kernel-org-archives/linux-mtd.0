Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctDMo-0006gM-BG
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 13:10:29 +0000
Date: Wed, 29 Mar 2017 15:10:02 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Roger Quadros <rogerq@ti.com>
Cc: Adam Ford <aford173@gmail.com>, "Leto, Enrico"
 <enrico.leto@siemens.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: Passing NAND mtdparts to OMAP2+ Kernel
Message-ID: <20170329151002.26203f2c@bbrezillon>
In-Reply-To: <04afe149-24b2-daec-5ef0-2d662ed79040@ti.com>
References: <CAHCN7xJoVF+3HjHwaS_U=jDqmU_Yv201KJSQ2s8N0gSNVR8pdQ@mail.gmail.com>
 <20170328215705.438d7af8@bbrezillon>
 <CAHCN7xKhRub4k8BpkPPjPFhjJU5c2xRd_VKPMfVOc88ZaTUmGQ@mail.gmail.com>
 <04afe149-24b2-daec-5ef0-2d662ed79040@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 29 Mar 2017 15:41:07 +0300
Roger Quadros <rogerq@ti.com> wrote:

> Adam,
>=20
> On 29/03/17 14:39, Adam Ford wrote:
> > On Tue, Mar 28, 2017 at 2:57 PM, Boris Brezillon
> > <boris.brezillon@free-electrons.com> wrote: =20
> >> +Roger and Enrico
> >>
> >> On Tue, 28 Mar 2017 10:43:01 -0500
> >> Adam Ford <aford173@gmail.com> wrote:
> >> =20
> >>> I posted this on the linux-omap list, and I was asked to post this on
> >>> the linux-mtd list:
> >>>
> >>>
> >>> I tried to remove the MTD partitions from the Linux device tree, and I
> >>> noticed that there was no partition information being pushed anymore
> >>> unless I changed the mtdparts name in U-Boot.
> >>>
> >>> It appears as if the MTD drivers have changed a bit.  I found a few
> >>> e-mails floating around that attempt to fix this
> >>>
> >>> Commit f7a8e38f07a17be907585 ("mtd: nand: assign reasonable default
> >>> name for NAND drivers") attempts to address this, and someone over at
> >>> https://patchwork.ozlabs.org/patch/707065/ attempted to address it as
> >>> well in a slightly different way. =20
> >>
> >> Can you test the patch and let me know if solves the problem. If it
> >> does, I'll send a clean version of the patch and queue it for 4.12.
> >> =20
> >=20
> > I tried to apply the patch directly, but it failed.  I then manually
> > copy-pasted it into the proper place, but it fails to compile.
> >=20
> > drivers/mtd/nand/omap2.c: In function =E2=80=98omap_nand_probe=E2=80=99:
> > drivers/mtd/nand/omap2.c:1859:14: error: implicit declaration of
> > function =E2=80=98devm_kasprinf=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
> >   mtd->name =3D devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_c=
s);
> >               ^~~~~~~~~~~~~
> > drivers/mtd/nand/omap2.c:1859:12: warning: assignment makes pointer
> > from integer without a cast [-Wint-conversion]
> >   mtd->name =3D devm_kasprinf(&pdev->dev, "omap2-nand.%d", info->gpmc_c=
s);
> >             ^
> > cc1: some warnings being treated as errors
> >=20
> > I use buildroot to build my toolchain and I am using gcc version 6.3.0
> > with glibc 2.24.  Is there supposed to be an include somewhere?  I am
> > not familiar with devm_kasprinf.

It's a typo: s/devm_kasprinf/devm_kasprintf/.

> >=20
> >  =20
>=20
> Does the below patch work for you?

Should work indeed.

I had a closer look and it seems that the bug was actually introduced
by c9711ec5250b mtd: nand: omap: Clean up device tree
support.
The parent device name has changed when switching to the new DT
representation: omap2-nand.0 (where 0 is the controller instance) became
30000000.nand (where 30000000 is the base reg address in the physical
address space). Which means my proposal was incorrect (0 is not the CS
line, it's the NAND controller instance number), so we'd better
statically set it to "omap2-nand.0".

>=20
> cheers,
> -roger
>=20
> ---
>  drivers/mtd/nand/omap2.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
> index 2a52101..f693b8d 100644
> --- a/drivers/mtd/nand/omap2.c
> +++ b/drivers/mtd/nand/omap2.c
> @@ -1856,6 +1856,13 @@ static int omap_nand_probe(struct platform_device =
*pdev)
>  	nand_chip->ecc.priv	=3D NULL;
>  	nand_set_flash_node(nand_chip, dev->of_node);
> =20

nand_set_flash_node() is now taking the "label" DT property into account
and assigning mtd->name to this value if present. I'd recommend doing

	if (!mtd->name)
		mtd->name =3D "omap2-nand.0";

> +	mtd->name =3D devm_kasprintf(&pdev->dev, GFP_KERNEL, "omap2-nand.%d",
> +				   info->gpmc_cs);
> +	if (!mtd->name) {
> +		dev_err(&pdev->dev, "Failed to set MTD name\n");
> +		return -ENOMEM;
> +	}
> +
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	nand_chip->IO_ADDR_R =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(nand_chip->IO_ADDR_R))
