Date: Wed, 30 Apr 2014 11:14:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Subject: Re: [PATCH v3 3/9] of: mtd: add NAND timing mode retrieval support
Message-ID: <20140430181458.GD2497@norris-Latitude-E6410>
References: <1394647664-8258-1-git-send-email-b.brezillon.dev@gmail.com>
 <1394647664-8258-4-git-send-email-b.brezillon.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394647664-8258-4-git-send-email-b.brezillon.dev@gmail.com>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-doc@vger.kernel.org, dev@linux-sunxi.org, linux-kernel@vger.kernel.org,
 Jason Gunthorpe <jgunthorpe@obsidianresearch.com>,
 Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@linaro.org>,
 linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 12, 2014 at 07:07:38PM +0100, Boris BREZILLON wrote:
> Add a function to retrieve NAND timing mode (ONFI timing mode) from a given
> DT node.
> 
> Signed-off-by: Boris BREZILLON <b.brezillon.dev@gmail.com>
> ---
>  drivers/of/of_mtd.c    |   19 +++++++++++++++++++
>  include/linux/of_mtd.h |    8 ++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
> index b7361ed..8bdaa0b 100644
> --- a/drivers/of/of_mtd.c
> +++ b/drivers/of/of_mtd.c
> @@ -117,3 +117,22 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
>  	return of_property_read_bool(np, "nand-on-flash-bbt");
>  }
>  EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
> +
> +/**
> + * of_get_nand_timings - Get nand timings for the given device_node
> + * @np:	Pointer to the given device_node
> + *
> + * return 0 on success errno other wise
> + */
> +int of_get_nand_onfi_timing_mode(struct device_node *np)
> +{
> +	int err;
> +	u32 mode;
> +
> +	err = of_property_read_u32(np, "onfi,nand-timing-mode", &mode);
> +	if (err)
> +		return err;
> +
> +	return mode;

To fit the style of the rest of this file (and to save some lines) this
might as well be:

	return ret ? ret : mode;

> +}
> +EXPORT_SYMBOL_GPL(of_get_nand_onfi_timing_mode);
> diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
> index e266caa..c8310ae 100644
> --- a/include/linux/of_mtd.h
> +++ b/include/linux/of_mtd.h
> @@ -9,6 +9,8 @@
>  #ifndef __LINUX_OF_MTD_H
>  #define __LINUX_OF_MTD_H
>  
> +#include <linux/mtd/nand.h>
> +

What's this header used for here? I think you can drop it.

>  #ifdef CONFIG_OF_MTD
>  
>  #include <linux/of.h>
> @@ -17,6 +19,7 @@ int of_get_nand_ecc_step_size(struct device_node *np);
>  int of_get_nand_ecc_strength(struct device_node *np);
>  int of_get_nand_bus_width(struct device_node *np);
>  bool of_get_nand_on_flash_bbt(struct device_node *np);
> +int of_get_nand_onfi_timing_mode(struct device_node *np);
>  
>  #else /* CONFIG_OF_MTD */
>  
> @@ -45,6 +48,11 @@ static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
>  	return false;
>  }
>  
> +static inline int of_get_nand_onfi_timing_mode(struct device_node *np)
> +{
> +	return -ENOSYS;
> +}
> +
>  #endif /* CONFIG_OF_MTD */
>  
>  #endif /* __LINUX_OF_MTD_H */

Brian
