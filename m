Message-ID: <5047286C.4060705@atmel.com>
Date: Wed, 05 Sep 2012 18:24:44 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: fix the compile error which miss label
 "err_ecc_ioremap".
References: <1346824842-18875-1-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1346824842-18875-1-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nicolas.ferre@atmel.com, plagnioj@jcrosoft.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all

This patch is for latest l2-mtd.git tree. It fixes the compile error 
after JC's commit: b654a9a4

On 9/5/2012 2:00 PM, Josh Wu wrote:
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
>   drivers/mtd/nand/atmel_nand.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 6a5a35b..9144557 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1399,7 +1399,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
>   	if (pdev->dev.of_node) {
>   		res = atmel_of_init_port(host, pdev->dev.of_node);
>   		if (res)
> -			goto err_nand_ioremap;
> +			goto err_ecc_ioremap;
>   	} else {
>   		memcpy(&host->board, pdev->dev.platform_data,
>   		       sizeof(struct atmel_nand_data));
> @@ -1560,6 +1560,7 @@ err_no_card:
>   	platform_set_drvdata(pdev, NULL);
>   	if (host->dma_chan)
>   		dma_release_channel(host->dma_chan);
> +err_ecc_ioremap:
>   	iounmap(host->io_base);
>   err_nand_ioremap:
>   	kfree(host);

Best Regards,
Josh Wu
