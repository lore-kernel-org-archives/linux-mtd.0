Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCA7-0001hn-U9
 for linux-mtd@lists.infradead.org; Fri, 07 Dec 2018 09:11:41 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Subject: Re: [1/2,v3] mtd: maps: Leave assigned complex mappings
Date: Fri,  7 Dec 2018 10:10:46 +0100
Message-Id: <20181207091046.17236-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181127205358.32502-1-linus.walleij@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2018-11-27 at 20:53:57 UTC, Linus Walleij wrote:
> The simple_map_init() may need to be called with some
> function pointers already assigned for complex mappings,
> just bail out if complex handlers have already been
> assigned.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
