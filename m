Received: from mho-02-ewr.mailhop.org ([204.13.248.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1xvm-00037w-Om
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 13:17:07 +0000
Date: Tue, 1 Jul 2014 06:16:19 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 05/36] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20140701131618.GQ28884@atomide.com>
References: <1402477001-31132-6-git-send-email-rogerq@ti.com>
 <20140613071820.GI17845@atomide.com> <539AAA8C.2070709@ti.com>
 <20140613075856.GQ17845@atomide.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF51DB@DBDE04.ent.ti.com>
 <539AB4E4.6050408@ti.com> <20140613104610.GS17845@atomide.com>
 <539AE390.4080504@ti.com> <20140613120839.GV17845@atomide.com>
 <53B2893E.5020306@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53B2893E.5020306@ti.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, "Nori, Sekhar" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>,
 Mark Brown <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 ivan.khoronzhuk@ti.com, "javier@dowhile0.org" <javier@dowhile0.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [140701 03:13]:
> On 06/13/2014 03:08 PM, Tony Lindgren wrote:
> > * Roger Quadros <rogerq@ti.com> [140613 04:43]:
> >>
> >> OK. I agree about using some kind of abstraction instead of direct access.
> > 
> > Yes and like we chatted on irc, adding a syscon mapping for for
> > the NAND specific registers might do the trick here.
> 
> After looking at the syscon driver, which relies on regmap, it seems that regmap was designed for slow control busses like I2C/SPI and using it for NAND controller register access will have a significant negative impact on performance. In the NAND case the register writes are used for each NAND command cycle and the reads for ECC checks (every page).
> 
> See how much code regmap_read and regmap_mmio_read() translates to for a simple register read i.e. readl().
> http://lxr.free-electrons.com/source/drivers/base/regmap/regmap.c#L1944
> http://lxr.free-electrons.com/source/drivers/base/regmap/regmap-mmio.c#L129
> 
> So I'm not so sure of using regmap/syscon for NAND controller register access.

OK yes I agree, it's not a good solution for a constant
register access that's needed for the ECC registers.
 
> Could there be any other abstraction method of sharing the register space between GPMC and NAND driver?
> I've also added Ivan to the thread, the author of memory/ti-aemif.c driver, to check if he faced any issues with shared register access of the AEMIF/NAND registers.

If there's no common framework available for GPMC to implement,
it's best to just export few functions from gpmc.c for the ECC
calculations.

Regards,

Tony
