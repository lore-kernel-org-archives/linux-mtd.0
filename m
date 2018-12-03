Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1d-0008Av-Jm
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:52:21 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [2/2] mtd: fix Coverity integer handling issue
Date: Mon,  3 Dec 2018 08:52:06 +0100
Message-Id: <20181203075206.28845-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181118201831.11636-2-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2018-11-18 at 20:18:31 UTC, Miquel Raynal wrote:
> A Coverity robot reported an integer handling issue
> (OVERFLOW_BEFORE_WIDEN) in the potentially overflowing expression:
> 
>     (mtd_div_by_ws(mtd->size, mtd) - mtd_div_by_ws(offs, mtd)) *
>     mtd_oobavail(mtd, ops)
> 
> While such overflow will certainly never happen due to the numbers
> handled, it is cleaner to fix this operation anyway.
> 
> The problem is that all the maths include 32-bit quantities, while the
> result is stored in an explicit 64-bit value.
> 
> As maxooblen will just be compared with a size_t, let's change the
> type of the variable to a size_t. This will not fix anything but will
> clarify a bit the situation. Then, do an explicit cast to fix Coverity
> warning.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
