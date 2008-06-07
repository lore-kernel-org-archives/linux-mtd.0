Received: from rv-out-0708.google.com ([209.85.198.242])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K50Xj-0004rB-OF
	for linux-mtd@lists.infradead.org; Sat, 07 Jun 2008 15:41:24 +0000
Received: by rv-out-0708.google.com with SMTP id b17so2067487rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sat, 07 Jun 2008 08:41:21 -0700 (PDT)
Message-ID: <cd73a99e0806070841m22f2364dy916e7b1c6f2cdeda@mail.gmail.com>
Date: Sat, 7 Jun 2008 17:41:21 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 1/8] at91_nand: Convert to generic GPIO API
In-Reply-To: <1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1212768298-13614-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1212768298-13614-2-git-send-email-haavard.skinnemoen@atmel.com>
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

hi,

> No point in using an AT91-specific GPIO API when the generic API works
> just as well.

Driver existed before there was a generic GPIO API.  :)


> Signed-off-by: Haavard Skinnemoen <haavard.skinnemoen@atmel.com>

Acked-by: Andrew Victor <linux@maxim.org.za>
