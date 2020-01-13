Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51832C33C9A
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E7321739
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 10:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VCZJIu3n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E7321739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5XwUGtTmHZuBy156o3C2lN6wAIytZksxxOwjTlW9zOg=; b=VCZJIu3niIkNcK8rMaCr6pBrV
	XrMu9Nn5DITWOhqO8SVjSQNMyrFSZ5ySGmSOW5OeC5umdQxRzS/jv8Whp4KqEKeNbmI6edb+Tajy2
	ghM02wZbkzxdP2Zjhmcwvwd/YEbnSkYGQHQ4dZ/5YAEFTDQabl1BZE9Q8ZD6QJGrxayFC51Q2dtsz
	Qa2d9tUiL0oRXfkq8xdLrSWmHaVUCd1RpHt4W4MhhW1k+DtpDhvkGpAlPpYu381ePjtv4U9ldpO0x
	UL7FTvIGKH0M74mZ/dmVMIOT0lfHEp2RrQMOhtqzgNZypQZlzMmNnx2iQZzhwzZQLt6S7B6597yDI
	/rItlyuzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqwfB-0004uC-Nm; Mon, 13 Jan 2020 10:09:37 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqwf7-0004tK-PT
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 10:09:35 +0000
Received: from lhreml706-cah.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id BFBAD38E1CB5CD72FF0D;
 Mon, 13 Jan 2020 10:09:30 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml706-cah.china.huawei.com (10.201.108.47) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 10:09:30 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 10:09:29 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
 <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
 <20200109212842.GK3702@sirena.org.uk>
 <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
Date: Mon, 13 Jan 2020 10:09:27 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200110193119.GI32742@smile.fi.intel.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_020933_978216_ACD9D50B 
X-CRM114-Status: GOOD (  17.82  )
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
Cc: chenxiang66@hisilicon.com, linux-kernel@vger.kernel.org,
 tudor.ambarus@microchip.com, liusimin4@huawei.com, linuxarm@huawei.com,
 linux-spi@vger.kernel.org, marek.vasut@gmail.com,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 xuejiancheng@hisilicon.com, Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 10/01/2020 19:31, Andy Shevchenko wrote:
> On Fri, Jan 10, 2020 at 02:58:54PM +0000, John Garry wrote:
>> On 10/01/2020 14:07, Mark Brown wrote:
>>> On Fri, Jan 10, 2020 at 11:55:37AM +0000, John Garry wrote: >
> 
> ...
> 
>>>> I will note that PRP0001+"jedec,spi-nor" compatible DSD seems to be the
>>>> defacto method to describe the SPI NOR-compat part for ACPI - that's what
>>>> I'm using. We could add properties there, but that seems improper.
>>>
>>> OK, so that's just reusing the DT binding in which case everything
>>> that's valid for the DT binding should also be valid for ACPI - I
>>> thought that actually worked automatically without you having to do
>>> anything in the code but ICBW.
>>
>> I thought that it would be improper as we could be mixing ACPI methods to
>> describe the serial bus (SPI Serial Bus Connection Resource Descriptor) and
>> also DT properties which could conflict, like CS active high.
>>
>> However I do see extra properties than "compatible" being added in DSD for
>> PRP0001:
>> https://patchwork.ozlabs.org/patch/662813/ (see EEPROM part)
> 

Hi Andy,

> PRP method is only for vendors to *test* the hardware in ACPI environment.
> The proper method is to allocate correct ACPI ID.

Yes, that would seem the proper thing to do. So the SPI NOR driver is 
based on micron m25p80 and compatible string is "jedec,spi-nor", so I 
don't know who should or would do this registration.

> 
> Properties (_DSD in ACPI) may be used in the same way as for DT if we have no
> other means in ACPI specification for them.
> 
>> And if we were to do this, I think that we would need to add some
>> device_property_read_u32("spi-rx-bus-width", ...), etc calls in the SPI FW
>> parsing for ACPI path - I couldn't see that.
> 
> It's okay as long as you have ACPI ID.

Well there is none AFAIK.

> 
> P.S. Most of the sensor drivers were updated in order to support ACPI PRP
> method due to DIY hobbyist on IoT sector and embedded devices. This should not
> be an official way how we support hardware on ACPI-based platforms.

Yeah, so we could do this. But, as I mentioned already, this could mean 
that we conflicting properties. For this the kernel driver prob should 
only pay attention to properties which ACPI cannot describe.

Even better would be to update the ACPI spec, especially for something 
general like SPI bus width

BTW, Do any of these sensors you mention have any ACPI standardization?

Thanks,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
