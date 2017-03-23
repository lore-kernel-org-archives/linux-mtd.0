Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr3Xa-0000K8-9u
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 14:16:46 +0000
Subject: Re: [PATCH v4 3/9] mtd: nand: add more helpers in nand.h
To: Peter Pan <peterpandong@micron.com>, boris.brezillon@free-electrons.com,
 richard@nod.at, computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-4-git-send-email-peterpandong@micron.com>
Cc: peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Marek Vasut <marex@denx.de>
Message-ID: <7806a650-cf1a-abed-35f4-d5c573a574aa@denx.de>
Date: Thu, 23 Mar 2017 12:19:06 +0100
MIME-Version: 1.0
In-Reply-To: <1490262226-29092-4-git-send-email-peterpandong@micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/23/2017 10:43 AM, Peter Pan wrote:
> This commit adds some helpers in nand.h
       ^^^^^^
       patch

>     nand_size()
>     nand_check_address()
>     nand_check_oob_ops()
>     nand_oob_ops_across_page()
>     nand_check_erase_ops()
> 
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  include/linux/mtd/nand.h | 62 ++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 54ded4c..0c52401 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -434,6 +434,68 @@ static inline int nand_neraseblocks(struct nand_device *nand)
>  }
>  
>  /**
> + * nand_size - Get NAND size
> + * @nand: NAND device
> + *
> + * Returns the total size exposed by @nand.
> + */
> +static inline u64 nand_size(struct nand_device *nand)
> +{
> +	return nand->memorg.ndies * nand->memorg.diesize;
> +}
> +

kerneldoc missing ... fix globally

> +static inline int nand_check_address(struct nand_device *nand, loff_t addr)
> +{
> +	return addr < nand_size(nand) ? 0 : -EINVAL;
> +}
> +
> +static inline int nand_check_oob_ops(struct nand_device *nand, loff_t start,
> +				     struct mtd_oob_ops *ops)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
> +		mtd->oobavail : mtd->oobsize;
> +
> +	if ((!!ops->datbuf != !!ops->len) ||
> +	    (!!ops->oobbuf != !!ops->ooblen))
> +		return -EINVAL;
> +	if (ops->ooboffs >= ooblen)
> +		return -EINVAL;
> +	if (ops->ooboffs + ops->ooblen >
> +	    (nand_len_to_pages(nand, nand_size(nand)) -
> +			       nand_offs_to_page(nand, start)) * ooblen)

The indent here is wrong and misguiding . I think it might be better to
introduce some variables to avoid 3-line long conditions too.

> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static inline bool nand_oob_ops_across_page(struct nand_device *nand,
> +					    struct mtd_oob_ops *ops)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +	int ooblen = ops->mode == MTD_OPS_AUTO_OOB ?
> +		     mtd->oobavail : mtd->oobsize;

The ooblen can probably be deduplicated by introducing some function.
Dunno if it's worth it though.

> +	return (ops->ooboffs + ops->ooblen) > ooblen;
> +}
> +
> +static inline int nand_check_erase_ops(struct nand_device *nand,
> +				       struct erase_info *einfo)
> +{
> +	/* check address align on block boundary */
> +	if (einfo->addr & (nand_eraseblock_size(nand) - 1))
> +		return -EINVAL;
> +	/* check lendth align on block boundary */
> +	if (einfo->len & (nand_eraseblock_size(nand) - 1))
> +		return -EINVAL;
> +	/* Do not allow erase past end of device */
> +	if ((einfo->addr + einfo->len) > nand_size(nand))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +/**
>   * nand_register - Register a NAND device
>   * @nand: NAND device
>   *
> 


-- 
Best regards,
Marek Vasut
