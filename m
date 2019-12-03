Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BITCOIN_SPAM_02,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,PDS_BTC_ID,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA5DC432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 12:35:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D6982070A
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 12:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBKCcgcH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D6982070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P5wLeJrOmcoIvwoZfMZZKiK8H8kfDsu+HgErjdpRbxU=; b=DBKCcgcHrgAahl0KMq6zSFtla
	LXxchWr1djue+wR9ZXj5p1idIdmIBcui9hkWBLjyHNr8XviBaiBC4/T+bc/PBoJ+yOLnNpU80ADzQ
	Cr88q8wA3OLrqQPBvhfr8i4goYtCUK0sJNOW2tkNcW/sXMJVUV4KW6610F/dFeiihfEtncUt7SI1L
	xSE0YhyJcP0UPQAfhJpk8im/f9xOXLjuwb+gytJtj5WTuqzgSoOCDfiHQI3dWruzX4+fBmdDhKBPs
	oCK36XKaZuANYrdNdYGvv4g0OSy21f82UItFaA0l5x1qW30clLscfNgXrwES+4L70ZXmDZyW4l28y
	C4kAwEqmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic7Og-0004Ht-4S; Tue, 03 Dec 2019 12:35:18 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic7Od-0004HL-7q
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 12:35:16 +0000
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.107])
 by Forcepoint Email with ESMTP id D248DD43263B517B8573;
 Tue,  3 Dec 2019 12:35:11 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Dec 2019 12:35:11 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 3 Dec 2019
 12:35:11 +0000
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: <Tudor.Ambarus@microchip.com>, <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
Date: Tue, 3 Dec 2019 12:35:10 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml702-chm.china.huawei.com (10.201.108.51) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_043515_428233_9AD1BB0B 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: broonie@kernel.org, chenxiang66@hisilicon.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 03/12/2019 12:27, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 12/3/19 2:05 PM, Tudor.Ambarus@microchip.com wrote:
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index f4afe123e9dc..f1490c7b5cb9 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1033,10 +1033,19 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>>
>>          sr_cr[0] = sr1;
>>
>> +       dev_err(nor->dev, "before write: sr_cr[0] = %02x, sr_cr[1] = %02x\n",
>> +               sr_cr[0], sr_cr[1]);
>> +
>>          ret = spi_nor_write_sr(nor, sr_cr, 2);
>>          if (ret)
>>                  return ret;
>>
>> +       ret = spi_nor_read_sr(nor, &sr_cr[0]);
>> +       if (ret)
>> +               return ret;
>> +
>> +       dev_err(nor->dev, "read back sr1: sr_cr[0] = %02x\n", sr_cr[0]);
>> +
>>          if (nor->flags & SNOR_F_NO_READ_CR)
>>                  return 0;
>>
>> @@ -1046,6 +1055,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
>>          if (ret)
>>                  return ret;
>>
>> +       dev_err(nor->dev, "read back sr2: sr_cr[1] = %02x\n", sr_cr[1]);
>> +
>>          if (cr_written != sr_cr[1]) {
>>                  dev_dbg(nor->dev, "CR: read back test failed\
> 
> On n25q256a I obtain:
> 
> root@sama5d2-xplained-sd:~# flash_lock -l /dev/mtd1
> spi-nor spi1.0: before write: sr_cr[0] = 9e, sr_cr[1] = ff
> spi-nor spi1.0: read back sr1: sr_cr[0] = 02
> spi-nor spi1.0: read back sr2: sr_cr[1] = ff
> 

So here is what I get:

root@ubuntu:/home/john# flash_lock -l /dev/mtd0
[  109.037492] spi-nor spi-PRP0001:00: before write: sr_cr[0] = 9e, 
sr_cr[1] = 00
[  109.044769] spi-nor spi-PRP0001:00: read back sr1: sr_cr[0] = 02
[  109.050790] spi-nor spi-PRP0001:00: read back sr2: sr_cr[1] = 00


> the 16 bit write SR does not execute correctly and the WE remains set. If
> neither of the micron flashes do not support the 16 bit write SR, we can add a
> condition based on MFR. Let me check few datasheets.
> 

OK, thanks.

John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
