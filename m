Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9Wdt-00010u-56
	for linux-mtd@lists.infradead.org; Wed, 05 May 2010 04:55:30 +0000
Subject: Re: Upcoming merge window and omap NAND patches
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Tony Lindgren <tony@atomide.com>
In-Reply-To: <20100504220803.GN29604@atomide.com>
References: <20100504220803.GN29604@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 07:49:03 +0300
Message-ID: <1273034943.3702.19.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sukumar Ghorai <s-ghorai@ti.com>, Steve Sakoman <sakoman@gmail.com>,
	Vimal Singh <vimal.newwork@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-05-05 at 00:08 +0200, ext Tony Lindgren wrote:
> Hi all,
> 
> There are several omap NAND patches pending, but some basic things
> should be fixed first.
> 
> 1. The NAND driver needs to stop tinkering with the GPMC registers
> 
> The omap General Purpose Memory Controller (GPMC) registers are omap
> specific, and not driver specific. Tinkering with these registers
> can cause issues with the other devices on the GPMC.
> 
> To find out what needs to disappear fomr the NAND driver, just do:
> 
> $ grep baseaddr drivers/mtd/nand/omap2.c
> 
> Any GPMC register tinkering needs to happen in arch/arm/mach-omap2/gpmc.c.
> If there are not currently GPMC functions to do something in gpmc.c, then
> let's add the necessary support there.
> 
> 2. Passing hardcoded GPMC_CS0_BASE needs to go from the board files
> 
> Passing hardcoded GPMC virtual addressess is sure way to mess up
> things. This should all become unnecessary once the NAND drivers
> stops messing with the GPMC registers directly.
> 
> So, as a result, I'm not planning on pushing any omap NAND related
> patches until these basic issues are fixed. I'll mark these patches
> as "Changes requested" in patchwork.kernel.org even if these patches
> don't have anything else wrong with them.
> 
> Let's fix the basic things for good, and put the other patches on
> hold for a while. Sorry if this causes problems!

Hi,

fair enough. I guess Vimal should address this, as he seems to be the TI
mr. NAND, right? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
