Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fXlJx-0003h8-Fj
 for linux-mtd@lists.infradead.org; Tue, 26 Jun 2018 10:35:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Date: Tue, 26 Jun 2018 12:35:24 +0200
From: Stefan Agner <stefan@agner.ch>
To: Colin King <colin.king@canonical.com>
Cc: Lucas Stach <dev@lynxeye.de>, Boris Brezillon
 <boris.brezillon@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan
 Hunter <jonathanh@nvidia.com>, linux-mtd@lists.infradead.org,
 linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] mtd: rawnand: fix a couple of spelling mistakes
In-Reply-To: <20180626102629.31083-1-colin.king@canonical.com>
References: <20180626102629.31083-1-colin.king@canonical.com>
Message-ID: <93be5d64cc447fb282bcc14fed853f0c@agner.ch>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 26.06.2018 12:26, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trival fix of two spelling mistakes in dev_err error messages:
> "supportes" -> "supports" and "strenght" -> "strength"

Acked-by: Stefan Agner <stefan@agner.ch>

> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c
> b/drivers/mtd/nand/raw/tegra_nand.c
> index 4daa88d81413..9f7de36be893 100644
> --- a/drivers/mtd/nand/raw/tegra_nand.c
> +++ b/drivers/mtd/nand/raw/tegra_nand.c
> @@ -1002,14 +1002,14 @@ static int tegra_nand_chips_init(struct device *dev,
>  	}
>  
>  	if (chip->ecc.algo == NAND_ECC_BCH && mtd->writesize < 2048) {
> -		dev_err(dev, "BCH supportes 2K or 4K page size only\n");
> +		dev_err(dev, "BCH supports 2K or 4K page size only\n");
>  		return -EINVAL;
>  	}
>  
>  	if (!chip->ecc.strength) {
>  		ret = tegra_nand_select_strength(chip, mtd->oobsize);
>  		if (ret < 0) {
> -			dev_err(dev, "No valid strenght found, minimum %d\n",
> +			dev_err(dev, "No valid strength found, minimum %d\n",
>  				chip->ecc_strength_ds);
>  			return ret;
>  		}
