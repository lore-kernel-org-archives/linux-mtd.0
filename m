Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gK4Rw-0000B4-Pz
 for linux-mtd@lists.infradead.org; Tue, 06 Nov 2018 16:43:33 +0000
Date: Tue, 6 Nov 2018 17:43:10 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: nand: Fix nanddev_pos_next_page() kernel-doc header
Message-ID: <20181106174310.66d8b134@bbrezillon>
In-Reply-To: <20181106173713.38806c5e@bbrezillon>
References: <20181106162537.13882-1-boris.brezillon@bootlin.com>
 <20181106172946.10f9c3ca@xps13>
 <20181106173713.38806c5e@bbrezillon>
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

On Tue, 6 Nov 2018 17:37:13 +0100
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Tue, 6 Nov 2018 17:29:46 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue,  6 Nov 2018
> > 17:25:37 +0100:
> >  =20
> > > Function name is wrong in the kernel-doc header.
> > >  =20
>=20
> Oops, forgot to add
>=20
> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAN=
D devices")

Queued to the fixes branch after adding the Fixes tag.

>=20
> > > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > ---
> > >  include/linux/mtd/nand.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > > index 7ff3770e468b..12d75402472a 100644
> > > --- a/include/linux/mtd/nand.h
> > > +++ b/include/linux/mtd/nand.h
> > > @@ -583,7 +583,7 @@ static inline void nanddev_pos_next_eraseblock(st=
ruct nand_device *nand,
> > >  }
> > > =20
> > >  /**
> > > - * nanddev_pos_next_eraseblock() - Move a position to the next page
> > > + * nanddev_pos_next_page() - Move a position to the next page
> > >   * @nand: NAND device
> > >   * @pos: the position to update
> > >   *   =20
> >=20
> > Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >=20
> >=20
> > Thanks,
> > Miqu=C3=A8l =20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
