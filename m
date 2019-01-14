Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gixxj-0005fI-Pw
 for linux-mtd@lists.infradead.org; Mon, 14 Jan 2019 08:51:17 +0000
Date: Mon, 14 Jan 2019 09:51:05 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: fsmc: Keep bank enable bit set
Message-ID: <20190114095105.4e2b5c5a@bbrezillon>
In-Reply-To: <20190109215144.15749-1-linus.walleij@linaro.org>
References: <20190109215144.15749-1-linus.walleij@linaro.org>
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

Hi Linus,

On Wed,  9 Jan 2019 22:51:44 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> Hammering the "bank enable" (PBKEN) bit on and off between
> every command crashes the Nomadik NHK15 with this message:
> 
> Scanning device for bad blocks
> Unhandled fault: external abort on non-linefetch (0x008) at 0xcc95e000
> pgd = (ptrval)
> [cc95e000] *pgd=0b808811, *pte=40000653, *ppte=40000552
> Internal error: : 8 [#1] PREEMPT ARM
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper Not tainted 4.20.0-rc2+ #72
> Hardware name: Nomadik STn8815
> PC is at fsmc_exec_op+0x194/0x204
> (...)
> 
> After a discussion we (me and Boris Brezillion) start to suspect
> that this bit does not immediately control the chip select line
> at all, it rather enables access to the bank and the hardware
> will drive the CS autonomously. If there is a NAND chip connected,
> we should keep this enabled.
> 
> As fsmc_nand_setup() sets this bit, we can simply remove the
> offending code.
> 
> Fixes: 550b9fc4e3af ("mtd: rawnand: fsmc: Stop implementing ->select_chip()")
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mtd/nand/raw/fsmc_nand.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
> index 325b4414dccc..c9149a37f8f0 100644
> --- a/drivers/mtd/nand/raw/fsmc_nand.c
> +++ b/drivers/mtd/nand/raw/fsmc_nand.c
> @@ -593,23 +593,6 @@ static void fsmc_write_buf_dma(struct fsmc_nand_data *host, const u8 *buf,
>  	dma_xfer(host, (void *)buf, len, DMA_TO_DEVICE);
>  }
>  
> -/* fsmc_select_chip - assert or deassert nCE */
> -static void fsmc_ce_ctrl(struct fsmc_nand_data *host, bool assert)
> -{
> -	u32 pc = readl(host->regs_va + FSMC_PC);
> -
> -	if (!assert)
> -		writel_relaxed(pc & ~FSMC_ENABLE, host->regs_va + FSMC_PC);
> -	else
> -		writel_relaxed(pc | FSMC_ENABLE, host->regs_va + FSMC_PC);
> -
> -	/*
> -	 * nCE line changes must be applied before returning from this
> -	 * function.
> -	 */
> -	mb();
> -}
> -
>  /*
>   * fsmc_exec_op - hook called by the core to execute NAND operations
>   *
> @@ -627,8 +610,6 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
>  
>  	pr_debug("Executing operation [%d instructions]:\n", op->ninstrs);
>  
> -	fsmc_ce_ctrl(host, true);
> -
>  	for (op_id = 0; op_id < op->ninstrs; op_id++) {
>  		instr = &op->instrs[op_id];
>  
> @@ -686,8 +667,6 @@ static int fsmc_exec_op(struct nand_chip *chip, const struct nand_operation *op,
>  		}
>  	}
>  
> -	fsmc_ce_ctrl(host, false);
> -
>  	return ret;
>  }
>  

Not related to this patch, but I think we're missing a nand_reset()
call in the ->resume() path. Without it FSMC timings might be wrong
after a suspend if they're not defined in the DT. Would you mind sending
another patch to fix that, and maybe an extra patch to clear
FSMC_ENABLE in the ->remove() path and the ->probe()'s error path as
you suggested?

Thanks,

Boris
