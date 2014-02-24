Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHyAG-0001rD-7P
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 16:13:57 +0000
Received: by mail-wg0-f47.google.com with SMTP id k14so4746413wgh.26
 for <linux-mtd@lists.infradead.org>; Mon, 24 Feb 2014 08:13:31 -0800 (PST)
Message-ID: <530B6FA9.5050902@gmail.com>
Date: Mon, 24 Feb 2014 17:13:29 +0100
From: Boris BREZILLON <b.brezillon.dev@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] of_mtd: Add helpers to get ECC strength and ECC
 step size
References: <1392749474-12936-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
In-Reply-To: <1392749474-12936-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Grant Likely <grant.likely@secretlab.ca>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18/02/2014 19:51, Ezequiel Garcia wrote:
> This commit adds simple helpers to obtain the devicetree properties
> that specify the ECC strength and ECC step size to use on a given
> NAND controller.
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>   drivers/of/of_mtd.c    | 34 ++++++++++++++++++++++++++++++++++
>   include/linux/of_mtd.h | 12 ++++++++++++
>   2 files changed, 46 insertions(+)
>
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index a27ec94..b7361ed 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -50,6 +50,40 @@ int of_get_nand_ecc_mode(struct device_node *np)
>   EXPORT_SYMBOL_GPL(of_get_nand_ecc_mode);
>   
>   /**
> + * of_get_nand_ecc_step_size - Get ECC step size associated to
> + * the required ECC strength (see below).
> + * @np:	Pointer to the given device_node
> + *
> + * return the ECC step size, or errno in error case.
> + */
> +int of_get_nand_ecc_step_size(struct device_node *np)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = of_property_read_u32(np, "nand-ecc-step-size", &val);
> +	return ret ? ret : val;
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_ecc_step_size);
> +
> +/**
> + * of_get_nand_ecc_strength - Get required ECC strength over the
> + * correspnding step size as defined by 'nand-ecc-size'
> + * @np:	Pointer to the given device_node
> + *
> + * return the ECC strength, or errno in error case.
> + */
> +int of_get_nand_ecc_strength(struct device_node *np)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = of_property_read_u32(np, "nand-ecc-strength", &val);
> +	return ret ? ret : val;
> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_ecc_strength);
> +
> +/**
>    * of_get_nand_bus_width - Get nand bus witdh for given device_node
>    * @np:	Pointer to the given device_node
>    *
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index cb32d9c..c078f99 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -13,6 +13,8 @@
>   
>   #include <linux/of.h>
>   int of_get_nand_ecc_mode(struct device_node *np);
> +int of_get_nand_ecc_step_size(struct device_node *np)
> +int of_get_nand_ecc_strength(struct device_node *np)

You forgot the semicolon.


>   int of_get_nand_bus_width(struct device_node *np);
>   bool of_get_nand_on_flash_bbt(struct device_node *np);
>   
> @@ -23,6 +25,16 @@ static inline int of_get_nand_ecc_mode(struct device_node *np)
>   	return -ENOSYS;
>   }
>   
> +static inline int of_get_nand_ecc_step_size(struct device_node *np)
> +{
> +	return -ENOSYS;
> +}
> +
> +static inline int of_get_nand_ecc_strength(struct device_node *np)
> +{
> +	return -ENOSYS;
> +}
> +
>   static inline int of_get_nand_bus_width(struct device_node *np)
>   {
>   	return -ENOSYS;
