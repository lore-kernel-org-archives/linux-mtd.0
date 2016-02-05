Received: from mail-qg0-x231.google.com ([2607:f8b0:400d:c04::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRpUC-0004Eu-7d
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2016 23:08:21 +0000
Received: by mail-qg0-x231.google.com with SMTP id y9so75903418qgd.3
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2016 15:07:58 -0800 (PST)
Date: Fri, 5 Feb 2016 20:07:54 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Lior Amsalem <alior@marvell.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 Nadav Haklai <nadavh@marvell.com>, linux-mtd@lists.infradead.org,
 Ofer Heifetz <oferh@marvell.com>
Subject: Re: [PATCH] mtd: nand: pxa3xx_nand: add support for partial chunks
Message-ID: <20160205230754.GB4329@laptop.cereza>
References: <1453901520-4621-1-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1453901520-4621-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thomas,

Thanks for working on this. Looks mostly good, just a couple minor
comments below.

Robert: Do you think you can take a look and test on PXA?

On 27 Jan 02:32 PM, Thomas Petazzoni wrote:
> This commit is needed to properly support the 8-bits ECC configuration
> with 4KB pages.
> 
> When pages larger than 2 KB are used on platforms using the PXA3xx
> NAND controller, the reading/programming operations need to be split
> in chunks of 2 KBs or less because the controller FIFO is limited to
> about 2 KB (i.e a bit more than 2 KB to accomodate OOB data). Due to
> this requirement, the data layout on NAND is a bit strange, with ECC
> interleaved with data, at the end of each chunk.
> 
> When a 4-bits ECC configuration is used with 4 KB pages, the physical
> data layout on the NAND looks like this:
> 
> | 2048 data | 32 spare | 30 ECC | 2048 data | 32 spare | 30 ECC |
> 
> So the data chunks have an equal size, 2080 bytes for each chunk,
> which the driver supports properly.
> 
> When a 8-bits ECC configuration is used with 4KB pages, the physical
> data layout on the NAND looks like this:
> 
> | 1024 data | 30 ECC | 1024 data | 30 ECC | 1024 data | 30 ECC | 1024 data | 30 ECC | 64 spare | 30 ECC |
> 
> So, the spare area is stored in its own chunk, which has a different
> size than the other chunks. Since OOB is not used by UBIFS, the initial
> implementation of the driver has chosen to not support reading this
> additional "spare" chunk of data.
> 
> Unfortunately, Marvell has chosen to store the BBT signature in the
> OOB area. Therefore, if the driver doesn't read this spare area, Linux
> has no way of finding the BBT. It thinks there is no BBT, and rewrites
> one, which U-Boot does not recognize, causing compability problem
> between the bootloader and the kernel in terms of NAND usage.
> 
> To fix this, this commit implements the support for reading a partial
> last chunk. This support is currently only useful for the case of 8
> bits ECC with 4 KB pages, but it will be useful in the future to
> enable other configurations such as 12 bits and 16 bits ECC with 4 KB
> pages, or 8 bits ECC with 8 KB pages, etc. All those configurations
> have a "last" chunk that doesn't have the same size as the other
> chunks.
> 
> In order to implement reading of the last chunk, this commit:
> 
>  - Adds a number of new fields to the pxa3xx_nand_info to describe how
>    many full chunks and how many chunks we have, the size of full
>    chunks and partial chunks, both in terms of data area and spare
>    area.
> 
>  - Fills in the step_chunk_size and step_spare_size variables to
>    describe how much data and spare should be read/written for the
>    current read/program step.
> 
>  - Reworks the state machine to accommodate doing the additional read
>    or program step when a last partial chunk is used.
> 
> This commit has been tested on a Marvell Armada 398 DB board, with a
> 4KB page NAND, tested in both 4 bits ECC and 8 bits ECC
> configurations. Testing on other platforms (with 512 bytes and 2 KB
> pages) would be useful.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This patch is really a fix, but since it is a quite complicated
> change, I don't think it should be pushed to the stable backports. The
> changes are too invasive to qualify as a stable backport IMO.
> 
>  drivers/mtd/nand/pxa3xx_nand.c | 147 ++++++++++++++++++++++++++---------------
>  1 file changed, 95 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 86fc245..4293ea7 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -222,15 +222,44 @@ struct pxa3xx_nand_info {
>  	int			use_spare;	/* use spare ? */
>  	int			need_wait;
>  
> -	unsigned int		data_size;	/* data to be read from FIFO */
> -	unsigned int		chunk_size;	/* split commands chunk size */
> -	unsigned int		oob_size;
> +	/* Amount of real data per full chunk */
> +	unsigned int		chunk_size;
> +
> +	/* Amount of spare data per full chunk */
>  	unsigned int		spare_size;
> +
> +	/* Number of full chunks (i.e chunk_size + spare_size) */
> +	unsigned int            nfullchunks;
> +
> +	/*
> +	 * Total number of chunks. If equal to nfullchunks, then there
> +	 * are only full chunks. Otherwise, there is one last chunk of
> +	 * size (last_chunk_size + last_spare_size)
> +	 */
> +	unsigned int            ntotalchunks;
> +
> +	/* Amount of real data in the last chunk */
> +	unsigned int		last_chunk_size;
> +
> +	/* Amount of spare data in the last chunk */
> +	unsigned int		last_spare_size;
> +
>  	unsigned int		ecc_size;
>  	unsigned int		ecc_err_cnt;
>  	unsigned int		max_bitflips;
>  	int 			retcode;
>  
> +	/*
> +	 * Variables only valid during command
> +	 * execution. step_chunk_size and step_spare_size is the
> +	 * amount of real data and spare data in the current
> +	 * chunk. cur_chunk is the current chunk being
> +	 * read/programmed.
> +	 */
> +	unsigned int		step_chunk_size;
> +	unsigned int		step_spare_size;
> +	unsigned int            cur_chunk;
> +
>  	/* cached register value */
>  	uint32_t		reg_ndcr;
>  	uint32_t		ndtr0cs0;
> @@ -526,25 +555,6 @@ static int pxa3xx_nand_init(struct pxa3xx_nand_host *host)
>  	return 0;
>  }
>  
> -/*
> - * Set the data and OOB size, depending on the selected
> - * spare and ECC configuration.
> - * Only applicable to READ0, READOOB and PAGEPROG commands.
> - */
> -static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info,
> -				struct mtd_info *mtd)
> -{
> -	int oob_enable = info->reg_ndcr & NDCR_SPARE_EN;
> -
> -	info->data_size = mtd->writesize;
> -	if (!oob_enable)
> -		return;
> -
> -	info->oob_size = info->spare_size;
> -	if (!info->use_ecc)
> -		info->oob_size += info->ecc_size;
> -}
> -
>  /**
>   * NOTE: it is a must to set ND_RUN firstly, then write
>   * command buffer, otherwise, it does not work.
> @@ -660,28 +670,26 @@ static void drain_fifo(struct pxa3xx_nand_info *info, void *data, int len)
>  
>  static void handle_data_pio(struct pxa3xx_nand_info *info)
>  {
> -	unsigned int do_bytes = min(info->data_size, info->chunk_size);
> -
>  	switch (info->state) {
>  	case STATE_PIO_WRITING:


>  		writesl(info->mmio_base + NDDB,
>  			info->data_buff + info->data_buff_pos,
> -			DIV_ROUND_UP(do_bytes, 4));
> +			DIV_ROUND_UP(info->step_chunk_size, 4));

Maybe we should check if step_chunk_size > 0 before calling writesl?
As far as I can see, we'll now call this to read spare only,
and it would be better not to rely in writesl checking the length.

>  
> -		if (info->oob_size > 0)
> +		if (info->step_spare_size)
>  			writesl(info->mmio_base + NDDB,
>  				info->oob_buff + info->oob_buff_pos,
> -				DIV_ROUND_UP(info->oob_size, 4));
> +				DIV_ROUND_UP(info->step_spare_size, 4));
>  		break;
>  	case STATE_PIO_READING:
>  		drain_fifo(info,
>  			   info->data_buff + info->data_buff_pos,
> -			   DIV_ROUND_UP(do_bytes, 4));
> +			   DIV_ROUND_UP(info->step_chunk_size, 4));
>  
> -		if (info->oob_size > 0)
> +		if (info->step_spare_size)
>  			drain_fifo(info,
>  				   info->oob_buff + info->oob_buff_pos,
> -				   DIV_ROUND_UP(info->oob_size, 4));
> +				   DIV_ROUND_UP(info->step_spare_size, 4));
>  		break;
>  	default:
>  		dev_err(&info->pdev->dev, "%s: invalid state %d\n", __func__,
> @@ -1236,22 +1259,30 @@ static void nand_cmdfunc_extended(struct mtd_info *mtd,
>  			break;
>  		}
>  
> +		/* Only a few commands new several steps */

s/new/need ?
 
> +		if (command != NAND_CMD_PAGEPROG &&
> +		    command != NAND_CMD_READ0    &&
> +		    command != NAND_CMD_READOOB)
> +			break;
> +
> +		info->cur_chunk++;
> +


-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
