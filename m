Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5bR7-0001My-Dq
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 07:05:01 +0000
Received: by yw-out-1718.google.com with SMTP id 5so1477184ywm.72
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Jun 2008 00:04:54 -0700 (PDT)
Message-ID: <80b317760806090004v56436872oac76944e39f57860@mail.gmail.com>
Date: Mon, 9 Jun 2008 09:04:54 +0200
From: "Richard Genoud" <richard.genoud@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 4/8] atmel_nand: Clean up and fix probe() error path
In-Reply-To: <20080607191815.3dc24360@siona.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
	<cd73a99e0806070908n5c9b6be4ned0386905555a1b7@mail.gmail.com>
	<20080607191815.3dc24360@siona.local>
Cc: kernel@avr32linux.org, Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
	Andrew Victor <avictor.za@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi !

>> The driver currently ioremap()'s the ECC controller's registers, but
>> on the AT91 the ECC controller is part of the System Peripherals and
>> so it is already mapped at startup.
>> I don't think it can/should be remapped twice.
>
> I don't see why that's really a problem -- it may get a different
> virtual address and possibly waste a TLB entry, but it should work.

Hmm, it reminds me something :
http://article.gmane.org/gmane.linux.ports.arm.kernel/38834

>> The AT91 patch (on maxim.org.za) current does:
>>     regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
>>          ....
>>     host->ecc = (void __force __iomem *) (AT91_VA_BASE_SYS - AT91_BASE_SYS);
>>     host->ecc += regs->start;
>> instead of the ioremap().  But this is not portable to the AVR32.
>
> How about sticking a "void __iomem *ecc_regs" field in struct
> atmel_nand_data and allow platforms to specify a pre-mapped pointer?
> Then the driver can do
>
>        if (host->board->ecc_regs)
>                host->ecc = host->board->ecc_regs;
>        else if (regs)
>                host->ecc = ioremap(regs->start, regs->end - regs->start + 1);
>
>        if (hard_ecc && !host->ecc)
>                printk("Hardware ECC not available\n");
>
> Right? I think we use a similar trick in the atmel_serial driver too.

It may be the best solution indeed.

richard.
