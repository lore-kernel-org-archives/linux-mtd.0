Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxJAs-0005dS-BK
 for linux-mtd@lists.infradead.org; Tue, 04 Sep 2018 21:47:52 +0000
Date: Tue, 4 Sep 2018 23:47:27 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH 0/2] mtd: rawnand: Make ->dev_ready() and ->chip_delay
 optional
Message-ID: <20180904234727.39f1d249@xps13>
In-Reply-To: <20180727074418.32384-1-boris.brezillon@bootlin.com>
References: <20180727074418.32384-1-boris.brezillon@bootlin.com>
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

Hi Boris,

Boris Brezillon <boris.brezillon@bootlin.com> wrote on Fri, 27 Jul 2018
09:44:16 +0200:

> Hello,
> 
> These 2 patches remove the last dependency we had on ->dev_ready() and
> ->chip_delay when ->exec_op() is defined. Will be needed to deprecate  
> both fields, which is about to happen (see this branch [1] if you want
> to have the big picture).
> 
> Regards,
> 
> Boris
> 
> [1]https://github.com/bbrezillon/linux-0day/commits/nand/api-cleanup
> 
> Boris Brezillon (2):
>   mtd: rawnand: Add the nand_wait_readrdy() helper and use it
>   mtd: rawnand: Add the nand_wait_rdy_op() helper and use it
> 
>  drivers/mtd/nand/raw/nand_base.c | 49 ++++++++++++++++++++++++++++------------
>  1 file changed, 35 insertions(+), 14 deletions(-)
> 

Applied to nand/next.
Thanks

-- 
Miquel Raynal, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
