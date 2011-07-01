Message-ID: <19981.25150.673498.516935@ipc1.ka-ro>
Date: Fri, 1 Jul 2011 07:59:26 +0200
From: =?utf-8?Q?Lothar_Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Arnd Bergmann <arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 1/3] ARM: mxs: add GPMI-NFC support for imx23/imx28
In-Reply-To: <201107010022.26597.arnd@arndb.de>
References: <1309406028-2924-1-git-send-email-b32955@freescale.com>
	<201106301555.19440.arnd@arndb.de>
	<19980.36638.134045.743619@ipc1.ka-ro>
	<201107010022.26597.arnd@arndb.de>
Cc: s.hauer@pengutronix.de, w.sang@pengutronix.de, thierry.nolf.barco@gmail.com,
	Huang Shijie <b32955@freescale.com>,
	linux-mtd@lists.infradead.org, u.kleine-koenig@pengutronix.de,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Arnd Bergmann writes:
> On Thursday 30 June 2011 16:58:38 Lothar Waßmann wrote:
> > > 
> > > When adding new infrastructure, always keep in mind how you want it to look
> > > after the device tree conversion. The partitions and min/max_* are easily covered
> > > with that, but the init/exit function pointers are somewhat problematic.
> > > 
> > > Fortunately, you don't really require these functions for this driver. The _exit
> > > function is completely unused, so just get rid of it.
> > > 
> > > The init function is used only to set up iomux, so the logical replacement is
> > > a pointer to the iomux data, and calling mxs_iomux_setup_multiple_pads
> > > directly from the driver.
> > > 
> > NO! I strongly object that. mxs_iomux_setup_multiple_pads() is a
> > platform specific function and has no business inside a device driver
> > that should be platform agnostic.
> > Consider the same controller being part of a different SoC that
> > requires you to call mxs_iomux_v2_setup_multiple_pads() instead. You
> > would then have to check for the SoC type inside the driver to find
> > the right function to call which is quite obscene.
> 
> Won't this problem just go away as soon as we get the mxs converted to the
> generic pinmux subsystem that Linus Walleij is doing?
> 
> Obviously, you would not have to check the soc type really, you would have
> to instead check for different versions of the gpmi, which you most likely
> have to anyway because reusing the same hardware block in a new chip usually
> comes with other changes as well. 
> 
The pin muxing is SoC specific, not GPMI specific. So the SoC version
should be checked, not something else that may be loosely linked to
it.

> Note how the driver already does this with code like
> 
> +	if (GPMI_IS_MX23(this) || GPMI_IS_MX28(this))
> +		nfc = &gpmi_nfc_hal_mxs;
> 
> If you really want to call out obsceneties, how about the fact that this
> driver comes with an 805 line patch to add a HAL for a single chip!
> 
> Such abstractions should not be introduced as long as there is only
> a single instance of the hardware.
> 
I had already commented on this in the first round of patches from
Huang in March this year.


Lothar Waßmann
-- 
___________________________________________________________

Ka-Ro electronics GmbH | Pascalstraße 22 | D - 52076 Aachen
Phone: +49 2408 1402-0 | Fax: +49 2408 1402-10
Geschäftsführer: Matthias Kaussen
Handelsregistereintrag: Amtsgericht Aachen, HRB 4996

www.karo-electronics.de | info@karo-electronics.de
___________________________________________________________
