Return-Path: <SRS0=cvjG=WM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB74DC3A59C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 10:21:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEEF2206C1
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Aug 2019 10:21:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JO6GyyFQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEEF2206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=grTKF7nd6KG91dOfRzzIVKXzqAf6OByuneVm2CK+1Ow=; b=JO6GyyFQtNBh7thUS8dKXloCL
	yknP/TM17wI1DMS64a3RY3qG3jOAvpDcD3ghBLvyxBXNB5FOfcNrmeroitJ7fGZvqlw61owQfbiT6
	SISIOZVFTXXU9Pb5eGzAyegRY5jn5+EAijv8aacgBbykRizHVUEFxop71dadpVEjK0iaQmx5WtlCK
	PLXFQ7h57wmDWxCWfu3hVFhGU5gw/PXSLMet/q88roX81VMNcQtWiXARKo6yoEFZdHTB6YymNkaMu
	1N0mqkmLQrOlhPEnQ/ShRICZEt1tYIppf6HfvU2bYr+bqhbkrhH9NNw4cs4Chf6oqTilaDfuYBSR5
	xSrNF9oPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hyZLl-0002es-Lu; Fri, 16 Aug 2019 10:20:49 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hyZLi-0002bb-6p
 for linux-mtd@lists.infradead.org; Fri, 16 Aug 2019 10:20:48 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 29405BDAF1D26FCBC989;
 Fri, 16 Aug 2019 18:20:43 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0;
 Fri, 16 Aug 2019 18:20:35 +0800
From: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH] docs: mtd: Update spi nor reference driver
To: Schrempf Frieder <frieder.schrempf@kontron.de>, "corbet@lwn.net"
 <corbet@lwn.net>, "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1565107583-68506-1-git-send-email-john.garry@huawei.com>
 <6c4bb892-6cf5-af46-3ace-b333fd47ef14@huawei.com>
 <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
Message-ID: <ab2d3c29-982f-cb13-e2a2-e6d8da8f1438@huawei.com>
Date: Fri, 16 Aug 2019 11:20:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <9b074db7-b95d-a081-2fba-7b2b82997332@kontron.de>
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190816_032046_405262_6921180B 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 06/08/2019 17:40, Schrempf Frieder wrote:
> Cc: +MTD/SPI-NOR/SPI maintainers
>
> Hi John,
>
> On 06.08.19 18:35, John Garry wrote:
>> On 06/08/2019 17:06, John Garry wrote:
>>> The reference driver no longer exists since commit 50f1242c6742 ("mtd:
>>> fsl-quadspi: Remove the driver as it was replaced by spi-fsl-qspi.c").
>>>
>>> Update reference to spi-fsl-qspi.c driver.
>>>
>>> Signed-off-by: John Garry <john.garry@huawei.com>
>>>
>>> diff --git a/Documentation/driver-api/mtd/spi-nor.rst
>>> b/Documentation/driver-api/mtd/spi-nor.rst
>>> index f5333e3bf486..1f0437676762 100644
>>> --- a/Documentation/driver-api/mtd/spi-nor.rst
>>> +++ b/Documentation/driver-api/mtd/spi-nor.rst
>>
>> In fact this document has many references to Freescale QuadSPI - could
>> someone kindly review this complete document for up-to-date accuracy?
>
> The new driver spi-fsl-qspi.c is not a SPI NOR controller driver
> anymore. It is now a SPI controller driver that uses the SPI MEM API, so
> referencing it here is obsolete.
>
> Actually it seems like the whole file is obsolete and needs to be
> removed or replaced by proper documentation of the SPI MEM API.

Hi,

Could someone kindly advise on the following:

I am looking at ACPI support only for an mtd spi nor driver we're 
targeting for mainline support.

So for the host, I could use a proprietary HID in the DSDT for matching 
in the kernel driver.

About the child spi flash devices, is the recommendation to just use 
PRP0001 HID and "jedec,spi-nor" compatible?

thanks,
John


>
> @Maintainers:
> Maybe the docs under Documentation/driver-api/mtd should be officially
> maintained by the MTD subsystem (and added to MAINTAINERS). And if there
> will be some driver API docs for SPI MEM it should probably live in
> Documentation/driver-api/spi instead of Documentation/driver-api/mtd, as
> spi-mem.c itself is in drivers/spi.
>
> Regards,
> Frieder
>
>>
>> Thanks,
>> John
>>
>>> @@ -59,7 +59,7 @@ Part III - How can drivers use the framework?
>>>
>>>  The main API is spi_nor_scan(). Before you call the hook, a driver
>>> should
>>>  initialize the necessary fields for spi_nor{}. Please see
>>> -drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to
>>> fsl-quadspi.c
>>> +drivers/mtd/spi-nor/spi-nor.c for detail. Please also refer to
>>> spi-fsl-qspi.c
>>>  when you want to write a new driver for a SPI NOR controller.
>>>  Another API is spi_nor_restore(), this is used to restore the status
>>> of SPI
>>>  flash chip such as addressing mode. Call it whenever detach the
>>> driver from
>>>
>>
>>
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
