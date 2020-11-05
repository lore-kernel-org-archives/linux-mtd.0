Return-Path: <SRS0=L3KX=EL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9A6C00A89
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 12:23:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F41D20729
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2020 12:23:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a+jNgOpe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V8jjEVSr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F41D20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CsYNSkJlZBHK+xev4tWf3/jZ+6iqXZhga5gbxAkVfIk=; b=a+jNgOpeRFeqo3eqToTrFJ5VH
	u4iiXz59nh5vjYhZWQKLVwDqiF15ln4pF72ifk9g47Fg7pkKy7ywllTqE20ix8obBAxdOJfzzScSl
	UUmIR6KwAvRNp734GBUAPi/mjDqe67MSNazUkSZneO124lJThHHUxZltqvYC+phovS+1LeZFWgJh4
	0yB4XZYsgFdh29SNQd12K9BUL1uKm0joDCy1ra6laGmuWr1B7YyqNpwb5Goxjnu5AppoGj6mQS6IM
	rDNjhacPi+5RnCChYJiZDgL/zeMSEX4HdtWa3NvJzZr0NxRlg0F9442oDKoRUj+3d/ZsxEg+dvGpH
	+7FxX32FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaeGS-0008Qv-Rb; Thu, 05 Nov 2020 12:21:16 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaeGP-0008Pn-1T
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2020 12:21:15 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5CL7NJ062582;
 Thu, 5 Nov 2020 06:21:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604578867;
 bh=Z4RRec5l05SjKlPI6lwgZrSpZa5Ph7B/vgfrZlgH4EA=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=V8jjEVSrFmvlfWWmuz3412aUGmrlgd35gOcW7Ewo2woR8zFtS+QQpOt+S8yfDWKOa
 29JaHlAJCjJDlP/YjVH6JPswMaJRBTP6uP0Jr88md9/y2FJxyLTgNvZSqRx0s9hrOa
 CaynBYj5X5xdiSz+VLY43Vi3j0FC8Jw8ziiA80NU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5CL7K8016114
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 06:21:07 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 06:21:07 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 06:21:06 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5CL4LN045327;
 Thu, 5 Nov 2020 06:21:04 -0600
Subject: Re: [PATCH 0/3] mtd: Make sure UBIFS does not do multi-pass page
 programming on flashes that don't support it
To: Pratyush Yadav <p.yadav@ti.com>
References: <20201012180404.6476-1-p.yadav@ti.com>
 <20201027111804.e27pyvf62eksngmp@ti.com>
 <CAFLxGvxc=EqBStzLz3ApwYDomKMe=WeK22ohfPQs1WrMCsaVQg@mail.gmail.com>
 <fa578bda-132a-320a-264c-d973bae194dd@ti.com>
 <20201103124527.x6mp6slck44aotzn@ti.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <4c0e3207-72a4-8c1a-5fca-e9f30cc60828@ti.com>
Date: Thu, 5 Nov 2020 17:51:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201103124527.x6mp6slck44aotzn@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_072113_231354_B1951CB2 
X-CRM114-Status: GOOD (  33.79  )
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
 Richard Weinberger <richard.weinberger@gmail.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/3/20 6:15 PM, Pratyush Yadav wrote:
> On 03/11/20 05:05PM, Vignesh Raghavendra wrote:
>>
>>
>> On 11/1/20 3:14 AM, Richard Weinberger wrote:
>>> On Tue, Oct 27, 2020 at 12:24 PM Pratyush Yadav <p.yadav@ti.com> wrote:
>>>>> [0] https://lore.kernel.org/linux-mtd/20201005153138.6437-1-p.yadav@ti.com/
>>>>
>>>> Ping. Any comments on the series?
>>>
>>> From the UBIFS point of view I'd like to avoid as many device specific
>>> settings as possible.
>>> We check already for NOR flash, checking for NOR *and* SPI_NOR_NO_MULTI_PASS_PP
>>> feels a bit clumsy.
>>>
>>> Tudor, what do you think about SPI_NOR_NO_MULTI_PASS_PP?
>>> This kind of NOR seems to be a little NAND'ish. Maybe we can hide this detail
>>> in the mtd framework?
>>>
>>
>> Agree with Richard. I don't see need for SPI_NOR_NO_MULTI_PASS_PP. From
>> MTD point of view setting mtd->writesize to be equal to pagesize should
>> be enough. Its upto clients of MTD devices to ensure there is no multi
>> pass programming within a "writesize" block.
> 
> That is what I initially thought too but then I realized that multi-pass 
> programming is completely different from page-size programming. Instead 
> of writing 4 bytes twice, you can zero out the entire page in one single 
> operation. You would be compliant with the write size requirement but 
> you still do multi-pass programming because you did not erase the page 
> before this operation.
> 

Right...

> It is also not completely correct to say the Cypress S28 flash has a 
> write size of 256. You _can_ write one byte if you want. You just can't 
> write to that page again without erasing it first. For example, if a 
> file system only wants to write 128 bytes on a page, it can do so 
> without having to write the whole page. It just needs to make sure it 
> doesn't write to it again without erasing first.
> 

As per documentation:
mtd_info::writesize: "In case of ECC-ed NOR it is of ECC block size"

This means, it is block on which ECC is calculated on ECC-ed NOR and
thus needs to be erased every time before being updated.

Looking at flash datasheet, this seems to be 16 bytes.

So mtd->writesize = 16 and not 256 (or pagesize)


Also, It does not imply length of data being written has to be multiple
of it. At least NAND subsystem does not seem to care that during  writes
len < mtd->writesize[1].

> nor_erase_prepare() was written to handle quirks of some specific 
> devices. Not every device starts filling zeroes from the end of a page. 
> So we have device-specific code in UBIFS already. You will obviously 
> need device-specific settings to have control over that code.
> 

UBIFS intends to be robust against rogue power cuts and therefore would
need to ensure some consistency during erase which explains flash
specific quirk here.

> One might argue that we should move nor_erase_prepare() out of UBIFS. 
> But requiring a flash to start erasing from the start of the page is a 
> UBIFS-specific requirement. Other users of a flash might not care about 
> it at all.
> 

Yes. But I don't see much harm done.

> And so we have ourselves a bit of a conundrum. Adding 
> SPI_NOR_NO_MULTI_PASS_PP is IMHO the least disruptive answer. If the 
> file system wants to do multi-pass page programming on NOR flashes, how 
> else do we tell it not to do it for this specific flash?
> 

I see don't see need for SPI_NOR_NO_MULTI_PASS_PP as
SPI_NOR_NO_MULTI_PASS_PP is implied within a ECC block and writesize is
supposed to represent the same.

>> If this is not clear in the current documentation of struct mtd, then
>> that can be updated.
> 

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/mtd/nand/raw/nand_base.c#L4166

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
