Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctJN1-0003oM-94
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 19:35:05 +0000
Date: Wed, 29 Mar 2017 21:34:27 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@atmel.com>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v4 1/9] mtd: nand: add oob iterator in nand_for_each_page
Message-ID: <20170329213427.280c26bb@bbrezillon>
In-Reply-To: <1490262226-29092-2-git-send-email-peterpandong@micron.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-2-git-send-email-peterpandong@micron.com>
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

On Thu, 23 Mar 2017 17:43:38 +0800
Peter Pan <peterpandong@micron.com> wrote:

> Iterate nand pages by both page and oob operation.

For the next version, can you merge my initial commit [1] into this one
(you can keep the authorship)?

> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/nand.h | 38 +++++++++++++++++++++++++++++++-------
>  1 file changed, 31 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index c2197b4..54ded4c 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -84,9 +84,12 @@ struct nand_device {
>   * @pageoffset: the offset within a page

Update the documentation.

>   */
>  struct nand_page_iter {
> -	loff_t offs;
>  	int page;
>  	int pageoffs;
> +	size_t dataleft;
> +	int ooboffs;
> +	int oobsize;

oobsize can be extracted from nand_device, and since a nand_device
object it passed to all nand_page_iter_xxx() functions you don't need it
here.

> +	size_t oobleft;
>  };
>  
>  /**
> @@ -193,14 +196,19 @@ static inline int nand_per_page_oobsize(struct nand_device *nand)
>   * @offs: absolute offset
>   * @iter: page iterator

Update the documentation.

>   */
> -static inline void nand_page_iter_init(struct nand_device *nand, loff_t offs,
> +static inline void nand_page_iter_init(struct nand_device *nand,
> +				       loff_t offs, size_t len, u32 ooboffs,
> +				       size_t ooblen, u32 oobsize,
>  				       struct nand_page_iter *iter)
>  {
>  	u64 page = offs;
>  
>  	iter->pageoffs = do_div(page, nand->memorg.pagesize);
>  	iter->page = page;
> -	iter->offs = offs;
> +	iter->dataleft = len;
> +	iter->ooboffs = ooboffs;
> +	iter->oobsize = oobsize;
> +	iter->oobleft = ooblen;
>  }
>  
>  /**
> @@ -212,13 +220,29 @@ static inline void nand_page_iter_next(struct nand_device *nand,
>  				       struct nand_page_iter *iter)
>  {
>  	iter->page++;
> -	iter->offs += nand_page_size(nand) - iter->pageoffs;
>  	iter->pageoffs = 0;
> +	if (iter->dataleft)
> +		iter->dataleft -= min_t (int,
> +					 nand_page_size(nand) - iter->pageoffs,
> +					 iter->dataleft);
> +	if (iter->oobleft)
> +		iter->oobleft -= min_t(int, iter->oobsize - iter->ooboffs,
> +				       iter->oobleft);
> +}
> +

Document the function.

> +static inline bool nand_page_iter_end(struct nand_device *nand,
> +				      struct nand_page_iter *iter)
> +{
> +	if (iter->dataleft || iter->oobleft)
> +		return false;
> +	return true;
>  }
>  
> -#define nand_for_each_page(nand, start, len, iter)		\
> -	for (nand_page_iter_init(nand, start, iter);		\
> -	     (iter)->offs < (start) + (len);			\
> +#define nand_for_each_page(nand, start, len, ooboffs, ooblen,	\
> +			   oobsize, iter)	\
> +	for (nand_page_iter_init(nand, start, len, ooboffs,	\
> +				 ooblen, oobsize, iter);	\
> +	     !nand_page_iter_end(nand, iter);		\
>  	     nand_page_iter_next(nand, iter))
>  
>  /**

[1]https://github.com/bbrezillon/linux-0day/commit/f02767a662ec02a0206a0b6c5a410a38d7b7b313
