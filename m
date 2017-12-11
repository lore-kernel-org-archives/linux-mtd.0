Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOUWm-0005MC-5E
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 20:18:18 +0000
Date: Mon, 11 Dec 2017 21:17:50 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>
Subject: Re: [PATCH v2] mtd: nand: add ->exec_op() implementation
Message-ID: <20171211211750.0e74d951@xps13>
In-Reply-To: <20171208075450.GA4359@kwain>
References: <20171207145434.21586-1-miquel.raynal@free-electrons.com>
 <20171208075450.GA4359@kwain>
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

Hello Antoine,

On Fri, 8 Dec 2017 08:54:50 +0100
Antoine Tenart <antoine.tenart@free-electrons.com> wrote:

> Hi Miquel,
>=20
> Be careful when defining macros: avoid to name your arguments with a
> value used in the macro that is not meant to be replaced.

That is right, it could have failed the macro.

Thank you for the tip,
Miqu=C3=A8l

>=20
> On Thu, Dec 07, 2017 at 03:54:34PM +0100, Miquel Raynal wrote:
> > +
> > +#define NAND_OP_DATA_IN(l, buf,
> > ns)					\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_IN_INSTR,				\
> > +		.ctx.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.buf.in =3D
> > buf,					\ =20
>=20
> Here.
>=20
> > +			.force_8bit =3D
> > false,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > ns,						\
> > +	}
> > +
> > +#define NAND_OP_DATA_OUT(l, buf,
> > ns)					\
> > +
> > {								\
> > +		.type =3D
> > NAND_OP_DATA_OUT_INSTR,				\
> > +		.ctx.data =3D
> > {						\
> > +			.len =3D
> > l,					\
> > +			.buf.out =3D
> > buf,					\ =20
>=20
> And here.
>=20
> > +			.force_8bit =3D
> > false,				\
> > +		},
> > \
> > +		.delay_ns =3D
> > ns,						\
> > +	} =20
>=20
> It works in your series because these macros are always called with
> the second argument being a variable named 'buf', but that's not safe.
>=20
> Thanks!
> Antoine
>=20



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
