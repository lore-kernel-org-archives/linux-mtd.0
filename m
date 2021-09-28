Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A4DC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE5861246
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFE5861246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5NO/UozSiiufVL1DHSAu++1YrgF4lx5308PdJC1G2I=; b=4XO920i9Z6UN8S
	PKrf/l0iOGJl2ipB7T3jcqqzAIgQqVksolXhVnQi0zbfSnaIgccM7hZlIzt+fqwiT01CtmTtPAPi/
	duFmXvqlm5H2wezloKyLanDYgaYsUyO04svikGE9eFER7dnfUKiOwzOxQZKHafEzJyCJdqtHohSrK
	ONkBNCARkh9Qs7uXfHypZj8b8gRZPMevja9CbUHP5xcusOiaW39mLXq2toTaXjdGRCJpXp08gjzPD
	bc/pwPC5QJAh39v1cqMPT+uI0HUzsNmM6ECR+cV41P6FMYBryUzYBBiE8ZYvFzmKqoOoP2zVx6bo1
	W/s3LA59uTKhdH+1jpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFZv-007z6u-GY; Tue, 28 Sep 2021 16:03:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFZs-007z5Q-2H
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 16:03:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71FBF61246;
 Tue, 28 Sep 2021 16:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632845011;
 bh=qYrKrBfr8T/2j0JCiK/Uk789YYa1zr6c30wSL9bTRE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CAj0x9ZNGz5+Gh6ByVNOz2OUeMXT19vPrBaIgcejp3rN1sWb5E0561uS3s5ggDGCf
 eKmZ3rXV8eAJSqeJhWYd9yUkGbiUe85x2rDLQbmR/gEtzMjQXEEocDvC2sLp9Twiup
 fDvMScWmNfc66NhzafTaVLnn6DD97tyu99qDv/20mSmWieHbVx3GnGyXj0W6u5XBol
 Q7rMUnfBNshb5UOub1LQci6PTW85JQMCiMLhX0wYIPR3fWgTK7G3ytBR3o5BrHXRe+
 BhwvI479QaOJYPa1ZPMZ+WgEMkyNpCaSJT+V6Wru0cbx5vbmep3bRaHVZl974E8tUQ
 V6hvIQUIVngXA==
Date: Tue, 28 Sep 2021 21:33:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 2/3] mtd: rawnand: qcom: Add sg list to handle status
 pipe request
