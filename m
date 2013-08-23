Received: from nasmtp02.atmel.com ([204.2.163.16])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VCiRX-0008TB-6D
 for linux-mtd@lists.infradead.org; Fri, 23 Aug 2013 03:53:51 +0000
Message-ID: <5216DCB0.7050909@atmel.com>
Date: Fri, 23 Aug 2013 11:53:20 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: Wei Yongjun <weiyj.lk@gmail.com>
Subject: Re: [PATCH -next] mtd: atmel_nand: fix error return code in
 atmel_nand_probe()
References: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
In-Reply-To: <CAPgLHd8an7_iEV1eTNGFmQ8B4CM=FGu0jrov_A=L9JRJ8AFKPA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, artem.bityutskiy@linux.intel.com,
 jg1.han@samsung.com, rob.herring@calxeda.com, yongjun_wei@trendmicro.com.cn,
 linux-mtd@lists.infradead.org, grant.likely@linaro.org, plagnioj@jcrosoft.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 8/23/2013 10:50 AM, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
>
> Fix to return a negative error code from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Thank you for catch this. And
Acked-by: Josh Wu <josh.wu@atmel.com>

> ---
>   drivers/mtd/nand/atmel_nand.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index 65b302c..093bcf8 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -2047,6 +2047,7 @@ static int __init atmel_nand_probe(struct platform_device *pdev)
>   		irq = platform_get_irq(pdev, 0);
>   		if (irq < 0) {
>   			dev_err(host->dev, "Cannot get HSMC irq!\n");
> +			res = irq;
>   			goto err_nand_ioremap;
>   		}
>   
>
