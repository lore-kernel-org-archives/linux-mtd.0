Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSfFH-0000V5-RO
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 09:38:01 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Schrempf Frieder <frieder.schrempf@kontron.de>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: mtd: nand: Fix memory allocation in nanddev_bbt_init()
Date: Fri, 30 Nov 2018 10:37:48 +0100
Message-Id: <20181130093748.5475-1-boris.brezillon@bootlin.com>
In-Reply-To: <1543304637-27308-1-git-send-email-frieder.schrempf@kontron.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2018-11-27 at 07:44:52 UTC, Schrempf Frieder wrote:
> Fix the size of the buffer allocated to store the in-memory BBT.
> This bug was previously hidden by a different bug, that was fixed in
> d098093ba06e.
> 
> Fixes: 9c3736a3de21 ("mtd: nand: Add core infrastructure to deal with NAND devices")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
