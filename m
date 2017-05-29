Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFRy9-00072d-1Q
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 21:12:55 +0000
Date: Mon, 29 May 2017 23:12:20 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 08/15] mtd: nand: Add the page iterator concept
Message-ID: <20170529231220.59767a76@bbrezillon>
In-Reply-To: <1495609631-18880-9-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-9-git-send-email-peterpandong@micron.com>
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

On Wed, 24 May 2017 15:07:04 +0800
Peter Pan <peterpandong@micron.com> wrote:

> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 

Please squash these changes int patch 3.

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/nand.h | 93 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 78931ff..479ff9f 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -78,6 +78,24 @@ struct nand_device {
>  };
>  
>  /**
> + * struct nand_page_iter - NAND page iterator
> + * @page: the page
> + * @pageoffs: the offset within a page
> + * @dataleft: the left page data to read/write
> + * @ooboffs: the offset within page oob
> + * @oobleft: the left oob data to read/write
> + * @oobbytes_per_page: maximun oob bytes to read/write per page
> + */
> +struct nand_page_iter {
> +	int page;
> +	int pageoffs;
> +	size_t dataleft;
> +	int ooboffs;
> +	size_t oobleft;
> +	int oobbytes_per_page;
> +};
> +
> +/**
>   * mtd_to_nand - Get the NAND device attached to the MTD instance
>   * @mtd: MTD instance
>   *
> @@ -176,6 +194,81 @@ static inline int nand_per_page_oobsize(struct nand_device *nand)
>  }
>  
>  /**
> + * nand_page_iter_init - Initialize a NAND page iterator
> + * @nand: NAND device
> + * @offs: absolute offset
> + * @len: page data length to read/write
> + * @ooboffs: oob offset within page
> + * @ooblen: oob data length to read/write
> + * @oobbytes_per_page: oob data can read/write per page
> + * @iter: page iterator
> + */
> +static inline void nand_page_iter_init(struct nand_device *nand,
> +				       loff_t offs, size_t len, u32 ooboffs,
> +				       size_t ooblen, u32 oobbytes_per_page,
> +				       struct nand_page_iter *iter)
> +{
> +	u64 page = offs;
> +
> +	iter->pageoffs = do_div(page, nand->memorg.pagesize);
> +	iter->page = page;
> +	iter->dataleft = len;
> +	iter->ooboffs = ooboffs;
> +	iter->oobleft = ooblen;
> +	iter->oobbytes_per_page = oobbytes_per_page;
> +}
> +
> +/**
> + * nand_page_iter_next - Move to the next page
> + * @nand: NAND device
> + * @iter: page iterator
> + */
> +static inline void nand_page_iter_next(struct nand_device *nand,
> +				       struct nand_page_iter *iter)
> +{
> +	iter->page++;
> +	iter->pageoffs = 0;

Blank line.

> +	if (iter->dataleft)
> +		iter->dataleft -= min_t (int,
> +					 nand_page_size(nand) - iter->pageoffs,
> +					 iter->dataleft);

Ditto.

> +	if (iter->oobleft)
> +		iter->oobleft -= min_t(int,
> +				       iter->oobbytes_per_page - iter->ooboffs,
> +				       iter->oobleft);
> +}
> +
> +/**
> + * nand_page_iter_end - Should end iteration or not
> + * @nand: NAND device
> + * @iter: page iterator
> + */
> +static inline bool nand_page_iter_end(struct nand_device *nand,
> +				      struct nand_page_iter *iter)
> +{
> +	if (iter->dataleft || iter->oobleft)
> +		return false;

Ditto.

> +	return true;
> +}
> +
> +/**
> + * nand_for_each_page - Iterate nand pages
> + * @nand: NAND device
> + * @start: start address to read/write
> + * @len: page data length to read/write
> + * @ooboffs: oob offset within page
> + * @ooblen: oob data length to read/write
> + * @oobbytes_per_page: oob data can read/write per page
> + * @iter: page iterator
> + */
> +#define nand_for_each_page(nand, start, len, ooboffs, ooblen,	\
> +			   oobbytes_per_page, iter)	\
> +	for (nand_page_iter_init(nand, start, len, ooboffs, ooblen,	\
> +				 oobbytes_per_page, iter);	\
> +	     !nand_page_iter_end(nand, iter);		\
> +	     nand_page_iter_next(nand, iter))
> +
> +/**
>   * nand_per_page_oobsize - Get NAND erase block size
>   * @nand: NAND device
>   *
