Received: from rv-out-0708.google.com ([209.85.198.251])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K50lg-0006B5-BD
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 15:55:48 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2071921rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 08:55:46 -0700 (PDT)
Message-ID: <cd73a99e0806070855g5db5f0eel7667e1277f7ac586@mail.gmail.com>
Date: Sat, 7 Jun 2008 17:55:46 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 2/8] rename at91_nand -> atmel_nand: file names and Kconfig
In-Reply-To: <1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
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

> The AT91 NAND driver needs just a few tiny modifications to work on
> AVR32 as well. Rename it atmel_nand to reflect this.
>
> Also move the ECC register definitions into drivers/mtd/nand since they
> are only useful to the atmel_nand driver, and get rid of the useless
> filename at the top of each file.
>
> Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>

Acked-by: Andrew Victor <linux@maxim.org.za>
