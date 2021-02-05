Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C745CC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 17:54:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4870F64DEC
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 17:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4870F64DEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U4bV8xdIpaz7ew3fKzbWW/y/27ncnS/Ey6DiSYk/2wY=; b=eoqSIMM+gXO+3c5yk8t29PCEH
	Q5pPH+H9C30vubVeLF5utfv9zQ/MgMbbkMh7cyT5CbcZGuQTMjaipW/laITxQf2eURcdfa34JjYqs
	I9R1oj9Tj9TpvoiIOO3XsA2X5DQfceFR+AGpMP5UxvzrUCux8/PxtMsThaUDkWYL2tNrZORZPfUJo
	5QyhV3SfxfE6Ar3cV8Bn/iqG5LSTht58dpOdr3ptTwoSjDlKpT9iu72UZvDN03syDhs2IETdq3Cxq
	TpLOK7VW2TeIdWeA9cWk/BcwQHrSRHg3QZxS14XMcNZZZvt2UyQuMoK/C1qTrOEBUG52g+2unPSPN
	XPSHIveMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l85Is-0000c2-IW; Fri, 05 Feb 2021 17:53:58 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l85Ip-0000az-Fc
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 17:53:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612547635; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=GihQ9LYDjowEbBDzOOAmGj6l125OrpUDwG0EebZ3OFI=;
 b=wPwrVasF6PKAK60zKaJDj5r/RGWnk/35jZ28bKjv6JJfHY5a2+cuP7pP3FA2JF157x383efK
 NXAl4hHOT21zyDZpb0hVRblB0eOFNSv1upZrk8Zk2n4uBXjGoGJ1ODyNnImku6mZgzuR8IwM
 Ply2zdNu3nCAl93B+LFpSBVS/ig=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 601d862df112b7872cb2916d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Feb 2021 17:53:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4BB76C43469; Fri,  5 Feb 2021 17:53:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: mdalam)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 57FCFC43462;
 Fri,  5 Feb 2021 17:53:46 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 05 Feb 2021 23:23:46 +0530
From: mdalam@codeaurora.org
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH V3] mtd: rawnand: qcom: update last code word register
In-Reply-To: <b46d212665a3054d736de2cae61e209c@codeaurora.org>
References: <1610251305-20792-1-git-send-email-mdalam@codeaurora.org>
 <20210128075248.GA31543@thinkpad>
 <b46d212665a3054d736de2cae61e209c@codeaurora.org>
