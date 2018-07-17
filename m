Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffOnp-0000A5-6y
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 12:10:03 +0000
Date: Tue, 17 Jul 2018 14:09:39 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 3/3] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180717140939.020794ac@xps13>
In-Reply-To: <20180717140332.7f47f9da@bbrezillon>
References: <20180717095454.27935-1-miquel.raynal@bootlin.com>
 <20180717095454.27935-4-miquel.raynal@bootlin.com>
 <20180717140332.7f47f9da@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 17 Jul 2018
14:03:32 +0200:

> On Tue, 17 Jul 2018 11:54:54 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > In order to remove the limitation that forbids dynamic allocation in
> > nand_scan_ident(), we must create a path that will be the same for all
> > controller drivers. The idea is to use nand_scan() instead of the widely
> > implemented nand_scan_ident()/nand_scan_tail() couple. In order to =20
>=20
>   ^ used
>=20
> > achieve this, controller drivers will need to adjust some parameters
> > between these two functions depending on the NAND chip wired on them.
> >=20
> > For that, a hook called ->attach_chip() is created in the
> > nand_controller structure. This structure may be referenced by two ways=
: =20
>=20
> This is no longer true. Now ->attach_chip() is part of
> nand_controller_ops, and nand_controller has a pointer to a
> nand_controller_ops implementation.

That's right.

>=20
> > 1/ if the driver does not implement its own controller, the
> >    chip->controller hook is not populated before nand_scan() so it
> >    cannot be dereferenced: use chip->hwcontrol instead (which is
> >    statically allocated and will be referenced later by chip->controller
> >    anyway). =20
>=20
> Not related to this patch, but I'd rename chip->hwcontrol into
> chip->dummycontroller or something that clearly shows that this field
> should only be used when the controller driver is dumb and can only
> control a single chip.

I like this idea but was not sure of a good name for it. If you are
okay I'll do the change in the same patch renaming nand_hw_control ->
nand_controller and nand_hw_control_init -> nand_controller_init. I
think it's related enough.

>=20
> > 2/ through chip->controller if the driver implements its own controller.
> >=20
> > Another hook, ->detach_chip() is also introduced in order to clean the
> > controller driver's potential allocations in case of failure of
> > nand_scan_tail(). There is no need for the controller driver to call th=
e =20
> > ->detach_chip() hook directly upon error after a successful nand_scan()=
.   =20
> > In this situation, calling nand_release() as before is enough.
> >=20
> > Both ->attac/detach_chip() hooks are located in a nand_controller_ops
> > structure.
> >=20
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com> =20
>=20
> The implementation looks good (one minor comment below, but you can
> ignore it if you disagree), so once you've fixed the commit message you
> can add
>=20
> Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
>=20
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 21 +++++++++++++++++++--
> >  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/na=
nd_base.c
> > index e21f03ee3251..5e8278281ba8 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -6710,11 +6710,23 @@ EXPORT_SYMBOL(nand_scan_tail);
> >  int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
> >  		       struct nand_flash_dev *ids)
> >  {
> > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> >  	int ret;
> > =20
> >  	ret =3D nand_scan_ident(mtd, maxchips, ids);
> > -	if (!ret)
> > -		ret =3D nand_scan_tail(mtd);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (chip->controller->ops && chip->controller->ops->attach_chip) {
> > +		ret =3D chip->controller->ops->attach_chip(chip);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	ret =3D nand_scan_tail(mtd);
> > +	if (ret && chip->controller->ops && chip->controller->ops->detach_chi=
p)
> > +		chip->controller->ops->detach_chip(chip); =20
>=20
> I'd recommend creating wrappers for detach/attach operations, just in case
> you need to automate more things in there:
>=20
> static int nand_attach(struct nand_chip *chip)
> {
> 	if (chip->controller->ops && chip->controller->ops->attach_chip)
> 		return chip->controller->ops->attach_chip(chip);
>=20
> 	return 0;
> }
>=20
> static void nand_detach(struct nand_chip *chip)
> {
> 	if (chip->controller->ops && chip->controller->ops->detach_chip)
> 		chip->controller->ops->detach_chip(chip);
> }

Even better. I'll add it.

Thanks,
Miqu=C3=A8l
