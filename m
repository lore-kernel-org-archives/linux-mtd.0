Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNNAp-0006P2-MV
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2018 19:19:32 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [3/3,v3] mtd: partitions: Add OF support to RedBoot partitions
Date: Thu, 15 Nov 2018 20:19:17 +0100
Message-Id: <20181115191917.3700-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181110211413.15707-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2018-11-10 at 21:14:13 UTC, Linus Walleij wrote:
> This adds device tree support for RedBoot partitioning. We
> read out the FIS directory block information from the device
> tree and then parse the partition table from there.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
