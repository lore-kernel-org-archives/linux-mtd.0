Received: from rv-out-0708.google.com ([209.85.198.247])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K50yO-0001HU-MD
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 16:08:57 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2075770rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 09:08:55 -0700 (PDT)
Message-ID: <cd73a99e0806070908mbc1f33cg37cc23a426ffca24@mail.gmail.com>
Date: Sat, 7 Jun 2008 18:08:55 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 7/8] atmel_nand: make available on AVR32
In-Reply-To: <1212768298-13614-8-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-3-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-4-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-5-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-6-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-7-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-8-git-send-email-haavard.skinnemoen@atmel.com>
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

> Make the atmel_nand driver selectable on AVR32, and update the Kconfig
> help text to reflect this.
>
> Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>

Acked-by: Andrew Victor <linux@maxim.org.za>
