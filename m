Received: from nasmtp01.atmel.com ([192.199.1.246]
 helo=DVREDG02.corp.atmel.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ua1lS-0006D0-1C
 for linux-mtd@lists.infradead.org; Wed, 08 May 2013 10:38:26 +0000
Message-ID: <518A2B00.8030900@atmel.com>
Date: Wed, 8 May 2013 18:37:52 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 11/26] mtd: nand: atmel_nand: remove unnecessary
 platform_set_drvdata()
References: <004f01ce4aec$c841b610$58c52230$@samsung.com>
In-Reply-To: <004f01ce4aec$c841b610$58c52230$@samsung.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: 'Artem Bityutskiy' <artem.bityutskiy@linux.intel.com>,
 'David Woodhouse' <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/7/2013 2:33 PM, Jingoo Han wrote:
> The driver core clears the driver data to NULL after device_release
> or on probe failure, since commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
> (device-core: Ensure drvdata = NULL when no driver is bound).
> Thus, it is not needed to manually clear the device driver data to NULL.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Josh Wu <josh.wu@atmel.com>

Best Regards,
Josh Wu

> ---
>   drivers/mtd/nand/atmel_nand.c |    1 -
>   1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 2d23d29..36c52f5 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1665,7 +1665,6 @@ err_hw_ecc:
>   err_scan_ident:
>   err_no_card:
>   	atmel_nand_disable(host);
> -	platform_set_drvdata(pdev, NULL);
>   	if (host->dma_chan)
>   		dma_release_channel(host->dma_chan);
>   err_ecc_ioremap:
