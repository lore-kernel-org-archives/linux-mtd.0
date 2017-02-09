Received: from mail-wr0-f195.google.com ([209.85.128.195])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbkuQ-0002ma-Hy
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 09:21:00 +0000
Received: by mail-wr0-f195.google.com with SMTP id 89so11248787wrr.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2017 01:20:38 -0800 (PST)
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
To: Brian Norris <computersforpeace@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
 <20170208233728.GN94627@google.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
Date: Thu, 9 Feb 2017 10:05:39 +0100
MIME-Version: 1.0
In-Reply-To: <20170208233728.GN94627@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/09/2017 12:37 AM, Brian Norris wrote:
> On Thu, Jan 19, 2017 at 10:13:18AM +0100, Cédric Le Goater wrote:
>> The first argument of ioread32_rep() and ioread8_rep is not
>> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
>> warning :
>>
>>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
>>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
>>       ioread32_rep(src, buf, len >> 2);
> 
> But why isn't that param constant? Seems like that's a bug in the
> ioread* APIs. Some of their implementations are const, but some are not.
> 
> I see for instance that the implementation in lib/iomap.c is not const,
> where there's zero reason it shouldn't be (if we also fix, e.g., its
> mmio_insl()).

Maybe it's worth fixing the ioread*_rep then ? Then again, that seems to
be way far off the scope of this patch.

-- 
Best regards,
Marek Vasut
