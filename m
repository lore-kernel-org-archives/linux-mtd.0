Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYAOW-0008Gp-G8
 for linux-mtd@lists.infradead.org; Sat, 15 Dec 2018 13:54:18 +0000
Date: Sat, 15 Dec 2018 14:54:03 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Nadav Haklai
 <nadavh@marvell.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: marvell: prevent timeouts on a loaded
 machine
Message-ID: <20181215145403.5d4897a2@xps13>
In-Reply-To: <20181215134137.44a79f14@bbrezillon>
References: <20181211173828.6619-1-miquel.raynal@bootlin.com>
 <20181215134137.44a79f14@bbrezillon>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Sat, 15 Dec 2018
13:41:37 +0100:

> On Tue, 11 Dec 2018 18:38:28 +0100
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>=20
> > marvell_nfc_wait_op() waits for completion during 'timeout_ms'
> > milliseconds before throwing an error. While the logic is fine, the
> > value of 'timeout_ms' is given by the core and actually correspond to
> > the maximum time the NAND chip will take to complete the
> > operation. Assuming there is no overhead in the propagation of the
> > interrupt signal to the the NAND controller (through the Ready/Busy
> > line), this delay does not take into account the latency of the
> > operating system. For instance, for a page write, the delay given by
> > the core is rounded up to 1ms. Hence, when the machine is over loaded,
> > there is chances that this timeout will be reached.
> >=20
> > There are two ways to solve this issue that are not incompatible:
> > 1/ Enlarge the timeout value (if so, how much?).
> > 2/ Check after the waiting method if we did not miss any interrupt
> > because of the OS latency (an interrupt is still pending). In this
> > case, we assume the operation exited successfully.
> >=20
> > We choose the second approach that is a must in all cases, with the
> > possibility to also modify the timeout value to be, e.g. at least 1
> > second in all cases.
> >=20
> > Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller d=
river")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > ---
> >  drivers/mtd/nand/raw/marvell_nand.c | 17 ++++++++++++++---
> >  1 file changed, 14 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw=
/marvell_nand.c
> > index e6c3739cea73..bc0eef4ade4f 100644
> > --- a/drivers/mtd/nand/raw/marvell_nand.c
> > +++ b/drivers/mtd/nand/raw/marvell_nand.c
> > @@ -514,9 +514,14 @@ static void marvell_nfc_enable_int(struct marvell_=
nfc *nfc, u32 int_mask)
> >  	writel_relaxed(reg & ~int_mask, nfc->regs + NDCR);
> >  }
> > =20
> > -static void marvell_nfc_clear_int(struct marvell_nfc *nfc, u32 int_mas=
k)
> > +static int marvell_nfc_clear_int(struct marvell_nfc *nfc, u32 int_mask=
) =20
>=20
> 	  ^ u32 ?
>=20
> With this fixed:
>=20
> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>

Applied with your change to nand/next.

Thanks,
Miqu=C3=A8l
