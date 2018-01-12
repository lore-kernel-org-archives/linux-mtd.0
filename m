Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eZzxg-0006nW-3X
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 14:05:41 +0000
Date: Fri, 12 Jan 2018 15:05:13 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v3] mtd: nand: Fix nand_do_read_oob() return value
Message-ID: <20180112150513.588294c0@bbrezillon>
In-Reply-To: <20180112091336.10709-1-miquel.raynal@free-electrons.com>
References: <20180112091336.10709-1-miquel.raynal@free-electrons.com>
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

On Fri, 12 Jan 2018 10:13:36 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> Starting from commit 041e4575f034 ("mtd: nand: handle ECC errors in
> OOB"), nand_do_read_oob() (from the NAND core) did return 0 or a
> negative error, and the MTD layer expected it.
> 
> However, the trend for the NAND layer is now to return an error or a
> positive number of bitflips. Deciding which status to return to the user
> belongs to the MTD layer.
> 
> Commit e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
> brought this logic to the mtd_read_oob() function while the return value
> coming from nand_do_read_oob() (called by the ->_read_oob() hook) was
> left unchanged.
> 
> Fixes: e47f68587b82 ("mtd: check for max_bitflips in mtd_read_oob()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@free-electrons.com>

Applied after fixing the bug I mentioned earlier.

Thanks,

Boris

> ---
> 
> 
> Changes since v2:
>   - Correctly return the maximum number of bitflips, not the number of
>     bitflips of the last chunk only.
> 
> Changes since v1:
>   - s/->ecc.read_oob() hook/->_read_oob() hook/ in the commit message
>   - Fixed the compilation issue
>   
> 
> drivers/mtd/nand/nand_base.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 469220065b8b..e4e39890a975 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3794,6 +3794,7 @@ EXPORT_SYMBOL(nand_write_oob_syndrome);
>  static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  			    struct mtd_oob_ops *ops)
>  {
> +	unsigned int max_bitflips = 0;
>  	int page, realpage, chipnr;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct mtd_ecc_stats stats;
> @@ -3855,6 +3856,8 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  		if (!readlen)
>  			break;
>  
> +		max_bitflips = max_t(unsigned int, max_bitflips, ret);
> +
>  		/* Increment page address */
>  		realpage++;
>  
> @@ -3876,7 +3879,7 @@ static int nand_do_read_oob(struct mtd_info *mtd, loff_t from,
>  	if (mtd->ecc_stats.failed - stats.failed)
>  		return -EBADMSG;
>  
> -	return  mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
> +	return max_bitflips;
>  }
>  
>  /**
