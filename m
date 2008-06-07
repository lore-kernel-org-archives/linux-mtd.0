Received: from smtpeu1.atmel.com ([195.65.72.27] helo=bagnes.atmel.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K523c-00058q-BS
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 17:18:24 +0000
Date: Sat, 7 Jun 2008 19:18:15 +0200
From: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
To: "Andrew Victor" <avictor.za@gmail.com>
Subject: Re: [PATCH 4/8] atmel_nand: Clean up and fix probe() error path
Message-ID: <20080607191815.3dc24360@siona.local>
In-Reply-To: <cd73a99e0806070908n5c9b6be4ned0386905555a1b7@mail.gmail.com>
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
	<cd73a99e0806070908n5c9b6be4ned0386905555a1b7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Patrice VILCHEZ <patrice.vilchez@atmel.com>, kernel@avr32linux.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 7 Jun 2008 18:08:07 +0200
"Andrew Victor" <avictor.za@gmail.com> wrote:

> hi Haavard,
> 
> > This fixes several bugs in the atmel_nand_probe() error path, including
> > at least one memory leak.
> 
> There is an issue with the current at91_nand driver here.

Hmm, right.

> The driver currently ioremap()'s the ECC controller's registers, but
> on the AT91 the ECC controller is part of the System Peripherals and
> so it is already mapped at startup.
> I don't think it can/should be remapped twice.

I don't see why that's really a problem -- it may get a different
virtual address and possibly waste a TLB entry, but it should work.

> The AT91 patch (on maxim.org.za) current does:
>     regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>          ....
>     host->ecc = (void __force __iomem *) (AT91_VA_BASE_SYS - AT91_BASE_SYS);
>     host->ecc += regs->start;
> instead of the ioremap().  But this is not portable to the AVR32.

How about sticking a "void __iomem *ecc_regs" field in struct
atmel_nand_data and allow platforms to specify a pre-mapped pointer?
Then the driver can do

	if (host->board->ecc_regs)
		host->ecc = host->board->ecc_regs;
	else if (regs)
		host->ecc = ioremap(regs->start, regs->end - regs->start + 1);

	if (hard_ecc && !host->ecc)
		printk("Hardware ECC not available\n");

Right? I think we use a similar trick in the atmel_serial driver too.

Haavard
