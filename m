Return-Path: <SRS0=etPf=NY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D961C432BE
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0568660238
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0568660238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B09nSETv7r35zeXGjGNcAp5QIU7YIaRZ4oCVIv2P7tQ=; b=LRbOw+nhS10G3aEHwDL7olkQpM
	S9vIPrYp99QCteAOgKZZEkxdV3J1urKv8F775rljDUATr9PgqSE3taAsyrYtVuq5UbUWBIohMVxkD
	kcb5DacSLi9tJSR1ULToLv1meFdApBsYhT4w17z/e41zzOUEIu3Bg8kFR5Xg8mkrZAnnyAy35M2bc
	OmE+xTXyb5efgZ5AY4Q0BGPCQMjY9gCuv30Ejn/YYDpBvQxFPYh0rkvDzIQ6jZ9Hk9CtYpKJERW+U
	bU8KsNTDKdQc2fgX6Ryza50IER7ngOI/tmVBAXBqnaXLJUzdZTbxYcm0rS/S8ZVoNqBbhdDeXFuMW
	bY73w/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLffs-008asq-P5; Thu, 02 Sep 2021 05:54:08 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLffl-008arw-Ol
 for linux-mtd@lists.infradead.org; Thu, 02 Sep 2021 05:54:06 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630562043; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mCYZzY8OT8rVEtmVK5dyJIyO9quIyexdFce4ZNsAP0U=;
 b=T91wIergNx9+h1U4SMXGHLOmDSvuscrSkycvs19NeeWndquW8+WeLWNCmN6fFq68zPkiatBI
 otux6NZeoaLkxSC2Y5R6WtM4Yd9KUT7ms8csWvRWKQxgyZn+L12gnpkfPZHuESFcrYpf3Vm7
 S9L+1K4Y/ZUbeTxiuv83N1ocgDc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 613066e84d644b7d1c28872d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 02 Sep 2021 05:53:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4CD80C43460; Thu,  2 Sep 2021 05:53:44 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8A94DC4338F;
 Thu,  2 Sep 2021 05:53:43 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 02 Sep 2021 11:23:43 +0530
From: mdalam@codeaurora.org
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: mani@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V3] mtd: rawnand: qcom: Update code word value for raw read
In-Reply-To: <20210901163615.090c6f24@xps13>
References: <1630493613-8158-1-git-send-email-mdalam@codeaurora.org>
 <20210901163615.090c6f24@xps13>
Message-ID: <b6473b7de57aa10682a5ca1651f6e620@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_225403_215664_27803E99 
X-CRM114-Status: GOOD (  19.50  )
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

On 2021-09-01 20:06, Miquel Raynal wrote:
> Md Sadre Alam <mdalam@codeaurora.org> wrote on Wed,  1 Sep 2021
> 16:23:33 +0530:
> 
>> Fixes: 503ee5aa ("mtd: rawnand: qcom: update last code word register")
>> Cc: stable@kernel.org
>> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
>> ---
>> [V3]
>>  * Added Fixes tag
>>  * Removed change log from commit message.
>> 
>>     From QPIC V2 onwards there is a separate register to read
>>     last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
>> 
>>     qcom_nandc_read_cw_raw() is used to read only one code word
>>     at a time. If we will configure number of code words to 1 in
>>     in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
>>     its reading the last code word, since from QPIC V2 onwards
>>     we are having separate register to read the last code word,
>>     we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
>>     register to fetch data from controller buffer to system
>>     memory.
> 
> Really?
> 
> It's not your first contribution, you know what a changelog is and what
> a commit message is, right? So please, keep the commit message
> ("why" your change is needed) where it was and only put
> the changelog (the differences between two versions) below the three
> dashes '---'.
> 
   Sorry for misinterpreting your comments.

   I have addressed your comment in patch V4

>> 
>>  drivers/mtd/nand/raw/qcom_nandc.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c 
>> b/drivers/mtd/nand/raw/qcom_nandc.c
>> index ef0bade..04e6f7b 100644
>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>> @@ -1676,13 +1676,17 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, 
>> struct nand_chip *chip,
>>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>>  	int data_size1, data_size2, oob_size1, oob_size2;
>>  	int ret, reg_off = FLASH_BUF_ACC, read_loc = 0;
>> +	int raw_cw = cw;
>> 
>>  	nand_read_page_op(chip, page, 0, NULL, 0);
>>  	host->use_ecc = false;
>> 
>> +	if (nandc->props->qpic_v2)
>> +		raw_cw = ecc->steps - 1;
>> +
>>  	clear_bam_transaction(nandc);
>>  	set_address(host, host->cw_size * cw, page);
>> -	update_rw_regs(host, 1, true, cw);
>> +	update_rw_regs(host, 1, true, raw_cw);
>>  	config_nand_page_read(chip);
>> 
>>  	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
>> @@ -1711,7 +1715,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, 
>> struct nand_chip *chip,
>>  		nandc_set_read_loc(chip, cw, 3, read_loc, oob_size2, 1);
>>  	}
>> 
>> -	config_nand_cw_read(chip, false, cw);
>> +	config_nand_cw_read(chip, false, raw_cw);
>> 
>>  	read_data_dma(nandc, reg_off, data_buf, data_size1, 0);
>>  	reg_off += data_size1;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
