Return-Path: <SRS0=9794=3U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F9FC2D0DB
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 16:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6324B214D8
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jan 2020 16:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l2IpW/kC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6324B214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9h7QqdWhSwmaT8UpaBfsSuh2odIsd/OM6Ne8TPXJ5SA=; b=l2IpW/kCRhsOX4+rMDozB8Myq
	GLwChDV2ZNTwKi9b4LBjlfAryOtzorso/bFRC/G6cyfFc4ZeTJQrCG5OS2g+jCvmkqjLN7X9IoKV+
	fxNc079kMixE+A6UAuJNP6DX9CVmflXv1mdpylTQcxbRsUYySSNRGnekZD2LRu8H5ADmaQYyGBf+6
	ORKStaUQA17RZIVnCixMNyemaz44UhtJlucji7zdhs4+rWMo9+XDDjErrkERY3haS2qVHLy4Y9pDI
	fSm3bDTei8i7YHfcIcXcI/j/xcHo7ydCn2XsKjq9Bqppi4KsQ6nFvkaoZWRYCUlO06JMqnPeC8cZm
	5MGl0soNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixZ8G-000631-OJ; Fri, 31 Jan 2020 16:27:00 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixZ8C-00061y-LF
 for linux-mtd@lists.infradead.org; Fri, 31 Jan 2020 16:26:58 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id BC5B4EA82E605F00057D;
 Fri, 31 Jan 2020 16:26:48 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 31 Jan 2020 16:26:48 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 31 Jan
 2020 16:26:47 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
 <20200113114256.GH3897@sirena.org.uk>
 <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
 <20200113140627.GJ3897@sirena.org.uk>
 <CAHp75VfepiiVFLLmCwdBS0Z6tmR+XKBaOLg1qPPuz1McLjS=4Q@mail.gmail.com>
 <20200113142754.GL3897@sirena.org.uk>
 <20200113143403.GQ32742@smile.fi.intel.com>
 <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
 <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
 <136bd652-dcb9-3efa-a92f-2263cbf840ad@huawei.com>
 <CAHp75Vd=TY0tPfSHMSLTh1Pgg-E7MCP5Gym1yjpLgH0Tx-2xSg@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <c5cfb189-797e-11c4-f77a-61ec35395b15@huawei.com>
Date: Fri, 31 Jan 2020 16:26:46 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd=TY0tPfSHMSLTh1Pgg-E7MCP5Gym1yjpLgH0Tx-2xSg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200131_082656_841345_53260FB9 
X-CRM114-Status: GOOD (  15.72  )
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
Cc: tudor.ambarus@microchip.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 chenxiang66@hisilicon.com, liusimin4@huawei.com,
 Linuxarm <linuxarm@huawei.com>, linux-spi <linux-spi@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, Mark Brown <broonie@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Jiancheng Xue <xuejiancheng@hisilicon.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 31/01/2020 15:46, Andy Shevchenko wrote:
> On Fri, Jan 31, 2020 at 2:03 PM John Garry <john.garry@huawei.com> wrote:
>> On 31/01/2020 11:39, Andy Shevchenko wrote:
>>> On Fri, Jan 31, 2020 at 12:08 PM John Garry <john.garry@huawei.com> wrote:
>>>> On 13/01/2020 14:34, Andy Shevchenko wrote:
> 
> ...
> 
>>>> About this topic of ACPI having no method to describe device buswidth in
>>>> the resource descriptor, it may be an idea for me to raise a Tianocore
>>>> feature request @ https://bugzilla.tianocore.org/
>>>>
>>>
>>> The 19.6.126 describes the SPI resource, in particular:
>>>
>>> ---8<---8<---
>>> DataBitLength is the size, in bits, of the smallest transfer unit for
>>> this connection. _LEN is automatically
>>> created to refer to this portion of the resource descriptor.
>>> ---8<---8<---
>>>

Hi Andy,

>>> Is it what you are looking for? (As far as I know most of the
>>> firmwares simple abuse this field among others)
>>
>> I didn't think so - I thought that there was a distinction between width
>> and length in SPI terms.
> 
> My interpretation of this field is a data width of the slave.
> Basically what we have as transfer->size inside SPI in the Linux
> kernel.
> 
>> So how do you find that most firmwares abuse this field? AFAICS, linux
>> kernel doesn't interpret this field at all.
> 
>>From all tables I have this is the result of appearance (some of the
> tables are like 10x times present in my data base, but nevertheless)
> 
>      140 SpiSerialBusV2(0x0000,PolarityHigh,FourWireMode,0x08,
>     411 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x08,
>       1 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x08,
>      36 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x10,
>      35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x18,
>      35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x20,
>       1 SpiSerialBusV2(0x0000,PolarityLow,ThreeWireMode,0x10,
>       8 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x08,
>       1 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x10,
> 
> So, it seems I stand corrected, the field is in right use, although
> cases like 0x10 and 0x20 should be carefully checked.
> 
> We may teach kernel to get something meaningful out of it.
> 

It seems that someone already had a go at that:
https://lore.kernel.org/lkml/20170317212143.bogj6efzyvvf24yd@sirena.org.uk/

Thanks,
John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
