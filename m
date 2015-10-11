Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZlMox-00041E-3Y
 for linux-mtd@lists.infradead.org; Sun, 11 Oct 2015 20:02:15 +0000
Received: by qgx61 with SMTP id 61so107226762qgx.3
 for <linux-mtd@lists.infradead.org>; Sun, 11 Oct 2015 13:01:54 -0700 (PDT)
Date: Sun, 11 Oct 2015 13:01:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sheng Yong <shengyong1@huawei.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH] mtd: nand_bbt: set the smallest size of bbt table
Message-ID: <20151011200154.GB3696@localhost>
References: <1438305164-82852-1-git-send-email-shengyong1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438305164-82852-1-git-send-email-shengyong1@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 31, 2015 at 01:12:44AM +0000, Sheng Yong wrote:
> When using nandsim to simulate a 128K block nand with `overridesize = 1',
> the size of mtd device is too small (mtd_size = 4 * block_size) to get the
> right length of bbt. Then when creating bbt, kzmalloc() will return
> ZERO_SIZE_PTR. This causes a NULL pointer oops when scanning bbt.
> 
[...]
> 
> This patch gives a smallest length to bbt, 1 byte, which is enough to
> represent up to 4 blocks.
> 
> Signed-off-by: Sheng Yong <shengyong1@huawei.com>
> ---
>  drivers/mtd/nand/nand_bbt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
> index 63a1a36..b1d4f81 100644
> --- a/drivers/mtd/nand/nand_bbt.c
> +++ b/drivers/mtd/nand/nand_bbt.c
> @@ -1080,7 +1080,7 @@ static int nand_scan_bbt(struct mtd_info *mtd, struct nand_bbt_descr *bd)
>  	struct nand_bbt_descr *td = this->bbt_td;
>  	struct nand_bbt_descr *md = this->bbt_md;
>  
> -	len = mtd->size >> (this->bbt_erase_shift + 2);
> +	len = (mtd->size >> (this->bbt_erase_shift + 2)) ? : 1;
>  	/*
>  	 * Allocate memory (2bit per block) and clear the memory bad block
>  	 * table.

So that's all that needs fixed to get that small of a "NAND" working?
I'd assume something else would break too. But maybe not!

Applied to l2-mtd.git. Thanks.
