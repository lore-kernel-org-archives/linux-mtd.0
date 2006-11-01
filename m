Received: from mgw-ext11.nokia.com ([131.228.20.170])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GfJJj-0000T5-Eg
	for linux-mtd@lists.infradead.org; Wed, 01 Nov 2006 11:52:01 -0500
Subject: Re: [PATCH] [MTD] MAPS: Support for BIOS flash chips on the nvidia
	ck804 southbridge
From: Artem Bityutskiy <dedekind@infradead.org>
To: Ryan Jackson <rjackson@lnxi.com>
In-Reply-To: <20061031235646.GE5968@localdomain>
References: <20061031235646.GE5968@localdomain>
Content-Type: text/plain; charset=utf-8
Date: Wed, 01 Nov 2006 18:51:48 +0200
Message-Id: <1162399908.15435.16.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Rayan,

I have few questions (may be silly) and comments.

On Tue, 2006-10-31 at 16:56 -0700, Ryan Jackson wrote:
> +static int __devinit ck804xrom_init_one (struct pci_dev *pdev,
> +	const struct pci_device_id *ent)

I wonder why do you use __devinit here, not __init? AFAIK, __devinit is
used for hotplug-able devices, is this the case for a video card?

> +{
> +	static char *rom_probe_types[] =3D { "cfi_probe", "jedec_probe", NULL }=
;

So the interface may really be JEDEC and CFI?
> phys;
> +		map->map.virt =3D (void __iomem *)
> +			(((unsigned long)(window->virt)) + offset);
map->map.virt is 'void *', so=20

map->map.virt =3D window->virt + offset * sizeof(long);

could be used instead and it looks neater. In gcc sizeof(void) is 1 and
is is widely used in the kernel.

> +static int __init init_ck804xrom(void)
> +{
> +	struct pci_dev *pdev;
> +	struct pci_device_id *id;
> +	int retVal;
> +	pdev =3D NULL;
> +
> +	for(id =3D ck804xrom_pci_tbl; id->vendor; id++) {
> +		pdev =3D pci_find_device(id->vendor, id->device, NULL);
> +		if (pdev)
> +			break;
> +	}
> +	if (pdev) {
> +		retVal =3D ck804xrom_init_one(pdev, &ck804xrom_pci_tbl[0]);
> +		pci_dev_put(pdev);
> +		return retVal;
> +	}
> +	return -ENXIO;
> +#if 0
> +	return pci_module_init(&ck804xrom_driver);
> +#endif

Why you commented out pci_module_init() and the related stuff? Why you
do not use this standard mechanism?

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
