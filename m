Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqpFx-0004Ny-R4
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 21:24:42 +0000
Received: by padhk11 with SMTP id hk11so199315128pad.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 14:24:19 -0700 (PDT)
Date: Mon, 26 Oct 2015 14:23:46 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: tony@atomide.com, dwmw2@infradead.org, ezequiel@vanguardiasur.com.ar,
 javier@dowhile0.org, fcooper@ti.com, nsekhar@ti.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 00/27] memory: omap-gpmc: mtd: nand: Support GPMC NAND
 on non-OMAP platforms
Message-ID: <20151026212346.GJ13239@google.com>
References: <1442588029-13769-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1442588029-13769-1-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Roger,

I'm not too familiar with OMAP platforms, and I might have missed out on
prior discussions/context, so please forgive if I'm asking silly or old
questions here.

On Fri, Sep 18, 2015 at 05:53:22PM +0300, Roger Quadros wrote:
> - Remove NAND IRQ handling from omap-gpmc driver, share the GPMC IRQ
> with the omap2-nand driver and handle NAND IRQ events in the NAND driver.
> This causes performance increase when using prefetch-irq mode.
> 30% increase in read, 17% increase in write in prefetch-irq mode.

Have you pinpointed the exact causes for the performance increase, or
can you give an educated guess? AIUI, you're reducing the number of
interrupts needed for NAND prefetch mode, but you're also removing a bit
of abstraction and implementing hooks that look awfully like the
existing abstractions:

+       int (*nand_irq_enable)(enum gpmc_nand_irq irq);
+       int (*nand_irq_disable)(enum gpmc_nand_irq irq);
+       void (*nand_irq_clear)(enum gpmc_nand_irq irq);
+       u32 (*nand_irq_status)(void);

That's not really a problem if there's a good reason for them (brcmnand
implements similar hooks because of quirks in the implementation of
interrupts across various BRCM SoCs, and it's not worth writing irqchip
drivers for those cases). I'm mainly curious for an explanation.

Regards,
Brian
