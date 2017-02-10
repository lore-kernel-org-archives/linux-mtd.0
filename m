Received: from mail-pg0-x242.google.com ([2607:f8b0:400e:c05::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ccFfV-0005ta-Br
 for linux-mtd@lists.infradead.org; Fri, 10 Feb 2017 18:11:40 +0000
Received: by mail-pg0-x242.google.com with SMTP id 75so3650474pgf.3
 for <linux-mtd@lists.infradead.org>; Fri, 10 Feb 2017 10:11:16 -0800 (PST)
Date: Fri, 10 Feb 2017 10:11:13 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH] mtd: aspeed: fix compile warning in
 aspeed_smc_read_from_ahb()
Message-ID: <20170210181113.GB95539@google.com>
References: <1484817198-22477-1-git-send-email-clg@kaod.org>
 <20170208233728.GN94627@google.com>
 <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19aa7cbb-8691-36d3-47a3-7a1029e66ecf@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 09, 2017 at 10:05:39AM +0100, Marek Vasut wrote:
> On 02/09/2017 12:37 AM, Brian Norris wrote:
> > On Thu, Jan 19, 2017 at 10:13:18AM +0100, Cédric Le Goater wrote:
> >> The first argument of ioread32_rep() and ioread8_rep is not
> >> const. Change aspeed_smc_read_from_ahb() prototype to fix compile
> >> warning :
> >>
> >>    drivers/mtd/spi-nor/aspeed-smc.c: In function 'aspeed_smc_read_from_ahb':
> >>    drivers/mtd/spi-nor/aspeed-smc.c:212:16: warning: passing argument 1 of 'ioread32_rep' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
> >>       ioread32_rep(src, buf, len >> 2);
> > 
> > But why isn't that param constant? Seems like that's a bug in the
> > ioread* APIs. Some of their implementations are const, but some are not.
> > 
> > I see for instance that the implementation in lib/iomap.c is not const,
> > where there's zero reason it shouldn't be (if we also fix, e.g., its
> > mmio_insl()).
> 
> Maybe it's worth fixing the ioread*_rep then ? Then again, that seems to
> be way far off the scope of this patch.

To be clear: I agree, it's out of the scope of this patch. I've pulled
this in anyway. But I am happy for any work in the meantime to improve
the consistency here.

Thanks,
Brian
