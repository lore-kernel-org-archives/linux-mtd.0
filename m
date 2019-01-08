Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggu1B-0002ST-1n
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 16:14:18 +0000
From: Boris Brezillon <bbrezillon@kernel.org>
To: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, bkenward@solarflare.com,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: mtdram: Expose module parameters
Date: Tue,  8 Jan 2019 17:14:08 +0100
Message-Id: <20190108161408.27543-1-bbrezillon@kernel.org>
In-Reply-To: <20181217215015.32392-1-richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@bootlin.com>

On Mon, 2018-12-17 at 21:50:15 UTC, Richard Weinberger wrote:
> Since we can set module parameters also when a driver is built in,
> it makes no sense to protect module parameter with #ifdef MODULE.
> Now the mtdram sizes can also set when the module is not a loadable
> module.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