Message-ID: <9820142a2f48cf72a1c36929c195749b@codeaurora.org>
X-Sender: mdalam@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_125355_621743_5F0DAA9B 
X-CRM114-Status: GOOD (  25.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, mdalam=codeaurora.org@codeaurora.org, richard@nod.at,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 sricharan@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2021-01-29 10:41, mdalam@codeaurora.org wrote:
> On 2021-01-28 13:22, Manivannan Sadhasivam wrote:
>> On Sun, Jan 10, 2021 at 09:31:45AM +0530, Md Sadre Alam wrote:
>>> From QPIC version 2.0 onwards new register got added to
>>> read last codeword. This change will update the same.
>>> 
>>> For first three code word READ_LOCATION_n register will be
>>> use.For last code word READ_LOCATION_LAST_CW_n register will be
>>> use.
>>> 
>>> Signed-off-by: Md Sadre Alam <mdalam@codeaurora.org>
>> 
>> I gave this patch a try on SDX55 board but not able to resolve an 
>> issue and
>> I think it is related to reading the last code word which this patch 
>> is trying
>> to address. For my patch on supporting QPIC v2 IP, I tested with 
>> SDX55-MTP board
>> and I never hit any issue. But on my new dev board (Telit FN980), 
>> there seems to
>> be an issue while populating the partitions and tracing down that bug 
>> lands me
>> in copy_last_cw() function.
>> 
>> The issue only happens while creating the 3rd partition on Telit board 
>> whose
>> size differs when compared with MTP. The board just reboots into QDL 
>> mode
>> whenever it tries to read the last code word.
>> 
>> Below is the snippet of partition layout:
>> 
>> Telit partitions:
>> 
>> [    1.082015] 0: sbl offs=0x00000000 size=0x0000000a attr:0x000000ff
>> [    1.082702] 1: mibib offs=0x0000000a size=0x0000000a 
>> attr:0x000000ff
>> [    1.083488] 2: ico offs=0x00000014 size=0x00000014 attr:0x000000ff
>> [    1.084572] 3: efs2 offs=0x00000028 size=0x0000002c attr:0x000000ff
>> [    1.085316] 4: tz offs=0x00000054 size=0x00000007 attr:0x000000ff
>> [    1.086089] 5: tz_devcfg offs=0x0000005b size=0x00000004 
>> attr:0x000000ff
>> ....
>> 
>> MTP partitions:
>> 
>> [    1.573871] 0: sbl offs=0x00000000 size=0x0000000a attr:0x000000ff
>> [    1.581139] 1: mibib offs=0x0000000a size=0x0000000a 
>> attr:0x000000ff
>> [    1.587362] 2: efs2 offs=0x00000014 size=0x0000002c attr:0x000000ff
>> [    1.593853] 3: tz offs=0x00000040 size=0x00000007 attr:0x000000ff
>> [    1.599860] 4: tz_devcfg offs=0x00000047 size=0x00000004 
>> attr:0x000000ff
>> ...
>> 
>> So until I figure this out, please keep this patch on hold!
> 
>   There was some corner case I missed in V3 patch. I have fixed this
> in V4 patch.
>   I have done some tress testing as well with V4 patch on IPQ5018
> platform using "nand-utils"
>   and "mtd_test.ko" , Now its working fine. Can you test with V4 patch 
> once.

    ping! Do you need some more info for the V4 patch ?
>> 
>> Thanks,
>> Mani
>> 
>>> ---
>>> [V3]
>>>  * Added else condition for last code word in update_rw_regs().
>>>  drivers/mtd/nand/raw/qcom_nandc.c | 84 
>>> ++++++++++++++++++++++++++++++++-------
>>>  1 file changed, 70 insertions(+), 14 deletions(-)
>>> 
>>> diff --git a/drivers/mtd/nand/raw/qcom_nandc.c 
>>> b/drivers/mtd/nand/raw/qcom_nandc.c
>>> index 667e4bf..50ff6e3 100644
>>> --- a/drivers/mtd/nand/raw/qcom_nandc.c
>>> +++ b/drivers/mtd/nand/raw/qcom_nandc.c
>>> @@ -48,6 +48,10 @@
>>>  #define	NAND_READ_LOCATION_1		0xf24
>>>  #define	NAND_READ_LOCATION_2		0xf28
>>>  #define	NAND_READ_LOCATION_3		0xf2c
>>> +#define	NAND_READ_LOCATION_LAST_CW_0	0xf40
>>> +#define	NAND_READ_LOCATION_LAST_CW_1	0xf44
>>> +#define	NAND_READ_LOCATION_LAST_CW_2	0xf48
>>> +#define	NAND_READ_LOCATION_LAST_CW_3	0xf4c
>>> 
>>>  /* dummy register offsets, used by write_reg_dma */
>>>  #define	NAND_DEV_CMD1_RESTORE		0xdead
>>> @@ -187,6 +191,12 @@ nandc_set_reg(nandc, 
>>> NAND_READ_LOCATION_##reg,			\
>>>  	      ((size) << READ_LOCATION_SIZE) |			\
>>>  	      ((is_last) << READ_LOCATION_LAST))
>>> 
>>> +#define nandc_set_read_loc_last(nandc, reg, offset, size, is_last)	\
>>> +nandc_set_reg(nandc, NAND_READ_LOCATION_LAST_CW_##reg,			\
>>> +	      ((offset) << READ_LOCATION_OFFSET) |		\
>>> +	      ((size) << READ_LOCATION_SIZE) |			\
>>> +	      ((is_last) << READ_LOCATION_LAST))
>>> +
>>>  /*
>>>   * Returns the actual register address for all NAND_DEV_ registers
>>>   * (i.e. NAND_DEV_CMD0, NAND_DEV_CMD1, NAND_DEV_CMD2 and 
>>> NAND_DEV_CMD_VLD)
>>> @@ -316,6 +326,10 @@ struct nandc_regs {
>>>  	__le32 read_location1;
>>>  	__le32 read_location2;
>>>  	__le32 read_location3;
>>> +	__le32 read_location_last0;
>>> +	__le32 read_location_last1;
>>> +	__le32 read_location_last2;
>>> +	__le32 read_location_last3;
>>> 
>>>  	__le32 erased_cw_detect_cfg_clr;
>>>  	__le32 erased_cw_detect_cfg_set;
>>> @@ -644,6 +658,14 @@ static __le32 *offset_to_nandc_reg(struct 
>>> nandc_regs *regs, int offset)
>>>  		return &regs->read_location2;
>>>  	case NAND_READ_LOCATION_3:
>>>  		return &regs->read_location3;
>>> +	case NAND_READ_LOCATION_LAST_CW_0:
>>> +		return &regs->read_location_last0;
>>> +	case NAND_READ_LOCATION_LAST_CW_1:
>>> +		return &regs->read_location_last1;
>>> +	case NAND_READ_LOCATION_LAST_CW_2:
>>> +		return &regs->read_location_last2;
>>> +	case NAND_READ_LOCATION_LAST_CW_3:
>>> +		return &regs->read_location_last3;
>>>  	default:
>>>  		return NULL;
>>>  	}
>>> @@ -719,9 +741,14 @@ static void update_rw_regs(struct qcom_nand_host 
>>> *host, int num_cw, bool read)
>>>  	nandc_set_reg(nandc, NAND_READ_STATUS, host->clrreadstatus);
>>>  	nandc_set_reg(nandc, NAND_EXEC_CMD, 1);
>>> 
>>> -	if (read)
>>> -		nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
>>> -				   host->cw_data : host->cw_size, 1);
>>> +	if (read) {
>>> +		if (nandc->props->qpic_v2)
>>> +			nandc_set_read_loc_last(nandc, 0, 0, host->use_ecc ?
>>> +					host->cw_data : host->cw_size, 1);
>>> +		else
>>> +			nandc_set_read_loc(nandc, 0, 0, host->use_ecc ?
>>> +					host->cw_data : host->cw_size, 1);
>>> +	}
>>>  }
>>> 
>>>  /*
>>> @@ -1096,9 +1123,13 @@ static void config_nand_page_read(struct 
>>> qcom_nand_controller *nandc)
>>>  static void
>>>  config_nand_cw_read(struct qcom_nand_controller *nandc, bool 
>>> use_ecc)
>>>  {
>>> -	if (nandc->props->is_bam)
>>> +	if (nandc->props->is_bam) {
>>> +		if (nandc->props->qpic_v2)
>>> +			write_reg_dma(nandc, NAND_READ_LOCATION_LAST_CW_0,
>>> +				      1, NAND_BAM_NEXT_SGL);
>>>  		write_reg_dma(nandc, NAND_READ_LOCATION_0, 4,
>>>  			      NAND_BAM_NEXT_SGL);
>>> +	}
>>> 
>>>  	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
>>>  	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
>>> @@ -1633,16 +1664,28 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, 
>>> struct nand_chip *chip,
>>>  	}
>>> 
>>>  	if (nandc->props->is_bam) {
>>> -		nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
>>> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
>>> +			nandc_set_read_loc_last(nandc, 0, read_loc, data_size1, 0);
>>> +		else
>>> +			nandc_set_read_loc(nandc, 0, read_loc, data_size1, 0);
>>>  		read_loc += data_size1;
>>> 
>>> -		nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
>>> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
>>> +			nandc_set_read_loc_last(nandc, 1, read_loc, oob_size1, 0);
>>> +		else
>>> +			nandc_set_read_loc(nandc, 1, read_loc, oob_size1, 0);
>>>  		read_loc += oob_size1;
>>> 
>>> -		nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
>>> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
>>> +			nandc_set_read_loc_last(nandc, 2, read_loc, data_size2, 0);
>>> +		else
>>> +			nandc_set_read_loc(nandc, 2, read_loc, data_size2, 0);
>>>  		read_loc += data_size2;
>>> 
>>> -		nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
>>> +		if (nandc->props->qpic_v2 && cw == (ecc->steps - 1))
>>> +			nandc_set_read_loc_last(nandc, 3, read_loc, oob_size2, 0);
>>> +		else
>>> +			nandc_set_read_loc(nandc, 3, read_loc, oob_size2, 1);
>>>  	}
>>> 
>>>  	config_nand_cw_read(nandc, false);
>>> @@ -1873,14 +1916,27 @@ static int read_page_ecc(struct 
>>> qcom_nand_host *host, u8 *data_buf,
>>> 
>>>  		if (nandc->props->is_bam) {
>>>  			if (data_buf && oob_buf) {
>>> -				nandc_set_read_loc(nandc, 0, 0, data_size, 0);
>>> -				nandc_set_read_loc(nandc, 1, data_size,
>>> -						   oob_size, 1);
>>> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1)) {
>>> +					nandc_set_read_loc_last(nandc, 0, 0, data_size, 0);
>>> +					nandc_set_read_loc_last(nandc, 1, data_size,
>>> +								oob_size, 1);
>>> +				} else {
>>> +					nandc_set_read_loc(nandc, 0, 0, data_size, 0);
>>> +					nandc_set_read_loc(nandc, 1, data_size,
>>> +							   oob_size, 1);
>>> +				}
>>>  			} else if (data_buf) {
>>> -				nandc_set_read_loc(nandc, 0, 0, data_size, 1);
>>> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
>>> +					nandc_set_read_loc_last(nandc, 0, 0, data_size, 1);
>>> +				else
>>> +					nandc_set_read_loc(nandc, 0, 0, data_size, 1);
>>>  			} else {
>>> -				nandc_set_read_loc(nandc, 0, data_size,
>>> -						   oob_size, 1);
>>> +				if (nandc->props->qpic_v2 && i == (ecc->steps - 1))
>>> +					nandc_set_read_loc_last(nandc, 0, data_size,
>>> +								oob_size, 1);
>>> +				else
>>> +					nandc_set_read_loc(nandc, 0, data_size,
>>> +							   oob_size, 1);
>>>  			}
>>>  		}
>>> 
>>> --
>>> 2.7.4
>>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
