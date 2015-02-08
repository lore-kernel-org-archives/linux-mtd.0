Date: Sun, 8 Feb 2015 21:00:36 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: [PATCH 3/9] mtd: pxa3xx_nand: set NDCR_PG_PER_BLK if page per
 block is 128
Message-ID: <20150208210036.4ae2978b@bbrezillon>
In-Reply-To: <1422367816-4257-4-git-send-email-antoine.tenart@free-electrons.com>
References: <1422367816-4257-1-git-send-email-antoine.tenart@free-electrons.com>
 <1422367816-4257-4-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: thomas.petazzoni@free-electrons.com, zmxu@marvell.com,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Antoine,

On Tue, 27 Jan 2015 15:10:10 +0100
Antoine Tenart <antoine.tenart@free-electrons.com> wrote:

I'm not the one who should say that (I'm often sending patches without
any commit message), but a short commit message explaining why you're
doing that would help reviewers ;-).

Best Regards,

Boris

> Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> ---
>  drivers/mtd/nand/pxa3xx_nand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
> index 2681ec4abafa..782ae24d6b7d 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -1216,7 +1216,8 @@ static int pxa3xx_nand_config_flash(struct pxa3xx_nand_info *info,
>  
>  	ndcr |= (pdata->enable_arbiter) ? NDCR_ND_ARB_EN : 0;
>  	ndcr |= (host->col_addr_cycles == 2) ? NDCR_RA_START : 0;
> -	ndcr |= (f->page_per_block == 64) ? NDCR_PG_PER_BLK : 0;
> +	ndcr |= (f->page_per_block == 64 || f->page_per_block == 128) ?
> +		NDCR_PG_PER_BLK : 0;
>  	ndcr |= (f->page_size == 2048) ? NDCR_PAGE_SZ : 0;
>  	ndcr |= (f->flash_width == 16) ? NDCR_DWIDTH_M : 0;
>  	ndcr |= (f->dfc_width == 16) ? NDCR_DWIDTH_C : 0;



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
