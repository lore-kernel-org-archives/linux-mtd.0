Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dRuoO-0003Nv-Fx
 for linux-mtd@lists.infradead.org; Mon, 03 Jul 2017 06:26:21 +0000
Subject: Re: [PATCH 03/14] qcom: mtd: nand: Fixed config error for BCH
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andy.gross@linaro.org, architt@codeaurora.org
References: <1498720566-20782-1-git-send-email-absahu@codeaurora.org>
 <1498720566-20782-4-git-send-email-absahu@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
Message-ID: <497e44b6-0872-0de3-5ca8-2f10af13d254@codeaurora.org>
Date: Mon, 3 Jul 2017 11:55:49 +0530
MIME-Version: 1.0
In-Reply-To: <1498720566-20782-4-git-send-email-absahu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
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

Hi Abhishek,

On 6/29/2017 12:45 PM, Abhishek Sahu wrote:
> The configuration for BCH is not correct in the current
> driver so this patch fixed the same.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 520add9..410ee53 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -1919,7 +1919,7 @@ static int qcom_nand_host_setup(struct qcom_nand_host *host)
>  				| wide_bus << WIDE_FLASH
>  				| 1 << DEV0_CFG1_ECC_DISABLE;
>  
> -	host->ecc_bch_cfg = host->bch_enabled << ECC_CFG_ECC_DISABLE
> +	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
>  				| 0 << ECC_SW_RESET
>  				| host->cw_data << ECC_NUM_DATA_BYTES
>  				| 1 << ECC_FORCE_CLK_OPEN
> 

 This could be patch #1, so basically all fixes first and then support
 for bam after that.

Regards,
 Sricharan

-- 
"QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
