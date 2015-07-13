Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEXso-0006kY-9O
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 07:10:35 +0000
Date: Mon, 13 Jul 2015 00:10:09 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, bcousson@baylibre.com,
 ezequiel@vanguardiasur.com.ar, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20150713071008.GC26485@atomide.com>
References: <1436531019-18088-1-git-send-email-rogerq@ti.com>
 <1436531019-18088-4-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436531019-18088-4-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [150710 05:26]:
> Since the Interrupt Events are used only by the NAND driver,
> there is no point in managing the Interrupt registers
> in the GPMC driver and complicating it with irqchip modeling.

I don't think it's a good idea to allow external drivers to
tinker directly with GPMC registers. How about just set up GPMC
as an irqchip for the edge detection interrupts?

I think we already have devices with multiple NAND chips. And
there's nothing stopping other drivers from using the edge
detection interrupts.

Regards,

Tony
