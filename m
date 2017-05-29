Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFR3x-000899-Ms
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 20:14:51 +0000
Date: Mon, 29 May 2017 22:14:17 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 03/15] mtd: nand: add a nand.h file to expose basic
 NAND stuff
Message-ID: <20170529221417.543adf3a@bbrezillon>
In-Reply-To: <1495609631-18880-4-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-4-git-send-email-peterpandong@micron.com>
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

On Wed, 24 May 2017 15:06:59 +0800
Peter Pan <peterpandong@micron.com> wrote:

> +
> +/**
> + * nand_check_oob_ops - check mtd_oob_ops is valid or not
> + * @nand: NAND device
> + * @start: start address to check
> + * @ops: oob operation description struct
> + *
> + * Returns 0 for valid ops and -EINVAL for invalid ops.
> + */
> +static inline int nand_check_oob_ops(struct nand_device *nand, loff_t start,
> +				     struct mtd_oob_ops *ops)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +	int oobbytes_per_page = ops->mode == MTD_OPS_AUTO_OOB ?
> +				mtd->oobavail : mtd->oobsize;
> +	int pages = nand_len_to_pages(nand, nand_size(nand));
> +	int max_pages = pages - nand_offs_to_page(nand, start);
> +	int max_ooblen = max_pages * oobbytes_per_page;
> +
> +	if ((!!ops->datbuf != !!ops->len) ||
> +	    (!!ops->oobbuf != !!ops->ooblen))
> +		return -EINVAL;

Can we make the test more obvious:

	if ((ops->len && !ops->datbuf) ||
	    (ops->ooblen && !ops->oobbuf))

> +	if (ops->ooboffs >= oobbytes_per_page)
> +		return -EINVAL;

Please add blank lines after each if () block.

> +	if (ops->ooboffs + ops->ooblen > max_ooblen)
> +		return -EINVAL;

I thought we agreed that these tests should go in mtdcore.c. That's
clearly generic and could benefit to everyone, not only NAND users.

> +
> +	return 0;
> +}
> +
> +/**
> + * nand_oob_ops_across_page - check oob operation across page or not

You mean cross, not across, right?

> + * @nand: NAND device
> + * @ops: oob operation description struct
> + *
> + * Returns true if oob operation across page and false when not.
> + */
> +static inline bool nand_oob_ops_across_page(struct nand_device *nand,
> +					    struct mtd_oob_ops *ops)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +	int oobbytes_per_page = ops->mode == MTD_OPS_AUTO_OOB ?
> +				mtd->oobavail : mtd->oobsize;
> +
> +	return (ops->ooboffs + ops->ooblen) > oobbytes_per_page;

Since mtd_oob_ops is actually not only about oob data, I guess we
should check in-band data as well. This implies passing the start
offset in argument of course.

	if (ops->ooboffs + ops->ooblen > oobbytes_per_page ||
	    ops->len > mtd->writesize ||
	    mtd_mod_by_ws(start_offs, mtd) + ops->len > mtd->writesize)
		return true;

	return false;

> +}

Again, this is completely generic, so probably something we should put
in mtd.h/mtdcore.c.

> +
> +/**
> + * nand_check_erase_ops - check erase operation is valid or not
> + * @nand: NAND device
> + * @einfo: erase instruction
> + *
> + * Returns 0 for valid erase operation and -EINVAL for invalid.
> + */
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

And here again, this should be moved to mtdcore.c/mtd.h. Actually, the
last check you're doing here is already done in mtd_erase() [1].

[1]http://elixir.free-electrons.com/linux/latest/source/drivers/mtd/mtdcore.c#L958
