Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gg3WR-0006WN-55
 for linux-mtd@lists.infradead.org; Sun, 06 Jan 2019 08:11:04 +0000
Date: Sun, 6 Jan 2019 09:10:49 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Emil Lenngren <emil.lenngren@gmail.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
Message-ID: <20190106091049.01e2e3d9@bbrezillon>
In-Reply-To: <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
 <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
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

On Sat, 5 Jan 2019 22:01:44 -0800
Emil Lenngren <emil.lenngren@gmail.com> wrote:

> Hi,
>=20
> Den l=C3=B6r 5 jan. 2019 kl 05:59 skrev Boris Brezillon <bbrezillon@kerne=
l.org>:
> >
> > On Fri, 21 Dec 2018 12:58:14 +0100
> > Emil Lenngren <emil.lenngren@gmail.com> wrote:
> > =20
> > > SPI NAND flashes don't accept new commands while an erase is ongoing.
> > > Make sure to wait until the device is ready before writing the marker.
> > >
> > > Just as with the erase op, no error check is performed since we want
> > > to continue writing the marker even if the erase fails.
> > >
> > > Signed-off-by: Emil Lenngren <emil.lenngren@gmail.com>
> > > ---
> > >  drivers/mtd/nand/spi/core.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > > index 479c2f2cf1..c2724d34e6 100644
> > > --- a/drivers/mtd/nand/spi/core.c
> > > +++ b/drivers/mtd/nand/spi/core.c
> > > @@ -685,6 +685,8 @@ static int spinand_markbad(struct nand_device *na=
nd, const struct nand_pos *pos)
> > >
> > >       spinand_erase_op(spinand, pos);
> > >
> > > +     spinand_wait(spinand, NULL);
> > > + =20
> >
> > After thinking a bit more about it, I think we should simply write the
> > BBM and skip the erase operation. Marking a block bad is just about
> > writing 0 to the first 2 bytes of the OOB area, and we don't need the
> > block to be erased to do that.
> > =20
>=20
> I compared with the raw and implementation in
> nand_block_markbad_lowlevel, it also erases first, ignoring a
> potential error.

Yes, and I think this implementation was inspired by the rawnand one,
but I'm not sure the rawnand implem is correct.

>=20
> On the other hand, a common spi flash chip MX35LF1GE4AB states in the
> datasheet that it's not recommended to erase a bad block, but no
> reason why.

Because the erase might succeed and reset the BBM to 0xff, thus marking
the block good even if it's unreliable.

> At the same time, it's generally disallowed to write the
> same page twice...

That's only if you care about the data you write to the page. Marking a
block bad is just about setting the BBM to 0x0, which should always work
even if the page you're writing to has already been written, simply
because a 1 -> 0 cell transition does not require an erase (only a 0 ->
1 transition does).

>=20
> But in the end I also think the best way is to avoid the erase
> operation and simply write 0 0 as a raw write.

I don't know why the erase op was added to
nand_block_markbad_lowlevel() in the first place but I don't want to
risk breaking platforms that might depend on this behavior. It's
different for SPI NAND: the subsystem has just been created and I think
we should get rid of this erase call until someone explicitly asks for
it with a good explanation on why this is needed.

>=20
> > >       memset(spinand->oobbuf, 0, 2);
> > >       return spinand_write_page(spinand, &req);
> > >  } =20
> > =20
>=20
> /Emil
