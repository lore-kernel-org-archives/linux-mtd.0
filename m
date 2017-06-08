Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIrVf-0000Hz-3T
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 07:05:37 +0000
Date: Thu, 8 Jun 2017 09:05:03 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Richard Weinberger
 <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Chuanxiao Dong <chuanxiao.dong@intel.com>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>, Dinh Nguyen
 <dinguyen@kernel.org>, linux-mtd@lists.infradead.org, Masami Hiramatsu
 <mhiramat@kernel.org>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, Brian Norris
 <computersforpeace@gmail.com>, Enrico Jorns <ejo@pengutronix.de>
Subject: Re: [PATCH v5 07/23] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
Message-ID: <20170608090503.11969545@bbrezillon>
In-Reply-To: <CAK7LNAR55jsT4Ch-vwhvEMvSmEGJPBQQc6Tw2gkiTianer2zjQ@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
 <20170607153318.7e341dff@bbrezillon>
 <CAK7LNAR55jsT4Ch-vwhvEMvSmEGJPBQQc6Tw2gkiTianer2zjQ@mail.gmail.com>
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

Le Thu, 8 Jun 2017 15:11:03 +0900,
Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :

> Hi Boris,
>=20
>=20
> 2017-06-07 22:33 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
> > On Wed,  7 Jun 2017 20:52:16 +0900
> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> > =20
> >> Currently, the error handling of denali_write_page(_raw) is a bit
> >> complicated.  If the program command fails, NAND_STATUS_FAIL is set
> >> to the driver internal denali->status, then read out later by
> >> denali_waitfunc().
> >>
> >> We can avoid it by exploiting the nand_write_page() implementation.
> >> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
> >> errors out immediately.  This gives the same result as returning
> >> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
> >> returned to the upper MTD layer. =20
> >
> > Actually, this is how it's supposed to work now (when they set
> > the NAND_ECC_CUSTOM_PAGE_ACCESS flag, drivers are expected to wait for
> > the program operation to finish and return -EIO if it failed), so you're
> > all good ;-).
> > =20
> >>
> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> ---
> >>
> >> Changes in v5: None
> >> Changes in v4: None
> >> Changes in v3: None
> >> Changes in v2:
> >>   - Newly added
> >>
> >>  drivers/mtd/nand/denali.c | 12 ++++--------
> >>  drivers/mtd/nand/denali.h |  1 -
> >>  2 files changed, 4 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> >> index 1897fe238290..22acfc34b546 100644
> >> --- a/drivers/mtd/nand/denali.c
> >> +++ b/drivers/mtd/nand/denali.c
> >> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, stru=
ct nand_chip *chip,
> >>       size_t size =3D mtd->writesize + mtd->oobsize;
> >>       uint32_t irq_status;
> >>       uint32_t irq_mask =3D INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL; =
=20
> >
> > As mentioned in my previous patch, I think you should wait for
> > INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL here. =20
>=20
> No.
> It is intentional to use INTR__DMA_CMD_COMP
> instead of INTR__PROGRAM_COMP here.
>=20
>=20
> This is very strange of this IP,
> INTR__PROGRAM_COMP is never set when DMA mode is being used.
> (INTR__DMA_CMD_COMP is set instead.)

Indeed, this is really strange. Are you sure the page is actually
programmed when you receive the INTR__DMA_CMD_COMP interrupt?
Because INTR__DMA_CMD_COMP is likely to happen before the PAGEPROG
command has finished, which is not good (the core might start a new
operation while the NAND is still busy).

Anyway, if INTR__DMA_CMD_COMP is what should be set, it clearly
deserves a comment.

>=20
>=20
> As far as I tested this IP,
> INTR__PROGRAM_COMP is set only when data are written by PIO mode.

It doesn't make much sense (not saying you're wrong, just that the IP
is weird). PROG completed should be independent of the data transfer
step. Sure it happens after transferring data to the NAND, but then you
still have to execute the PAGEPROG command and wait until the NAND
becomes ready again. That's when I'd expect PROGRAM_COMP (or
PROGRAM_FAIL) to be triggered.

>=20
>=20
> I introduced PIO transfer in
> http://patchwork.ozlabs.org/patch/772398/
>=20
> I used INTR__PROGRAM_COMP in denali_pio_write().
>=20

Yep, I see that.

>=20
>=20
> >> +     int ret =3D 0;
> >>
> >>       denali->page =3D page;
> >>
> >> @@ -1038,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, st=
ruct nand_chip *chip,
> >>       if (irq_status =3D=3D 0) {
> >>               dev_err(denali->dev, "timeout on write_page (type =3D %d=
)\n",
> >>                       raw_xfer);
> >> -             denali->status =3D NAND_STATUS_FAIL;
> >> +             ret =3D -EIO;
> >>       } =20
> >
> >         if (irq_status & INTR__PROGRAM_FAIL) {
> >                 dev_err(denali->dev, "page program failed (type =3D %d)=
\n",
> >                         raw_xfer);
> >                 ret =3D -EIO;
> >         } =20
>=20
> This will be fixed anyway by
> http://patchwork.ozlabs.org/patch/772414/

Note that PROG_FAILED is quite different from a timeout (usually
happens when a block becomes bad), so it probably deserve a specific
error message.

>=20
>=20
> I do not want to include unrelated change.
>=20
>=20

Okay.
