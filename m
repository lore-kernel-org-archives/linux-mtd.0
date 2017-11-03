Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eAcIk-0008J2-UR
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 13:46:29 +0000
Date: Fri, 3 Nov 2017 14:46:02 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: Re: [RFC 03/12] mtd: nand: use a static data_interface in the
 nand_chip structure
Message-ID: <20171103144602.53f0bcbc@xps13>
In-Reply-To: <20171018190255.3b223d7e@bbrezillon>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-4-miquel.raynal@free-electrons.com>
 <20171018190255.3b223d7e@bbrezillon>
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

> > Change the data_interface field from the nand_chip structure,
> > convert the pointer to a static structure. =20
>=20
> You mean "embed a nand_data_interface object". Not sure the static
> specifier can be used to describe what you do.

Ok.

> > Also remove the nand_get_default_data_interface() function that
> > become useless and rename the onfi_init_data_interface() by
> > nand_fill_data_interface(), =20
>=20
> I know I'm the one who suggested to rename this function, but I'm not
> so sure it's a good idea in the end, and I don't like the new
> prototype where you drop the iface_type parameter.

No problem, I will just rename it "onfi_fill_data_interface" because
there is no more real "initialization", it is just a dumb function
that fills the structure with the appropriate timings (I found the
name too close to "nand_init_data_interface" that really does
something). But ok, let's keep the iface_type parameter.

>=20
> > which is a more appropriate name because
> > applied timings are ONFI, no matter if the NAND actually is one. =20
>=20
> Well, this is actually a good reason to keep the onfi_ prefix. A NAND
> driver can decide that its NAND is close to an existing timing mode
> and re-use this onfi_init_data_interface(), but maybe someday we'll
> have drivers filling the nand_data_interface object with their own
> (non-ONFI) timings.
>=20
> >=20
> > This is needed before passing to ->exec_op() to avoid any race
> > that =20
>=20
> It's not really a race, it's just that you need some timings during
> NAND detection, and the core is currently creating the
> nand_data_interface object after the detection step (in
> nand_scan_tail()).

I changed the commit message.


> > @@ -1107,7 +1107,6 @@ static int nand_wait(struct mtd_info *mtd,
> > struct nand_chip *chip) static int nand_reset_data_interface(struct
> > nand_chip *chip, int chipnr) {
> >  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> > -	const struct nand_data_interface *conf;
> >  	int ret;
> > =20
> >  	if (!chip->setup_data_interface)
> > @@ -1127,8 +1126,8 @@ static int nand_reset_data_interface(struct
> > nand_chip *chip, int chipnr)
> >  	 * timings to timing mode 0.
> >  	 */
> > =20
> > -	conf =3D nand_get_default_data_interface();
> > -	ret =3D chip->setup_data_interface(mtd, chipnr, conf);
> > +	nand_fill_data_interface(chip, 0);
> > +	ret =3D chip->setup_data_interface(mtd, chipnr,
> > &chip->data_interface); if (ret)
> >  		pr_err("Failed to configure data interface to SDR
> > timing mode 0\n");=20
>=20
> So now you're stuck in timing mode 0 as soon as you have nand_reset()
> called.
>=20
> Actually, what we should do is:
>=20
> 1/ at the beginning of nand_scan_ident(), call
>    onfi_init_data_interface(chip, &chip->data_interface,
> NAND_SDR_IFACE, 0) (or a wrapper that does that) so that
> data_interface is initialized with the appropriate timings for
> reset/detection operations 2/ after detection, find the best iface
> type and timing mode we can use (what's currently done in
> nand_init_data_interface()) 3/ in nand_reset(), you should save
> what's in chip->data_interface, in a local variable, then apply
> SDR+timing-mode-0 and finally restore the previous settings (the one
> you stored in your local variable) after the RESET op.
>=20
> This way you're guaranteed to always end up with the best data iface
> settings after a RESET.

Clear explanation, this is corrected.

Thank you,
Miqu=C3=A8l
