Received: from up.free-electrons.com ([163.172.77.33]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c3kMA-0000s2-2X
 for linux-mtd@lists.infradead.org; Mon, 07 Nov 2016 13:53:03 +0000
Date: Mon, 7 Nov 2016 14:52:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Bjorn
 Helgaas <bhelgaas@google.com>, Linas Vepstas <linasvepstas@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: nand: denali_pci: add missing
 pci_release_regions() calls
Message-ID: <20161107145229.7c934989@bbrezillon>
In-Reply-To: <1478525584.5295.59.camel@linux.intel.com>
References: <1478106790-10399-1-git-send-email-yamada.masahiro@socionext.com>
 <1478525584.5295.59.camel@linux.intel.com>
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

On Mon, 07 Nov 2016 15:33:04 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Thu, 2016-11-03 at 02:13 +0900, Masahiro Yamada wrote:
> > The probe function calls pci_request_regions(), but I do not see
> > corresponding pci_release_regions() calls.
> >=20
> > While we are here, rename the jump labels to follow the guideline
> > "Choose label names which say what the goto does" suggested by
> > Documentation/CodingStyle. =20
>=20
> NACK!
>=20
> Please, remove or revert this patch.
> Everything is done in pcim_release() function.

Indeed. I'll drop the patch.

Thanks,

Boris

>=20
> >=20
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >=20
> > =C2=A0drivers/mtd/nand/denali_pci.c | 14 +++++++++-----
> > =C2=A01 file changed, 9 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/denali_pci.c
> > b/drivers/mtd/nand/denali_pci.c
> > index de31514..be8152f 100644
> > --- a/drivers/mtd/nand/denali_pci.c
> > +++ b/drivers/mtd/nand/denali_pci.c
> > @@ -76,28 +76,31 @@ static int denali_pci_probe(struct pci_dev *dev,
> > const struct pci_device_id *id)
> > =C2=A0	denali->flash_reg =3D ioremap_nocache(csr_base, csr_len);
> > =C2=A0	if (!denali->flash_reg) {
> > =C2=A0		dev_err(&dev->dev, "Spectra: Unable to remap memory
> > region\n");
> > -		return -ENOMEM;
> > +		ret =3D -ENOMEM;
> > +		goto release_regions;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	denali->flash_mem =3D ioremap_nocache(mem_base, mem_len);
> > =C2=A0	if (!denali->flash_mem) {
> > =C2=A0		dev_err(&dev->dev, "Spectra: ioremap_nocache
> > failed!");
> > =C2=A0		ret =3D -ENOMEM;
> > -		goto failed_remap_reg;
> > +		goto unmap_reg;
> > =C2=A0	}
> > =C2=A0
> > =C2=A0	ret =3D denali_init(denali);
> > =C2=A0	if (ret)
> > -		goto failed_remap_mem;
> > +		goto unmap_mem;
> > =C2=A0
> > =C2=A0	pci_set_drvdata(dev, denali);
> > =C2=A0
> > =C2=A0	return 0;
> > =C2=A0
> > -failed_remap_mem:
> > +unmap_mem:
> > =C2=A0	iounmap(denali->flash_mem);
> > -failed_remap_reg:
> > +unmap_reg:
> > =C2=A0	iounmap(denali->flash_reg);
> > +release_regions:
> > +	pci_release_regions(dev);
> > =C2=A0	return ret;
> > =C2=A0}
> > =C2=A0
> > @@ -109,6 +112,7 @@ static void denali_pci_remove(struct pci_dev *dev)
> > =C2=A0	denali_remove(denali);
> > =C2=A0	iounmap(denali->flash_reg);
> > =C2=A0	iounmap(denali->flash_mem);
> > +	pci_release_regions(dev);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static struct pci_driver denali_pci_driver =3D { =20
>=20
