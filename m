Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffvN3-0008Qs-93
 for linux-mtd@lists.infradead.org; Wed, 18 Jul 2018 22:56:36 +0000
Date: Thu, 19 Jul 2018 00:56:20 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: add hooks that may be called
 during nand_scan()
Message-ID: <20180719005620.68b4c23b@xps13>
In-Reply-To: <20180719004636.4a85644a@bbrezillon>
References: <20180718215056.1242-1-miquel.raynal@bootlin.com>
 <20180718215056.1242-3-miquel.raynal@bootlin.com>
 <20180719004225.438ea90f@bbrezillon>
 <20180719004636.4a85644a@bbrezillon>
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

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Thu, 19 Jul 2018
00:46:36 +0200:

> On Thu, 19 Jul 2018 00:42:25 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:
>=20
> > On Wed, 18 Jul 2018 23:50:56 +0200
> > Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >  =20
> > > In order to remove the limitation that forbids dynamic allocation in
> > > nand_scan_ident(), we must create a path that will be the same for all
> > > controller drivers. The idea is to use nand_scan() instead of the wid=
ely
> > > used nand_scan_ident()/nand_scan_tail() couple. In order to achieve
> > > this, controller drivers will need to adjust some parameters between
> > > these two functions depending on the NAND chip wired on them.
> > >=20
> > > For that, a hook called ->attach_chip() is created as part of the
> > > nand_controller_ops structure, itself embedded in the nand_controller
> > > structure. The later may be referenced by two ways:
> > > 1/ if the driver does not implement its own controller, the
> > >    chip->controller hook is not populated before nand_scan() so it
> > >    cannot be dereferenced: use chip->dummy_controller instead (which =
is
> > >    statically allocated and will be referenced later by chip->control=
ler
> > >    anyway).
> > > 2/ through chip->controller if the driver implements its own controll=
er.
> > >=20
> > > Another hook, ->detach_chip() is also introduced in order to clean the
> > > controller driver's potential allocations in case of failure of
> > > nand_scan_tail(). There is no need for the controller driver to call =
the   =20
> > > ->detach_chip() hook directly upon error after a successful nand_scan=
().     =20
> > > In this situation, calling nand_release() as before is enough.
> > >=20
> > > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > > Acked-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  drivers/mtd/nand/raw/nand_base.c | 32 ++++++++++++++++++++++++++++++=
--
> > >  include/linux/mtd/rawnand.h      | 16 ++++++++++++++++
> > >  2 files changed, 46 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/=
nand_base.c
> > > index 0aef0299f4f2..a64a344bf7a9 100644
> > > --- a/drivers/mtd/nand/raw/nand_base.c
> > > +++ b/drivers/mtd/nand/raw/nand_base.c
> > > @@ -6697,6 +6697,20 @@ EXPORT_SYMBOL(nand_scan_tail);
> > >  	is_module_text_address((unsigned long)__builtin_return_address(0))
> > >  #endif
> > > =20
> > > +static int nand_attach(struct nand_chip *chip)
> > > +{
> > > +	if (chip->controller->ops && chip->controller->ops->attach_chip)
> > > +		return chip->controller->ops->attach_chip(chip);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void nand_detach(struct nand_chip *chip)
> > > +{
> > > +	if (chip->controller->ops && chip->controller->ops->detach_chip)
> > > +		chip->controller->ops->detach_chip(chip);
> > > +}
> > > +
> > >  /**
> > >   * nand_scan_with_ids - [NAND Interface] Scan for the NAND device
> > >   * @mtd: MTD device structure
> > > @@ -6710,11 +6724,21 @@ EXPORT_SYMBOL(nand_scan_tail);
> > >  int nand_scan_with_ids(struct mtd_info *mtd, int maxchips,
> > >  		       struct nand_flash_dev *ids)
> > >  {
> > > +	struct nand_chip *chip =3D mtd_to_nand(mtd);
> > >  	int ret;
> > > =20
> > >  	ret =3D nand_scan_ident(mtd, maxchips, ids);
> > > -	if (!ret)
> > > -		ret =3D nand_scan_tail(mtd);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D nand_attach(chip);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret =3D nand_scan_tail(mtd);
> > > +	if (ret)
> > > +		nand_detach(chip);
> > > +
> > >  	return ret;
> > >  }
> > >  EXPORT_SYMBOL(nand_scan_with_ids);
> > > @@ -6742,7 +6766,11 @@ void nand_cleanup(struct nand_chip *chip)
> > > =20
> > >  	/* Free manufacturer priv data. */
> > >  	nand_manufacturer_cleanup(chip);
> > > +
> > > +	/* Free controller specific allocations after chip identification */
> > > +	nand_detach(chip);
> > >  }
> > > +
> > >  EXPORT_SYMBOL_GPL(nand_cleanup);
> > > =20
> > >  /**
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index eb5a053fd06b..d046b3a61205 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -509,6 +509,19 @@ struct nand_id {
> > >  	int len;
> > >  };
> > > =20
> > > +/**
> > > + * struct nand_controller_ops - Controller operations
> > > + *
> > > + * @attach_chip:	Callback that may be called between nand_detect() a=
nd
> > > + *			nand_scan_tail() during nand_scan() (optional).
> > > + * @detach_chip:	Callback that may be called if nand_scan_tail() fai=
ls
> > > + *			(optional).
> > > + */
> > > +struct nand_controller_ops {
> > > +	int (*attach_chip)(struct nand_chip *chip);
> > > +	void (*detach_chip)(struct nand_chip *chip);
> > > +};
> > > +
> > >  /**
> > >   * struct nand_controller - Control structure for hardware controller
> > >   *                          shared among independent devices
> > > @@ -517,11 +530,13 @@ struct nand_id {
> > >   * @wq:			wait queue to sleep on if a NAND operation is in
> > >   *			progress used instead of the per chip wait queue
> > >   *			when a hw controller is available.
> > > + * @ops:		NAND controller operations.
> > >   */
> > >  struct nand_controller {
> > >  	spinlock_t lock;
> > >  	struct nand_chip *active;
> > >  	wait_queue_head_t wq;
> > > +	const struct nand_controller_ops *ops;
> > >  };
> > > =20
> > >  static inline void nand_controller_init(struct nand_controller *nfc)
> > > @@ -529,6 +544,7 @@ static inline void nand_controller_init(struct na=
nd_controller *nfc)
> > >  	nfc->active =3D NULL;
> > >  	spin_lock_init(&nfc->lock);
> > >  	init_waitqueue_head(&nfc->wq);
> > > +	nfc->ops =3D NULL;   =20
> >=20
> > Hm, actually it does not work for all dummy controllers since this
> > function is called from nand_set_defaults() which is called from
> > nand_scan_ident(). That means the previous chip->dummy_controller.ops
> > assignment you might have done before calling nand_scan() is gone.
> >=20
> > Looks like we'll have to patch all drivers to call
> > nand_controller_init(&chip->dummy_controller), unless you see a better
> > option. =20
>=20
> Alternatively, we could assume that the nand_controller object is
> always zeroed at allocation time, and simply not assign nfc->ops from
> nand_controller_init() so that dummy controller drivers that need to
> pass non-NULL ops can do so before calling nand_scan().

Exactly what I just answered, then I'll just remove this line and we
should be good.

Thanks,
Miqu=C3=A8l
