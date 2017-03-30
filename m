Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctafg-00045i-V1
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 14:03:30 +0000
Date: Thu, 30 Mar 2017 16:02:38 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Enrico Jorns <ejo@pengutronix.de>, Artem
 Bityutskiy <artem.bityutskiy@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Graham Moore
 <grmoore@opensource.altera.com>, David Woodhouse <dwmw2@infradead.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Chuanxiao Dong
 <chuanxiao.dong@intel.com>, Jassi Brar <jaswinder.singh@linaro.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, Rob Herring <robh+dt@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3 14/37] mtd: nand: denali: support "nand-ecc-strength"
 DT property
Message-ID: <20170330160238.59e5a2c1@bbrezillon>
In-Reply-To: <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
References: <1490856383-31560-1-git-send-email-yamada.masahiro@socionext.com>
 <1490856383-31560-15-git-send-email-yamada.masahiro@socionext.com>
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

On Thu, 30 Mar 2017 15:46:00 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

> Historically, this driver tried to choose as big ECC strength as
> possible, but it would be reasonable to allow DT to set a particular
> ECC strength with "nand-ecc-strength" property.  This is useful
> when a particular ECC setting is hard-coded by firmware (or hard-
> wired by boot ROM).
> 
> If no ECC strength is specified in DT, "nand-ecc-maximize" is implied
> since this was the original behavior.

You said there is currently no DT users, so how about changing the
"fallback to ECC maximization" behavior for DT users, and instead of
maximizing the ECC strength take the NAND requirements into account
(chip->ecc_strength_ds).

For PCI users, you explicitly set the NAND_ECC_MAXIMIZE flag, so it
shouldn't be a problem (you're still backward compatible).

> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v3: None
> Changes in v2:
>   - Add available values in the binding document
> 
>  Documentation/devicetree/bindings/mtd/denali-nand.txt |  6 ++++++
>  drivers/mtd/nand/denali.c                             | 18 ++++++++++++++++--
>  drivers/mtd/nand/denali_pci.c                         |  1 +
>  3 files changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mtd/denali-nand.txt b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> index 25313c7..647618e 100644
> --- a/Documentation/devicetree/bindings/mtd/denali-nand.txt
> +++ b/Documentation/devicetree/bindings/mtd/denali-nand.txt
> @@ -11,6 +11,12 @@ Optional properties:
>    - nand-ecc-step-size: must be 512 or 1024.  If not specified, default to:
>        512   for "altr,socfpga-denali-nand"
>      see nand.txt for details.
> +  - nand-ecc-strength: see nand.txt for details.  Available values are:
> +      8, 15      for "altr,socfpga-denali-nand"
> +  - nand-ecc-maximize: see nand.txt for details
> +
> +Note:
> +Either nand-ecc-strength or nand-ecc-maximize should be specified.
>  
>  The device tree may optionally contain sub-nodes describing partitions of the
>  address space. See partition.txt for more detail.
> diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
> index ce87b95..2f796e3 100644
> --- a/drivers/mtd/nand/denali.c
> +++ b/drivers/mtd/nand/denali.c
> @@ -1641,9 +1641,23 @@ int denali_init(struct denali_nand_info *denali)
>  		goto failed_req_irq;
>  	}
>  
> -	ret = denali_set_max_ecc_strength(denali);
> -	if (ret)
> +	if (!chip->ecc.strength && !(chip->ecc.options & NAND_ECC_MAXIMIZE)) {
> +		dev_info(denali->dev,
> +			 "No ECC strength strategy is specified. Maximizing ECC strength\n");
> +		chip->ecc.options |= NAND_ECC_MAXIMIZE;
> +	}
> +
> +	if (chip->ecc.options & NAND_ECC_MAXIMIZE) {
> +		ret = denali_set_max_ecc_strength(denali);
> +		if (ret)
> +			goto failed_req_irq;
> +	} else if (!(denali->ecc_strength_avail & BIT(chip->ecc.strength))) {
> +		dev_err(denali->dev,
> +			"ECC strength %d is not supported on this controller.\n",
> +			chip->ecc.strength);
> +		ret = -EINVAL;
>  		goto failed_req_irq;
> +	}
>  
>  	chip->ecc.bytes = denali_calc_ecc_bytes(chip->ecc.size,
>  						chip->ecc.strength);
> diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
> index a1ee9f8..a39682a5 100644
> --- a/drivers/mtd/nand/denali_pci.c
> +++ b/drivers/mtd/nand/denali_pci.c
> @@ -87,6 +87,7 @@ static int denali_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  
>  	denali->ecc_strength_avail = BIT(15) | BIT(8);
>  	denali->caps |= DENALI_CAP_ECC_SIZE_512;
> +	denali->nand.ecc.options |= NAND_ECC_MAXIMIZE;
>  
>  	ret = denali_init(denali);
>  	if (ret)
