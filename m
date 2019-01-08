Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggmly-0005k0-HW
 for linux-mtd@lists.infradead.org; Tue, 08 Jan 2019 08:30:12 +0000
From: Boris Brezillon <bbrezillon@kernel.org>
To: Boris Brezillon <bbrezillon@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Subject: Re: [2/2] mtd: Check add_mtd_device() ret code
Date: Tue,  8 Jan 2019 09:29:59 +0100
Message-Id: <20190108082959.20870-1-bbrezillon@kernel.org>
In-Reply-To: <20190102143654.24362-2-bbrezillon@kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Boris Brezillon <boris.brezillon@bootlin.com>

On Wed, 2019-01-02 at 14:36:54 UTC, Boris Brezillon wrote:
> add_mtd_device() can fail. We should always check its return value
> and gracefully handle the failure case. Fix the call sites where this
> not done (in mtdpart.c) and add a __must_check attribute to the
> prototype to avoid this kind of mistakes.
> 
> Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
