Received: from mho-03-ewr.mailhop.org ([204.13.248.66]
 helo=mho-01-ewr.mailhop.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvLlD-00078Z-SB
 for linux-mtd@lists.infradead.org; Fri, 13 Jun 2014 07:18:52 +0000
Date: Fri, 13 Jun 2014 00:18:21 -0700
From: Tony Lindgren <tony@atomide.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 05/36] mtd: nand: omap: Move IRQ handling from GPMC to
 NAND driver
Message-ID: <20140613071820.GI17845@atomide.com>
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-6-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402477001-31132-6-git-send-email-rogerq@ti.com>
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Roger Quadros <rogerq@ti.com> [140611 01:58]:
> Since the Interrupt Events are used only by the NAND driver,
> there is no point in managing the Interrupt registers
> in the GPMC driver and complicating it with irqchip modeling.
> 
> Let's manage the interrupt registers directly in the NAND driver
> and get rid of irqchip model from GPMC driver.
> 
> Get rid of IRQ commands and unused commands from gpmc_configure() in
> the GPMC driver.

This seems like a step backward to me. The GPMC interrupt enable
register can do edge detection on the wait pins, how is that
limited to NAND?

Further, let's not start mixing GPMC hardware module register
access with the NAND driver register access. They can be clocked
separately. And bugs in the NAND driver can cause issues in other
GPMC using drivers.

Regards,

Tony
