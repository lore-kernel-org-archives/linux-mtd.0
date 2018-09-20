Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g303E-0003is-Md
 for linux-mtd@lists.infradead.org; Thu, 20 Sep 2018 14:35:30 +0000
Date: Thu, 20 Sep 2018 16:35:06 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Set SPI_NOR_4B_OPCODES on all >16MB
 Spansion NORs
Message-ID: <20180920163506.6d8eba6c@bbrezillon>
In-Reply-To: <1485e647-e662-53ca-22c0-e63a185ccd41@wedev4u.fr>
References: <20180920141425.31737-1-boris.brezillon@bootlin.com>
 <1485e647-e662-53ca-22c0-e63a185ccd41@wedev4u.fr>
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

Hi Cyrille,

On Thu, 20 Sep 2018 16:28:43 +0200
Cyrille Pitchen <cyrille.pitchen@wedev4u.fr> wrote:

> Hi Boris,
>=20
> Le 20/09/2018 =C3=A0 16:14, Boris Brezillon a =C3=A9crit=C2=A0:
> > The code was treating >16MB Spansion NORs as a special case, while they
> > could just be flagged with SPI_NOR_4B_OPCODES and be treated as other
> > NORs.
> >=20
> > This change simplifies the code and makes it explicit that those parts
> > are supporting 4B addressing.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---
> > I've checked the datasheet of s25fl512s and s70fl01gs, and they indeed
> > support 4B opcodes. Other Spansion NORs might also support 4B opcodes,
> > but those that are not already have SPI_NOR_4B_OPCODES set are anyway
> > <16MB in size.
> >=20
> > Also, I kept NOR definitions on a single line, since those were already
> > over 80chars. Marek, let me know if you want me to change that for the
> > GigaDevice formatting:
> >=20
> >         {
> >                 "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
> >                         SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ=
 |
> >                         SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> >         },
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 9 +++------
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-no=
r.c
> > index 7993dd5c0c21..391e888758c1 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1416,8 +1416,8 @@ static const struct flash_info spi_nor_ids[] =3D {
> >  	{ "s25sl064p",  INFO(0x010216, 0x4d00,  64 * 1024, 128, SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ) },
> >  	{ "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128, USE_CLSR) },
> >  	{ "s25fl256s1", INFO(0x010219, 0x4d01,  64 * 1024, 512, SPI_NOR_DUAL_=
READ | SPI_NOR_QUAD_READ | USE_CLSR) }, =20
>=20
> You need to add the SPI_NOR_4B_OPCODES to all Spansion/Cypress memory
> parts > 128Mbits, hence also to 256Mbits memory parts ;)

Crap! I missed those ones. Will fix it in a v2.

Thanks,

Boris
