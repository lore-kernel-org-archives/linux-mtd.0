Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1siA-0001tK-Bn
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 12:33:16 +0000
Date: Mon, 17 Sep 2018 14:32:44 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] mtd: rawnand: denali: fix a race condition when DMA is
 kicked
Message-ID: <20180917143244.2e55fbac@bbrezillon>
In-Reply-To: <1536818329-11068-1-git-send-email-yamada.masahiro@socionext.com>
References: <1536818329-11068-1-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 13 Sep 2018 14:58:49 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> I thought the read-back of the DMA_ENABLE register was unnecessary
> (at least it is working on my boards), then deleted it in commit
> 586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helper
> into caller").  Sorry, I was wrong - it caused a timing issue on
> Cyclone5 SoCFPGAs.
> 
> Revive the register read-back, commenting why this is necessary.
> 
> Fixes: 586a2c52909d ("mtd: nand: denali: squash denali_enable_dma() helper into caller")
> Reported-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Queued to master.

Thanks,

Boris

> ---
> 
>  drivers/mtd/nand/raw/denali.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
> index 67b2065..b864b93 100644
> --- a/drivers/mtd/nand/raw/denali.c
> +++ b/drivers/mtd/nand/raw/denali.c
> @@ -596,6 +596,12 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
>  	}
>  
>  	iowrite32(DMA_ENABLE__FLAG, denali->reg + DMA_ENABLE);
> +	/*
> +	 * The ->setup_dma() hook kicks DMA by using the data/command
> +	 * interface, which belongs to a different AXI port from the
> +	 * register interface.  Read back the register to avoid a race.
> +	 */
> +	ioread32(denali->reg + DMA_ENABLE);
>  
>  	denali_reset_irq(denali);
>  	denali->setup_dma(denali, dma_addr, page, write);
