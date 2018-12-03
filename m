Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj1d-0008GJ-M1
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:52:22 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [1/2] mtd: fix mtd_oobavail() incoherent returned value
Date: Mon,  3 Dec 2018 08:52:10 +0100
Message-Id: <20181203075210.28913-1-boris.brezillon@bootlin.com>
In-Reply-To: <20181118201831.11636-1-miquel.raynal@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2018-11-18 at 20:18:30 UTC, Miquel Raynal wrote:
> mtd_oobavail() returns either mtd->oovabail or mtd->oobsize. Both
> values are unsigned 32-bit entities, so there is no reason to pretend
> returning a signed one.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
