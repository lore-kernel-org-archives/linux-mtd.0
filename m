Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5o5M-0000Fk-El
 for linux-mtd@lists.infradead.org; Fri, 28 Sep 2018 08:25:18 +0000
Date: Fri, 28 Sep 2018 10:24:54 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Daniel Mack <daniel@zonque.org>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Boris Brezillon
 <boris.brezillon@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20180928102454.325644f3@xps13>
In-Reply-To: <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13>
 <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
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

Hi Daniel,

Daniel Mack <daniel@zonque.org> wrote on Fri, 28 Sep 2018 09:43:18
+0200:

> Hi Chris,
>=20
> On 27/9/2018 11:55 PM, Chris Packham wrote:
> > On 27/09/18 20:56, Boris Brezillon wrote: =20
> >> On Thu, 27 Sep 2018 10:11:45 +0200
> >> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> >> =20
> >>> Hi Daniel,
> >>>
> >>> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51
> >>> +0200:
> >>> =20
> >>>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR re=
gister
> >>>> will only cause the IRQ to latch when the RDY lanes are changing, an=
d not
> >>>> in case they are already asserted.
> >>>>
> >>>> This means that if the controller finished the command in flight bef=
ore
> >>>> marvell_nfc_wait_op() is called, that function will wait for a chang=
e in
> >>>> the bit that can't ever happen as it is already set.
> >>>>
> >>>> To address this race, check for the RDY bits after the IRQ was enabl=
ed,
> >>>> and complete the completion immediately if the condition is already =
met.
> >>>>
> >>>> This fixes a bug that was observed with a NAND chip that holds a UBI=
FS
> >>>> parition on which file system stress tests were executed. When
> >>>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually mo=
unt
> >>>> the filesystem read-only, reporting lots of warnings along the way.
> >>>>
> >>>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller =
driver
> >>>> Cc: stable@vger.kernel.org
> >>>> Signed-off-by: Daniel Mack <daniel@zonque.org>
> >>>> --- =20
> >>>
> >>> Sorry I haven't had the time to check on my Armada, but you figured it
> >>> out, and the fix looks good to me!
> >>>
> >>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> >>>
> >>> Boris, do you plan to send another fixes PR of can I take it into
> >>> the nand/next branch? =20
> >>
> >> Queued to mtd/master.
> > > After fixing my R/B configuration I get a new error with this patch w=
hen =20
> > running stress_1 from mtd-utils-2.0.0. I don't see this without the pat=
ch. =20
>=20
> That's strange. So your controller sets the RDY bits before it is ready? =
Could
> you check whether only checking for NDSR_RDY(0) changes anything? Not sure
> about the handling of NDSR_RDY(1) in this driver anyway ...
>=20

I suppose you mean this portion of code is not clear enough?


        u32 st =3D readl_relaxed(nfc->regs + NDSR);
        u32 ien =3D (~readl_relaxed(nfc->regs + NDCR)) & NDCR_ALL_INT;

        /*
         * RDY interrupt mask is one bit in NDCR while there are two status
         * bit in NDSR (RDY[cs0/cs2] and RDY[cs1/cs3]).
         */
        if (st & NDSR_RDY(1))
                st |=3D NDSR_RDY(0);

        if (!(st & ien))
                return IRQ_NONE;


-> st is the status in the NDSR register which has two RDY bits, one
   for each RDY line.
-> ien is a view of the NDCR register which commands the interrupts
   and has one bit to enable both interrupt lines (let's call it
   NDCR_RDYM).

The trick is that NDSR_RDY(0) is the same bit as NDCR_RDYM.
So whenever NDSR_RDY(1) is set, we fake NDSR_RDY(0) to be set (by
setting manually the bit in 'st') so that the (st & ien) comparison
can be true if NDSR_RDY(1) is valid and RDY interrupts are enabled.

With this in mind, I don't see why this

+	st =3D readl_relaxed(nfc->regs + NDSR);
+	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
+		complete(&nfc->complete);

would break the driver.

Thanks,
Miqu=C3=A8l
