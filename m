Sender: Grant Likely <glikely@secretlab.ca>
Date: Mon, 25 Jul 2011 15:19:10 -0600
From: Grant Likely <grant.likely@secretlab.ca>
To: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] mtd/m25p80: add device tree probe support
Message-ID: <20110725211910.GG26735@ponder.secretlab.ca>
References: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311601063-16581-1-git-send-email-shawn.guo@linaro.org>
Cc: devicetree-discuss@lists.ozlabs.org,
	Artem Bityutskiy <artem.bityutskiy@intel.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 25, 2011 at 09:37:43PM +0800, Shawn Guo wrote:
> It adds device tree probe support for m25p80 driver.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Cc: Artem Bityutskiy <artem.bityutskiy@intel.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>
> ---
>  Documentation/devicetree/bindings/mtd/st-m25p.txt |   14 ++++++++++++++
>  drivers/mtd/devices/m25p80.c                      |   12 ++++++++++++
>  2 files changed, 26 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mtd/st-m25p.txt
> 
> diff --git a/Documentation/devicetree/bindings/mtd/st-m25p.txt b/Documentation/devicetree/bindings/mtd/st-m25p.txt
> new file mode 100644
> index 0000000..a8c0485
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/st-m25p.txt
> @@ -0,0 +1,14 @@
> +* STMicroelectronics SPI Flash
> +
> +Required properties:
> +- compatible : "st,<model>", "st,m25p".
> +
> +Examples:
> +
> +flash: m25p32@1 {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	compatible = "st,m25p32", "st,m25p";
> +	spi-max-frequency = <20000000>;
> +	reg = <1>;
> +};
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index e6ba034..d9d4101 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -26,6 +26,7 @@
>  #include <linux/slab.h>
>  #include <linux/sched.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/of_device.h>
>  
>  #include <linux/mtd/cfi.h>
>  #include <linux/mtd/mtd.h>
> @@ -767,6 +768,16 @@ static const struct spi_device_id m25p_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(spi, m25p_ids);
>  
> +#ifdef CONFIG_OF
> +static const struct of_device_id m25p_dt_ids[] = {
> +	{ .compatible = "st,m25p", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, m25p_dt_ids);
> +#else
> +#define m25p_dt_ids NULL
> +#endif
> +
>  static const struct spi_device_id *__devinit jedec_probe(struct spi_device *spi)
>  {
>  	int			tmp;
> @@ -986,6 +997,7 @@ static struct spi_driver m25p80_driver = {
>  		.name	= "m25p80",
>  		.bus	= &spi_bus_type,
>  		.owner	= THIS_MODULE,
> +		.of_match_table = m25p_dt_ids,
>  	},
>  	.id_table	= m25p_ids,
>  	.probe	= m25p_probe,
> -- 
> 1.7.4.1
> 
> 
