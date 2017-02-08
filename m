Received: from mail-pf0-f194.google.com ([209.85.192.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbbp6-0000AE-Vu
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 23:38:54 +0000
Received: by mail-pf0-f194.google.com with SMTP id y143so12412032pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 15:38:32 -0800 (PST)
Date: Wed, 8 Feb 2017 15:37:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
Message-ID: <20170208233728.GN94627@google.com>
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1484817198-22477-1-git-send-email-clg@kaod.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 19, 2017 at 10:13:18AM +0100, Cédric Le Goater wrote:
> The first argument of ioread32_rep() and ioread8_rep is not
> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
> warning :
> 
>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>       ioread32_rep(src, buf, len >> 2);

But why isn't that param constant? Seems like that's a bug in the
ioread* APIs. Some of their implementations are const, but some are not.

I see for instance that the implementation in lib/iomap.c is not const,
where there's zero reason it shouldn't be (if we also fix, e.g., its
mmio_insl()).

Brian
