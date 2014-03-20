Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WQafw-0003I4-SJ
 for linux-mtd@lists.infradead.org; Thu, 20 Mar 2014 10:58:17 +0000
Received: by mail-pa0-f53.google.com with SMTP id ld10so767562pab.40
 for <linux-mtd@lists.infradead.org>; Thu, 20 Mar 2014 03:57:55 -0700 (PDT)
Date: Thu, 20 Mar 2014 03:57:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Pekon Gupta <pekon@ti.com>
Subject: Re: [PATCH v5 2/4] mtd: devices: elm: clean elm_load_syndrome
Message-ID: <20140320105751.GN31517@norris-Latitude-E6410>
References: <1393845563-7800-1-git-send-email-pekon@ti.com>
 <1393845563-7800-3-git-send-email-pekon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1393845563-7800-3-git-send-email-pekon@ti.com>
Cc: Stefan Roese <sr@denx.de>, linux-mtd <linux-mtd@lists.infradead.org>,
 Felipe Balbi <balbi@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 03, 2014 at 04:49:21PM +0530, Pekon Gupta wrote:
>  - replace ECC_BYTES* macros with ecc->bytes

^^ this comment doesn't quite match. But the patch looks OK.

>  - Add scalability for future ecc-schemes
> 
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---
>  drivers/mtd/devices/elm.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/devices/elm.c b/drivers/mtd/devices/elm.c
> index 7fda50f..f59c100 100644
> --- a/drivers/mtd/devices/elm.c
> +++ b/drivers/mtd/devices/elm.c
> @@ -181,10 +181,8 @@ static void elm_load_syndrome(struct elm_info *info,
>  			elm_configure_page_mode(info, i, true);
>  			offset = ELM_SYNDROME_FRAGMENT_0 +
>  				SYNDROME_FRAGMENT_REG_SIZE * i;
> -
> -			/* BCH8 */
> -			if (info->bch_type) {
> -
> +			switch (info->bch_type) {
> +			case BCH8_ECC:
>  				/* syndrome fragment 0 = ecc[9-12B] */
>  				val = cpu_to_be32(*(u32 *) &ecc[9]);
>  				elm_write_reg(info, offset, val);
> @@ -203,7 +201,8 @@ static void elm_load_syndrome(struct elm_info *info,
>  				offset += 4;
>  				val = ecc[0];
>  				elm_write_reg(info, offset, val);
> -			} else {
> +				break;
> +			case BCH4_ECC:
>  				/* syndrome fragment 0 = ecc[20-52b] bits */
>  				val = (cpu_to_be32(*(u32 *) &ecc[3]) >> 4) |
>  					((ecc[2] & 0xf) << 28);
> @@ -213,11 +212,14 @@ static void elm_load_syndrome(struct elm_info *info,
>  				offset += 4;
>  				val = cpu_to_be32(*(u32 *) &ecc[0]) >> 12;
>  				elm_write_reg(info, offset, val);
> +				break;
> +			default:
> +				pr_err("invalid config bch_type\n");
>  			}
>  		}
>  
>  		/* Update ecc pointer with ecc byte size */
> -		ecc += info->bch_type ? BCH8_SIZE : BCH4_SIZE;
> +		ecc += info->ecc_step_bytes;
>  	}
>  }
>  

Brian
