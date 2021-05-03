Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39029C433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 14:56:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1FC611EE
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 14:56:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C1FC611EE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8ILgsxet8A3uxGIouv016wjxksZ/N1rO+Vd5koYqkDg=; b=OgN7hZhLN5TdzD69RitWf05h+
	Ct0pzPV+fBKLc3DOMwLhvBX6TdgsmpA4xBIR0cC+FywwW8yHKfScq0HPjTmIslClAe3IgQQFT3xXg
	Ocjv3GLZppnmzkVprPkFyMPRhF03k+fqwHqm7qTUNO6Q0853jbPDwJ0xfB3gnS3jT5IYKex9mLKZC
	lGzD/+6Qxwh4dXtDWxY+nQ46pgwAZrl3D4xpyd9echSf3gLIvh+pjtKY3z+fHzVltty09jzkwkYZr
	otWMIMPS+gdXcEwwg+UOzKB24BYQtQPaYvTFCvifrbX7JenVMMtqqhHFEdtgE+NmAEXf0jwfZGCWk
	ZSkESk2JA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldZyW-00E8P6-Fp; Mon, 03 May 2021 14:55:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldZyT-00E8O8-Cb
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 14:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=3Fk+kDMYxkaBQhIOQ4tkY93cPnBbUwngSdDbYFdBEWY=; b=niXFcuZNdY6EIQlDb5EoIdhxlB
 mrYyYDK7j9oOI2mLAatp31NsGDFUDnqW+RYkewZvD/WgSEUjjcegNkU9FU6/HIfAhIdQxKk8SIOV2
 TAbnQsGlYedfqzTUOiFD1Ag7FvlrhbrEaa23GTqcS3PvR7VQ1sNhEdwJYHxkqM7GaxVd0jpXyELXl
 Sd6kDe+q83BaC407sjZw601H1oBorrioC0ROzJQxPC5j88u0lYkkLcwcszRKP402qxUWsAw2gewvW
 2M20oO0UEJJYt+AR838+lrk656yV0YjsMfSPqqVNdtEWvOZ5nCcm7GcaCyNH41Cn4jRKC0NgXfP7X
 VeIYLgzg==;
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldZyQ-00393Y-5B
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 14:55:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1620053702; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=3Fk+kDMYxkaBQhIOQ4tkY93cPnBbUwngSdDbYFdBEWY=;
 b=OeLblfo47TiqQmwmHXM3jSJUkK/GJ5k+T9Ni0XEMbCFmouxkwX4hOyO+jsVK2XlddCmIcJBb
 aoKhabmAGlUgTAO83fsgavTgBk1SeKu1aDMMLP3+4a3ZUtoJbq4Wa/TkcWDs9C6bDJAtgmAR
 4gbQPJFI6vEhvbDCTrnMxbGJHPg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 60900ec179b6f9e57b034309 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 03 May 2021 14:54:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E66ECC43143; Mon,  3 May 2021 14:54:56 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D322C433F1;
 Mon,  3 May 2021 14:54:54 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 03 May 2021 20:24:54 +0530
From: mdalam@codeaurora.org
To: miquel.raynal@bootlin.com, mani@kernel.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: avoid write to obsolete register
In-Reply-To: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
References: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
Message-ID: <2667b47434a8f2892ea3d5f304380960@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_075502_856229_2A925EB8 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2021-04-24 00:51, Md Sadre Alam wrote:
> QPIC_EBI2_ECC_BUF_CFG register got obsolete from QPIC V2.0 onwards.
> Avoid writing this register if QPIC version is V2.0 or newer.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c
> b/drivers/mtd/nand/raw/qcom_nandc.c
> index fd4c318..8c5205c 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -714,7 +714,8 @@ static void update_rw_regs(struct qcom_nand_host
> *host, int num_cw, bool read)
>  	nandc_set_reg(nandc, NAND_DEV0_CFG0, cfg0);
>  	nandc_set_reg(nandc, NAND_DEV0_CFG1, cfg1);
>  	nandc_set_reg(nandc, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
> -	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
> +	if (!nandc->props->qpic_v2)
> +		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
>  	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
> @@ -1083,7 +1084,8 @@ static void config_nand_page_read(struct
> qcom_nand_controller *nandc)
>  {
>  	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
>  	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
> +	if (!nandc->props->qpic_v2)
> +		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
>  	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
>  	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
>  		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
> @@ -1132,8 +1134,9 @@ static void config_nand_page_write(struct
> qcom_nand_controller *nandc)
>  {
>  	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
>  	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
> -		      NAND_BAM_NEXT_SGL);
> +	if (!nandc->props->qpic_v2)
> +		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1,
> +			      NAND_BAM_NEXT_SGL);
>  }
> 
>  /*
> @@ -1187,7 +1190,8 @@ static int nandc_param(struct qcom_nand_host 
> *host)
>  					| 2 << WR_RD_BSY_GAP
>  					| 0 << WIDE_FLASH
>  					| 1 << DEV0_CFG1_ECC_DISABLE);
> -	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << 
> ECC_CFG_ECC_DISABLE);
> +	if (!nandc->props->qpic_v2)
> +		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << 
> ECC_CFG_ECC_DISABLE);
> 
>  	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
>  	if (!nandc->props->qpic_v2) {
> @@ -2628,7 +2632,8 @@ static int qcom_nand_attach_chip(struct nand_chip 
> *chip)
>  				| ecc_mode << ECC_MODE
>  				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
> 
> -	host->ecc_buf_cfg = 0x203 << NUM_STEPS;
> +	if (!nandc->props->qpic_v2)
> +		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
> 
>  	host->clrflashstatus = FS_READY_BSY_N;
>  	host->clrreadstatus = 0xc0;


ping! Hi Miquel could you review this change and let me know if more 
info needed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
