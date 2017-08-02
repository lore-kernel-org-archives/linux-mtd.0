Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcmXz-0002YD-GH
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 05:50:21 +0000
Subject: Re: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, sricharan@codeaurora.org
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <1eaa3317-5dcf-d212-c6fa-f6922bd40441@codeaurora.org>
Date: Wed, 2 Aug 2017 11:19:52 +0530
MIME-Version: 1.0
In-Reply-To: <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
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



On 07/19/2017 05:17 PM, Abhishek Sahu wrote:
> The current driver is failing without complete bootchain since
> NAND_DEV_CMD_VLD value is not valid.
> 

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index bc0408c..f3b995d 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -148,6 +148,9 @@
>   #define	FETCH_ID			0xb
>   #define	RESET_DEVICE			0xd
>   
> +/* Value for NAND_DEV_CMD_VLD */
> +#define NAND_DEV_CMD_VLD_VAL		0x1d
> +
>   /*
>    * the NAND controller performs reads/writes with ECC in 516 byte chunks.
>    * the driver calls the chunks 'step' or 'codeword' interchangeably
> @@ -1972,6 +1975,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>   {
>   	/* kill onenand */
>   	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>   
>   	/* enable ADM DMA */
>   	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
