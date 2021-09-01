Return-Path: <SRS0=cUeG=NX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1823C432BE
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 14:37:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B61261057
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Sep 2021 14:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B61261057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PG5m9bsxsNSoaMtOjAnbEIFb18Shj/e83Sr2GHSEw/4=; b=J+WMmmqcRVllDM
	EJcpwZpugjQHE/KPtnOiBrZWnjs8ySPYQR8Ge+kUuXjfRINFJ0jJ/hr9YOtRPq9MLKRZag+Hj2Q8i
	bDY3sTA/EIthp0Dl8AMNz4QSx2Ig3SD14nolaNaDKQRpOTMk7bRAL8zLMfK648SxIg4BLzZ/vK5Zf
	zCVH08pQjYxaw8QmMI9Eunz/PbjfdxnBQm+uu3k+5FyjyVltq7sXo6M1/U39DSLfLiEYDoN4YvR4i
	yREwptm3L1ESeEkVb4aM+I1xM23UmmTU6G10sC/+LNgazjahatrs0h2MfCXOvLhCv05eu7pDZ6n6C
	PfHAdOkA6Hikf37xHKuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLRLr-006GAl-TK; Wed, 01 Sep 2021 14:36:31 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLRLm-006G9c-QQ
 for linux-mtd@lists.infradead.org; Wed, 01 Sep 2021 14:36:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2C93CC0005;
 Wed,  1 Sep 2021 14:36:16 +0000 (UTC)
Date: Wed, 1 Sep 2021 16:36:15 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Md Sadre Alam <mdalam@codeaurora.org>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: Update code word value for raw read
Message-ID: <20210901163615.090c6f24@xps13>
In-Reply-To: <1630493613-8158-1-git-send-email-mdalam@codeaurora.org>
References: <1630493613-8158-1-git-send-email-mdalam@codeaurora.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_073627_906800_6B0E2B58 
X-CRM114-Status: GOOD (  20.57  )
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


Md Sadre Alam <mdalam@codeaurora.org> wrote on Wed,  1 Sep 2021
16:23:33 +0530:

> Fixes: 503ee5aa ("mtd: rawnand: qcom: update last code word register")
> Cc: stable@kernel.org
> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
> ---
> [V3]
>  * Added Fixes tag
>  * Removed change log from commit message.
> 
>     From QPIC V2 onwards there is a separate register to read
>     last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
> 
>     qcom_nandc_read_cw_raw() is used to read only one code word
>     at a time. If we will configure number of code words to 1 in
>     in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
>     its reading the last code word, since from QPIC V2 onwards
>     we are having separate register to read the last code word,
>     we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
>     register to fetch data from controller buffer to system
>     memory.

Really?

It's not your first contribution, you know what a changelog is and what
a commit message is, right? So please, keep the commit message
("why" your change is needed) where it was and only put
the changelog (the differences between two versions) below the three
dashes '---'.

>  
>  drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
> index ef0bade..04e6f7b 100644
> --- a/drivers/mtd/nand/raw/qcom_nandc.c
> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
> @@ -1676,13 +1676,17 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	int data_size1, data_size2, oob_size1, oob_size2;
>  	int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
> +	int raw_cw = cw;
>  
>  	nand_read_page_op(chip, page, 0, NULL, 0);
>  	host->use_ecc = false;
>  
> +	if (nandc->props->qpic_v2)
> +		raw_cw = ecc->steps - 1;
> +
>  	clear_bam_transaction(nandc);
>  	set_address(host, host->cw_size * cw, page);
> -	update_rw_regs(host, 1, true, cw);
> +	update_rw_regs(host, 1, true, raw_cw);
>  	config_nand_page_read(chip);
>  
>  	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
> @@ -1711,7 +1715,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
>  		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
>  	}
>  
> -	config_nand_cw_read(chip, false, cw);
> +	config_nand_cw_read(chip, false, raw_cw);
>  
>  	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>  	reg_off += data_size1;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
