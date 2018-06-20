Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVY70-0003qW-8m
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 08:05:08 +0000
Date: Wed, 20 Jun 2018 10:04:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: micron: Update ecc_stats.corrected
Message-ID: <20180620100444.4f60f8dd@bbrezillon>
In-Reply-To: <20180620095843.7ec30e67@xps13>
References: <20180620074443.30235-1-boris.brezillon@bootlin.com>
 <20180620095843.7ec30e67@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 20 Jun 2018 09:58:43 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> On Wed, 20 Jun 2018 09:44:43 +0200, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> 
> > Even if we can't update ecc_stats.corrected with an accurate value we
> > should at least increase the number of bitflips so that MTD users can
> > know that there was some bitflips.
> > 
> > Just add chip->ecc.strength to mtd->ecc_stats.corrected which should
> > account for the worst case situation.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > ---  
> 
> Shouldn't we consider this change as a fix?

It's not really fixing a bug, in that ecc_stats.corrected are already
not accurate, they just give a hint about how often you fix bitflips
on a NAND device. But if you think it should be backported, I can add
the Fixes and Cc-stable tags.
