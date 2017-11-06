Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eBhnA-0002is-52
 for linux-mtd@lists.infradead.org; Mon, 06 Nov 2017 13:50:22 +0000
Date: Mon, 6 Nov 2017 14:49:44 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Gregory Clement
 <gregory.clement@free-electrons.com>, linux-mtd@lists.infradead.org, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>,
 Hanna Hawa <hannah@marvell.com>
Subject: Re: [RFC 06/12] mtd: nand: add reworked Marvell NAND controller driver
Message-ID: <20171106144944.26e3c0b1@xps13>
In-Reply-To: <20171019091810.13f54c78@bbrezillon>
References: <20171018143629.29302-1-miquel.raynal@free-electrons.com>
 <20171018143629.29302-7-miquel.raynal@free-electrons.com>
 <20171019091810.13f54c78@bbrezillon>
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

> > +enum marvell_nfc_variant {
> > +	MARVELL_NFC_VARIANT_PXA3XX,
> > +	MARVELL_NFC_VARIANT_ARMADA370,
> > +	MARVELL_NFC_VARIANT_ARMADA_8K,
> > +};
> > +
> > +/*
> > + * NAND controller capabilities for distinction between compatible
> > strings
> > + *
> > + * @variant:		Board type
> > + * @max_cs_nb:		Number of Chip Select lines available
> > + * @max_rb_nb:		Number of Ready/Busy lines available
> > + * @legacy_of_bindings	Indicates if DT parsing must be done
> > using the old
> > + *			fashion way
> > + */
> > +struct marvell_nfc_caps {
> > +	enum marvell_nfc_variant variant; =20
>=20
> Do you really need this variant field. It seems you're only using it
> to detect if you should MUX the NAND pins using the Special Function
> registers on armada8k. Maybe you should just have:
>=20
> 	bool need_system_controller;
>=20
> and set it to true for the "armada8k" compatible.

Ok. After Rob's review I also added a "bool need_arbiter" to avoid
using any "variant =3D=3D PXA_VARIANT" in the code.

>=20
> > +	unsigned int max_cs_nb;
> > +	unsigned int max_rb_nb;
> > +	bool legacy_of_bindings;
> > +};
> > + =20

Thanks,
Miqu=C3=A8l
