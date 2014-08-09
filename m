Received: from mail-pd0-x235.google.com ([2607:f8b0:400e:c02::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG06d-0007rw-SX
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 06:26:20 +0000
Received: by mail-pd0-f181.google.com with SMTP id g10so8133250pdj.12
 for <linux-mtd@lists.infradead.org>; Fri, 08 Aug 2014 23:25:58 -0700 (PDT)
Date: Sat, 9 Aug 2014 14:25:45 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/8] mtd: spi-nor: eliminate duplicate
 spi_nor_wait_till_{, fsr}_ready() code
Message-ID: <20140809062543.GA31092@localhost.localdomain>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-2-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org,
 Graham Moore <grmoore@altera.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:16:55PM -0700, Brian Norris wrote:
> These functions were near-carbon-copies due to a small per-flash quirk.
> Let's add a new spi_nor::flags bitfield to support these types of
> quirks.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Graham Moore <grmoore@altera.com>
> Cc: Huang Shijie <b32955@freescale.com>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  drivers/mtd/spi-nor/spi-nor.c | 66 ++++++++++++++++++++++---------------------
>  include/linux/mtd/spi-nor.h   |  6 ++++
>  2 files changed, 40 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index b5ad6bebf5e7..5825b8a12cee 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -163,48 +163,51 @@ static inline int set_4byte(struct spi_nor *nor, u32 jedec_id, int enable)
>  		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1, 0);
>  	}
>  }
> -
> -static int spi_nor_wait_till_ready(struct spi_nor *nor)
> +static inline int spi_nor_sr_ready(struct spi_nor *nor)
>  {
> -	unsigned long deadline;
> -	int sr;
> -
> -	deadline = jiffies + MAX_READY_WAIT_JIFFIES;
> -
> -	do {
> -		cond_resched();
> +	int sr = read_sr(nor);
> +	if (sr < 0)
> +		return sr;
> +	else
> +		return !(sr & SR_WIP);
> +}
>  
> -		sr = read_sr(nor);
> -		if (sr < 0)
> -			break;
> -		else if (!(sr & SR_WIP))
> -			return 0;
> -	} while (!time_after_eq(jiffies, deadline));
> +static inline int spi_nor_fsr_ready(struct spi_nor *nor)
> +{
> +	int fsr = read_fsr(nor);
> +	if (fsr < 0)
> +		return fsr;
> +	else
> +		return fsr & FSR_READY;
> +}
>  
> -	return -ETIMEDOUT;
> +static int spi_nor_ready(struct spi_nor *nor)
> +{
> +	int sr, fsr;
> +	sr = spi_nor_sr_ready(nor);
> +	if (sr < 0)
> +		return sr;
> +	fsr = nor->flags & SNOR_F_USE_FSR ? spi_nor_fsr_ready(nor) : 1;
> +	if (fsr < 0)
> +		return sr;
return "fsr" here.

Beside this, i am ok with this patch.	
	
thanks
Huang Shijie
