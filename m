Return-Path: <SRS0=v3L2=4G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634B8C34026
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 18:02:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CAD2070B
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2020 18:02:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a4qQjkI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CAD2070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DpA+RjWXE2AA96sbdzPjfOjk0lKfyMW4gz8VyYFxX2s=; b=a4qQjkI8S5Z1dtgP8KmILYUL3
	lgqJM9GtMFDbekAcXYTWqRLNYLCcQ6dzntUZh7C6jabGAE0J5DUpwETapklk745iUk8e3dUODnz5F
	ML3wgFwoK44X1lDWML51r7CYR6IRQRS16XLHoCJyyBE1F5OEWip/Xa7gpdfgQ341dS91g5HNZt+es
	TPnfCWeP9l/XXrreeN017kP+LPR3gXO2mkw61i3xH5ZY4e1Eev6ZlCPs/2tAd2MrUF22Mgg9ZnIXX
	iXyA8EUwNpNpka+nrT5KtjHDGcIu2B5yCgXyyYV6iVghYs6OdQZA64Pj7jWhZPArjCajzrYXQL+VB
	qrBZOxzMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j47C1-00022y-ST; Tue, 18 Feb 2020 18:01:57 +0000
Received: from lhrrgout.huawei.com ([185.176.76.210] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j47Bz-00022a-BK
 for linux-mtd@lists.infradead.org; Tue, 18 Feb 2020 18:01:56 +0000
Received: from LHREML714-CAH.china.huawei.com (unknown [172.18.7.108])
 by Forcepoint Email with ESMTP id E2F98400FDEB56B5A97E;
 Tue, 18 Feb 2020 18:01:53 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 LHREML714-CAH.china.huawei.com (10.201.108.37) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 18 Feb 2020 18:01:53 +0000
Received: from [127.0.0.1] (10.202.226.45) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5; Tue, 18 Feb
 2020 18:01:52 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Fixup page size for S25FS-S
To: Vignesh Raghavendra <vigneshr@ti.com>, Alexander A Sverdlin
 <alexander.sverdlin@nokia.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20200205165736.4964-1-alexander.sverdlin@nokia.com>
 <62a35797-4e78-f6b0-de86-50004bc636ca@huawei.com>
 <385c743e-0d8d-bcdc-7dd8-a1a619380b0a@ti.com>
 <0c894f19-6e19-c90a-afe7-e7f2a086b436@huawei.com>
 <0b5af315-5e1b-31ef-6cb9-eefefc86b425@ti.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <9042100b-eb7a-8285-6127-25d5b0073e94@huawei.com>
Date: Tue, 18 Feb 2020 18:01:51 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <0b5af315-5e1b-31ef-6cb9-eefefc86b425@ti.com>
Content-Language: en-US
X-Originating-IP: [10.202.226.45]
X-ClientProxiedBy: lhreml703-chm.china.huawei.com (10.201.108.52) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_100155_530995_9B6EEF89 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "chenxiang \(M\)" <chenxiang66@hisilicon.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>, David
 Woodhouse <dwmw2@infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 18/02/2020 04:53, Vignesh Raghavendra wrote:
>> I don't mean to hijack this thread, but I have tried to enable QUAD mode
>> for part s25fl129p1, and it fails in spi_nor_write_16bit_cr_and_check():
>>
>> [ 47.263365] spi-nor spi-PRP0001:00: CR: read back test failed
>> [ 47.306567] spi-nor spi-PRP0001:00: quad mode not supported
>> [ 47.322413] spi-nor: probe of spi-PRP0001:00 failed with error -5
>>
>> Hacking the flags to set SNOR_F_NO_READ_CR, and at least I can
>> successfully probe the driver.
>>
>> Does anyone know if this part does not support reading the config
>> register. The limited datasheet here doesn't mention it, AFAICT:
>>

Hi Vignesh,

>> https://www.cypress.com/file/196851/download
> Above datasheet is for s25fl128p.
> 

Right, I figured this out soon enough. I shouldn't just click on the 
first page which google produces...

> Per, s25fl129p datasheet[1], part does support 0x35 (SPINOR_OP_RDCR)
> command and support 16bit write status register command (0x1)
> 
> Could you debug further and see what exactly fails to match when
> read back fails?

I was trying to figure out the issue. So in 
spi_nor_write_16bit_cr_and_check(), the sr check passes (it holds 0, so 
that may be somewhat inconclusive) but the value for comparison return 0 
in the CR also versus expected 3.

Maybe it is a host driver issue, but I am doubtful.

I can continue to investigate. Any ideas would be appreciated.

> 
> [1]https://www.cypress.com/file/197121/download
> 
> 

Thanks,
John


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
