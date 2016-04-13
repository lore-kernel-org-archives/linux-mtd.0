Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqFU8-0006Eq-EN
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 07:45:13 +0000
Date: Wed, 13 Apr 2016 09:44:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Richard Weinberger
 <richard@nod.at>, "open list:MEMORY TECHNOLOGY..."
 <linux-mtd@lists.infradead.org>, Egor Martovetsky <egor@pasemi.com>, Olof
 Johansson <olof@lixom.net>, Joe Perches <joe@perches.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "open
 list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] mtd: nand: pasemi: switch to pr_* functions
Message-ID: <20160413094440.1b883491@bbrezillon>
In-Reply-To: <CAHp75VcAbjTLPs128b1ojmWkosXBmYL5BUTbzw6aSYWN-ZRDBA@mail.gmail.com>
References: <1460111589-18781-1-git-send-email-zajec5@gmail.com>
 <1460114003-19926-1-git-send-email-zajec5@gmail.com>
 <CAHp75VcAbjTLPs128b1ojmWkosXBmYL5BUTbzw6aSYWN-ZRDBA@mail.gmail.com>
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

Hi,

On Sat, 9 Apr 2016 12:50:35 +0300
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Fri, Apr 8, 2016 at 2:13 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com=
> wrote:
> > 1) Use pr_fmt to keep messages consistent
> > 2) Don't warn if kzalloc fails as it dumps stack on its own
> > 3) Use %pR format for displaying whole resource to avoid:
> > warning: format =E2=80=98%08llx=E2=80=99 expects type =E2=80=98long lon=
g unsigned int=E2=80=99, but argument 2 has type =E2=80=98resource_size_t=
=E2=80=99
> >
> > Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> > ---
> >  drivers/mtd/nand/pasemi_nand.c | 9 ++++-----
> >  1 file changed, 4 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/pasemi_nand.c b/drivers/mtd/nand/pasemi_n=
and.c
> > index 63fcb8c..e8372b4 100644
> > --- a/drivers/mtd/nand/pasemi_nand.c
> > +++ b/drivers/mtd/nand/pasemi_nand.c
> > @@ -22,6 +22,8 @@
> >
> >  #undef DEBUG
> >
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> >  #include <linux/slab.h>
> >  #include <linux/module.h>
> >  #include <linux/mtd/mtd.h>
> > @@ -112,8 +114,6 @@ static int pasemi_nand_probe(struct platform_device=
 *ofdev)
> >         /* Allocate memory for MTD device structure and private data */
> >         chip =3D kzalloc(sizeof(struct nand_chip), GFP_KERNEL);
> >         if (!chip) {
> > -               printk(KERN_WARNING
> > -                      "Unable to allocate PASEMI NAND MTD device struc=
ture\n");
> >                 err =3D -ENOMEM;
> >                 goto out;
> >         }
> > @@ -163,13 +163,12 @@ static int pasemi_nand_probe(struct platform_devi=
ce *ofdev)
> >         }
> >
> >         if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
> > -               printk(KERN_ERR "pasemi_nand: Unable to register MTD de=
vice\n");
> > +               pr_err("Unable to register MTD device\n");
>=20
> And why not to use dev_err(&ofdev->dev, =E2=80=A6); ?

Yep, I think it's better to use dev_err().

Best Regards,

Boris

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
