Received: from mail-la0-x22d.google.com ([2a00:1450:4010:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UpJB1-0004TA-JN
 for linux-mtd@lists.infradead.org; Wed, 19 Jun 2013 14:16:00 +0000
Received: by mail-la0-f45.google.com with SMTP id fr10so4669657lab.32
 for <linux-mtd@lists.infradead.org>; Wed, 19 Jun 2013 07:15:36 -0700 (PDT)
Message-ID: <51C1BD0C.2040008@cogentembedded.com>
Date: Wed, 19 Jun 2013 18:15:40 +0400
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
MIME-Version: 1.0
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH 2/6] mtd: atmel_nand: replace pmecc enable code with one
 function.
References: <1371622997-26303-1-git-send-email-josh.wu@atmel.com>
 <1371622997-26303-3-git-send-email-josh.wu@atmel.com>
In-Reply-To: <1371622997-26303-3-git-send-email-josh.wu@atmel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, nicolas.ferre@atmel.com, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

On 19-06-2013 10:23, Josh Wu wrote:

> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
> ---
>   drivers/mtd/nand/atmel_nand.c |   40 +++++++++++++++++++++++++---------------
>   1 file changed, 25 insertions(+), 15 deletions(-)

> diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
> index d39f364..cb8362e 100644
> --- a/drivers/mtd/nand/atmel_nand.c
> +++ b/drivers/mtd/nand/atmel_nand.c
> @@ -754,6 +754,29 @@ normal_check:
>   	return total_err;
>   }
>
> +static void pmecc_enable(struct atmel_nand_host *host, int ecc_op)
> +{
> +	u32 val;

    Other functions have empty line after the declaration.

> +	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_RST);
> +	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
> +	val = pmecc_readl_relaxed(host->ecc, CFG);
> +
> +	if (ecc_op != NAND_ECC_READ && ecc_op != NAND_ECC_WRITE) {
> +		dev_err(host->dev, "atmel_nand: wrong pmecc operation type!");
> +		return;
> +	}
> +
> +	if (ecc_op == NAND_ECC_READ)
> +		pmecc_writel(host->ecc, CFG, (val & ~PMECC_CFG_WRITE_OP)
> +			| PMECC_CFG_AUTO_ENABLE);
> +	else
> +		pmecc_writel(host->ecc, CFG, (val | PMECC_CFG_WRITE_OP)
> +			& ~PMECC_CFG_AUTO_ENABLE);
> +
> +	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_ENABLE);
> +	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DATA);
> +}
> +

WBR, Sergei
