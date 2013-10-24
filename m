Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZGoF-0002Ip-Lc
 for linux-mtd@lists.infradead.org; Thu, 24 Oct 2013 09:02:28 +0000
Message-ID: <5268E206.5080602@ti.com>
Date: Thu, 24 Oct 2013 14:31:58 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 5/5] mtd: m25p80: remove 'disabled' device check
References: <1382583503-13748-1-git-send-email-computersforpeace@gmail.com>
 <1382583503-13748-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1382583503-13748-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>, Rob Herring <rob.herring@calxeda.com>,
 linux-mtd@lists.infradead.org, Grant Likely <grant.likely@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 24 October 2013 08:28 AM, Brian Norris wrote:
> It seems like the following commit was never necessary
>
>      commit 5f949137952020214cd167093dd7be448f21c079
>      Author: Shaohui Xie<Shaohui.Xie@freescale.com>
>      Date:   Fri Oct 14 15:49:00 2011 +0800
>
>          mtd: m25p80: don't probe device which has status of 'disabled'
>
> because it duplicates the code in of_platform_device_create_pdata()
> which ensures that 'disabled' nodes are never instantiated.
>
> Also, drop the __maybe_unused.
>
> Signed-off-by: Brian Norris<computersforpeace@gmail.com>
> Cc: Grant Likely<grant.likely@linaro.org>
> Cc: Rob Herring<rob.herring@calxeda.com>
> Cc:<devicetree@vger.kernel.org>
Reviewed-by: Sourav Poddar <sourav.poddar@ti.com>
> ---
>   drivers/mtd/devices/m25p80.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
> index d6c5c57..a1dc49a 100644
> --- a/drivers/mtd/devices/m25p80.c
> +++ b/drivers/mtd/devices/m25p80.c
> @@ -935,12 +935,7 @@ static int m25p_probe(struct spi_device *spi)
>   	struct flash_info		*info;
>   	unsigned			i;
>   	struct mtd_part_parser_data	ppdata;
> -	struct device_node __maybe_unused *np = spi->dev.of_node;
> -
> -#ifdef CONFIG_MTD_OF_PARTS
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> -#endif
> +	struct device_node *np = spi->dev.of_node;
>
>   	/* Platform data helps sort out which chip type we have, as
>   	 * well as how this board partitions it.  If we don't have
