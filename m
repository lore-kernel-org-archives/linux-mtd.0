Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7bev-0004Zl-6q
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 07:33:26 +0000
Date: Wed, 3 Oct 2018 09:33:02 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Daniel Mack <daniel@zonque.org>, Boris Brezillon
 <boris.brezillon@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20181003093302.4b810e64@xps13>
In-Reply-To: <da3e196e239545cfb533a84d9ad71656@svr-chch-ex1.atlnz.lc>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon>
 <20181002084601.2a118f10@xps13> <20181002092500.3dc2ac7a@xps13>
 <09d3f8ab-6c5e-56be-479f-6ca28dca5778@zonque.org>
 <da3e196e239545cfb533a84d9ad71656@svr-chch-ex1.atlnz.lc>
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

Hi Chris,

Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote on Tue, 2 Oct
2018 20:53:14 +0000:

> On 02/10/18 21:23, Daniel Mack wrote:
> > Hi Miquel,
> >=20
> > On 2/10/2018 9:25 AM, Miquel Raynal wrote: =20
> >> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 2 Oct 2018
> >> 08:46:01 +0200: =20
> >>> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 2 Oct 2018
> >>> 00:13:28 +0200: =20
> >  =20
> >>>> Also, it looks like complete() is not called until the RDDREQ, WRDREQ
> >>>> and WRCMDREQ are cleared in the interrupt handler [1], which is weir=
d.
> >>>> Miquel, do you happen to remember why you had to do that? =20
> >>>
> >>> The RDDREQ, WRDREQ and WRCMDREQ events might potentially happen while
> >>> the interrupts are enabled while we only wait for R/B signalling. This
> >>> check is to avoid calling complete() on these situations. =20
> >>
> >> Actually Boris is right on the fact that while the intention is good,
> >> the writing of [1] is not accurate. Daniel, could you please test if
> >> the following diff changes something with your setup, without your
> >> patch?
> >>
> >>
> >> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/ra=
w/marvell_nand.c
> >> index bc2ef5209783..c7573ccdbacd 100644
> >> --- a/drivers/mtd/nand/raw/marvell_nand.c
> >> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> >> @@ -686,7 +686,7 @@ static irqreturn_t marvell_nfc_isr(int irq, void *=
dev_id)
> >>   =20
> >>           marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);
> >>   =20
> >> -       if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))
> >> +       if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
> >>                   complete(&nfc->complete);
> >>   =20
> >>           return IRQ_HANDLED; =20
> >=20
> > Yes! That seems to work nicely as a replacement for my patch.
> >=20
> > Chris, how is that going on your board? =20
>=20
> Looks good to me. I've just re-run stress_{1,2,3} on the custom board=20
> and DB-88F6820-AMC.

Great! There is still something weird about the complete() though.

Daniel, do you plan to send the above change or do you want me to do
it? I would like to integrate the fix in nand/next before sending the
PR.


Thanks,
Miqu=C3=A8l
