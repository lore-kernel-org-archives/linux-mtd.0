Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctbpq-0001Dq-Rj
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 15:18:05 +0000
Date: Thu, 30 Mar 2017 17:17:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH v3 18/37] mtd: nand: denali: do not propagate
 NAND_STATUS_FAIL to waitfunc()
Message-ID: <20170330171701.7c7d0ee2@bbrezillon>
In-Reply-To: <1490856383-31560-19-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-19-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 15:46:04 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Currently, the error handling of denali_write_page(_raw) is a bit
> complicated.  If the program command fails, NAND_STATUS_FAIL is set
> to the driver internal denali->status, then read out later by
> denali_waitfunc().
> 
> We can avoid it by exploiting the nand_write_page() implementation.
> If chip->ecc.write_page(_raw) returns negative code (i.e. -EIO), it
> errors out immediately.  This gives the same result as returning
> NAND_STATUS_FAIL from chip->waitfunc.  In either way, -EIO is
> returned to the upper MTD layer.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/denali.c | 12 ++++--------
>  drivers/mtd/nand/denali.h |  1 -
>  2 files changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 79851ca..5da8156 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1005,6 +1005,7 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	size_t size = mtd->writesize + mtd->oobsize;
>  	uint32_t irq_status;
>  	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
> +	int ret = 0;
>  
>  	denali->page = page;
>  
> @@ -1038,13 +1039,13 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (irq_status == 0) {
>  		dev_err(denali->dev, "timeout on write_page (type = %d)\n",
>  			raw_xfer);
> -		denali->status = NAND_STATUS_FAIL;
> +		ret = -EIO;
>  	}
>  
>  	denali_enable_dma(denali, false);
>  	dma_sync_single_for_cpu(denali->dev, addr, size, DMA_TO_DEVICE);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  /* NAND core entry points */
> @@ -1196,12 +1197,7 @@ static void denali_select_chip(struct mtd_info *mtd, int chip)
>  
>  static int denali_waitfunc(struct mtd_info *mtd, struct nand_chip *chip)
>  {
> -	struct denali_nand_info *denali = mtd_to_denali(mtd);
> -	int status = denali->status;
> -
> -	denali->status = 0;
> -
> -	return status;
> +	return 0;

I know it's not your fault, and the existing denali_waitfunc() is
already buggy, but it's definitely wrong to return 0 here without
checking the NAND status.

->waitfunc() is not only used to wait for a page-program operation,
it's used every time the NAND enters the busy state (lock, unlock,
set_features, ...).

Anyway, I'll review the remaining patches before taking a decision.

>  }
>  
>  static int denali_erase(struct mtd_info *mtd, int page)
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index 00ce04e..9e2b787 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -329,7 +329,6 @@ struct nand_buf {
>  struct denali_nand_info {
>  	struct nand_chip nand;
>  	int flash_bank; /* currently selected chip */
> -	int status;
>  	int platform;
>  	struct nand_buf buf;
>  	struct device *dev;
