Received: from ip2.televic.com ([81.82.194.222])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QeNtX-0005e3-IV
	for linux-mtd@lists.infradead.org; Wed, 06 Jul 2011 08:55:44 +0000
From: =?iso-8859-15?Q?Lambrecht_J=FCrgen?= <J.Lambrecht@TELEVIC.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Wed, 6 Jul 2011 10:55:40 +0200
Subject: Re: [PATCH] Add 'config IMX_NFC_V1_BISWAP' to swap the Bad block
	Indicator, and use for imx27pdk nand support.
Message-ID: <4E14230C.2040504@televic.com>
References: <1309872828-13942-1-git-send-email-J.Lambrecht@televic.com>
	<20110706080942.GC26347@pengutronix.de>
In-Reply-To: <20110706080942.GC26347@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/06/2011 10:09 AM, Sascha Hauer wrote:
>
> On Tue, Jul 05, 2011 at 03:33:48PM +0200, J=FCrgen Lambrecht wrote:
> > - Swap the BI-byte on position 0x7D0 with a data byte at 0x835.  To=20
> fix a bug
> >   in Freescale imx NFC v1 SoC's for 2K page NAND flashes: imx27 and=20
> imx31.
> >   Warning: The same solution needs to be applied to the boot loader=20
> and the
> >   flash programmer.
> > - Enable NAND support for the imx27pdk (3ds), and use BISWAP.
> >
> > Signed-off-by: J=FCrgen Lambrecht <J.Lambrecht@televic.com>
> > ---
> >  arch/arm/mach-imx/Kconfig         |   30 ++++++++++++++++++++++++++++-=
-
> >  arch/arm/mach-imx/mach-mx27_3ds.c |   14 ++++++++++++++
> >  drivers/mtd/nand/mxc_nand.c       |   29 +++++++++++++++++++++++++++++
> >  3 files changed, 71 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm/mach-imx/Kconfig b/arch/arm/mach-imx/Kconfig
> > index 0519dd7..e8b16a9 100644
> > --- a/arch/arm/mach-imx/Kconfig
> > +++ b/arch/arm/mach-imx/Kconfig
> > @@ -274,7 +274,7 @@ config MACH_EUKREA_MBIMX27_BASEBOARD
> >  endchoice
> >
> >  config MACH_MX27_3DS
> > -     bool "MX27PDK platform"
> > +     bool "MX27PDK (3DS) platform"
> >       select SOC_IMX27
> >       select IMX_HAVE_PLATFORM_FSL_USB2_UDC
> >       select IMX_HAVE_PLATFORM_IMX2_WDT
> > @@ -284,13 +284,39 @@ config MACH_MX27_3DS
> >       select IMX_HAVE_PLATFORM_IMX_UART
> >       select IMX_HAVE_PLATFORM_MXC_EHCI
> >       select IMX_HAVE_PLATFORM_MXC_MMC
> > +     select IMX_HAVE_PLATFORM_MXC_NAND
> >       select IMX_HAVE_PLATFORM_SPI_IMX
> >       select MXC_DEBUG_BOARD
> >       select MXC_ULPI if USB_ULPI
> >       help
> > -       Include support for MX27PDK platform. This includes specific
> > +       Include support for MX27PDK (3DS) platform. This includes=20
> specific
> >         configurations for the board and its peripherals.
> >
> > +config MACH_MXC_NAND_USE_BBT
> > +     bool "Make the MXC NAND driver use the in flash Bad Block Table"
> > +     depends on MACH_MX27_3DS
> > +     depends on MTD_NAND_MXC
> > +     help
> > +       Enable this if you want that the MXC NAND driver uses the in=20
> flash
> > +       Bad Block Table to know what blocks are bad instead of=20
> scanning the
> > +       entire flash looking for bad block markers.
>
> Besides the fact that we have too many kconfig options there's another
> problem. We try to build kernels which run on as many boards as
> possible. Adding options like this limit a kernel for a particular
> usecase (bbt vs. scanning)
>
Indeed. I just copied it from MACH_MX31_3DS_MXC_NAND_USE_BBT, and=20
thought it was good to do the same.
If I want to use it, better just do it without that option, as other=20
_3ds boards do (and davinci and atmel also do in another way).
I will remove the option in a separate nand patch for imx27pdk.

Regards,
J=FCrgen
[snip]
