Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIuIz-0000Yi-W3
 for linux-mtd@lists.infradead.org; Thu, 08 Jun 2017 10:04:43 +0000
Date: Thu, 8 Jun 2017 12:04:09 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>, Enrico Jorns <ejo@pengutronix.de>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Jassi Brar
 <jaswinder.singh@linaro.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v5 07/23] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
Message-ID: <20170608120409.0fb16b9d@bbrezillon>
In-Reply-To: <CAK7LNAT3JkSccFO=fJm737wLGCOLZBu+0z8zxeB=VmhoggF-Cg@mail.gmail.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-8-git-send-email-yamada.masahiro@socionext.com>
 <20170607153318.7e341dff@bbrezillon>
 <CAK7LNAR55jsT4Ch-vwhvEMvSmEGJPBQQc6Tw2gkiTianer2zjQ@mail.gmail.com>
 <20170608090503.11969545@bbrezillon>
 <CAK7LNAT3JkSccFO=fJm737wLGCOLZBu+0z8zxeB=VmhoggF-Cg@mail.gmail.com>
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

On Thu, 8 Jun 2017 18:43:47 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Hi Boris,
>=20
>=20
> 2017-06-08 16:05 GMT+09:00 Boris Brezillon <boris.brezillon@free-electron=
s.com>:
> > Le Thu, 8 Jun 2017 15:11:03 +0900,
> > Masahiro Yamada <yamada.masahiro@socionext.com> a =C3=A9crit :
> > =20
> >> Hi Boris,
> >>
> >>
> >> 2017-06-07 22:33 GMT+09:00 Boris Brezillon <boris.brezillon@free-elect=
rons.com>: =20
> >> > On Wed,  7 Jun 2017 20:52:16 +0900
> >> > Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >> > =20
> >> >> Currently, the error handling of denali_write_page(_raw) is a bit
> >> >> complicated.  If the program command fails, NAND_STATUS_FAIL is set
> >> >> to the driver internal denali->status, then read out later by
> >> >> denali_waitfunc().
> >> >>
> >> >> We can avoid it by exploiting the nand_write_page() implementation.
> >> >> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
> >> >> errors out immediately.  This gives the same result as returning
> >> >> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
> >> >> returned to the upper MTD layer. =20
> >> >
> >> > Actually, this is how it's supposed to work now (when they set
> >> > the NAND_ECC_CUSTOM_PAGE_ACCESS flag, drivers are expected to wait f=
or
> >> > the program operation to finish and return -EIO if it failed), so yo=
u're
> >> > all good ;-).
> >> > =20
> >> >>
> >> >> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> >> ---
> >> >>
> >> >> Changes in v5: None
> >> >> Changes in v4: None
> >> >> Changes in v3: None
> >> >> Changes in v2:
> >> >>   - Newly added
> >> >>
> >> >>  drivers/mtd/nand/denali.c | 12 ++++--------
> >> >>  drivers/mtd/nand/denali.h |  1 -
> >> >>  2 files changed, 4 insertions(+), 9 deletions(-)
> >> >>
> >> >> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> >> >> index 1897fe238290..22acfc34b546 100644
> >> >> --- a/drivers/mtd/nand/denali.c
> >> >> +++ b/drivers/mtd/nand/denali.c
> >> >> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, s=
truct nand_chip *chip,
> >> >>       size_t size =3D mtd->writesize + mtd->oobsize;
> >> >>       uint32_t irq_status;
> >> >>       uint32_t irq_mask =3D INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL=
; =20
> >> >
> >> > As mentioned in my previous patch, I think you should wait for
> >> > INTR__PROGRAM_COMP | INTR__PROGRAM_FAIL here. =20
> >>
> >> No.
> >> It is intentional to use INTR__DMA_CMD_COMP
> >> instead of INTR__PROGRAM_COMP here.
> >>
> >>
> >> This is very strange of this IP,
> >> INTR__PROGRAM_COMP is never set when DMA mode is being used.
> >> (INTR__DMA_CMD_COMP is set instead.) =20
> >
> > Indeed, this is really strange. Are you sure the page is actually
> > programmed when you receive the INTR__DMA_CMD_COMP interrupt? =20
>=20
> Yes.
> After my test, I concluded INTR__DMA_CMD_COMP is asserted
> when page program is completed.
>=20
>=20
>=20
> Rationale:
>=20
> Denali User's Guide describes the IRQ bits as follows:
>=20
>=20
> Bit 2 (dma_cmd_comp)    A data DMA command has completed on this bank
>   ...
> Bit 7 (program_comp)    Device finished the last issued program command
>   ...
> Bit 12 (INT_act)        R/B pin of device transitioned from low to high
>   ...
> Bit 15 (page_xfer_inc)  For every page of data transfer to or from the de=
vice,
>                         this bit will be set.
>=20
>=20
>=20
> In my test,  ->write_page() hook triggers IRQ bits as follows:
>=20
>  - Write access with DMA
>       bit 15 is asserted first,
>       then some timer later  bit 12 and bit 2 are asserted at the same ti=
me
>=20
>  - Write access with PIO
>       bit 15 is asserted first,
>       then some time later   bit 12 and bit 7 are asserted at the same ti=
me
>=20
>=20
>=20
> NAND devices toggle R/B# pin when page program is completed.
> So, bit 2 (dma_cmd_comp) means the completion of page program.
>=20
>=20
> I assume your next question here.
> "So, why don't you wait for INTR__INT_ACT
> instead of INTR__DMA_CMD_COMP / INTR__PROGRAM_COMP?
> It should work regardless of transfer mode."
> This has a point.
> We can always check R/B# transition for read, write, erase, or whatever.
> This is just a matter of taste, but I am just keeping code that uses
> dedicated IRQ bits for each mode.

Actually, I agree with you: it's clearer to use the INTR__DMA_CMD_COMP /
INTR__PROGRAM_COMP events here :P.
