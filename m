Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcpAI-0002QI-V5
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 08:38:04 +0000
Subject: Re: [PATCH v2 13/25] mtd: nand: qcom: add QPIC NAND compatible string
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, sricharan@codeaurora.org
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-14-git-send-email-absahu@codeaurora.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <973705c0-7915-3239-c150-92dc938e52e6@codeaurora.org>
Date: Wed, 2 Aug 2017 14:06:18 +0530
MIME-Version: 1.0
In-Reply-To: <1500464893-11352-14-git-send-email-absahu@codeaurora.org>
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



On 07/19/2017 05:18 PM, Abhishek Sahu wrote:
> The current driver only support EBI2 NAND which uses ADM DMA. The

s/support/supports

> latest QCOM controller supports QPIC NAND which uses BAM DMA. NAND
> registers and programming sequence are same for EBI2 and QPIC
> NAND so the same driver can support QPIC NAND also by adding the
> BAM DMA support. This patch adds the QPIC NAND support in current
> NAND driver with compatible string "qcom,qpic-nandc-v1.4.0" and
> maps it with different configuration parameter in driver data.
> 

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 3b0ae91..6d24630 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -323,9 +323,11 @@ struct qcom_nand_host {
>    * This data type corresponds to the nand controller properties which varies
>    * among different NAND controller IP's.
>    * @ecc_modes - ecc mode for NAND
> + * @is_bam - whether NAND controller is using bam
>    */
>   struct qcom_props {
>   	u32 ecc_modes;
> +	bool is_bam;
>   };
>   
>   static inline struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
> @@ -2245,6 +2247,12 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   
>   static const struct qcom_props ebi2_nandc_data = {
>   	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
> +	.is_bam = false,
> +};
> +
> +static const struct qcom_props qpic_nandc_v1_4_0_data = {
> +	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
> +	.is_bam = true,
>   };
>   
>   /*
> @@ -2255,6 +2263,9 @@ static int qcom_nandc_remove(struct platform_device *pdev)
>   	{	.compatible = "qcom,ebi2-nandc",
>   		.data = &ebi2_nandc_data,
>   	},
> +	{	.compatible = "qcom,qpic-nandc-v1.4.0",
> +		.data = &qpic_nandc_v1_4_0_data,
> +	},
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, qcom_nandc_of_match);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
