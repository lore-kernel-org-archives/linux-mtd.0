Return-Path: <SRS0=aQsM=4U=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C298C3F2CD
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:43:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 540C6208C3
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Mar 2020 09:43:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kZfnmeHQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 540C6208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0PLueA7Z1j4anvaJhmxFgUcGKIrhjgngrQ10ljnWmTM=; b=kZfnmeHQH4+2ZzSmz7pgc17cq
	j8xpwGRq/sYKrfEVJQgpXd1s9tISZFxKOzlmhJTUpHvV1AlfLR7i4Uj2CA6uIfN1x9UeLoXUCjLP/
	b540l2rQaWwOBcGSaeBUCjKhxCTDW251rto5MsNNjhn0qqbn+BkAxvTMPzCeQj10rFaw6RAoCijDe
	tjZZ/I2NuF0vE0t3/v4uL47sfDujf8l2Fxonh+9KY7D9zqUWcEuXKgEkHq+C3eP+eN53zRwtI40nv
	Ykyb8Au+dO4hDcahTkxwYjHxAugBIeCV4XkaYv+//u86PdJboNuXYuiFX1YXUx/Ty6bbTIgDi+pwE
	koRQ7Lltg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j944t-0006ML-Tf; Tue, 03 Mar 2020 09:43:03 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j944q-0006L2-Ii
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2020 09:43:02 +0000
Received: from LHREML710-CAH.china.huawei.com (unknown [172.18.7.106])
 by Forcepoint Email with ESMTP id 17437D1B0E2FDFC47141;
 Tue,  3 Mar 2020 09:42:47 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML710-CAH.china.huawei.com (10.201.108.33) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 3 Mar 2020 09:42:46 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 3 Mar 2020
 09:42:46 +0000
Subject: Re: [PATCH RFC 1/3] spi: Allow SPI controller override device buswidth
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-2-git-send-email-john.garry@huawei.com>
 <CAMuHMdW7Xu6EzfmVFx1+i1byy3KOS5A+h2GuMb8nkZ+-jD1=BA@mail.gmail.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <f6f21e75-7cee-89da-bb87-95327a4ec2cc@huawei.com>
Date: Tue, 3 Mar 2020 09:42:45 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW7Xu6EzfmVFx1+i1byy3KOS5A+h2GuMb8nkZ+-jD1=BA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml725-chm.china.huawei.com (10.201.108.76) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_014300_765893_4E4A1117 
X-CRM114-Status: GOOD (  14.61  )
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
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linuxarm <linuxarm@huawei.com>, Mark Brown <broonie@kernel.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Geert,

> 
> On Fri, Feb 28, 2020 at 4:23 PM John Garry <john.garry@huawei.com> wrote:
>> Currently ACPI firmware description for a SPI device does not have any
>> method to describe the data buswidth on the board.
>>
>> So even through the controller and device may support higher modes than
>> standard SPI, it cannot be assumed that the board does - as such, that
>> device is limited to standard SPI in such a circumstance.
>>
>> As a workaround, allow the controller driver supply buswidth override bits,
>> which are used inform the core code that the controller driver knows the
>> buswidth supported on that board for that device.
> 
> Just wondering: can't the controller just override this (e.g. in the .setuup()
> callback) without having to touch the generic code?

I think that this is a good idea.

However, where we call .setup() in spi_setup() looks a little too late - 
at the point we call .setup(), most of the work on vetting/fixing the 
mode bits is complete. And I would not want the SPI controller driver 
just to disregard this work and overwrite the bits (in this way).

And if we wanted to move the .setup callback earlier, then I would be 
worried here with 2 things:
1. Some SPI controller drivers may rely on spi->mode being set finally 
when .setup() is called
2. We may need to undo the work of .setup() if we later error in 
spi_setup(), like for invalid mode bits

However, maybe another callback could be introduced, .early_setup().

Thanks,
John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
