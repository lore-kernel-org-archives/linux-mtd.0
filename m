Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dcmnn-0001zM-IH
 for linux-mtd@lists.infradead.org; Wed, 02 Aug 2017 06:06:41 +0000
Subject: Re: [PATCH v2 09/25] mtd: nand: qcom: remove memset for clearing read
 register buffer
To: Abhishek Sahu <absahu@codeaurora.org>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@free-electrons.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@wedev4u.fr,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 andy.gross@linaro.org, sricharan@codeaurora.org
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-10-git-send-email-absahu@codeaurora.org>
From: Archit Taneja <architt@codeaurora.org>
Message-ID: <3804c0db-940d-24d6-dae0-7965bfb3f259@codeaurora.org>
Date: Wed, 2 Aug 2017 11:36:12 +0530
MIME-Version: 1.0
In-Reply-To: <1500464893-11352-10-git-send-email-absahu@codeaurora.org>
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
> The memset in clear_read_regs is overhead. All the register data
> will be filled by DMA during NAND operation so making these
> register variables zero is not required.

Yeah, that's a good point.

Reviewed-by: Archit Taneja <architt@codeaurora.org>

> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>   drivers/mtd/nand/qcom_nandc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 5b71478..7ecd0f8 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -826,8 +826,6 @@ static void free_descs(struct qcom_nand_controller *nandc)
>   static void clear_read_regs(struct qcom_nand_controller *nandc)
>   {
>   	nandc->reg_read_pos = 0;
> -	memset(nandc->reg_read_buf, 0,
> -	       MAX_REG_RD * sizeof(*nandc->reg_read_buf));
>   }
>   
>   static void pre_command(struct qcom_nand_host *host, int command)
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
