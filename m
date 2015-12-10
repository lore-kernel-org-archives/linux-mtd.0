Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a6qo1-0004tv-Uu
 for linux-mtd@lists.infradead.org; Thu, 10 Dec 2015 02:18:06 +0000
Received: by pacwq6 with SMTP id wq6so39038123pac.1
 for <linux-mtd@lists.infradead.org>; Wed, 09 Dec 2015 18:17:44 -0800 (PST)
Date: Wed, 9 Dec 2015 18:17:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-mtd@lists.infradead.org, Fabio Estevam <fabio.estevam@freescale.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Check the return value from read_sr()
Message-ID: <20151210021741.GF144338@google.com>
References: <1448043971-20230-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1448043971-20230-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 04:26:11PM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> We should better check the return value from read_sr() and
> propagate it in the case of error.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
> Changes since v1:
> - Change status_old and status_new to int (Brian).
> 
>  drivers/mtd/spi-nor/spi-nor.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 16c9f55..b5e505d 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -459,11 +459,13 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> -	u8 status_old, status_new;
> +	int status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
>  
>  	status_old = read_sr(nor);
> +	if (status_old < 0)
> +		return status_old;

This wasn't exactly what I was imagining (I figured have an 'int ret'
just for th error code, but still keep 'u8 status_{old,new}'), but still
looks good to me. Applied to l2-mtd.git. Thanks!

Brian

>  
>  	/* SPI NOR always locks to the end */
>  	if (ofs + len != mtd->size) {
> @@ -509,11 +511,13 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> -	uint8_t status_old, status_new;
> +	int status_old, status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
>  
>  	status_old = read_sr(nor);
> +	if (status_old < 0)
> +		return status_old;
>  
>  	/* Cannot unlock; would unlock larger region than requested */
>  	if (stm_is_locked_sr(nor, status_old, ofs - mtd->erasesize,
> @@ -1013,6 +1017,8 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	int ret, val;
>  
>  	val = read_sr(nor);
> +	if (val < 0)
> +		return val;
>  	write_enable(nor);
>  
>  	write_sr(nor, val | SR_QUAD_EN_MX);
> -- 
> 1.9.1
> 
