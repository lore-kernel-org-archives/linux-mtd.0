Received: from nasmtp02.atmel.com ([204.2.163.16])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UjNZf-0006K7-C2
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2013 05:44:55 +0000
Message-ID: <51AC2D20.3040703@atmel.com>
Date: Mon, 3 Jun 2013 13:44:00 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Richard Genoud <richard.genoud@gmail.com>
Subject: Re: [PATCH] MTD: atmel_nand: using a stronger ECC is not dangerous
References: <1370010850-20860-1-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1370010850-20860-1-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/31/2013 10:34 PM, Richard Genoud wrote:
> We don't have to issue a warning when a stronger error correting
> capability is chosen.
>
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>

Acked-by: Josh Wu <josh.wu@atmel.com>

Best Regards,
Josh Wu

> ---
>   drivers/mtd/nand/atmel_nand.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 2d23d29..2415cdc 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -1002,7 +1002,7 @@ static int __init atmel_pmecc_nand_init_params(struct platform_device *pdev,
>   		return err_no;
>   	}
>   
> -	if (cap != host->pmecc_corr_cap ||
> +	if (cap > host->pmecc_corr_cap ||
>   			sector_size != host->pmecc_sector_size)
>   		dev_info(host->dev, "WARNING: Be Caution! Using different PMECC parameters from Nand ONFI ECC reqirement.\n");
>   
