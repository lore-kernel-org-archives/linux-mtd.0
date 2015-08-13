Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPhGC-0004mm-Pn
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 01:24:49 +0000
Received: by pacgr6 with SMTP id gr6so25814674pac.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 18:24:26 -0700 (PDT)
Date: Wed, 12 Aug 2015 18:24:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, antoine.tenart@free-electrons.com,
 robert.jarzmik@free.fr
Subject: Re: [PATCH 2/2] nand: pxa3xx: Increase initial buffer size
Message-ID: <20150813012424.GB104137@google.com>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-3-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438612286-16070-3-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 03, 2015 at 11:31:26AM -0300, Ezequiel Garcia wrote:
> The initial buffer is used for the initial commands used to detect
> a flash device (STATUS, READID and PARAM).
> 
> ONFI param page is 256 bytes, and there are three redundant copies
> to be read. JEDEC param page is 512 bytes, and there are also three
> redundant copies to be read. Hence this buffer should be at least
> 512 x 3. This commits rounds the buffer size to 2048.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 0815f11..9dac28d 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -45,10 +45,13 @@
>  
>  /*
>   * Define a buffer size for the initial command that detects the flash device:
> - * STATUS, READID and PARAM. The largest of these is the PARAM command,
> - * needing 256 bytes.
> + * STATUS, READID and PARAM.
> + * ONFI param page is 256 bytes, and there are three redundant copies
> + * to be read. JEDEC param page is 512 bytes, and there are also three
> + * redundant copies to be read.
> + * Hence this buffer should be at least 512 x 3. Let's pick 2048.
>   */
> -#define INIT_BUFFER_SIZE	256
> +#define INIT_BUFFER_SIZE	2048

Not sure if you're going to run into problems with extended parameter
pages. For one, you don't support NAND_CMD_RNDOUT, it seems.

Brian

>  
>  /* registers and bit definitions */
>  #define NDCR		(0x00) /* Control register */
> @@ -899,14 +902,14 @@ static int prepare_set_command(struct pxa3xx_nand_info *info, int command,
>  		break;
>  
>  	case NAND_CMD_PARAM:
> -		info->buf_count = 256;
> +		info->buf_count = INIT_BUFFER_SIZE;
>  		info->ndcb0 |= NDCB0_CMD_TYPE(0)
>  				| NDCB0_ADDR_CYC(1)
>  				| NDCB0_LEN_OVRD
>  				| command;
>  		info->ndcb1 = (column & 0xFF);
> -		info->ndcb3 = 256;
> -		info->data_size = 256;
> +		info->ndcb3 = INIT_BUFFER_SIZE;
> +		info->data_size = INIT_BUFFER_SIZE;
>  		break;
>  
>  	case NAND_CMD_READID:
> -- 
> 2.4.6
> 
