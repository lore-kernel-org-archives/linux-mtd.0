Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cj4Ce-0006E4-4W
 for linux-mtd@lists.infradead.org; Wed, 01 Mar 2017 13:22:02 +0000
Date: Wed, 1 Mar 2017 14:21:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <boris.brezillon@free-electrons.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>,
 peterpansjtu@gmail.com, linshunquan1@hisilicon.com
Subject: Re: [PATCH v2 1/6] nand: spi: Add init/release function
Message-ID: <20170301142135.0f0bbe65@free-electrons.com>
In-Reply-To: <1488358330-23832-2-git-send-email-peterpandong@micron.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-2-git-send-email-peterpandong@micron.com>
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

Hello,

On Wed, 1 Mar 2017 16:52:05 +0800, Peter Pan wrote:

> +static bool spinand_scan_id_table(struct spinand_device *chip, u8 *id)
> +{
> +	struct nand_device *nand = &chip->base;
> +	struct spinand_flash *type = spinand_table;
> +	struct nand_memory_organization *memorg = &nand->memorg;
> +	struct spinand_ecc_engine *ecc_engine = &chip->ecc_engine;
> +
> +	for (; type->name; type++) {
> +		if (id[0] == type->mfr_id && id[1] == type->dev_id) {
> +			chip->name = type->name;
> +			memorg->eraseblocksize = type->page_size
> +					* type->pages_per_blk;
> +			memorg->pagesize = type->page_size;
> +			memorg->oobsize = type->oob_size;
> +			memorg->diesize =
> +				memorg->eraseblocksize * type->blks_per_lun;
> +			memorg->ndies = type->luns_per_chip;
> +			ecc_engine->strength = type->ecc_strength;
> +			chip->rw_mode = type->rw_mode;
> +
> +			return true;
> +		}
> +	}

One minor nit, based on a very quick look. What about instead:

	for (type = spinand_table; type->name; type++) {
		if (id[0] != type->mfr_id)
			continue;
		if (id[1] != type->dev_id)
			continue;
		chip->name = type->name;
		...
		return true;
	}

I.e, use the initialization part of the for() loop, and inside the
for() loop, avoid one indentation level by handling the non-interesting
case first, and skipping to the next table entry if needed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
