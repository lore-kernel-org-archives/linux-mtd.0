Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eCTMl-00009s-Hp
 for linux-mtd@lists.infradead.org; Wed, 08 Nov 2017 16:38:20 +0000
Date: Wed, 8 Nov 2017 17:37:53 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Antoine Tenart
 <antoine.tenart@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Rob
 Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Wenyou
 Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Kamal
 Dasu <kdasu.kdev@gmail.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>, Han Xu <han.xu@nxp.com>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>, Stefan Agner <stefan@agner.ch>
Subject: Re: [RFC PATCH v2 1/6] mtd: nand: provide several helpers to do
 common NAND operations
Message-ID: <20171108173753.054c6a0a@bbrezillon>
In-Reply-To: <20171107145419.22717-2-miquel.raynal@free-electrons.com>
References: <20171107145419.22717-1-miquel.raynal@free-electrons.com>
 <20171107145419.22717-2-miquel.raynal@free-electrons.com>
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

On Tue,  7 Nov 2017 15:54:14 +0100
Miquel Raynal <miquel.raynal@free-electrons.com> wrote:

> +
> +/**
> + * nand_read_oob_op - Do a READ OOB operation
> + * @chip: The NAND chip
> + * @page: page to read
> + * @offset_in_page: offset within the page

Please rename this parameter ooboffs or something that clarifies the
fact that this offset is relative to the start of the OOB area and not
the start of the page.

> + * @buf: buffer used to store the data
> + * @len: length of the buffer
> + *
> + * This function issues a READ OOB operation.
> + * This function does not select/unselect the CS line.
> + *
> + * Returns 0 for success or negative error code otherwise
> + */
> +int nand_read_oob_op(struct nand_chip *chip, unsigned int page,
> +		     unsigned int offset_in_page, void *buf, unsigned int len)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +
> +	if (len && !buf)
> +		return -EINVAL;
> +
> +	if (offset_in_page + len > mtd->oobsize)
> +		return -EINVAL;
> +
> +	chip->cmdfunc(mtd, NAND_CMD_READOOB, offset_in_page, page);
> +	if (len)
> +		chip->read_buf(mtd, buf, len);
> +
> +	return 0;
