Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1asuJL-00019o-4p
 for linux-mtd@lists.infradead.org; Wed, 20 Apr 2016 15:45:03 +0000
Date: Wed, 20 Apr 2016 17:44:40 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Maarten ter Huurne <maarten@treewalker.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: nand: jz4740: Remove unused local variable
Message-ID: <20160420174440.46f8ed48@bbrezillon>
In-Reply-To: <1460995496-11666-1-git-send-email-maarten@treewalker.org>
References: <1460995496-11666-1-git-send-email-maarten@treewalker.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 18 Apr 2016 18:04:56 +0200
Maarten ter Huurne <maarten@treewalker.org> wrote:

> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/nand/jz4740_nand.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
> index 673ceb2..2f39ee1 100644
> --- a/drivers/mtd/nand/jz4740_nand.c
> +++ b/drivers/mtd/nand/jz4740_nand.c
> @@ -221,7 +221,6 @@ static int jz_nand_correct_ecc_rs(struct mtd_info *mtd, uint8_t *dat,
>  	struct jz_nand *nand = mtd_to_jz_nand(mtd);
>  	int i, error_count, index;
>  	uint32_t reg, status, error;
> -	uint32_t t;
>  	unsigned int timeout = 1000;
>  
>  	for (i = 0; i < 9; ++i)



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
