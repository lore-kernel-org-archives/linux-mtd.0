Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzXAY-0005eU-Nu
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 21:55:07 +0000
Received: by pacdm15 with SMTP id dm15so93474976pac.3
 for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2015 13:54:46 -0800 (PST)
Date: Thu, 19 Nov 2015 13:54:43 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <fabio.estevam@freescale.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: Check the return value from read_sr()
Message-ID: <20151119215443.GK64635@google.com>
References: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447771824-9147-1-git-send-email-fabio.estevam@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 12:50:24PM -0200, Fabio Estevam wrote:
> We should better check the return value from read_sr() and
> propagate it in the case of error.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index 12041e1..4d858f7 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -459,11 +459,14 @@ static int stm_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
>  static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> -	u8 status_old, status_new;
> +	u8 status_new;
>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
> +	int status_old;

Hmm, by changing status_old from u8 to int, do we propagate any
sign-extension issues in this function? What if BIT(7) is set? If I
recall my C promotion/extension rules correctly, then I guess it's safe
(we get zero-extension, not sign-extension), but I wouldn't always put
my faith in my memory...

>  
>  	status_old = read_sr(nor);
> +	if (status_old < 0)
> +		return status_old;
>  
>  	/* SPI NOR always locks to the end */
>  	if (ofs + len != mtd->size) {
> @@ -509,11 +512,14 @@ static int stm_lock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  static int stm_unlock(struct spi_nor *nor, loff_t ofs, uint64_t len)
>  {
>  	struct mtd_info *mtd = &nor->mtd;
> -	uint8_t status_old, status_new;
> +	uint8_t status_new;
> +	int status_old;

Same here.

>  	u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
>  	u8 shift = ffs(mask) - 1, pow, val;
>  
>  	status_old = read_sr(nor);
> +	if (status_old < 0)
> +		return status_old;
>  
>  	/* Cannot unlock; would unlock larger region than requested */
>  	if (stm_is_locked_sr(nor, status_old, ofs - mtd->erasesize,
> @@ -1013,6 +1019,8 @@ static int macronix_quad_enable(struct spi_nor *nor)
>  	int ret, val;
>  
>  	val = read_sr(nor);
> +	if (val < 0)
> +		return val;
>  	write_enable(nor);
>  
>  	write_sr(nor, val | SR_QUAD_EN_MX);

If we wanted to sidestep the issue, we could still keep status_old as
u8, but just use an 'int ret' as an intermediate place-holder, so we can
do signed error checking.

Brian
