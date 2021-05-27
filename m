Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38840C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:59:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01F08610A0
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 13:59:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01F08610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fVQkxEHlB3Of/9y1xycFvapCpxs0OswL45H+7Dgxva8=; b=lcQV3jursXF14qu2EL2kygYHBo
	58XS8m/XqeUDe1QlBna8wLZEt6VaRB3gczBJlFzs1wbYtAiV5Y/Eo8KUYS/0nBwlPd45H3OSviSJ6
	sN5P5Hx7B7U58Gc51dDhWziYecpYWIDHaZfETQADU+4PJy4LoIlnnUcHC0S7BVopl/mgDT2Akv4qk
	v6rA25DwG49vOy2XZkLYosLwcSv76UjXZbUwV2RDklt5l8KJ/Xn4v2vTaJBLZM4aVHOMCaCaWba2d
	AvAymCwMSdKdSvbV2GqXvG0eMmRJPGnm+uQbJcQBbwk5oS5+FAXIHMeDgkoKRqAnQJKNizxTgC8/m
	UkcC/UPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmGWa-006V8L-Ma; Thu, 27 May 2021 13:58:13 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93]
 helo=mx07-00178001.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmGP9-006R97-7j; Thu, 27 May 2021 13:50:33 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RDgLGR013480; Thu, 27 May 2021 15:50:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Vvo4lmC0J+8Th7Lx+/tE/cI6WkohGoJEOy5+1hxoZ54=;
 b=2w7kU1wz6fEl5jbBTPmB5FhF0/iaP7K3N3mjGQ+m7HOIXNR0T1nhW6ytDEcYIdY9E5Bk
 ijMaU/XmQggmuR86nlIqgorOKd9tn1lKGvnRe1m1xENWs2DRbTrBfFyhpvdQ7KjpHKOh
 nodb//LT0fuTYVNz5RxGE3lIgLH3TsysHJOjWT8nBj52AOKNZeEuUIlkNtTseVUBp6q9
 4POBk4pmR+xb6CXkcZk9ylgLCNj43XaFPQiI7j04WBFYdVKkxgA8mBmzcpPjNUt8Pt2y
 11jbwWynch5DHZa08VDD4fHY0k15AKIRY9mRmvHLUJU/zsLEp0/E+V5sbbLS8tIMBufE uw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38t0fr49qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 15:50:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C4473100034;
 Thu, 27 May 2021 15:50:25 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A73EA228134;
 Thu, 27 May 2021 15:50:25 +0200 (CEST)
Received: from lmecxl0573.lme.st.com (10.75.127.46) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 27 May
 2021 15:50:24 +0200
Subject: Re: mtd: spinand: add spi nand mtd resume handler
To: Pratyush Yadav <p.yadav@ti.com>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris
 Brezillon <boris.brezillon@collabora.com>, <linux-mtd@lists.infradead.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <linux-spi@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <christophe.kerello@foss.st.com>
References: <20210526153016.32653-1-patrice.chotard@foss.st.com>
 <20210527100015.abxcroi23zyvcyzk@ti.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
Message-ID: <3baf8f02-f290-91d1-af56-62181651c61a@foss.st.com>
Date: Thu, 27 May 2021 15:50:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210527100015.abxcroi23zyvcyzk@ti.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_06:2021-05-26,
 2021-05-27 signatures=0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_065031_636177_BCA451CB 
X-CRM114-Status: GOOD (  32.08  )
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

Hi Pratyush

On 5/27/21 12:00 PM, Pratyush Yadav wrote:
> On 26/05/21 05:30PM, patrice.chotard@foss.st.com wrote:
>> From: Christophe Kerello <christophe.kerello@foss.st.com>
>>
>> After power up, all SPI NAND's blocks are locked. Only read operations
>> are allowed, write and erase operations are forbidden.
>> The SPI NAND framework unlocks all the blocks during its initialization.
>>
>> During a standby low power, the memory is powered down, losing its
>> configuration.
>> During the resume, the QSPI driver state is restored but the SPI NAND
>> framework does not reconfigured the memory.
>>
>> This patch adds spi nand mtd PM handlers for resume ops.
>> SPI NAND resume op re-initializes SPI NAND flash to its probed state.
>>
>> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
>> Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
>> ---
>>  drivers/mtd/nand/spi/core.c | 56 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
>> index 17f63f95f4a2..6abaf874eb3f 100644
>> --- a/drivers/mtd/nand/spi/core.c
>> +++ b/drivers/mtd/nand/spi/core.c
>> @@ -1074,6 +1074,61 @@ static int spinand_detect(struct spinand_device *spinand)
>>  	return 0;
>>  }
>>  
>> +static void spinand_mtd_resume(struct mtd_info *mtd)
>> +{
>> +	struct spinand_device *spinand = mtd_to_spinand(mtd);
>> +	struct nand_device *nand = mtd_to_nanddev(mtd);
>> +	struct device *dev = &spinand->spimem->spi->dev;
>> +	int ret, i;
>> +
>> +	ret = spinand_reset_op(spinand);
>> +	if (ret)
>> +		return;
>> +
>> +	ret = spinand_init_quad_enable(spinand);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to initialize the quad part (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	ret = spinand_upd_cfg(spinand, CFG_OTP_ENABLE, 0);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to updtae the OTP (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
> 
> Since you have reset the flash, this cache is invalid. You should reset 
> the cache and re-populate it before using it in any way.

I got your point, i will take it in account in v3 (v2 has already been send but need rework)

> 
>> +
>> +	ret = spinand_manufacturer_init(spinand);
>> +	if (ret) {
>> +		dev_err(dev,
>> +			"Failed to initialize the SPI NAND chip (err = %d)\n",
>> +			ret);
>> +		return;
>> +	}
>> +
>> +	/* After power up, all blocks are locked, so unlock them here. */
>> +	for (i = 0; i < nand->memorg.ntargets; i++) {
>> +		ret = spinand_select_target(spinand, i);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to select the target (err = %d)\n",
>> +				ret);
>> +			return;
>> +		}
>> +
>> +		ret = spinand_lock_block(spinand, BL_ALL_UNLOCKED);
>> +		if (ret) {
>> +			dev_err(dev,
>> +				"Failed to unlock block (err = %d)\n",
>> +				ret);
>> +			return;
>> +		}
>> +	}
>> +}
>> +
> 
> Most of these seem to be copied from spinand_init(). I think it is 
> better to create a common function that can be called from both 
> spinand_init() and spinand_mtd_resume(). This way when someone adds 
> something new to the init procedure, like support for some other modes, 
> they won't have to remember to update it in two places.

Agree, it was already part of the v2

> 
>>  static int spinand_init(struct spinand_device *spinand)
>>  {
>>  	struct device *dev = &spinand->spimem->spi->dev;
>> @@ -1167,6 +1222,7 @@ static int spinand_init(struct spinand_device *spinand)
>>  	mtd->_block_isreserved = spinand_mtd_block_isreserved;
>>  	mtd->_erase = spinand_mtd_erase;
>>  	mtd->_max_bad_blocks = nanddev_mtd_max_bad_blocks;
>> +	mtd->_resume = spinand_mtd_resume;
> 
> Is it possible that the userspace can use this mtd device before the 
> resume is finished? Is there a way to temporarily "pause" or unregister 
> an mtd device?

Honestly, i don't know.

Thanks
Patrice

> 
>>  
>>  	if (nand->ecc.engine) {
>>  		ret = mtd_ooblayout_count_freebytes(mtd);
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
