Received: from nwd2mail10.analog.com ([137.71.25.55])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ISP25-00080M-OL
	for linux-mtd@lists.infradead.org; Mon, 03 Sep 2007 23:24:57 -0400
Subject: Re: [PATCH] Blackfin BF54x NAND Flash Controller driver
From: Bryan Wu <bryan.wu@analog.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0709031057u1f4608f6y36bd20a8f6910a32@mail.gmail.com>
References: <1188804323.29566.6.camel@roc-laptop>
	<8bd0f97a0709031057u1f4608f6y36bd20a8f6910a32@mail.gmail.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: Tue, 04 Sep 2007 11:21:49 +0800
Message-Id: <1188876109.6319.9.camel@roc-desktop>
Mime-Version: 1.0
Cc: bryan.wu@analog.com, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>, akpm@linux-foundation.org
Reply-To: bryan.wu@analog.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-09-03 at 13:57 -0400, Mike Frysinger wrote:
> On 9/3/07, Bryan Wu <bryan.wu@analog.com> wrote:
> > --- a/drivers/mtd/nand/Kconfig
> > +++ b/drivers/mtd/nand/Kconfig
> > @@ -131,6 +131,24 @@ config MTD_NAND_AU1550
> > +config MTD_NAND_BF54X
> > +       tristate "NAND Flash support for Blackfin BF54X SoC DSP"
> 
> i'd just describe it as "Blackfin on-chip NAND" rather than sticking
> in exact part numbers as i imagine we can extend it down the line
> 
> > +         This enables the NAND flash controller on the BF54X SoC DPSs
> 
> "BF54X SoC DPSs" -> "BF54x SoC DSPs"
> 
> > +         No board specific support is done by this driver, each board
> > +         must advertise a platform_device for the driver to attach.
> 
> should mention the module name when built as a module
> 

I will get rid of this BF54X and use BF5XX for (BF54x and BF52x and
future processor)

> > +config MTD_NAND_BF54X_HWECC
> > +       bool "BF54X NAND Hardware ECC"
> > +       depends on MTD_NAND_BF54X
> > +       help
> > +         Enable the use of the BF54X's internal ECC generator when
> > +         using NAND. Early versions of the chip have had problems with
> > +         incorrect ECC generation, and if using these, the default of
> > +         software ECC is preferable.
> 
> rather than advertising this, i'd just keep it in the driver ...
> presumably there are anomaly #'s for when the ECC is wrong, so we can
> make the code depend on those
> -mike

This option is quite common in the NAND driver. If there are anomaly
#'s, code can still depend on those by using hardware_ecc varible. This
option is very useful when someone need software_ecc.

Thanks
- Bryan Wu
