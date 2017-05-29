Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dFRrV-0004fj-HI
 for linux-mtd@lists.infradead.org; Mon, 29 May 2017 21:06:03 +0000
Date: Mon, 29 May 2017 23:05:29 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpandong@micron.com>
Cc: <richard@nod.at>, <computersforpeace@gmail.com>,
 <arnaud.mouiche@gmail.com>, <thomas.petazzoni@free-electrons.com>,
 <marex@denx.de>, <cyrille.pitchen@wedev4u.fr>,
 <linux-mtd@lists.infradead.org>, <peterpansjtu@gmail.com>,
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v6 05/15] mtd: nand: raw: create struct rawnand_device
Message-ID: <20170529230529.2a0433f5@bbrezillon>
In-Reply-To: <1495609631-18880-6-git-send-email-peterpandong@micron.com>
References: <1495609631-18880-1-git-send-email-peterpandong@micron.com>
 <1495609631-18880-6-git-send-email-peterpandong@micron.com>
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

On Wed, 24 May 2017 15:07:01 +0800
Peter Pan <peterpandong@micron.com> wrote:

> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Create the rawnand_device struct inheriting from nand_device and make
> nand_chip inherit from this struct.
> 
> The rawnand_device object should be used for the new
> rawnand-device/rawnand-controller model, and fields inside nand_chip
> should progressively move to the future rawnand_controller or the existing
> rawnand_device struct.
> 
> In the meantime, we make sure nand_device fields are properly initialized
> by converting information stored in mtd_info and nand_chip into the
> nand_memory_organization format.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Peter Pan <peterpandong@micron.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      | 26 ++++++++++++++++++++------
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index a113cfb..8f8df15 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3957,6 +3957,43 @@ static bool find_full_id_nand(struct nand_chip *chip,
>  	return false;
>  }
>  

[...]

> +
> +static void nandc_fill_nandd(struct nand_chip *chip)

I'll probably rename this function nandchip_init_nanddev() to be
consistent with the nandchip prefix used in patch 4.

> +{
> +	struct mtd_info *mtd = nandchip_to_mtd(chip);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	struct nand_memory_organization *memorg = &nand->memorg;
> +
> +	memorg->pagesize = mtd->writesize;
> +	memorg->oobsize = mtd->oobsize;
> +	memorg->eraseblocksize = mtd->erasesize;
> +	memorg->ndies = chip->numchips;
> +	memorg->diesize = chip->chipsize;
> +	/* TODO: fill ->planesize and ->nplanes */
> +
> +	nand->ops = &rawnand_ops;
> +}
