Received: from mail.free-electrons.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e00UK-0008Hr-9A
 for linux-mtd@lists.infradead.org; Thu, 05 Oct 2017 07:22:34 +0000
Date: Thu, 5 Oct 2017 09:22:07 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>, Sricharan R <sricharan@codeaurora.org>
Subject: Re: [RESEND PATCH v5 10/16] mtd: nand: qcom: add command elements
 in BAM transaction
Message-ID: <20171005092207.63f2c18f@bbrezillon>
In-Reply-To: <1506325886-23347-1-git-send-email-absahu@codeaurora.org>
References: <1506325886-23347-1-git-send-email-absahu@codeaurora.org>
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

On Mon, 25 Sep 2017 13:21:25 +0530
Abhishek Sahu <absahu@codeaurora.org> wrote:

> All the QPIC register read/write through BAM DMA requires
> command descriptor which contains the array of command elements.
> 
> Reviewed-by: Archit Taneja <architt@codeaurora.org>
> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>

Applied both.

Thanks,

Boris

> ---
> 
> * Changes from v4: None
> 
> The BAM DMA patches [1] got merged in 4.14-rc1 so now all the build
> dependencies are solved and this patch can be merged.
> This patch can be cleanly applied over v4.14-rc1.
> 
> [1] http://www.spinics.net/lists/dmaengine/msg13665.html
> 
>  drivers/mtd/nand/qcom_nandc.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/qcom_nandc.c b/drivers/mtd/nand/qcom_nandc.c
> index 7977a70..b0a4734 100644
> --- a/drivers/mtd/nand/qcom_nandc.c
> +++ b/drivers/mtd/nand/qcom_nandc.c
> @@ -22,6 +22,7 @@
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/delay.h>
> +#include <linux/dma/qcom_bam_dma.h>
>  
>  /* NANDc reg offsets */
>  #define	NAND_FLASH_CMD			0x00
> @@ -199,6 +200,7 @@
>   */
>  #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
>  
> +#define QPIC_PER_CW_CMD_ELEMENTS	32
>  #define QPIC_PER_CW_CMD_SGL		32
>  #define QPIC_PER_CW_DATA_SGL		8
>  
> @@ -221,8 +223,13 @@
>  /*
>   * This data type corresponds to the BAM transaction which will be used for all
>   * NAND transfers.
> + * @bam_ce - the array of BAM command elements
>   * @cmd_sgl - sgl for NAND BAM command pipe
>   * @data_sgl - sgl for NAND BAM consumer/producer pipe
> + * @bam_ce_pos - the index in bam_ce which is available for next sgl
> + * @bam_ce_start - the index in bam_ce which marks the start position ce
> + *		   for current sgl. It will be used for size calculation
> + *		   for current sgl
>   * @cmd_sgl_pos - current index in command sgl.
>   * @cmd_sgl_start - start index in command sgl.
>   * @tx_sgl_pos - current index in data sgl for tx.
> @@ -231,8 +238,11 @@
>   * @rx_sgl_start - start index in data sgl for rx.
>   */
>  struct bam_transaction {
> +	struct bam_cmd_element *bam_ce;
>  	struct scatterlist *cmd_sgl;
>  	struct scatterlist *data_sgl;
> +	u32 bam_ce_pos;
> +	u32 bam_ce_start;
>  	u32 cmd_sgl_pos;
>  	u32 cmd_sgl_start;
>  	u32 tx_sgl_pos;
> @@ -462,7 +472,8 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
>  
>  	bam_txn_size =
>  		sizeof(*bam_txn) + num_cw *
> -		((sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
> +		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
> +		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
>  		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
>  
>  	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
> @@ -472,6 +483,10 @@ static void free_bam_transaction(struct qcom_nand_controller *nandc)
>  	bam_txn = bam_txn_buf;
>  	bam_txn_buf += sizeof(*bam_txn);
>  
> +	bam_txn->bam_ce = bam_txn_buf;
> +	bam_txn_buf +=
> +		sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS * num_cw;
> +
>  	bam_txn->cmd_sgl = bam_txn_buf;
>  	bam_txn_buf +=
>  		sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL * num_cw;
> @@ -489,6 +504,8 @@ static void clear_bam_transaction(struct qcom_nand_controller *nandc)
>  	if (!nandc->props->is_bam)
>  		return;
>  
> +	bam_txn->bam_ce_pos = 0;
> +	bam_txn->bam_ce_start = 0;
>  	bam_txn->cmd_sgl_pos = 0;
>  	bam_txn->cmd_sgl_start = 0;
>  	bam_txn->tx_sgl_pos = 0;
