Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1enAPQ-00082m-SI
 for linux-mtd@lists.infradead.org; Sat, 17 Feb 2018 21:52:43 +0000
Date: Sat, 17 Feb 2018 22:52:26 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Vignesh R <vigneshr@ti.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Yogesh Gaur
 <yogeshnarayan.gaur@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>, Richard
 Weinberger <richard@nod.at>, "linux-spi@vger.kernel.org"
 <linux-spi@vger.kernel.org>, Peter Pan <peterpansjtu@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Frieder Schrempf
 <frieder.schrempf@exceet.de>, Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Subject: Re: [RFC PATCH 4/6] spi: ti-qspi: Implement the spi_mem interface
Message-ID: <20180217225226.3813c1ce@bbrezillon>
In-Reply-To: <55878296-f1c9-434b-3c7e-e2f03f5824a9@ti.com>
References: <20180205232120.5851-1-boris.brezillon@bootlin.com>
 <20180205232120.5851-5-boris.brezillon@bootlin.com>
 <6a9eaaaf-20a6-b332-03d0-9d16e24d0b3d@ti.com>
 <20180212133158.3032442f@bbrezillon>
 <67e61203-a2e9-853c-6cda-7226499611c2@ti.com>
 <20180212170809.3f0b5e20@bbrezillon>
 <0944fefa-6ef8-a93a-dad6-660044b8ec8e@ti.com>
 <20180214200952.6a8578dc@bbrezillon>
 <55878296-f1c9-434b-3c7e-e2f03f5824a9@ti.com>
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

On Sat, 17 Feb 2018 16:31:48 +0530
Vignesh R <vigneshr@ti.com> wrote:

> [...]
> >>>>>>      =20
> >>>>>>> +static const struct spi_controller_mem_ops ti_qspi_mem_ops =3D {
> >>>>>>> +=C2=A0=C2=A0 .exec_op =3D ti_qspi_exec_mem_op,=C2=A0      =20
> >>>>>>
> >>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .supports_op =3D ti_qsp=
i_supports_mem_op,
> >>>>>>
> >>>>>> Its required as per spi_controller_check_ops() in Patch 1/6     =20
> >>>>>      =20
> >>>>> ->supports_op() is optional, and if it's missing, the core will do =
the     =20
> >>>>> regular QuadSPI/DualSPI/SingleSPI check (see spi_mem_supports_op()
> >>>>> implementation).      =20
> >>>>
> >>>> You might have overlooked spi_controller_check_ops() from Patch 1/6:
> >>>> +static int spi_controller_check_ops(struct spi_controller *ctlr)
> >>>> +{
> >>>> +	/*
> >>>> +	 * The controller can implement only the high-level SPI-memory
> >>>> +	 * operations if it does not support regular SPI transfers.
> >>>> +	 */
> >>>> +	if (ctlr->mem_ops) {
> >>>> +		if (!ctlr->mem_ops->supports_op ||
> >>>> +		    !ctlr->mem_ops->exec_op)
> >>>> +			return -EINVAL;
> >>>> +	} else if (!ctlr->transfer && !ctlr->transfer_one &&
> >>>> +		   !ctlr->transfer_one_message) {
> >>>> +		return -EINVAL;
> >>>> +	}
> >>>> +
> >>>> +	return 0;
> >>>> +}
> >>>> +
> >>>>
> >>>> So if ->supports_op() is not populated by SPI controller driver, then
> >>>> driver probe fails with -EINVAL. This is what I observed on my TI
> >>>> hardware when testing this patch series.   =20
> >>>
> >>> Correct. Then I should fix spi_controller_check_ops() to allow empty
> >>> ctlr->mem_ops->supports_op.
> >>>    =20
> >>>>   =20
> >>>>> This being said, if you think a custom ->supports_op()
> >>>>> implementation is needed for this controller I can add one.
> >>>>>      =20
> >>>>
> >>>> spi_mem_supports_op() should suffice for now if above issue is fixed=
.   =20
> >>>
> >>> Cool. IIUC, you tested the series on a TI SoC. Does it work as
> >>> expected? Do you see any perf regressions?
> >>>    =20
>=20
> No other functional failures or performance issues so far wrt TI QSPI.
> Things look good :)

That's good news. I'll send a v2 addressing the problems you and others
reported soon, but I'd like to have Cyrille's and Mark's feedback first.

BTW, don't hesitate to comment on the interface itself. Do you think
it's missing important features? Do you need more information to better
optimize SPI memory accesses? ...
This truly was an RFC: I'm new to these QSPI/SPI-NOR/SPI-NAND stuff, and
I know you and others already faced various problems and thought about
different solutions to address them. Now is a good time to re-think the
whole thing and design the spi_mem interface in a way that allows us to
better support all these QSPI-memory-oriented controllers.

Regards,

Boris

--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
