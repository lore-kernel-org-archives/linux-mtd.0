Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e2HBN-0005Zs-CQ
 for linux-mtd@lists.infradead.org; Wed, 11 Oct 2017 13:36:23 +0000
Date: Wed, 11 Oct 2017 15:35:59 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 11/15] nand: spi: add basic operations support
Message-ID: <20171011153559.0b1efb28@bbrezillon>
In-Reply-To: <1495609631-18880-12-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-12-git-send-email-peterpandong@micron.com>
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

Hi Peter,

I'm resurrecting this series, and I still have on question on this
patch (probably not my last question ;-)).

On Wed, 24 May 2017 15:07:07 +0800
Peter Pan <peterpandong@micron.com> wrote:



> +/**
> + * spinand_do_write_ops - write data from buffer to device
> + * @mtd: MTD device structure
> + * @to: offset to write to
> + * @ops: oob operations description structure
> + */
> +static int spinand_do_write_ops(struct mtd_info *mtd, loff_t to,
> +				struct mtd_oob_ops *ops)
> +{
> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	int ret = 0;
> +
> +	ret = nand_check_address(nand, to);
> +	if (ret) {
> +		dev_err(spinand->dev, "%s: invalid write address\n", __func__);
> +		return ret;
> +	}
> +
> +	ret = nand_check_oob_ops(nand, to, ops);
> +	if (ret) {
> +		dev_err(spinand->dev,
> +			"%s: invalid oob operation input\n", __func__);
> +		return ret;
> +	}
> +
> +	if (nand_oob_ops_across_page(mtd_to_nand(mtd), ops)) {
> +		dev_err(spinand->dev,
> +			"%s: try to across page when writing with OOB\n",
> +			__func__);
> +		return -EINVAL;
> +	}

Why do you prevent writing more than one OOB region?

> +
> +	mutex_lock(&spinand->lock);
> +	ret = spinand_write_pages(mtd, to, ops);
> +	mutex_unlock(&spinand->lock);
> +
> +	return ret;
> +}
