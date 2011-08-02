Date: Tue, 2 Aug 2011 16:12:54 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v8 0/3] add the GPMI controller driver for IMX23/IMX28
Message-ID: <20110802081253.GA23380@freescale.com>
References: <20110722055731.GI26837@S2100-06.ap.freescale.net>
	<4E292FCF.6010608@freescale.com>
	<CAHMSPgMHrqWcJ=BThDLgQ=XyTBDCMvNS4SVjQWfk=Jf682TEig@mail.gmail.com>
	<4E2F6F90.7030207@freescale.com>
	<CAHMSPgPC4whyskfuFGeFd7WHx-=5htezWajm_rNi9Xa+03PV0A@mail.gmail.com>
	<20018.24364.787244.956361@ipc1.ka-ro>
	<CAHMSPgM5W8=mE4sRDGMMfo39fvThBo_jrdG8hyhJNQ_ceV=_pA@mail.gmail.com>
	<4E32823C.3060007@freescale.com>
	<CAHMSPgMTf1UnMyvsSZM1in-FEAoWyS5VSdczsxfHgujGJ0DFtw@mail.gmail.com>
	<4E37970C.4070903@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <4E37970C.4070903@freescale.com>
Content-Transfer-Encoding: quoted-printable
Cc: arnd@arndb.de, dedekind1@gmail.com, Koen Beel <koen.beel.barco@gmail.com>,
	Wolfram Sang <w.sang@pengutronix.de>,
	linux-mtd@lists.infradead.org, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	Lothar =?iso-8859-1?Q?Wa=DFmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 02, 2011 at 02:19:56PM +0800, Huang Shijie wrote:
> Hi,
> >On Fri, Jul 29, 2011 at 11:49 AM, Huang Shijie<b32955@freescale.com>  =
wrote:
> >>=E4=BA=8E 2011=E5=B9=B407=E6=9C=8829=E6=97=A5 15:40, Koen Beel =E5=86=
=99=E9=81=93:
> >>>Hi,
> >>>
> >>>On Fri, Jul 29, 2011 at 9:20 AM, Lothar Wa=C3=9Fmann<LW@karo-electro=
nics.de>
> >>>  wrote:
> >>>>Hi,
> >>>>
> >>>>Koen Beel writes:
> >>>>>Hi,
> >>>>>
> >>>>>I have test on mx23evk board. Still see the same issues.
> >>>>>
> >>>>>On Wed, Jul 27, 2011 at 3:53 AM, Huang Shijie<b32955@freescale.com=
>
> >>>>>  wrote:
> >>>>>>Hi,
> >>>>>>
> >>>>>>Thanks for your test.
> >>>>>>
> >>>>>>>Hi,
> >>>>>>>
> >>>>>>>It's not really working for me.
> >>>>>>>I've applied all gpmi-nand driver patches and the dma driver pat=
ches.
> >>>>>>>
> >>>>>>>I have added following kernel parameters:
> >>>>>>>mtdparts=3Dgpmi-nand:20m(boot),-(user) ubi.mtd=3D1 root=3Dubi0:r=
ootfs0
> >>>>>>>rootfstype=3Dubifs gpmi_debug_init
> >>>>>>>
> >>>>>>>During boot I get already get DMA timeout:
> >>>>>>>[    2.560000] [ start_dma_without_bch_irq : 392 ] DMA timeout, =
last
> >>>>>>>DMA
> >>>>>>>:1
> >>>>>>>[    3.560000] [ start_dma_with_bch_irq : 427 ] bch timeout!!!
> >>>>>>>...
> >>>>>>>(see log file in attach line 89)
> >>>>>I still see this DMA timeout when booting.
> >>>>>What kernel parameters do you use? I still use same as above.
> >>>>>
> >>>>Do you have an SD card in the system? I'm getting the same error wh=
en
> >>>>accessing an SD card. Without SD card I can use the flash without a=
ny
> >>>>errors.
> >>>No SD card in the system. At least not on my mx23evk board.
> >>>My real target hardware has a SDIO wifi chip.
> >>Does it conflict with the GPMI?
> >Well I don't know if it conflicts. From what Lothar says I assume
> >there might be a conflict between gpmi and sdio.
> Yes, the conflict between gpmi and other module(such as SD in MX6Q)
> is THE prime reason
> which caused the DMA timeout.
>=20
> I am debuging the IMX6Q now, and meet the same problem.
>=20
I do not follow on this.  SD on i.mx6q does not use apbh-dma at all.
How will it conflict with gpmi regarding to dma timeout?

--=20
Regards,
Shawn
