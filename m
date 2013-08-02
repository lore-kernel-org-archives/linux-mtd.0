Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V59E3-0007bc-Vh
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 06:52:36 +0000
Message-ID: <51FB5719.7050209@ti.com>
Date: Fri, 2 Aug 2013 12:22:09 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Sourav Poddar <sourav.poddar@ti.com>
Subject: Re: [PATCH] drivers: mtd: devices: make m25p80 dt adapted.
References: <1375426170-31609-1-git-send-email-sourav.poddar@ti.com>
In-Reply-To: <1375426170-31609-1-git-send-email-sourav.poddar@ti.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, artem.bityutskiy@linux.intel.com, balbi@ti.com,
 linux-mtd@lists.infradead.org, pekon@ti.com, linux-omap@vger.kernel.org,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ correct device tree mailing list
On Friday 02 August 2013 12:19 PM, Sourav Poddar wrote:
> This patch helps gettimg m25p80 probed through dt.
> To get the id of the exact flash type supported for dt case,
> data->type is getting parsed from dt entry.
>
> Signed-off-by: Sourav Poddar<sourav.poddar@ti.com>
> ---
>   drivers/mtd/devices/m25p80.c |   22 +++++++++++++++++++++-
>   1 files changed, 21 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index 33098bf..cbfb9b3 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -855,6 +855,13 @@ static const struct spi_device_id m25p_ids[] = {
>   };
>   MODULE_DEVICE_TABLE(spi, m25p_ids);
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id m25p_dt_ids[] = {
> +	{ .compatible = "m25p80", },
> +	{ /* sentinel */ }
> +};
> +#endif
> +
>   static const struct spi_device_id *jedec_probe(struct spi_device *spi)
>   {
>   	int			tmp;
> @@ -909,6 +916,7 @@ static int m25p_probe(struct spi_device *spi)
>   	unsigned			i;
>   	struct mtd_part_parser_data	ppdata;
>   	struct device_node __maybe_unused *np = spi->dev.of_node;
> +	int len;
>
>   #ifdef CONFIG_MTD_OF_PARTS
>   	if (!of_device_is_available(np))
> @@ -920,7 +928,18 @@ static int m25p_probe(struct spi_device *spi)
>   	 * a chip ID, try the JEDEC id commands; they'll work for most
>   	 * newer chips, even if we don't recognize the particular chip.
>   	 */
> -	data = spi->dev.platform_data;
> +	if (!np) {
> +		data = spi->dev.platform_data;
> +	} else {
> +		data = devm_kzalloc(&spi->dev, sizeof(*data), GFP_KERNEL);
> +		if (!data)
> +			return -ENOMEM;
> +
> +		data->type = (char *) of_get_property(np, "type",&len);
> +		if (!data->type || strlen(data->type)>  len)
> +			return -ENODEV;
> +	}
> +
>   	if (data&&  data->type) {
>   		const struct spi_device_id *plat_id;
>
> @@ -1098,6 +1117,7 @@ static struct spi_driver m25p80_driver = {
>   	.driver = {
>   		.name	= "m25p80",
>   		.owner	= THIS_MODULE,
> +		.of_match_table = of_match_ptr(m25p_dt_ids),
>   	},
>   	.id_table	= m25p_ids,
>   	.probe	= m25p_probe,
