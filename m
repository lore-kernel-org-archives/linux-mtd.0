Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhrPR-0003SW-Fv
 for linux-mtd@lists.infradead.org; Wed, 16 Aug 2017 06:02:30 +0000
Subject: Re: [PATCH v4 19/20] mtd: nand: qcom: support for IPQ4019 QPIC NAND
 controller
To: Abhishek Sahu <absahu@codeaurora.org>, boris.brezillon@free-electrons.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, andy.gross@linaro.org, sricharan@codeaurora.org
References: <1502451575-15712-1-git-send-email-absahu@codeaurora.org>
 <1502451575-15712-20-git-send-email-absahu@codeaurora.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <651595b5-3877-f771-0aba-d6466f8ba8db@codeaurora.org>
Date: Wed, 16 Aug 2017 11:32:03 +0530
MIME-Version: 1.0
In-Reply-To: <1502451575-15712-20-git-send-email-absahu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 08/11/2017 05:09 PM, Abhishek Sahu wrote:
> Add the compatible string for IPQ4019 QPIC NAND controller
> version 1.4.0 which uses BAM DMA.


Reviewed-by: Archit Taneja <architt@codeaurora.org>

Thanks,
Archit

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index f2cb696..03e671e 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2857,6 +2857,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   	.flash_dev_offset = 0x0,
>   };
>   
> +static const struct qcom_nandc_props ipq4019_nandc_props = {
> +	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
> +	.is_bam = true,
> +	.flash_dev_offset = 0x0,
> +};
> +
>   /*
>    * data will hold a struct pointer containing more differences once we support
>    * more controller variants
> @@ -2866,6 +2872,10 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   		.compatible = "qcom,ipq806x-nand",
>   		.data = &ipq806x_nandc_props,
>   	},
> +	{
> +		.compatible = "qcom,ipq4019-nand",
> +		.data = &ipq4019_nandc_props,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
