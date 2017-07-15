Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dWMUE-0003X4-Ou
 for linux-mtd@lists.infradead.org; Sat, 15 Jul 2017 12:47:56 +0000
Date: Sat, 15 Jul 2017 14:47:26 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Han Xu <han.xu@nxp.com>, "richard@nod.at" <richard@nod.at>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: gpmi-nand: do not fail setting ONFI timing mode if
 available
Message-ID: <20170715144726.7d984b49@bbrezillon>
In-Reply-To: <20170715125200.0b74d494@xps13>
References: <20170713192030.22177-1-miquel.raynal@free-electrons.com>
 <20170713221520.268bc554@bbrezillon>
 <178298b1-b482-e636-2daa-1a6595b8c139@nxp.com>
 <20170714193143.034c4c24@bbrezillon>
 <20170715125200.0b74d494@xps13>
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

Le Sat, 15 Jul 2017 12:52:00 +0200,
Miquel RAYNAL <miquel.raynal@free-electrons.com> a =C3=A9crit :

> Hi Han and Boris,
>=20
> On Fri, 14 Jul 2017 19:31:43 +0200
> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:
>=20
> > Hi Han,
> >=20
> > Le Fri, 14 Jul 2017 14:53:39 +0000,
> > Han Xu <han.xu@nxp.com> a =C3=A9crit :
> >  =20
> > > On 07/13/2017 03:15 PM, Boris Brezillon wrote:   =20
> > > > Hi Miquel,
> > > >
> > > > Le Thu, 13 Jul 2017 21:20:30 +0200,
> > > > Miquel Raynal <miquel.raynal@free-electrons.com> a =C3=A9crit :
> > > >     =20
> > > >> GPMI NFC driver fails to apply timing mode if the =20
> > > >> ->onfi_get_features() does not return the mode that was =20
> > > >> previously applied.
> > > >>
> > > >> We can assume that a nand chip supports a timing as long as it is
> > > >> read from the ONFI parameter page. Reading back a different mode
> > > >> than the one previously applied does not mean the mode is
> > > >> unsupported but that the nand chip does not implement the ONFI
> > > >> feature because it probably does not need to.
> > > >>
> > > >> The output of ->onfi_get_feature() is irrelevant so delete
> > > >> it.     =20
> > > > Having the NAND part that is not supporting the
> > > > get/set(timing_mode) feature explicitly mentioned in the commit
> > > > message would help reviewers understand why this patch is needed.
> > > >
> > > > Also mention that, even though the SET/GET_FEATURES(timing_mode)
> > > > is marked as required in the ONFI spec, this Macronix chip does
> > > > not support it which could be considered as a bug.
> > > >
> > > > Regards,
> > > >
> > > > Boris     =20
> > >=20
> > > Yes, this is a Macronix chip bug and I have reproduced on my side,=20
> > > ignoring the GET_FEATURE checking is a workaround and the chip will=20
> > > still works in EDO mode 5, but I don't accept to remove the
> > > reasonable checking code for a chip bug.   =20
> >=20
> > I understand why you're reluctant to remove this check just to make
> > one particular chip work correctly, but, on the other hand, if we were
> > only supporting non-broken NAND chip in mainline, plenty of boards
> > wouldn't be supported. Flash vendors tend to take liberties with
> > standards, that's a fact, and once the chip is out there's nothing we
> > can do about it, except add a workaround to support it.
> >=20
> > So let's try to find a solution that makes everyone happy: now that we
> > have nand_manufacturer_ops, we can easily let manufacturer code flag
> > specific chip features as broken and let the core or drivers test for
> > it before using the feature.
> > This way, the gpmi-nand driver could check this flag before trying to
> > call ->onfi_set/get_features(TIMING).
> > Would that work for you?
> >=20
> > BTW, that'd be great to have this driver converted to the =20
> > ->setup_data_interface() approach at some point.   =20
>=20
> I do agree with both of you.
>=20
> If sent this patch without asking myself more questions because:
> not checking if the timings have been properly set by a call to
> ->onfi_get_features() is what the nand core does. =20
>=20
> http://elixir.free-electrons.com/linux/v4.12/source/drivers/mtd/nand/nand=
_base.c#L1110

Probably something we should fix in nand_setup_data_interface().
Checking if a parameter has been properly set by reading it back sounds
like a good practice.

Note that, based on the tests Sascha and I did back when he implemented
the ->setup_data_interface() infrastructure, I doubt setting timing
mode on an SDR NAND has any effect.
This is the very reason I initially suggested you to drop the extra
check in the GPMI driver: if the NAND properly implements
SET/GET_FEATURES(timing), then SET_FEATURES(timing, X) should work just
fine, and if it does not but still advertise that it support modes 0 to
X, that means SET_FEATURES(timing, X) is useless and we shouldn't care
if GET_FEATURES(timing) returns a wrong value.

>=20
> Of course it would be better to use the ->setup_data_interface()
> but this is much bigger effort.

Yes, I was doing this suggestion to know if Han (or someone else) had
planned to support this feature. And yes, the initial effort is not
comparable to the 7-lines patch you submitted, but having NAND timings
selection logic in a single place is easier to maintain.

Note that I'm not requiring this rework, just gently suggesting to
think about it ;-).
