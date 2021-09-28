Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B31EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB65E60FE3
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB65E60FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KnZl6dXTy7qUX269Dsxhd4V0riT1ppnvIU/2Ktk0IuA=; b=tKvTaNVoSzAttV
	VjG/on0P3w3zXQxqXrBVAqUAm4mcCs+rr0FJYX92XOI1X7cJyLOBrvRRXXXxbuTZLzsbOkgiPhJfx
	yt50ZNdO/4Vo3zttIZ6FdhSJ1B1VQXSiunKY5DKmMKVwA9tZyhjADwr4lHEIGyMA1hozfN5feGa0F
	GEk9fL9ESPf6jJGP/wMz+/mjcUEX5IsuCDM1rII3wXop8JNE/n+sDUu304a8PKAH6yzmoaLxb4kq5
	GnR13JJyGEnECa4tf7O2yCcHCgQ3VlFefLYFHzBoguLjlS5MVLw8elWhLxqkeXQ0ccsRy3hA2NqS7
	L0/yZ2Alf9H1Jx5arvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFiu-0081YU-Bd; Tue, 28 Sep 2021 16:12:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFir-0081Xw-07
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 16:12:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F0FA611C3;
 Tue, 28 Sep 2021 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632845568;
 bh=DFUNqDy3Ot4Tq/eu+piBAz26Q4OJcSk95Ec7Bn5i6Dg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dac+fqiHI1x2PWBuvFfxKNJDpFWhm/YXuGKyIH0a3CYgDU/rJjao/sCWx0YisD96a
 fYoWfKjze8RtTP7gJnFx4BxwiDzBTL5eRZzL16tVn5hxZjPcTT/WhLUAWcMURXtPFd
 YUyCR52j/GFh34N4oHXz+4AkaPYW3JBkyfLqKqtqqDE7MXxXoSbFtSBrCj+1hffvDA
 v/m2efbsgzH/ZaSrMRNmXGKxBvIPzFiYhQXewvMzCZPeo02x7zK7zzqIXvSfC0oyid
 sVsL/Fz3ZwH7JcrPn4s59UyUMXeeNlST4Ru2/mDlDO+qHRWXAwmxYSohpy1Nc95TxR
 07tmeWhZ0/rIA==
Date: Tue, 28 Sep 2021 21:42:19 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH 3/3] mtd: rawnand: qcom: Add support for page scope read
Message-ID: <20210928161219.GD12183@thinkpad>
References: <1631699851-12172-1-git-send-email-mdalam@codeaurora.org>
 <1631699851-12172-4-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1631699851-12172-4-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_091249_100059_4238626E 
X-CRM114-Status: GOOD (  25.82  )
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

On Wed, Sep 15, 2021 at 03:27:31PM +0530, Md Sadre Alam wrote:
> QPIC V2.0 onwards QPIC controller support enhanced read mode
> like page scope read and multi page read.
> 

Define page scope read.

> In QPIC V1, SW is needed to write EXEC_CMD register for each
> Code word and collect any Status related to that CW before
> issueing EXEC_CMD for next CW.
> 
> Page scope command is truly a page mode command where SW is
> required to issue EXEC_CMD only once for a page. Controller
> HW takes care of Codeword specific details and automatically
> returns status associated with each CW to BAM pipe, dedicated
> for status deposition.
> 
> With this command, SW now can issue one read command for a page
> and upon receiving completion interrupt, can process status,
> that have already been deposited in memory through status BAM pipe.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 77 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index 07448c4..257dec7e 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -157,6 +157,10 @@
>  #define	OP_FETCH_ID			0xb
>  #define	OP_RESET_DEVICE			0xd
>  
> +/* Auto status val and mask */
> +#define	AUTO_STS_VAL			0x000B000B

Use non-cap hex.

> +#define PAGE_SCOPE_READ			BIT(23)
> +
>  /* Default Value for NAND_DEV_CMD_VLD */
>  #define NAND_DEV_CMD_VLD_VAL		(READ_START_VLD | WRITE_START_VLD | \
>  					 ERASE_START_VLD | SEQ_READ_START_VLD)
> @@ -336,6 +340,8 @@ struct nandc_regs {
>  
>  	__le32 erased_cw_detect_cfg_clr;
>  	__le32 erased_cw_detect_cfg_set;
> +
> +	__le32 auto_sts_en;
>  };
>  
>  /*
> @@ -421,6 +427,9 @@ struct qcom_nand_controller {
>  
>  	u32 cmd1, vld;
>  	const struct qcom_nandc_props *props;
> +
> +	__le32 *status_buf;
> +	int sts_buf_size;

Add kdoc for these two members.

>  };
>  
>  /*
> @@ -487,6 +496,7 @@ struct qcom_nandc_props {
>  	bool is_bam;
>  	bool is_qpic;
>  	bool qpic_v2;
> +	bool page_scope;
>  	u32 dev_cmd_reg_start;
>  };
>  
> @@ -656,6 +666,8 @@ static __le32 *offset_to_nandc_reg(struct nandc_regs *regs, int offset)
>  		return &regs->cfg1;
>  	case NAND_DEV0_ECC_CFG:
>  		return &regs->ecc_bch_cfg;
> +	case NAND_AUTO_STATUS_EN:
> +		return &regs->auto_sts_en;
>  	case NAND_READ_STATUS:
>  		return &regs->clrreadstatus;
>  	case NAND_DEV_CMD1:
> @@ -756,10 +768,13 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
>  	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
>  
>  	if (read) {
> -		if (host->use_ecc)
> +		if (host->use_ecc) {
>  			cmd = OP_PAGE_READ_WITH_ECC | PAGE_ACC | LAST_PAGE;
> -		else
> +			if (nandc->props->qpic_v2 && nandc->props->page_scope)

Again, why you are checking for both conditions? Using "page_scope" is
sufficient enough.

> +				cmd |= PAGE_SCOPE_READ;
> +		} else {
>  			cmd = OP_PAGE_READ | PAGE_ACC | LAST_PAGE;
> +		}
>  	} else {
>  		cmd = OP_PROGRAM_PAGE | PAGE_ACC | LAST_PAGE;
>  	}

[...]

>  	if (use_ecc) {
> -		read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> -		read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> -			     NAND_BAM_NEXT_SGL);
> +		if (nandc->props->qpic_v2 && nandc->props->page_scope) {
> +			if (qcom_nandc_is_last_cw(ecc, cw))
> +				write_reg_dma(nandc, NAND_EXEC_CMD, 1,
> +					      NAND_BAM_NEXT_SGL);
> +		} else {
> +			write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
> +			read_reg_dma(nandc, NAND_FLASH_STATUS, 2, 0);
> +			read_reg_dma(nandc, NAND_ERASED_CW_DETECT_STATUS, 1,
> +				     NAND_BAM_NEXT_SGL);
> +		}

You need to add a comment for this.

Thanks,
Mani

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
