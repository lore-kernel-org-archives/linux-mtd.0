Received: from smtp.nokia.com ([131.228.20.172] helo=mgw-ext13.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H4dFH-0000Zq-EW
	for linux-mtd@lists.infradead.org; Wed, 10 Jan 2007 08:12:02 -0500
Message-ID: <45A4E5E8.1050108@nokia.com>
Date: Wed, 10 Jan 2007 15:11:04 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: kyungmin.park@samsung.com
Subject: Re: [PATCH] OneNAND: Use address instead block, page in bufferram
References: <32289320.317881168308612503.JavaMail.weblogic@ep_ml29>
In-Reply-To: <32289320.317881168308612503.JavaMail.weblogic@ep_ml29>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> [PATCH] OneNAND: Use address instead of block, page in bufferram
>
> we use the address itself instead of block, page in bufferam.
>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> --
>
>
> @@ -587,19 +601,18 @@ static int onenand_write_bufferram(struct mtd_info *mtd, int area,
>  static int onenand_check_bufferram(struct mtd_info *mtd, loff_t addr)
>  {
>  	struct onenand_chip *this = mtd->priv;
> -	int block, page;
>  	int i;
> +#ifdef DEBUG_BUFFERRAM
> +	int block, page;
>  
>  	block = (int) (addr >> this->erase_shift);
> -	page = (int) (addr >> this->page_shift);
> -	page &= this->page_mask;
> +	page = (int) (addr >> this->page_shift) & this->page_mask;
> +#endif
>  
>  	i = ONENAND_CURRENT_BUFFERRAM(this);
>  
>  	/* Is there valid data? */
> -	if (this->bufferram[i].block == block &&
> -	    this->bufferram[i].page == page &&
> -	    this->bufferram[i].valid)
> +	if (this->bufferram[i].addr == addr && this->bufferram[i].valid)
>  		return 1;
>  
>  	return 0;
> @@ -617,24 +630,25 @@ static int onenand_update_bufferram(struct mtd_info *mtd, loff_t addr,
>  		int valid)
>  {
>  	struct onenand_chip *this = mtd->priv;
> -	int block, page;
>  	int i;
> +#ifdef DEBUG_BUFFERRAM
> +	int block, page;
>  
>  	block = (int) (addr >> this->erase_shift);
> -	page = (int) (addr >> this->page_shift);
> -	page &= this->page_mask;
> +	page = (int) (addr >> this->page_shift) & this->page_mask;
> +#endif
>  
>  	/* Invalidate BufferRAM */
>  	for (i = 0; i < MAX_BUFFERRAM; i++) {
> -		if (this->bufferram[i].block == block &&
> -		    this->bufferram[i].page == page)
> +		if (this->bufferram[i].addr == addr) {
>  			this->bufferram[i].valid = 0;
> +			break;
> +		}
>  	}
>  
>  	/* Update BufferRAM */
>  	i = ONENAND_CURRENT_BUFFERRAM(this);
> -	this->bufferram[i].block = block;
> -	this->bufferram[i].page = page;
> +	this->bufferram[i].addr = addr;
>  	this->bufferram[i].valid = valid;
>  
>  	return 0;
> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index f775a7a..46e052f 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -47,9 +47,8 @@ typedef enum {
>   * @valid:		valid flag
>   */
>  struct onenand_bufferram {
> -	int block;
> -	int page;
> -	int valid;
> +	loff_t		addr;
> +	int		valid;
>  };
>  
>  /**
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>   
It seems to me that this patch would cause un-necessary loads.  For example:

first read at address 0x00000000
then read at address 0x00000010

The second read would load to bufferRAM because the address is different,
even though the page is already there because of the first read.

I am not sure this patch is needed.

Regards
Adrian
