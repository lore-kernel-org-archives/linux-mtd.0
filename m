Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eBiv9-0000od-F0
 for linux-mtd@lists.infradead.org; Mon, 06 Nov 2017 15:02:41 +0000
Date: Mon, 6 Nov 2017 16:02:05 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, David Woodhouse <dwmw2@infradead.org>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: Re: [RFC 02/12] mtd: nand: force drivers to explicitly send
 READ/PROG commands
Message-ID: <20171106160206.4bb70e45@xps13>
In-Reply-To: <af6a28eeafc9379c3f4e8bb03ff60fc7@agner.ch>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-3-miquel.raynal@free-electrons.com>
 <af6a28eeafc9379c3f4e8bb03ff60fc7@agner.ch>
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

Hi Stefan,

> Thanks for the work on this, happy to see the new interface is moving
> forward. Some comments below.

Thank you!

> > diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > index c8ceaecd8065..3f2b903158c1 100644
> > --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> > @@ -1043,6 +1043,8 @@ static int gpmi_ecc_read_page(struct mtd_info
> > *mtd, struct nand_chip *chip,
> >  	unsigned int  max_bitflips =3D 0;
> >  	int           ret;
> > =20
> > +	nand_read_page_op(chip, page, 0, NULL, 0);
> > +
> >  	dev_dbg(this->dev, "page number is : %d\n", page);
> >  	ret =3D read_page_prepare(this, buf, nfc_geo->payload_size,
> >  					this->payload_virt,
> > this->payload_phys, @@ -1220,12 +1222,13 @@ static int
> > gpmi_ecc_read_subpage(struct mtd_info *mtd, struct nand_chip *chip,
> >  	meta =3D geo->metadata_size;
> >  	if (first) {
> >  		col =3D meta + (size + ecc_parity_size) * first;
> > -		chip->cmdfunc(mtd, NAND_CMD_RNDOUT, col, -1); =20
>=20
> Shouldn't we add nand_change_read_column_op here?

The change column operation is done right after with
"nand_read_page_op()" that also set the page. I am pretty sure this
overall operation could be handled in a cleaner way though.

Could you test this driver with ->exec_op() implementation? If you do I
am interested to know if all goes well or not.

>=20
>=20
> > =20
> >  		meta =3D 0;
> >  		buf =3D buf + first * size;
> >  	}
> > =20
> > +	nand_read_page_op(chip, page, col, NULL, 0);
> > +
> >  	/* Save the old environment */
> >  	r1_old =3D r1_new =3D readl(bch_regs + HW_BCH_FLASH0LAYOUT0);
> >  	r2_old =3D r2_new =3D readl(bch_regs + HW_BCH_FLASH0LAYOUT1);

[...]

>=20
> > diff --git a/drivers/mtd/nand/vf610_nfc.c
> > b/drivers/mtd/nand/vf610_nfc.c index 8037d4b48a05..80d31a58e558
> > 100644 --- a/drivers/mtd/nand/vf610_nfc.c
> > +++ b/drivers/mtd/nand/vf610_nfc.c
> > @@ -560,7 +560,7 @@ static int vf610_nfc_read_page(struct mtd_info
> > *mtd, struct nand_chip *chip,
> >  	int eccsize =3D chip->ecc.size;
> >  	int stat;
> > =20
> > -	vf610_nfc_read_buf(mtd, buf, eccsize);
> > +	nand_read_page_op(chip, page, 0, buf, eccsize);
> >  	if (oob_required)
> >  		vf610_nfc_read_buf(mtd, chip->oob_poi,
> > mtd->oobsize);=20
> > @@ -580,7 +580,7 @@ static int vf610_nfc_write_page(struct mtd_info
> > *mtd, struct nand_chip *chip,
> >  {
> >  	struct vf610_nfc *nfc =3D mtd_to_nfc(mtd);
> > =20
> > -	vf610_nfc_write_buf(mtd, buf, mtd->writesize); =20
>=20
> We currently ignore NAND_CMD_SEQIN in ->cmdfunc anyway, so I think
> this change would not even be necessary here.
>=20

Boris already answered this one, I will let it as is to remain
consistent but thanks for the remark.

>=20
> This is a NAND controller which will benefit from the new interface. I
> plan to convert the driver to the new interface, maybe I manage to do
> that soon so we have a second driver making use of the new interface.

That would be great! I am writing the kernel-doc aside, I hope it will
be ready soon, but in any case do not hesitate if you need help.

Thank you,
Miqu=C3=A8l
