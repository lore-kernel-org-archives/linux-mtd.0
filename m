Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gg1VR-0001rt-Sx
 for linux-mtd@lists.infradead.org; Sun, 06 Jan 2019 06:01:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id t13so19251380pgr.11
 for <linux-mtd@lists.infradead.org>; Sat, 05 Jan 2019 22:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20181221115831.9595-1-emil.lenngren@gmail.com>
 <20190105145845.7a28d8f8@bbrezillon>
In-Reply-To: <20190105145845.7a28d8f8@bbrezillon>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Sat, 5 Jan 2019 22:01:44 -0800
Message-ID: <CAO1O6se_1oPv6SogDkkMaF1K9N7XxtTzeHAruibB8fph+mam=A@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Wait after erase in spinand_markbad
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
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

Den l=C3=B6r 5 jan. 2019 kl 05:59 skrev Boris Brezillon <bbrezillon@kernel.=
org>:
>
> On Fri, 21 Dec 2018 12:58:14 +0100
> Emil Lenngren <emil.lenngren@gmail.com> wrote:
>
> > SPI NAND flashes don't accept new commands while an erase is ongoing.
> > Make sure to wait until the device is ready before writing the marker.
> >
> > Just as with the erase op, no error check is performed since we want
> > to continue writing the marker even if the erase fails.
> >
> > Signed-off-by: Emil Lenngren <emil.lenngren@gmail.com>
> > ---
> >  drivers/mtd/nand/spi/core.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > index 479c2f2cf1..c2724d34e6 100644
> > --- a/drivers/mtd/nand/spi/core.c
> > +++ b/drivers/mtd/nand/spi/core.c
> > @@ -685,6 +685,8 @@ static int spinand_markbad(struct nand_device *nand=
, const struct nand_pos *pos)
> >
> >       spinand_erase_op(spinand, pos);
> >
> > +     spinand_wait(spinand, NULL);
> > +
>
> After thinking a bit more about it, I think we should simply write the
> BBM and skip the erase operation. Marking a block bad is just about
> writing 0 to the first 2 bytes of the OOB area, and we don't need the
> block to be erased to do that.
>

I compared with the raw and implementation in
nand_block_markbad_lowlevel, it also erases first, ignoring a
potential error.

On the other hand, a common spi flash chip MX35LF1GE4AB states in the
datasheet that it's not recommended to erase a bad block, but no
reason why. At the same time, it's generally disallowed to write the
same page twice...

But in the end I also think the best way is to avoid the erase
operation and simply write 0 0 as a raw write.

> >       memset(spinand->oobbuf, 0, 2);
> >       return spinand_write_page(spinand, &req);
> >  }
>

/Emil
