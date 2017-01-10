Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cR1p6-0006A4-Vz
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2017 19:11:11 +0000
Received: by mail-wm0-x241.google.com with SMTP id l2so32050583wml.2
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2017 11:10:48 -0800 (PST)
Subject: Re: [PATCH v3 5/7] mtd: nand: raw: create struct rawnand_device
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Peter Pan <peterpansjtu@gmail.com>
References: <1479732328-18363-1-git-send-email-boris.brezillon@free-electrons.com>
 <1479732328-18363-6-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Kelvin Cheung <keguang.zhang@gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <480dca8c-993e-71ff-b37c-062a3de2f003@gmail.com>
Date: Tue, 10 Jan 2017 20:09:15 +0100
MIME-Version: 1.0
In-Reply-To: <1479732328-18363-6-git-send-email-boris.brezillon@free-electrons.com>
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

On 11/21/2016 01:45 PM, Boris Brezillon wrote:
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
> ---
>  drivers/mtd/nand/raw/nand_base.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/rawnand.h      | 26 ++++++++++++++++++++------
>  2 files changed, 60 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 893ec615332a..77ca2dbee341 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3999,6 +3999,43 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
>  	return false;
>  }
>  
> +static int rawnand_erase(struct nand_device *nand, struct erase_info *einfo)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +
> +	return nand_erase_nand(mtd, einfo, 1);
> +}
> +
> +static int rawnand_markbad(struct nand_device *nand, int block)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(nand);
> +	struct nand_chip *chip = mtd_to_nandc(mtd);
> +	loff_t offs = nand_eraseblock_to_offs(nand, block);
> +
> +	return chip->block_markbad(mtd, offs);
> +}
> +
> +static const struct nand_ops rawnand_ops = {
> +	.erase = rawnand_erase,
> +	.markbad = rawnand_markbad,
> +};
> +
> +static void nandc_fill_nandd(struct nand_chip *chip)
> +{
> +	struct mtd_info *mtd = nandc_to_mtd(chip);
> +	struct nand_device *nand = mtd_to_nand(mtd);
> +	struct nand_memory_organization *memorg = &nand->memorg;
> +
> +	memorg->pagesize = mtd->writesize;
> +	memorg->oobsize = mtd->oobsize;
> +	memorg->eraseblocksize = mtd->erasesize;
> +	memorg->ndies = chip->numchips;
> +	memorg->diesize = chip->chipsize;
> +	/* TODO: fill ->planesize and ->nplanes */

When will this be addressed ?

> +	nand->ops = &rawnand_ops;
> +}

[...]

-- 
Best regards,
Marek Vasut
