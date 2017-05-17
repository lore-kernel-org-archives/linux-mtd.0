Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAuej-0003il-Rp
 for linux-mtd@lists.infradead.org; Wed, 17 May 2017 08:50:06 +0000
Date: Wed, 17 May 2017 10:49:30 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 3/3] mtd: nand: Drop the ->errstat() hook
Message-ID: <20170517104930.28d14910@bbrezillon>
In-Reply-To: <1494886663-20700-4-git-send-email-boris.brezillon@free-electrons.com>
References: <1494886663-20700-1-git-send-email-boris.brezillon@free-electrons.com>
 <1494886663-20700-4-git-send-email-boris.brezillon@free-electrons.com>
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

On Tue, 16 May 2017 00:17:43 +0200
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> TODO: add a real commit message

Duh. Forgot to add a real commit message here :-).

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 16 ----------------
>  include/linux/mtd/nand.h     |  5 -----
>  2 files changed, 21 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 6eba5ba51c90..8dafd2a54e11 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2577,14 +2577,6 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
>  	if (nand_standard_page_accessors(&chip->ecc))
>  		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
>  	status = chip->waitfunc(mtd, chip);
> -	/*
> -	 * See if operation failed and additional status checks are
> -	 * available.
> -	 */
> -	if ((status & NAND_STATUS_FAIL) && (chip->errstat))
> -		status = chip->errstat(mtd, chip, FL_WRITING, status,
> -				       page);
> -
>  	if (status & NAND_STATUS_FAIL)
>  		return -EIO;
>  
> @@ -3044,14 +3036,6 @@ int nand_erase_nand(struct mtd_info *mtd, struct erase_info *instr,
>  
>  		status = chip->erase(mtd, page & chip->pagemask);
>  
> -		/*
> -		 * See if operation failed and additional status checks are
> -		 * available
> -		 */
> -		if ((status & NAND_STATUS_FAIL) && (chip->errstat))
> -			status = chip->errstat(mtd, chip, FL_ERASING,
> -					       status, page);
> -
>  		/* See if block erase succeeded */
>  		if (status & NAND_STATUS_FAIL) {
>  			pr_debug("%s: failed erase, page 0x%08x\n",
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 9ca3ad20faea..2dcdd07e7810 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -819,9 +819,6 @@ struct nand_manufacturer_ops {
>   *			structure which is shared among multiple independent
>   *			devices.
>   * @priv:		[OPTIONAL] pointer to private chip data
> - * @errstat:		[OPTIONAL] hardware specific function to perform
> - *			additional error status checks (determine if errors are
> - *			correctable).
>   * @manufacturer:	[INTERN] Contains manufacturer information
>   */
>  
> @@ -845,8 +842,6 @@ struct nand_chip {
>  	int(*waitfunc)(struct mtd_info *mtd, struct nand_chip *this);
>  	int (*erase)(struct mtd_info *mtd, int page);
>  	int (*scan_bbt)(struct mtd_info *mtd);
> -	int (*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state,
> -			int status, int page);
>  	int (*onfi_set_features)(struct mtd_info *mtd, struct nand_chip *chip,
>  			int feature_addr, uint8_t *subfeature_para);
>  	int (*onfi_get_features)(struct mtd_info *mtd, struct nand_chip *chip,
