Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am1bu-0005mE-2B
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 16:07:50 +0000
Received: by mail-pa0-x22d.google.com with SMTP id fe3so94360298pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 09:07:25 -0700 (PDT)
Date: Fri, 1 Apr 2016 09:07:22 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Message-ID: <20160401160722.GC117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1455300685-27009-2-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafał Miłecki wrote:
> This will allow drivers handle ECC properly.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
>  drivers/mtd/nand/nand_base.c | 6 +++++-
>  include/linux/mtd/nand.h     | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index f2c8ff3..ef977f3 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3979,7 +3979,7 @@ ident_done:
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>  	struct device_node *dn = nand_get_flash_node(chip);
> -	int ecc_mode, ecc_strength, ecc_step;
> +	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
>  
>  	if (!dn)
>  		return 0;
> @@ -3991,6 +3991,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  		chip->bbt_options |= NAND_BBT_USE_FLASH;
>  
>  	ecc_mode = of_get_nand_ecc_mode(dn);
> +	ecc_algo = of_get_nand_ecc_algo(dn);
>  	ecc_strength = of_get_nand_ecc_strength(dn);
>  	ecc_step = of_get_nand_ecc_step_size(dn);
>  
> @@ -4003,6 +4004,9 @@ static int nand_dt_init(struct nand_chip *chip)
>  	if (ecc_mode >= 0)
>  		chip->ecc.mode = ecc_mode;
>  
> +	if (ecc_algo >= 0)
> +		chip->ecc.algo = ecc_algo;
> +

While this might appear to handle the absence of the nand-ecc-algo
property correctly, this isn't safe. This means that any existing DT
without the property will get treated as Hamming ECC. Perhaps we need
the enum to have a 0 value of 'NAND_ECC_ALGO_UNKNOWN' or something like
that?

Brian

>  	if (ecc_strength >= 0)
>  		chip->ecc.strength = ecc_strength;
>  
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 25854d2..8deca1b 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -513,6 +513,7 @@ struct nand_hw_control {
>   */
>  struct nand_ecc_ctrl {
>  	nand_ecc_modes_t mode;
> +	enum nand_ecc_algo algo;
>  	int steps;
>  	int size;
>  	int bytes;
> -- 
> 1.8.4.5
> 
