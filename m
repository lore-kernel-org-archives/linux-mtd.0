Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974E0C33CAD
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:01:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F3B207FF
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 13:01:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DHbpnSSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F3B207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+7LUgbUX/kT+FoPiUdu+SFNRv9mqkbe7dGRTXXb+enU=; b=DHbpnSSwuSYJJqYL3HuHzVyQw
	qP8HbADSwdCx+4VrC0bgMJFtCzUplvM8Ywn0j9sqD0oWk9cDNHRGLrMDEf8EQcBGHWWYtJmS2oz0t
	e54q7ZLz4Uj3lVIwMyI2EMmVtSDiyjvKH/ewDfKBNXRkQ/jdf9rZq51ofHBi/bIFdct9F923fR1Ie
	CVA1s5Qd+mDphb4r6yo9Pz9STFDXYhEA+h/9B6GUE+eh+KI7CMTjcq3l8132YwDJxnuwnzF5+lkWB
	NfjlFwYi3mF/erIx396C0V3qarrc5l2PeNX774XJQrgDSheH/i2yyPN7Ln7/vUetJTumYWZBLbfVO
	jd4KD+KtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqzLE-000092-Cq; Mon, 13 Jan 2020 13:01:12 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqzLB-00007l-AG
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2020 13:01:10 +0000
Received: from lhreml704-cah.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 18EF8C44A31786DBE467;
 Mon, 13 Jan 2020 13:01:08 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml704-cah.china.huawei.com (10.201.108.45) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 13 Jan 2020 13:01:07 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 13 Jan
 2020 13:01:07 +0000
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
To: Mark Brown <broonie@kernel.org>
References: <1575900490-74467-1-git-send-email-john.garry@huawei.com>
 <1575900490-74467-3-git-send-email-john.garry@huawei.com>
 <0dc5cb2e-b765-9e13-b05e-9e3c835c5985@huawei.com>
 <20200109212842.GK3702@sirena.org.uk>
 <df67b562-7d82-19f6-7581-680190a7772d@huawei.com>
 <20200110140726.GB5889@sirena.org.uk>
 <6db83881-927c-d11c-9c77-23a45892ddab@huawei.com>
 <20200110193119.GI32742@smile.fi.intel.com>
 <612a3c5d-69a4-af6b-5c79-c3fb853193ab@huawei.com>
 <20200113114256.GH3897@sirena.org.uk>
From: John Garry <john.garry@huawei.com>
Message-ID: <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
Date: Mon, 13 Jan 2020 13:01:06 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20200113114256.GH3897@sirena.org.uk>
Content-Language: en-US
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_050109_505456_4D4245B6 
X-CRM114-Status: GOOD (  14.03  )
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
 linux-mtd@lists.infradead.org, xuejiancheng@hisilicon.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 13/01/2020 11:42, Mark Brown wrote:
> On Mon, Jan 13, 2020 at 10:09:27AM +0000, John Garry wrote:
>> On 10/01/2020 19:31, Andy Shevchenko wrote:
> 
>>> PRP method is only for vendors to *test* the hardware in ACPI environment.
>>> The proper method is to allocate correct ACPI ID.
> 
>> Yes, that would seem the proper thing to do. So the SPI NOR driver is based
>> on micron m25p80 and compatible string is "jedec,spi-nor", so I don't know
>> who should or would do this registration.
> 

Hi Mark,

> The idiomatic approach appears to be for individual board vendors
> to allocate IDs, you do end up with multiple IDs from multiple
> vendors for the same thing.

So we see sort of approach a lot when vendors integrate 3rd party IP 
into a SoC and then assign some vendor specific ID for that.

But I am not sure how appropriate that same approach would be for some 
3rd party memory part which we're simply wiring up on our board. Maybe 
it is.

> 
>> BTW, Do any of these sensors you mention have any ACPI standardization?
> 
> In general there's not really much standardizaiton for devices,
> the bindings that do exist aren't really centrally documented and
> the Windows standard is just to have the basic device
> registration in the firmware and do all properties based on
> quirking based on DMI information.
> 

OK, so there is always DMI. I hoped to avoid this sort of thing in the 
linux driver :)

Cheers,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
