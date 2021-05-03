Return-Path: <SRS0=b+Mj=J6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83743C433ED
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 16:48:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D96E561283
	for <linux-mtd@archiver.kernel.org>; Mon,  3 May 2021 16:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D96E561283
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kLps7MITJL+I2h5M7jF2wbrSr7IWjaIQGAIOv1cyHJo=; b=Jg5Lidhfzp6VxVU57oH2guNoc
	MvZK/YWU9WIJg0J931O6C/gsYqCUFH2Cd3EVR13TY5vP25unfghK8abIjDE9qsuYvaOwxal5n34+0
	wVBLYK5/mlUqDo3mWvAZ1/Bl5i3+vWUIS/cvOzq12jAYPAVdH/DPoXS3TG50iPdqpkq7VmWT16pL7
	oB8w9cUcy0TxXNN0uO5waOkyDgAcbBJqICdiuwK7m7xyE5qALNfsVfa9clYbbwRFoAguqYMYdfC/t
	CQshytcVppcbC2v5QwtJIAlJghQ3SJKW1jf8AJTl3yzQDNWf8+rNC0BfD5oa6U3PER6D+CUhmFIP2
	nm48d3/cw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldbj8-00ERLz-4A; Mon, 03 May 2021 16:47:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbit-00ERJR-7j
 for linux-mtd@desiato.infradead.org; Mon, 03 May 2021 16:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3qpXgYIm46vBwOOqXb9lQCRxOj66aYjBIfpsDo7bLHk=; b=iIZkVniuLW1eM/4LnwJcUUGOua
 hrh59Xd/ya1/ob4NoVWxr/Tw48FtVP1EvnyTVVuECyQpSWL0lTP3cVey4R0ufeq7BpgNq5bm9llgb
 5yfL6ttLBZVylgZiAfxKw5Xfb+nz+5rs22GTP6Fm8h+6dpG1fm+kp70CJtxpckfld+xPPFfL7Ckt9
 Rb14OfOho/nvOcf//wUSyHB4Yz3J2SmH7bOJE0dY4/v4virBw/fxyZ/53fhA9zqT+ZlJOQQgTFU+b
 0a8LTGvye0gsOJxu19+eXyRdiY43X+Xm0B5OMS52glQmu5OGY2EkUcI3xOZVoMNvDUKVXQ2Ap4p/Y
 962UgMPw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbip-003IIc-Q7
 for linux-mtd@lists.infradead.org; Mon, 03 May 2021 16:47:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB66C613E9;
 Mon,  3 May 2021 16:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620060422;
 bh=iPg8jBVzACvtxro+PBWxTxGIHPUG4kFtNrGMH6DiwJY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6bk8ZsFhhQnP1duUqTJt0hZF54ljp486uPCGNeL0MT7W6jOUKWSRsNJtO7wbCj3T
 svRBALzjohPxD8LNmZeXXfqVHXx73HrvEkmC93VfVNHOx0gK0zEjev2RMAIXwm6g+z
 9ecG17e4R2uSO6d443q8S2AkEdxZkxcrocjBHjQE4zCrL+UnJMNPvs0ervWSDTBLt8
 CaHeMLbUMIhTxag8XALWXha/eJZhqzbXToRoPrK+MZIno8XYa5KaIOUlo5vIs4CuKu
 rH+YIZawB+qooG3HCyzufMa2Es0Eq3eS4/+Jty/jxtJO9QU7dssxFIlYkklrr5PAtX
 LgeVDcBbRhVUQ==
Date: Mon, 3 May 2021 22:16:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: miquel.raynal@bootlin.com, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 sricharan@codeaurora.org
Subject: Re: [PATCH] mtd: rawnand: qcom: avoid write to obsolete register
Message-ID: <20210503164652.GA3958@thinkpad>
References: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1619205694-25645-1-git-send-email-mdalam@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_094703_972245_D145D88A 
X-CRM114-Status: GOOD (  15.41  )
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

On Sat, Apr 24, 2021 at 12:51:34AM +0530, Md Sadre Alam wrote:
> QPIC_EBI2_ECC_BUF_CFG register got obsolete from QPIC V2.0 onwards.
> Avoid writing this register if QPIC version is V2.0 or newer.
> 
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/mtd/nand/raw/qcom_nandc.c | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index fd4c318..8c5205c 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -714,7 +714,8 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read)
>  	nandc_set_reg(nandc, NAND_DEV0_CFG0, cfg0);
>  	nandc_set_reg(nandc, NAND_DEV0_CFG1, cfg1);
>  	nandc_set_reg(nandc, NAND_DEV0_ECC_CFG, ecc_bch_cfg);
> -	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
> +	if (!nandc->props->qpic_v2)
> +		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, host->ecc_buf_cfg);
>  	nandc_set_reg(nandc, NAND_FLASH_STATUS, host->clrflashstatus);
>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
> @@ -1083,7 +1084,8 @@ static void config_nand_page_read(struct qcom_nand_controller *nandc)
>  {
>  	write_reg_dma(nandc, NAND_ADDR0, 2, 0);
>  	write_reg_dma(nandc, NAND_DEV0_CFG0, 3, 0);
> -	write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
> +	if (!nandc->props->qpic_v2)
> +		write_reg_dma(nandc, NAND_EBI2_ECC_BUF_CFG, 1, 0);
>  	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1, 0);
>  	write_reg_dma(nandc, NAND_ERASED_CW_DETECT_CFG, 1,
>  		      NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
> @@ -1132,8 +1134,9 @@ static void config_nand_page_write(struct qcom_nand_controller *nandc)
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
> @@ -1187,7 +1190,8 @@ static int nandc_param(struct qcom_nand_host *host)
>  					| 2 << WR_RD_BSY_GAP
>  					| 0 << WIDE_FLASH
>  					| 1 << DEV0_CFG1_ECC_DISABLE);
> -	nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
> +	if (!nandc->props->qpic_v2)
> +		nandc_set_reg(nandc, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
>  
>  	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
>  	if (!nandc->props->qpic_v2) {
> @@ -2628,7 +2632,8 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
>  				| ecc_mode << ECC_MODE
>  				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
>  
> -	host->ecc_buf_cfg = 0x203 << NUM_STEPS;
> +	if (!nandc->props->qpic_v2)
> +		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
>  
>  	host->clrflashstatus = FS_READY_BSY_N;
>  	host->clrreadstatus = 0xc0;
> -- 
> 2.7.4
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
