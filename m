Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ebB0R-0001uM-R2
 for linux-mtd@lists.infradead.org; Mon, 15 Jan 2018 20:05:21 +0000
Date: Mon, 15 Jan 2018 21:05:03 +0100
From: Miquel Raynal <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, David
 Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 "Cyrille Pitchen" <cyrille.pitchen@wedev4u.fr>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH 1/2] mtd: nand: Check ONFI timings have been acked by
 the chip
Message-ID: <20180115210503.21fc34df@xps13>
In-Reply-To: <20180115194108.318d57b8@bbrezillon>
References: <20171222172853.27710-1-miquel.raynal@free-electrons.com>
 <20171222172853.27710-2-miquel.raynal@free-electrons.com>
 <20180105161321.44218e4e@bbrezillon>
 <20180105164239.79d7980c@xps13>
 <20180108140429.79f67a83@bbrezillon>
 <20180115141900.39661c4e@bbrezillon>
 <VI1PR0401MB2221E2E684A28F8016C4D19197EB0@VI1PR0401MB2221.eurprd04.prod.outlook.com>
 <20180115194108.318d57b8@bbrezillon>
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

Hi Han,

On Mon, 15 Jan 2018 19:41:08 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> On Mon, 15 Jan 2018 17:57:08 +0000
> Han Xu <han.xu@nxp.com> wrote:
>=20
> > ________________________________________
> > From: Boris Brezillon <boris.brezillon@free-electrons.com>
> > Sent: Monday, January 15, 2018 7:19 AM
> > To: Han Xu
> > Cc: Miquel RAYNAL; Richard Weinberger; David Woodhouse; Brian
> > Norris; Marek Vasut; Cyrille Pitchen; linux-mtd@lists.infradead.org
> > Subject: Re: [PATCH 1/2] mtd: nand: Check ONFI timings have been
> > acked by the chip
> >=20
> > Hi Han,
> >=20
> > On Mon, 8 Jan 2018 14:04:29 +0100
> > Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
> >  =20
> > > On Fri, 5 Jan 2018 16:42:39 +0100
> > > Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:
> > >   =20
> > > > Hello,
> > > >   =20
> > > > > Hm, I'm not sure this is safe. The spec says that new ONFI
> > > > > timing mode is applied as soon the CS line is released after a
> > > > > SET_FEATURES(ONFI_FEATURE_ADDR_TIMING_MODE), and since we
> > > > > have no guarantee that the CS will be kept low by the
> > > > > controller after ->onfi_set_features() returns we must assume
> > > > > the new mode has been applied and call
> > > > > ->setup_data_interface() to instruct the controller to apply
> > > > > new timings.
> > > > >
> > > > > If you want to check if the mode has really been applied, you
> > > > > should release the CS (->select_chip(-1)), re-acquire it
> > > > > (->select_chip(X)), and call   =20
> > > > > ->onfi_get_features(ONFI_FEATURE_ADDR_TIMING_MODE). If it
> > > > > appears that the mode has not been applied, you should
> > > > > restore timing mode 0 and issue a RESET.   =20
> > > >
> > > > Boris, thanks for the comment, I will fix that.
> > > >
> > > > Han, could I have your input on this series? Aside Boris'
> > > > comment of course.   =20
> > >
> > > Han, we really need your feedback on this series since you were
> > > the one complaining that ONFI mode should be checked back after
> > > applying a new mode. Miquel is reworking the framework to mimic
> > > what the GPMI driver, but we need to be sure that you'll accept
> > > to transition to the generic ->setup_data_interface()
> > > solution.   =20
> >=20
> > Thanks Miquel, I do accept to transit to setup_data_interface
> > solution and actually I am also working on the similar patches. I
> > reviewed the patch set and don't have more comments, this one
> > improved more than mine. =20
>=20
> Glad to hear you're not opposed to the idea.

I'm happy to read this, I'll send a v2 tomorrow that addresses Boris'
comments.

Thanks,
Miqu=C3=A8l
