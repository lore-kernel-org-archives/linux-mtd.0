Received: from rv-out-0708.google.com ([209.85.198.245])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K5nnl-0005FE-SA
	for linux-mtd@lists.infradead.org; Mon, 09 Jun 2008 20:17:14 +0000
Received: by rv-out-0708.google.com with SMTP id b17so3043129rvf.42
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Jun 2008 13:17:12 -0700 (PDT)
Message-ID: <cd73a99e0806091317q37d134acu8b7d4033e769fcc1@mail.gmail.com>
Date: Mon, 9 Jun 2008 22:17:12 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Richard Genoud" <richard.genoud@gmail.com>
Subject: Re: [PATCH 4/8] atmel_nand: Clean up and fix probe() error path
In-Reply-To: <80b317760806090004v56436872oac76944e39f57860@mail.gmail.com>
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
	<80b317760806090004v56436872oac76944e39f57860@mail.gmail.com>
Cc: kernel@avr32linux.org, Patrice VILCHEZ <patrice.vilchez@atmel.com>,
	linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>,
	linux-mtd@lists.infradead.org,
	Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi,

>> Then the driver can do
>>        if (host->board->ecc_regs)
>>                host->ecc = host->board->ecc_regs;
>>        else if (regs)
>>                host->ecc = ioremap(regs->start, regs->end - regs->start + 1);
>>
>>        if (hard_ecc && !host->ecc)
>>                printk("Hardware ECC not available\n");
>>
>> Right? I think we use a similar trick in the atmel_serial driver too.
>
> It may be the best solution indeed.

Agreed.


Regards,
  Andrew Victor
