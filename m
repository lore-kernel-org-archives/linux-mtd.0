Received: from mail-ig0-x234.google.com ([2607:f8b0:4001:c05::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W3ucZ-0000lJ-0l
 for linux-mtd@lists.infradead.org; Thu, 16 Jan 2014 21:37:03 +0000
Received: by mail-ig0-f180.google.com with SMTP id m12so8791871iga.1
 for <linux-mtd@lists.infradead.org>; Thu, 16 Jan 2014 13:36:41 -0800 (PST)
Date: Thu, 16 Jan 2014 13:36:37 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: nand: add support for Samsung K9LCG08U0B
Message-ID: <20140116213637.GH8919@ld-irv-0074>
References: <1387963135-22142-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1387963135-22142-1-git-send-email-b32955@freescale.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 25, 2013 at 05:18:55PM +0800, Huang Shijie wrote:
> Assume that:
>           tmp = ((extid >> 2) & 0x04) | (extid & 0x03));
> 
> From the K9LCG08U0B's datasheet, we know that:
>   the oob size is 640 when tmp is 6;
>   the oob size is 1024 when tmp is 7;
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ce4dec7..0d113cc 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3242,9 +3242,11 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>  			mtd->oobsize = 512;
>  			break;
>  		case 6:
> -		default: /* Other cases are "reserved" (unknown) */
>  			mtd->oobsize = 640;
>  			break;
> +		case 7:
> +			mtd->oobsize = SZ_1K;

#include <linux/sizes.h>

Did you compile this?

Anyway, I think just using the literal 1024 is better. I can fix it up
and push myself in a bit.

> +			break;
>  		}
>  		extid >>= 2;
>  		/* Calc blocksize */

Brian
