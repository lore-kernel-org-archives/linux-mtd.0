Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dIazh-0002yi-Es
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 13:27:33 +0000
Date: Wed, 7 Jun 2017 15:26:58 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao
 Dong <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH v5 06/23] mtd: nand: denali: set
 NAND_ECC_CUSTOM_PAGE_ACCESS
Message-ID: <20170607152658.51c90ba9@bbrezillon>
In-Reply-To: <1496836352-8016-7-git-send-email-yamada.masahiro@socionext.com>
References: <1496836352-8016-1-git-send-email-yamada.masahiro@socionext.com>
 <1496836352-8016-7-git-send-email-yamada.masahiro@socionext.com>
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

On Wed,  7 Jun 2017 20:52:15 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> The denali_cmdfunc() actually does nothing valuable for
> NAND_CMD_{PAGEPROG,READ0,SEQIN}.
> 
> For NAND_CMD_{READ0,SEQIN}, it copies "page" to "denali->page", then
> denali_read_page() and denali_read_page_raw() compare them to check
> if the NAND framework called the callbacks in correct order.
> (Inconsistently, this check is missing from the denali_write_page()
> and denali_write_page_raw().)
> 
> The framework is widely tested by many drivers, so this kind of
> sanity check is unneeded.  The Denali controller is equipped with
> high level interface for read/write, so let's skip unneeded call
> of cmdfunc().

I recently changed the semantic of ecc->write_page[_raw]() when
NAND_ECC_CUSTOM_PAGE_ACCESS is set [1]. I'm not sure your driver waits
for the program command to finish.
I think you should wait for INTR_STATUS__PROGRAM_COMP instead of
INTR_STATUS__DMA_CMD_COMP in write_page() [2], as is done in
write_oob_data().

Note that, even though you listen to INTR_STATUS__PROGRAM_FAIL, you
never test the value of irq_status when it != 0, which means you don't
detect PROG failures.

[1]http://git.infradead.org/l2-mtd.git/commit/41145649f4acb30249b636b945053db50c9331c5
[2]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/nand/denali.c#L1029

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
> 
> Changes in v5: None
> Changes in v4: None
> Changes in v3: None
> Changes in v2:
>   - Newly added
> 
>  drivers/mtd/nand/denali.c | 29 ++++++++---------------------
>  1 file changed, 8 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index 991924b9ae2c..1897fe238290 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -998,7 +998,7 @@ static void denali_setup_dma(struct denali_nand_info *denali, int op)
>   * configuration details.
>   */
>  static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
> -			const uint8_t *buf, bool raw_xfer)
> +			const uint8_t *buf, int page, bool raw_xfer)
>  {
>  	struct denali_nand_info *denali = mtd_to_denali(mtd);
>  	dma_addr_t addr = denali->buf.dma_buf;
> @@ -1006,6 +1006,8 @@ static int write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	uint32_t irq_status;
>  	uint32_t irq_mask = INTR__DMA_CMD_COMP | INTR__PROGRAM_FAIL;
>  
> +	denali->page = page;
> +
>  	/*
>  	 * if it is a raw xfer, we want to disable ecc and send the spare area.
>  	 * !raw_xfer - enable ecc
> @@ -1059,7 +1061,7 @@ static int denali_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	 * for regular page writes, we let HW handle all the ECC
>  	 * data written to the device.
>  	 */
> -	return write_page(mtd, chip, buf, false);
> +	return write_page(mtd, chip, buf, page, false);
>  }
>  
>  /*
> @@ -1075,7 +1077,7 @@ static int denali_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	 * for raw page writes, we want to disable ECC and simply write
>  	 * whatever data is in the buffer.
>  	 */
> -	return write_page(mtd, chip, buf, true);
> +	return write_page(mtd, chip, buf, page, true);
>  }
>  
>  static int denali_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
> @@ -1105,12 +1107,7 @@ static int denali_read_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	unsigned long uncor_ecc_flags = 0;
>  	int stat = 0;
>  
> -	if (page != denali->page) {
> -		dev_err(denali->dev,
> -			"IN %s: page %d is not equal to denali->page %d",
> -			__func__, page, denali->page);
> -		BUG();
> -	}
> +	denali->page = page;
>  
>  	setup_ecc_for_xfer(denali, true, false);
>  
> @@ -1154,12 +1151,7 @@ static int denali_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	size_t size = mtd->writesize + mtd->oobsize;
>  	uint32_t irq_mask = INTR__DMA_CMD_COMP;
>  
> -	if (page != denali->page) {
> -		dev_err(denali->dev,
> -			"IN %s: page %d is not equal to denali->page %d",
> -			__func__, page, denali->page);
> -		BUG();
> -	}
> +	denali->page = page;
>  
>  	setup_ecc_for_xfer(denali, false, true);
>  	denali_enable_dma(denali, true);
> @@ -1238,8 +1230,6 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
>  	int i;
>  
>  	switch (cmd) {
> -	case NAND_CMD_PAGEPROG:
> -		break;
>  	case NAND_CMD_STATUS:
>  		read_status(denali);
>  		break;
> @@ -1259,10 +1249,6 @@ static void denali_cmdfunc(struct mtd_info *mtd, unsigned int cmd, int col,
>  			write_byte_to_buf(denali, id);
>  		}
>  		break;
> -	case NAND_CMD_READ0:
> -	case NAND_CMD_SEQIN:
> -		denali->page = page;
> -		break;
>  	case NAND_CMD_RESET:
>  		reset_bank(denali);
>  		break;
> @@ -1603,6 +1589,7 @@ int denali_init(struct denali_nand_info *denali)
>  
>  	mtd_set_ooblayout(mtd, &denali_ooblayout_ops);
>  
> +	chip->ecc.options |= NAND_ECC_CUSTOM_PAGE_ACCESS;
>  	chip->ecc.read_page = denali_read_page;
>  	chip->ecc.read_page_raw = denali_read_page_raw;
>  	chip->ecc.write_page = denali_write_page;
