Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ddILh-0006C5-8n
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 15:47:46 +0000
Date: Thu, 3 Aug 2017 17:47:13 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com, marek.vasut@gmail.com,
 richard@nod.at, cyrille.pitchen@wedev4u.fr, robh+dt@kernel.org,
 mark.rutland@arm.com, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andy.gross@linaro.org,
 architt@codeaurora.org, sricharan@codeaurora.org
Subject: Re: [PATCH v2 02/25] mtd: nand: qcom: program NAND_DEV_CMD_VLD
 register
Message-ID: <20170803174713.5b5f5dde@bbrezillon>
In-Reply-To: <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
References: <1500464893-11352-1-git-send-email-absahu@codeaurora.org>
 <1500464893-11352-3-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 19 Jul 2017 17:17:50 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> The current driver is failing without complete bootchain since
> NAND_DEV_CMD_VLD value is not valid.
> 
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
> ---
>  drivers/mtd/nand/qcom_nandc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index bc0408c..f3b995d 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -148,6 +148,9 @@
>  #define	FETCH_ID			0xb
>  #define	RESET_DEVICE			0xd
>  
> +/* Value for NAND_DEV_CMD_VLD */
> +#define NAND_DEV_CMD_VLD_VAL		0x1d

Where does this 0x1d value comes from? Defining a macro instead of
passing 0x1d does not change the fact that this is a magic value :-).

> +
>  /*
>   * the NAND controller performs reads/writes with ECC in 516 byte chunks.
>   * the driver calls the chunks 'step' or 'codeword' interchangeably
> @@ -1972,6 +1975,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
>  {
>  	/* kill onenand */
>  	nandc_write(nandc, SFLASHC_BURST_CFG, 0);
> +	nandc_write(nandc, NAND_DEV_CMD_VLD, NAND_DEV_CMD_VLD_VAL);
>  
>  	/* enable ADM DMA */
>  	nandc_write(nandc, NAND_FLASH_CHIP_SELECT, DM_EN);
