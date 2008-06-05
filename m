Date: Thu, 5 Jun 2008 22:28:58 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: [RFC/PATCH 3/3] NAND multiple plane feature 
In-Reply-To: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
Message-ID: <alpine.LFD.1.10.0806052203520.3235@apollo.tec.linutronix.de>
References: <alpine.LFD.1.10.0805281410030.23606@pentafluge.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, joern@logfs.org, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 28 May 2008, Alexey Korolev wrote:
> @@ -748,12 +750,13 @@ static int nand_wait(struct mtd_info *mt
>   * @mtd:	mtd info structure
>   * @chip:	nand chip info structure
>   * @buf:	buffer to store read data
> + * @oobbuf:	buffer to store read oob
>   */
>  static int nand_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
> -			      uint8_t *buf)
> +			      uint8_t *buf, uint8_t *oobbuf)

Why is this change necessary ?

> -			if (ret < 0)
> -				break;
> +			nand_read_operations(mtd, chip, bufpoi, from, bytes, sndcmd, (ops->mode == MTD_OOB_RAW));

sigh

>  
>  			/* Transfer not aligned data */
>  			if (!aligned) {
>  				chip->pagebuf = realpage;
>  				memcpy(buf, chip->buffers->databuf + col, bytes);
>  			}
> -
>  			buf += bytes;
> +			from += bytes;
>  
>  			if (unlikely(oob)) {
>  				/* Raw mode does data:oob:data:oob */
>  				if (ops->mode != MTD_OOB_RAW) {
> -					int toread = min(oobreadlen,
> -						chip->ecc.layout->oobavail);
> +					int toread = min(oobreadlen, chip->ecc.layout->oobavail);

  what's the effective change ?

>  					if (toread) {
> -						oob = nand_transfer_oob(chip,
> -							oob, ops, toread);
> +						oob = nand_transfer_oob(chip, oob, ops, toread);

  ditto


>  						oobreadlen -= toread;
>  					}
>  				} else
> -					buf = nand_transfer_oob(chip,
> -						buf, ops, mtd->oobsize);
> +					buf = nand_transfer_oob(chip, buf, ops, mtd->oobsize);

  ditto

>  		readlen -= bytes;
> @@ -1125,11 +1181,21 @@ static int nand_read(struct mtd_info *mt
>  static int nand_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
>  			     int page, int sndcmd)
>  {
> -	if (sndcmd) {
> -		chip->cmdfunc(mtd, NAND_CMD_READOOB, 0, page);
> -		sndcmd = 0;
> +	int i = 0;
> +	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
> +	int start_block = (page & ~block_mask) * chip->numplanes;
> +	int page_num = page & block_mask;
> +
> +	while (i < chip->numplanes) {

  for (i = 0; .....

> @@ -1181,15 +1247,30 @@ static int nand_read_oob_syndrome(struct
>  static int nand_write_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
>  			      int page)
>  {
> +	int i = 0;
>  	int status = 0;
>  	const uint8_t *buf = chip->oob_poi;
> -	int length = mtd->oobsize;
> -
> -	chip->cmdfunc(mtd, NAND_CMD_SEQIN, mtd->writesize, page);
> -	chip->write_buf(mtd, buf, length);
> -	/* Send command to program the OOB data */
> -	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> -
> +	int length = chip->oob_phys_size;
> +	int block_mask = (1 << (chip->erase_shift - chip->page_shift)) - 1;
> +	int start_block = (page & ~block_mask) * chip->numplanes;
> +	int page_num = page & block_mask;
> +
> +	/* calculate physycal page at first plane */
> +	while (i < chip->numplanes) {
> +		page = start_block + page_num + (block_mask + 1) * i;
> +		chip->cmdfunc(mtd, NAND_CMD_SEQIN, chip->page_phys_size, page);
> +		chip->write_buf(mtd, buf + length * i, length);
> +		/* Send command to program the OOB data */
> +		i++;
> +		if (i < chip->numplanes) {
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG_MP, -1, -1);
> +			if (!chip->dev_ready)
> +				udelay(chip->chip_delay);
> +			else
> +				nand_wait_ready(mtd);
> +		} else
> +			chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
> +	}
>  	status = chip->waitfunc(mtd, chip);

Sigh. There is one call site for this and there we can do the whole
numplanes hackery in 5 lines of code and extend the function with a
parameter which command to use. Which also allows those driver which
have their own function to utilize the multiplane features.

> @@ -269,16 +270,16 @@ struct nand_ecc_ctrl {
>  					   uint8_t *calc_ecc);
>  	int			(*read_page_raw)(struct mtd_info *mtd,
>  						 struct nand_chip *chip,
> -						 uint8_t *buf);
> +						 uint8_t *buf, uint8_t *oobbuf);
>  	void			(*write_page_raw)(struct mtd_info *mtd,
>  						  struct nand_chip *chip,
> -						  const uint8_t *buf);
> +						  const uint8_t *buf, uint8_t *oobbuf);
>  	int			(*read_page)(struct mtd_info *mtd,
>  					     struct nand_chip *chip,
> -					     uint8_t *buf);
> +					     uint8_t *buf, uint8_t *oobbuf);
>  	void			(*write_page)(struct mtd_info *mtd,
>  					      struct nand_chip *chip,
> -					      const uint8_t *buf);
> +					      const uint8_t *buf, uint8_t *oobbuf);
>  	int			(*read_oob)(struct mtd_info *mtd,
>  					    struct nand_chip *chip,
>  					    int page,
> @@ -362,7 +363,6 @@ struct nand_buffers {
>   * @priv:		[OPTIONAL] pointer to private chip date
>   * @errstat:		[OPTIONAL] hardware specific function to perform additional error status checks
>   *			(determine if errors are correctable)
> - * @write_page:		[REPLACEABLE] High-level page write function
>   */
>  
>  struct nand_chip {
> @@ -385,8 +385,6 @@ struct nand_chip {
>  	void		(*erase_cmd)(struct mtd_info *mtd, int page);
>  	int		(*scan_bbt)(struct mtd_info *mtd);
>  	int		(*errstat)(struct mtd_info *mtd, struct nand_chip *this, int state, int status, int page);
> -	int		(*write_page)(struct mtd_info *mtd, struct nand_chip *chip,
> -				      const uint8_t *buf, int page, int cached, int raw);
>  
>  	int		chip_delay;
>  	unsigned int	options;> 

All the above changes break existing drivers.

The whole multiplane stuff needs to be done at the highest possible
level of the nand driver and not pushed down into the low level
functions, which access the hardware.

Thanks,
	tglx
