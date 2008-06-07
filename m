Received: from rv-out-0708.google.com ([209.85.198.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K50xc-000853-Dx
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 16:08:09 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2075536rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 09:08:07 -0700 (PDT)
Message-ID: <cd73a99e0806070908n5c9b6be4ned0386905555a1b7@mail.gmail.com>
Date: Sat, 7 Jun 2008 18:08:07 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 4/8] atmel_nand: Clean up and fix probe() error path
In-Reply-To: <1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
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

hi Haavard,

> This fixes several bugs in the atmel_nand_probe() error path, including
> at least one memory leak.

There is an issue with the current at91_nand driver here.

The driver currently ioremap()'s the ECC controller's registers, but
on the AT91 the ECC controller is part of the System Peripherals and
so it is already mapped at startup.
I don't think it can/should be remapped twice.

The AT91 patch (on maxim.org.za) current does:
    regs = platform_get_resource(pdev, IORESOURCE_MEM, 1);
         ....
    host->ecc = (void __force __iomem *) (AT91_VA_BASE_SYS - AT91_BASE_SYS);
    host->ecc += regs->start;
instead of the ioremap().  But this is not portable to the AVR32.


Regards,
  Andrew Victor
