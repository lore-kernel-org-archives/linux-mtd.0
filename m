Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcmZs-000463-TO
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 05:52:18 +0000
Subject: Re: [PATCH v2 05/25] mtd: nand: qcom: remove redundant chip select
 compatible string
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, sricharan@codeaurora.org
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-6-git-send-email-absahu@codeaurora.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <248e1459-5cec-32c6-1de8-8f5478a8f5da@codeaurora.org>
Date: Wed, 2 Aug 2017 11:21:50 +0530
MIME-Version: 1.0
In-Reply-To: <1500464893-11352-6-git-send-email-absahu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
> Currently the compatible “qcom,nandcs” is being used for each
> connected NAND device to support for multiple NAND devices in the
> same bus. The same thing can be achieved by looking reg property
> for each sub nodes which contains the chip select number so this
> patch removes the use of “qcom,nandcs” for specifying NAND device
> sub nodes.
> 
> Since there is no user for this driver currently in so
> changing compatible string is safe.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 26 ++++++++++++--------------
>   1 file changed, 12 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 8fa2f0c..110a26a 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -2129,22 +2129,20 @@ static int qcom_nandc_probe(struct platform_device *pdev)
>   		goto err_setup;
>   
>   	for_each_available_child_of_node(dn, child) {
> -		if (of_device_is_compatible(child, "qcom,nandcs")) {
> -			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> -			if (!host) {
> -				of_node_put(child);
> -				ret = -ENOMEM;
> -				goto err_cs_init;
> -			}
> -
> -			ret = qcom_nand_host_init(nandc, host, child);
> -			if (ret) {
> -				devm_kfree(dev, host);
> -				continue;
> -			}
> +		host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
> +		if (!host) {
> +			of_node_put(child);
> +			ret = -ENOMEM;
> +			goto err_cs_init;
> +		}
>   
> -			list_add_tail(&host->node, &nandc->host_list);
> +		ret = qcom_nand_host_init(nandc, host, child);
> +		if (ret) {
> +			devm_kfree(dev, host);
> +			continue;
>   		}
> +
> +		list_add_tail(&host->node, &nandc->host_list);
>   	}
>   
>   	if (list_empty(&nandc->host_list)) {
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
