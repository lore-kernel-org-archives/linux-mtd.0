Return-Path: <SRS0=sITD=N5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AECC433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:36:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3966E610F8
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Sep 2021 06:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3966E610F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz5El4R8ZBYcftqSIeb7LPgzzJYdWWwhTvOQwgtyptc=; b=Qu+B4VBba0vhA8X+knzEF8AG+M
	kwOGLqCc0PN+gagOnATaLrNUIrUY+p0E5XXmSbDxB3KgSE71W0x0gLJHbBaBCJzDlI9AVTpcawnTp
	Msj2UkN1f1KGhYZQSdmXmYS1cA2tVmAN1u7HTx0yp+tnD0j7n5djo58cjaH/wN8bu2xLThfI2l2CH
	QfrpTmntYETVGH9cr7t8dK11sHNgIM2IA5jqSmFCJ4dDrizs1bXfOInwMQddFitqbZ4gnHjKsBWvV
	tWjLK1AfDvSsYJobyFVJ0pp2MN1/xu1X6rffRtsWZRmKaMUaJmlsPsE2GV2qauSbzsGf58c7Xbtdd
	kIZYTIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNUhx-002ZVl-UH; Tue, 07 Sep 2021 06:35:49 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNUhu-002ZUt-LP
 for linux-mtd@lists.infradead.org; Tue, 07 Sep 2021 06:35:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1630996545; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xc048QqgaI2ANyWI4pqRHNZXsACOQ6mJX1gQ/QPaTW4=;
 b=EjK4+xGbE2ZyRe8QPSMR0Bls5oubaMc5bV70RaGBfdIukdTV33ba3cyZ4x1BU2KYcyfOHBlF
 OcSp0qRz/LiborIGa4J4ciRftFnmwgerXON3pHss6/tlVN7hq2iKN7hL7lE6rtXxxR2uHgVQ
 2VIywmgTwqXZ56/6OG+Tr/rYnKs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 6137084097222b4b5b67a24b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Sep 2021 06:35:44
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 676AEC43460; Tue,  7 Sep 2021 06:35:44 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 42F04C4338F;
 Tue,  7 Sep 2021 06:35:42 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 07 Sep 2021 12:05:42 +0530
From: mdalam@codeaurora.org
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org, stable@kernel.org
Subject: Re: [PATCH V4] mtd: rawnand: qcom: Update code word value for raw read
In-Reply-To: <20210902091730.GA10844@workstation>
References: <1630561763-18486-1-git-send-email-mdalam@codeaurora.org>
 <20210902091730.GA10844@workstation>
Message-ID: <3ea25e979fc8c965820596ec86c61172@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_233546_806091_8A9C33BA 
X-CRM114-Status: GOOD (  28.40  )
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

On 2021-09-02 14:47, Manivannan Sadhasivam wrote:
> On Thu, Sep 02, 2021 at 11:19:23AM +0530, Md Sadre Alam wrote:
>> From QPIC V2 onwards there is a separate register to read
>> last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".
>> 
>> qcom_nandc_read_cw_raw() is used to read only one code word
>> at a time. If we will configure number of code words to 1 in
>> in QPIC_NAND_DEV0_CFG0 register then QPIC controller thinks
>> its reading the last code word, since from QPIC V2 onwards
>> we are having separate register to read the last code word,
>> we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n"
>> register to fetch data from controller buffer to system
>> memory.
>> 
>> Fixes: 503ee5aa ("mtd: rawnand: qcom: update last code word register")
> 
> Commit hash should be of 12 digits.

   Updated in patch V5
> 
>> Cc: stable@kernel.org
>> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
>> ---
>> [V4]
>>  * Added commit message
>>  * Added changelog
>> 
>>  In commit 503ee5aa added QPIC V2 support. Since QPIC V2 onwards there
>>  is separate register to get last CW data. If total number of CW 
>> configred is 1
>>  then , QPIC controller treat this as last CW and software shhould 
>> copy data to memory
>>  via QPIC_NAND_READ_LOCATION_LAST_CW_n register instead of 
>> QPIC_NAND_READ_LOCATION_n.
>>  Since in raw read we are configuring total number of CW 1, this 
>> change fixes
>>  this if total number of CW 1 then make this as last CW.  raw_cw = 
>> ecc->steps - 1;
>>  since ecc->steps holds total number of CWs.
>> 
> 
> This is not a changelog. Changelog should mention what has been changed
> between versions from v1 to v4. For example:
> 
> Changes in v4:
> 
> * Incorporated AAA comments from X
> * Changed a local variable
> 
> Changes in v3:
> 
> * Incorporated BBB comments from X
> 
> Changes in v2:
> 
> * Incorporated CCC comments from X

  Updated in patch V5
> 
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
> 
> Sorry, I don't understand how it can work. For reading a codeword like
> 0, you are reading the last codeword here if the controller is v2. And
> you'll continue to read the last codeword only for any codeword
> requested :/

   This case is only applicable when we will configure number of code 
words to 1.
   These registers "QPIC_NAND_READ_LOCATION_LAST_CW_n" & 
"QPIC_NAND_READ_LOCATION_n"
   are only used to copy data into memory i.e our local buffer. So this 
last CW interpretation from
   QPIC controller to memory not for Flash to QPIC controller.
   If number of CW configured to 1 means QPIC will treat this a last CW , 
so copy the data from QPIC to local memory
   buffer , we have to use QPIC_NAND_READ_LOCATION_LAST_CW_n register 
instead of QPIC_NAND_READ_LOCATION_n regsiter,
   Since there is separate register from QPIC V2 onwards to read get last 
CW "QPIC_NAND_READ_LOCATION_LAST_CW_n".


> 
> Thanks,
> Mani
> 
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
>> --
>> 2.7.4
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
