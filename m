Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bEEWz-0001pA-77
 for linux-mtd@lists.infradead.org; Sat, 18 Jun 2016 11:35:17 +0000
Date: Sat, 18 Jun 2016 13:34:54 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Richard Weinberger <richard@nod.at>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Hans de Goede
 <hdegoede@redhat.com>, linux-kernel@vger.kernel.org, Aleksei Mamlin
 <mamlinav@gmail.com>
Subject: Re: [PATCH v2 05/15] mtd: nand: add manufacturer specific
 initialization/detection steps
Message-ID: <20160618133454.38fc8fd9@bbrezillon>
In-Reply-To: <576512F5.7050506@nod.at>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
 <1465390849-13199-6-git-send-email-boris.brezillon@free-electrons.com>
 <576512F5.7050506@nod.at>
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

On Sat, 18 Jun 2016 11:23:01 +0200
Richard Weinberger <richard@nod.at> wrote:

> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 55f3ab8..aadebe7 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3703,6 +3703,10 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
> 
>  	chip->manufacturer.ops = nand_manuf_ids[maf_idx].ops;
> 
> +	if (!chip->manufacturer.ops)
> +		/* assign no operations */
> +		chip->manufacturer.ops = nand_manuf_ids[0].ops;
> +

BTW, this is wrong, the manufacturer id code is not the index of the
nand_manuf_ids[] table ;). If we go for this option, we should probably
declare no_ops in nand_base.c and assign it here:

		chip->manufacturer.ops = nand_manuf_no_ops;

>  	if (!type)
>  		type = nand_flash_ids;
> 
