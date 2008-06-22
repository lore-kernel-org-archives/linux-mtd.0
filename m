Received: from rv-out-0708.google.com ([209.85.198.249])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KAQxH-0007yy-3w
	for linux-mtd@lists.infradead.org; Sun, 22 Jun 2008 14:54:11 +0000
Received: by rv-out-0708.google.com with SMTP id b17so9498082rvf.42
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Jun 2008 07:54:10 -0700 (PDT)
Message-ID: <cd73a99e0806220754v5cbbbeefm1c0a47ef25431391@mail.gmail.com>
Date: Sun, 22 Jun 2008 16:54:10 +0200
From: "Andrew Victor" <avictor.za@gmail.com>
To: "Haavard Skinnemoen" <haavard.skinnemoen@atmel.com>
Subject: Re: [PATCH 2/3] atmel_nand: Work around AT32AP7000 ECC errata
In-Reply-To: <1213948112-22348-2-git-send-email-haavard.skinnemoen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1213948112-22348-1-git-send-email-haavard.skinnemoen@atmel.com>
	<1213948112-22348-2-git-send-email-haavard.skinnemoen@atmel.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

hi Haavard,

> The ALE signal isn't correctly wired up to the ECC controller on the
> AP7000, so it starts calculating ECC during the address cycles.

Shouldn't affect the AT91's, so
  Acked-by: Andrew Victor <linux@maxim.org.za>

You might want to also change/remove the comment where the ECC hwctl()
function is registered.
It's currently:
   nand_chip->ecc.hwctl = at91_nand_hwctl;     /* unused */


Regards,
  Andrew Victor
