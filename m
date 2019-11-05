Return-Path: <SRS0=AYH6=Y5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01A3C010A3
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 10:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02D82190F
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2019 10:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jCvTTtjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02D82190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6uLCqCd5CsoC+F3peE1AfaaxoX5sfVZ64ZCjuROjDxU=; b=jCvTTtjA8rP6C85hJeCbeegTj
	JPJW32oFg7F1qvRPd2tDnbQkNGxqcd61g08p3xn+m60HpJNSLZeA6hN2roclZw43fzNWy1S5cL3cK
	mdJrOCYoA6BHpLcOuR4IN7SKLVlvJ1jXgWyMohOaBEkT6FzwCUQuRGVVlIiNHmKyP9jwKYfYnyL1o
	nRlAnK7dXrbu+AL4sHUW3D0+hXCjGTdbNFDCRYb8Uv+iHYVJyQxGJSUg4d14Too4KPk9/tNMkgxFE
	tFv48GswuoY1lldU3LTjN8qoF3CZafQOS7X+xs1dLcFFlctiQsfwfS73pLeJ/OKI7T2iY5tld2cY0
	kF0OtKFpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRwXx-0001mJ-UR; Tue, 05 Nov 2019 10:58:49 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRwXu-0001l1-Rl
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2019 10:58:48 +0000
Received: from lhreml708-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id 62D9AC260B20A0E14590;
 Tue,  5 Nov 2019 10:58:41 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml708-cah.china.huawei.com (10.201.108.49) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 5 Nov 2019 10:58:40 +0000
Received: from [127.0.0.1] (10.202.226.46) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 5 Nov 2019
 10:58:40 +0000
Subject: Re: [PATCH 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Mark Brown <broonie@kernel.org>
References: <1572886297-45400-1-git-send-email-john.garry@huawei.com>
 <1572886297-45400-3-git-send-email-john.garry@huawei.com>
 <20191104192406.GH5238@sirena.co.uk>
From: John Garry <john.garry@huawei.com>
Message-ID: <855a67dc-1356-a763-e374-540f6ac400ab@huawei.com>
Date: Tue, 5 Nov 2019 10:58:39 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191104192406.GH5238@sirena.co.uk>
Content-Language: en-US
X-Originating-IP: [10.202.226.46]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191105_025847_043904_95AFBDF6 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: tudor.ambarus@microchip.com, linux-kernel@vger.kernel.org,
 linuxarm@huawei.com, linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com,
 fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/11/2019 19:24, Mark Brown wrote:
> On Tue, Nov 05, 2019 at 12:51:36AM +0800, John Garry wrote:
> 

Hi Mark,

>> Only ACPI firmware is supported.
> 
> There's no ACPI dependency though?  If the driver only works with ACPI
> I'd expect to see one with an || COMPILE_TEST like the architecture
> dependency.

Yeah, you're right. So the driver can build for !ACPI and !COMPILE_TEST, 
but there's no point really. I'll update.

> 
>> @@ -0,0 +1,287 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * HiSilicon SPI NOR V3XX Flash Controller Driver for hi16xx chipsets
>> + *
> 
> Please make the entire comment a C++ one for neatness.

ok

> 
>> + * Copyright (c) 2019 HiSilicon Technologies Co., Ltd.
>> + * Author: John Garry <john.garry@huawei.com>
>> + */
>> +//#define DEBUG 1
> 
> Please remove this.

ok

> 
>> +#define GLOBAL_CFG (0x100)
>> +
>> +#define BUS_CFG1 (0x200)
>> +#define BUS_CFG2 (0x204)
>> +#define BUS_FLASH_SIZE (0x210)
>> +
>> +#define VERSION (0x1f8)
> 
> These could use some namespacing, especially the last one - it seems
> quite likely there'll be some collisions at some point.

ok

> 
>> +#define HISI_SFC_V3XX_WAIT_TIMEOUT_US		1000000
>> +#define HISI_SFC_V3XX_WAIT_POLL_INTERVAL_US	10
> 
> Plus if we've got these long prefixes here it'd be good to be
> consistent.

sure

> 
>> +	if (IS_ALIGNED((uintptr_t)to, 4)) {
>> +		int words = len / 4;
>> +
>> +		__ioread32_copy(to, host->regbase + CMD_DATABUF(0), words);
>> +
>> +		len -= words * 4;
>> +		if (len) {
>> +			u32 val;
>> +
>> +			val = __raw_readl(host->regbase + CMD_DATABUF(words));
>> +
>> +			to += words * 4;
>> +			for (i = 0; i < len; i++, val >>= 8, to++)
>> +				*to = (u8)val;
>> +		}
>> +	} else {
>> +		for (i = 0; i < DIV_ROUND_UP(len, 4); i++) {
>> +			u32 val = __raw_readl(host->regbase + CMD_DATABUF(i));
>> +			int j;
> 
> The more usual pattern for these would be to do some unaligned accesses
> for the start/end of the buffer to get to alignment and then transfer
> the rest as aligned data.
> 

Yeah, I understand you, but for that I would need to generate multiple 
transactions in the driver, and I wanted to keep 1x transaction per 
spi_controller_mem_ops.exec_op call.

So maybe I can do some trickery in my adjust_op_size method to generate 
these multiple transactions: a. any unaligned start data b. the 
32b-aligned data b. unaligned end. I think that the HW should be able to 
handle that.

Thanks,
John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
