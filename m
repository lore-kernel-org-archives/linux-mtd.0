Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cBlYj-0005r0-It
 for linux-mtd@lists.infradead.org; Tue, 29 Nov 2016 16:47:10 +0000
Subject: Re: [PATCH 2/3] mtd: spi-nor: Implement die erase command logic
To: <marcin.krzeminski@nokia.com>, <linux-mtd@lists.infradead.org>
References: <1477314214-17718-1-git-send-email-marcin.krzeminski@nokia.com>
 <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
CC: <rfsw-patches@mlist.nokia.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <marek.vasut@gmail.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <7e94d439-114a-8827-9667-1472d3e4323a@atmel.com>
Date: Tue, 29 Nov 2016 17:46:45 +0100
MIME-Version: 1.0
In-Reply-To: <1477314214-17718-3-git-send-email-marcin.krzeminski@nokia.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marcin,

I know you have already answered some of my questions of IRC but I ask
them again here on the mailing list so everybody can benefit from your
answers.

Le 24/10/2016 à 15:03, marcin.krzeminski@nokia.com a écrit :
> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> 
> This commit implements die erase logic.
> Sector at a time procedure is moved to function,
> then erase algorithm will try to use die erase cmd
> if size and address cover one or more dies.
> 

I'm reading your v2 series but indeed I try to understand the purpose of the
series simply because I don't know what does die erase do as compared to chip
erase of sector erase.
Is you series a bug fix or an optmization, maybe both?

Best regards,

Cyrille

> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 90 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 3afe207..17bbec0 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -360,6 +360,29 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  	return nor->write_reg(nor, nor->erase_opcode, buf, nor->addr_width);
>  }
>  
> +static inline int spi_nor_sector_at_time_erase(struct mtd_info *mtd, u32 addr, u32 len)
> +{
> +	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> +	int ret = 0;
> +
> +	while (len) {
> +		write_enable(nor);
> +
> +		ret = spi_nor_erase_sector(nor, addr);
> +		if (ret)
> +			return ret;
> +
> +		addr += mtd->erasesize;
> +		len -= mtd->erasesize;
> +
> +		ret = spi_nor_wait_till_ready(nor);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return ret;
> +}
> +
>  /*
>   * Erase an address range on the nor chip.  The address range may extend
>   * one or more erase sectors.  Return an error is there is a problem erasing.
> @@ -367,9 +390,11 @@ static int spi_nor_erase_sector(struct spi_nor *nor, u32 addr)
>  static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  {
>  	struct spi_nor *nor = mtd_to_spi_nor(mtd);
> -	u32 addr, len;
> +	u32 addr, len, die_no, die_size;
>  	uint32_t rem;
>  	int ret;
> +	unsigned long timeout;
> +	u8 die_erase = nor->die_cnt && SNOR_F_DIE_ERASE;
>  
>  	dev_dbg(nor->dev, "at 0x%llx, len %lld\n", (long long)instr->addr,
>  			(long long)instr->len);
> @@ -386,7 +411,7 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  		return ret;
>  
>  	/* whole-chip erase? */
> -	if (len == mtd->size) {
> +	if (len == mtd->size && !die_erase) {
>  		unsigned long timeout;
>  
>  		write_enable(nor);
> @@ -416,17 +441,58 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
>  
>  	/* "sector"-at-a-time erase */
>  	} else {
> -		while (len) {
> -			write_enable(nor);
> -
> -			ret = spi_nor_erase_sector(nor, addr);
> -			if (ret)
> +		if (die_erase) {
> +			die_size = div_u64_rem(mtd->size, nor->die_cnt, &rem);
> +			if (rem) {
> +				ret = -EINVAL;
>  				goto erase_err;
> -
> -			addr += mtd->erasesize;
> -			len -= mtd->erasesize;
> -
> -			ret = spi_nor_wait_till_ready(nor);
> +			}
> +			while (len) {
> +				die_no = div_u64_rem(addr, die_size, &rem);
> +
> +				/* Check if address is aligned to die begin*/
> +				if (!rem) {
> +					/* die erase? */
> +					if (len >= die_size) {
> +						ret = spi_nor_die_erase(nor, addr);
> +						if (ret)
> +							goto erase_err;
> +
> +						len -= die_size;
> +						addr += die_size;
> +
> +						timeout = max(CHIP_ERASE_2MB_READY_WAIT_JIFFIES,
> +								CHIP_ERASE_2MB_READY_WAIT_JIFFIES *
> +								(unsigned long)(die_size / SZ_2M));
> +						ret = spi_nor_wait_till_ready_with_timeout(nor, timeout);
> +						if (ret)
> +							goto erase_err;
> +					} else {
> +						ret = spi_nor_sector_at_time_erase(mtd, addr, len);
> +						if (ret)
> +							goto erase_err;
> +						len = 0;
> +					}
> +				} else {
> +					/* check if end address cover at least one die */
> +					if (div64_ul(addr + len, die_size) > ++die_no) {
> +						/* align to next die */
> +						rem = die_size - rem;
> +						ret = spi_nor_sector_at_time_erase(mtd, addr, rem);
> +						if (ret)
> +							goto erase_err;
> +						len -= rem;
> +						addr += rem;
> +					} else {
> +						ret = spi_nor_sector_at_time_erase(mtd, addr, len);
> +						if (ret)
> +							goto erase_err;
> +						len = 0;
> +					}
> +				}
> +			}
> +		} else {
> +			ret = spi_nor_sector_at_time_erase(mtd, addr, len);
>  			if (ret)
>  				goto erase_err;
>  		}
> 
