Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vw062-0002R0-9W
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 01:50:48 +0000
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYE00FGY53Z8TD0@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 26 Dec 2013 10:50:23 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Ezequiel Garcia' <ezequiel.garcia@free-electrons.com>
References: <001701cefd5b$de189f90$9a49deb0$%han@samsung.com>
 <001901cefd5c$644dec50$2ce9c4f0$%han@samsung.com>
 <20131221142203.GA2810@localhost>
In-reply-to: <20131221142203.GA2810@localhost>
Subject: Re: [PATCH 3/4] mtd: orion_nand: use dev_err() instead of printk()
Date: Thu, 26 Dec 2013 10:50:23 +0900
Message-id: <008101cf01dc$d7485b30$85d91190$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: quoted-printable
Content-language: ko
Cc: 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 'Andrew Lunn' <andrew@lunn.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday, December 21, 2013 11:22 PM, Ezequiel Garcia wrote:
>=20
> Hi Jingoo,
>=20
> Thanks for the cleanup!
>=20
> I have some extra requests :-)
>=20
> On Fri, Dec 20, 2013 at 05:20:50PM +0900, Jingoo Han wrote:
> [..]
> > diff --git a/drivers/mtd/nand/orion_nand.c =
b/drivers/mtd/nand/orion_nand.c
> > index a393a5b..7cd9aed 100644
> > --- a/drivers/mtd/nand/orion_nand.c
> > +++ b/drivers/mtd/nand/orion_nand.c
> > @@ -87,7 +87,7 @@ static int __init orion_nand_probe(struct =
platform_device *pdev)
> >
> >  	nc =3D kzalloc(sizeof(struct nand_chip) + sizeof(struct mtd_info), =
GFP_KERNEL);
> >  	if (!nc) {
> > -		printk(KERN_ERR "orion_nand: failed to allocate device =
structure.\n");
> > +		dev_err(&pdev->dev, "orion_nand: failed to allocate device =
structure.\n");
>=20
> Instead of this replacement, can you remove the error message =
entirely?
> It's redundant for a driver to print anything after an allocation =
error, since an
> out-of-memory condition will print quite enough information.
>=20
> (Google for "Joe Perches OOM" and you'll find lots of patches removing =
this prints).

OK, I see.

I checked the patches about OOM from Joe Perches.
I will send another patch to remove OOM error message,
instead of this patch. Thank you for your comment.

Best regards,
Jingoo Han

>=20
> > @@ -110,7 +110,7 @@ static int __init orion_nand_probe(struct =
platform_device *pdev)
> >  		board =3D devm_kzalloc(&pdev->dev, sizeof(struct =
orion_nand_data),
> >  					GFP_KERNEL);
> >  		if (!board) {
> > -			printk(KERN_ERR "orion_nand: failed to allocate board =
structure.\n");
> > +			dev_err(&pdev->dev, "orion_nand: failed to allocate board =
structure.\n");
>=20
> Ditto.
>=20
> Thanks!
> --
> Ezequiel Garc=C3=ADa, Free Electrons
> Embedded Linux, Kernel and Android Engineering
> http://free-electrons.com
