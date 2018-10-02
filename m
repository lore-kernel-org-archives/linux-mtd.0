Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7F3a-0001JG-Hg
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 07:25:24 +0000
Date: Tue, 2 Oct 2018 09:25:00 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>, Daniel Mack
 <daniel@zonque.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Message-ID: <20181002092500.3dc2ac7a@xps13>
In-Reply-To: <20181002084601.2a118f10@xps13>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon>
 <20181002084601.2a118f10@xps13>
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

Hi Daniel, Chris,

Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 2 Oct 2018
08:46:01 +0200:

> Hi Boris,
>=20
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 2 Oct 2018
> 00:13:28 +0200:
>=20
> > On Mon, 1 Oct 2018 22:01:27 +0000
> > Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:
> >  =20
> > > On 02/10/18 10:41, Boris Brezillon wrote:   =20
> > > > On Mon, 1 Oct 2018 22:34:38 +0200
> > > > Boris Brezillon <boris.brezillon@bootlin.com> wrote:
> > > >         =20
> > > >>>
> > > >>> I'd previously tried readl() based on the same hunch. No change.
> > > >>>
> > > >>> I think my snippet above might be misleading. While a delay betwe=
en
> > > >>> readl_relaxed() and the if should not change the outcome, this is=
 also a
> > > >>> delay between marvell_nfc_enable_int() and marvell_nfc_disable_in=
t()
> > > >>> which is probably more significant. Sure enough if I move the del=
ay to
> > > >>> just before the marvell_nfc_disable_int() the error is not seen. =
    =20
> > > >>
> > > >> AFAICT, your timeout always happens when waiting for RDREQ, not RD=
YM.
> > > >> So maybe disabling MRDY too early has a side-effect on the RDREQ e=
vent.     =20
> > > >=20
> > > > Can you try with this patch [1]? It should ensure that NDSR_RDY bits
> > > > are cleared before starting an operation.
> > > >=20
> > > > [1]http://code.bulix.org/lgs30c-468205
> > > >      =20
> > >=20
> > > No luck. I applied that on top of Daniel's and got the same result.
> > >=20
> > > One thing that does look promising is the following modification of=20
> > > Daniel's patch[1]. Which moves the RDY check to before where the=20
> > > interrupts are enabled.   =20
> >=20
> > Except we still don't know why this is happening, and I'm not sure I
> > want to take a fix without understanding why it does fix the problem.
> >=20
> > Also, it looks like complete() is not called until the RDDREQ, WRDREQ
> > and WRCMDREQ are cleared in the interrupt handler [1], which is weird.
> > Miquel, do you happen to remember why you had to do that? =20
>=20
> The RDDREQ, WRDREQ and WRCMDREQ events might potentially happen while
> the interrupts are enabled while we only wait for R/B signalling. This
> check is to avoid calling complete() on these situations.

Actually Boris is right on the fact that while the intention is good,
the writing of [1] is not accurate. Daniel, could you please test if
the following diff changes something with your setup, without your
patch?


diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/mar=
vell_nand.c
index bc2ef5209783..c7573ccdbacd 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -686,7 +686,7 @@ static irqreturn_t marvell_nfc_isr(int irq, void *dev_i=
d)
=20
        marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);
=20
-       if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))
+       if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
                complete(&nfc->complete);
=20
        return IRQ_HANDLED;

>=20
> >=20
> > [1]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/drivers/mtd/nand/raw/marvell_nand.c?h=3Dv4.19-rc6#n689 =20
>=20


Thanks,
Miqu=C3=A8l