Message-ID: <20210928160315.GC12183@thinkpad>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-3-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1631699851-12172-3-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_090332_174925_BFC02644 
X-CRM114-Status: GOOD (  21.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 15, 2021 at 03:27:30PM +0530, Md Sadre Alam wrote:
> From QPIC V2.0 onwards there is separate pipe to read status
> for each code word while reading in enhanced mode. page scope
> read and multi page read.
> 
> This sgl list will be use to handle the request via status pipe
> during page scope and multi page read.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 42c6291..07448c4 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -213,6 +213,7 @@ nandc_set_reg(chip, reg,			\
>  #define QPIC_PER_CW_CMD_ELEMENTS	32
>  #define QPIC_PER_CW_CMD_SGL		32
>  #define QPIC_PER_CW_DATA_SGL		8
> +#define	QPIC_PER_CW_STS_SGL		8

Use space after #define

>  
>  #define QPIC_NAND_COMPLETION_TIMEOUT	msecs_to_jiffies(2000)
>  
> @@ -258,6 +259,7 @@ struct bam_transaction {
>  	struct bam_cmd_element *bam_ce;
>  	struct scatterlist *cmd_sgl;
>  	struct scatterlist *data_sgl;
> +	struct scatterlist *sts_sgl;
>  	u32 bam_ce_pos;
>  	u32 bam_ce_start;
>  	u32 cmd_sgl_pos;
> @@ -266,6 +268,8 @@ struct bam_transaction {
>  	u32 tx_sgl_start;
>  	u32 rx_sgl_pos;
>  	u32 rx_sgl_start;
> +	u32 sts_sgl_pos;
> +	u32 sts_sgl_start;
>  	bool wait_second_completion;
>  	struct completion txn_done;
>  	struct dma_async_tx_descriptor *last_data_desc;
> @@ -508,6 +512,8 @@ alloc_bam_transaction(struct qcom_nand_controller *nandc)
>  		((sizeof(*bam_txn->bam_ce) * QPIC_PER_CW_CMD_ELEMENTS) +
>  		(sizeof(*bam_txn->cmd_sgl) * QPIC_PER_CW_CMD_SGL) +
>  		(sizeof(*bam_txn->data_sgl) * QPIC_PER_CW_DATA_SGL));
> +	if (nandc->props->qpic_v2)
> +		bam_txn_size += (sizeof(*bam_txn->sts_sgl) * QPIC_PER_CW_STS_SGL);
>  
>  	bam_txn_buf = devm_kzalloc(nandc->dev, bam_txn_size, GFP_KERNEL);
>  	if (!bam_txn_buf)
> @@ -526,6 +532,12 @@ alloc_bam_transaction(struct qcom_nand_controller *nandc)
>  
>  	bam_txn->data_sgl = bam_txn_buf;
>  
> +	if (nandc->props->qpic_v2) {
> +		bam_txn_buf +=
> +			sizeof(*bam_txn->sts_sgl) * QPIC_PER_CW_STS_SGL * num_cw;
> +		bam_txn->sts_sgl = bam_txn_buf;
> +	}
> +
>  	init_completion(&bam_txn->txn_done);
>  
>  	return bam_txn;
> @@ -554,6 +566,12 @@ static void clear_bam_transaction(struct qcom_nand_controller *nandc)
>  		      QPIC_PER_CW_CMD_SGL);
>  	sg_init_table(bam_txn->data_sgl, nandc->max_cwperpage *
>  		      QPIC_PER_CW_DATA_SGL);
> +	if (nandc->props->qpic_v2) {
> +		bam_txn->sts_sgl_pos = 0;
> +		bam_txn->sts_sgl_start = 0;
> +		sg_init_table(bam_txn->sts_sgl, nandc->max_cwperpage *
> +				QPIC_PER_CW_STS_SGL);
> +	}
>  
>  	reinit_completion(&bam_txn->txn_done);
>  }
> @@ -808,6 +826,12 @@ static int prepare_bam_async_desc(struct qcom_nand_controller *nandc,
>  		bam_txn->tx_sgl_start = bam_txn->tx_sgl_pos;
>  		dir_eng = DMA_MEM_TO_DEV;
>  		desc->dir = DMA_TO_DEVICE;
> +	} else if (nandc->props->qpic_v2 && chan == nandc->sts_chan) {

These two are mutually inclusive, so why can't you simply check for the
existence of "nanc->sts_chan"?

> +		sgl = &bam_txn->sts_sgl[bam_txn->sts_sgl_start];
> +		sgl_cnt = bam_txn->sts_sgl_pos - bam_txn->sts_sgl_start;
> +		bam_txn->sts_sgl_start = bam_txn->sts_sgl_pos;
> +		dir_eng = DMA_DEV_TO_MEM;
> +		desc->dir = DMA_FROM_DEVICE;
>  	} else {
>  		sgl = &bam_txn->data_sgl[bam_txn->rx_sgl_start];
>  		sgl_cnt = bam_txn->rx_sgl_pos - bam_txn->rx_sgl_start;
> @@ -1394,6 +1418,14 @@ static int submit_descs(struct qcom_nand_controller *nandc)
>  			if (r)
>  				return r;
>  		}
> +
> +		if (nandc->props->qpic_v2) {

I feel like you should just check for "nandc->sts_chan" instead of qpic_v2. This
will make the driver work with future revisions of the IP as well.

> +			if (bam_txn->sts_sgl_pos > bam_txn->sts_sgl_start) {
> +				r = prepare_bam_async_desc(nandc, nandc->sts_chan, 0);
> +				if (r)
> +					return r;
> +			}
> +		}
>  	}
>  
>  	list_for_each_entry(desc, &nandc->desc_list, node)
> @@ -1411,6 +1443,8 @@ static int submit_descs(struct qcom_nand_controller *nandc)
>  		dma_async_issue_pending(nandc->tx_chan);
>  		dma_async_issue_pending(nandc->rx_chan);
>  		dma_async_issue_pending(nandc->cmd_chan);
> +		if (nandc->props->qpic_v2)
> +			dma_async_issue_pending(nandc->sts_chan);

Same here.

Thanks,
Mani

>  
>  		if (!wait_for_completion_timeout(&bam_txn->txn_done,
>  						 QPIC_NAND_COMPLETION_TIMEOUT))
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
