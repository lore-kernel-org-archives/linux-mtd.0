Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctcyK-0006wn-0Z
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 16:30:54 +0000
Date: Thu, 30 Mar 2017 18:30:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, David
 Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Dinh
 Nguyen <dinguyen@kernel.org>, Artem Bityutskiy
 <artem.bityutskiy@linux.intel.com>, Graham Moore
 <grmoore@opensource.altera.com>, Enrico Jorns <ejo@pengutronix.de>,
 Chuanxiao Dong <chuanxiao.dong@intel.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v3 32/37] mtd: nand: denali: support hardware-assisted
 erased page detection
Message-ID: <20170330183030.14acbb47@bbrezillon>
In-Reply-To: <1490861708-27813-2-git-send-email-yamada.masahiro@socionext.com>
References: <1490861708-27813-1-git-send-email-yamada.masahiro@socionext.com>
 <1490861708-27813-2-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 17:15:03 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Recent versions of this IP support automatic erased page detection.
> If an erased page is detected on reads, the controller does not set
> INTR__ECC_UNCOR_ERR, but INTR__ERASED_PAGE.  If this feature is
> supported, the driver can use this information instead of calling
> nand_check_erased_ecc_chunk().
> 
> The detection of erased page is based on the number of zeros in the
> page; if the number of zeros is less than the value in the field
> ERASED_THRESHOLD, the page is assumed as erased.
> 
> Set the ERASED_THRESHOLD to (chip->ecc.strength + 1).  This is the
> worst case where all the bitflips come from the same ECC sector.
> This field is Reserved for older IP versions, so this commit has
> no impact on them.

Do you have a way to know the actual number of bitflips in an erased
ECC block? BTW, is the threshold a per-page information or a per ECC
block information.

If you can't know the real number of bitflips I don't think it's safe
to set the threshold to chip->ecc.strength + 1.

You can still use the feature to detect erased pages without any
bitflips (set ERASED_THRESHOLD to 1), which should be the case most of
the time, but for cases where you have bitflips I'd recommend using
nand_check_erased_ecc_chunk() if you can't know the actual number of
bitflips in the page.

> 
> One thing worth mentioning is the driver still needs to fill the
> buffer with 0xff in the case because the ECC correction engine has
> already manipulated the data in the buffer.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/denali.c | 10 +++++++++-
>  drivers/mtd/nand/denali.h |  5 +++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 51e8a9a..9ee0f30 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -604,6 +604,9 @@ static int denali_pio_read(struct denali_nand_info *denali, void *buf,
>  	if (!(irq_status & INTR__PAGE_XFER_INC))
>  		return -EIO;
>  
> +	if (irq_status & INTR__ERASED_PAGE)
> +		memset(buf, 0xff, size);
> +
>  	return irq_status & ecc_err_mask ? -EBADMSG : 0;
>  }
>  
> @@ -676,6 +679,9 @@ static int denali_dma_xfer(struct denali_nand_info *denali, void *buf,
>  	denali_enable_dma(denali, false);
>  	dma_sync_single_for_cpu(denali->dev, dma_addr, size, dir);
>  
> +	if (irq_status & INTR__ERASED_PAGE)
> +		memset(buf, 0xff, size);
> +
>  	return ret;
>  }
>  
> @@ -1475,7 +1481,9 @@ int denali_init(struct denali_nand_info *denali)
>  	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
>  						chip->ecc.strength);
>  
> -	iowrite32(chip->ecc.strength, denali->flash_reg + ECC_CORRECTION);
> +	iowrite32(MAKE_ECC_CORRECTION(chip->ecc.strength,
> +				      chip->ecc.strength + 1),
> +		  denali->flash_reg + ECC_CORRECTION);
>  	iowrite32(mtd->erasesize / mtd->writesize,
>  		  denali->flash_reg + PAGES_PER_BLOCK);
>  	iowrite32(denali->nand.options & NAND_BUSWIDTH_16 ? 1 : 0,
> diff --git a/drivers/mtd/nand/denali.h b/drivers/mtd/nand/denali.h
> index f92b9db..b5ea8d7 100644
> --- a/drivers/mtd/nand/denali.h
> +++ b/drivers/mtd/nand/denali.h
> @@ -110,6 +110,10 @@
>  
>  #define ECC_CORRECTION				0x1b0
>  #define     ECC_CORRECTION__VALUE			GENMASK(4, 0)
> +#define     ECC_CORRECTION__ERASE_THRESHOLD		GENMASK(31, 16)
> +#define     MAKE_ECC_CORRECTION(val, thresh)		\
> +			(((val) & (ECC_CORRECTION__VALUE)) | \
> +			(((thresh) << 16) & (ECC_CORRECTION__ERASE_THRESHOLD)))
>  
>  #define READ_MODE				0x1c0
>  #define     READ_MODE__VALUE				GENMASK(3, 0)
> @@ -233,6 +237,7 @@
>  #define     INTR__RST_COMP				BIT(13)
>  #define     INTR__PIPE_CMD_ERR				BIT(14)
>  #define     INTR__PAGE_XFER_INC				BIT(15)
> +#define     INTR__ERASED_PAGE				BIT(16)
>  
>  #define PAGE_CNT(bank)				(0x430 + (bank) * 0x50)
>  #define ERR_PAGE_ADDR(bank)			(0x440 + (bank) * 0x50)
