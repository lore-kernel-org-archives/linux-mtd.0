Return-Path: <SRS0=Oj4s=2C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0AEC43603
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 01:06:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E452214D8
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Dec 2019 01:06:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VytdBv9/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E452214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mz3fAu005BDf9YwlP5C1PLOc2z04mCh1b17yUOyUuk8=; b=VytdBv9/xDRTXx
	y/xNLeD7CJTkD9BFffl2SNbG8vvuBzNDOq3F+csbbD0VorqGWgvAbMZn0CTMzCrTQlLwXgvqWL4vn
	bzgliml6SwlbIgF+WTwN/Orct4SiScC/py/mBzSn2k8vyeNu/QoQI5PcjLQtMAzOuGKE/uKgNOMoW
	KDoawN5W0jC3dktxOO8Vj/SCaJqCA41wm9lNdcXqgDxhnCjl20VVrpElFTelmXR2qjVXtVGf7iY+q
	7XRhN96kTzdtGo9ErbXuKJozF6NuFyiOIizovMIPZ5IYeghzlVcFe0UTpD+Df3DE99VVG0rzlEKaF
	yzH+txUuBSxE8mS6f3OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifCw2-0005S3-8j; Thu, 12 Dec 2019 01:06:30 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifCvz-0005RF-5S
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2019 01:06:29 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47YFxF6vhxz1rXQ1;
 Thu, 12 Dec 2019 02:06:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47YFxF66LLz1qqkn;
 Thu, 12 Dec 2019 02:06:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6Dao9Rin5E_m; Thu, 12 Dec 2019 02:06:21 +0100 (CET)
X-Auth-Info: qhjSMqRTsdExmk4P0b+jsQnrqhlz8bnSUHbdasHUDx8=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu, 12 Dec 2019 02:06:20 +0100 (CET)
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
 <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
 <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
 <c611d4ab-443d-1041-9301-6129fb3fcf81@denx.de>
 <CAK7LNATYCvjqzctz+e-7Phh2No31xY891vK3e26c4OQLLdjKUA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <3f8417b7-56c4-8bf8-6c5b-99b4eb599e38@denx.de>
Date: Thu, 12 Dec 2019 01:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNATYCvjqzctz+e-7Phh2No31xY891vK3e26c4OQLLdjKUA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_170627_506881_C3A99623 
X-CRM114-Status: GOOD (  26.17  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 12/10/19 7:30 AM, Masahiro Yamada wrote:
> On Tue, Dec 10, 2019 at 12:35 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/10/19 4:15 AM, Masahiro Yamada wrote:
>>> On Mon, Dec 9, 2019 at 9:57 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 12/9/19 6:38 AM, Masahiro Yamada wrote:
>>>> [...]
>>>>
>>>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>>>>>> index 3102ddbd8abdb..b6c463d021677 100644
>>>>>> --- a/drivers/mtd/nand/raw/denali.c
>>>>>> +++ b/drivers/mtd/nand/raw/denali.c
>>>>>> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
>>>>>>
>>>>>>         /*
>>>>>>          * Set how many bytes should be skipped before writing data in OOB.
>>>>>> +        * If a non-zero value has already been configured, update it in HW.
>>>>>>          * If a non-zero value has already been set (by firmware or something),
>>>>>>          * just use it. Otherwise, set the driver's default.
>>>>>>          */
>>>>>> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>>>>>> -       if (!denali->oob_skip_bytes) {
>>>>>> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>>>>>> +       if (denali->oob_skip_bytes) {
>>>>>>                 iowrite32(denali->oob_skip_bytes,
>>>>>>                           denali->reg + SPARE_AREA_SKIP_BYTES);
>>>>>> +       } else {
>>>>>> +               denali->oob_skip_bytes =
>>>>>> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>>>>>> +               if (!denali->oob_skip_bytes) {
>>>>>> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>>>>>> +                       iowrite32(denali->oob_skip_bytes,
>>>>>> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
>>>>>
>>>>> This fallback is ugly, and should be removed, I think.
>>>>> It is only reachable by PCI platform (Intel MRST), where
>>>>> DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.
>>>>
>>>> This fallback retains the original behavior on all platforms. It might
>>>> not be to your liking, but it does not break other platforms while
>>>> fixing SoCFPGA. We don't know what other platforms might be depending on
>>>> this behavior, do we ?
>>>
>>>      if (denali->oob_skip_bytes) {
>>>                  iowrite32(denali->oob_skip_bytes,
>>>                                  denali->reg + SPARE_AREA_SKIP_BYTES);
>>>      else
>>>                 denali->oob_skip_bytes =
>>>                                  ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>>>
>>>
>>> ... retains the original behavior.
>>
>> It does not, because if the readback in the else branch sets
>> oob_skip_bytes to 0, the controller is not updated with the default value.
>>
>>> For denali_dt.c, it now explicitly sets SPARE_AREA_SKIP_BYTES
>>> to the well-defined value.
>>>
>>> denali_pci.c is the only platform that can read back the
>>> register value.
>>>
>>> See, how Intel originally wrote the code.
>>>
>>> https://github.com/torvalds/linux/blob/v3.0/drivers/mtd/nand/denali.c#L1345
>>>
>>>
>>> Please notice the part "if this value is 0, just let it be."
>>> The Intel MRST platform happily accepts
>>> SPARE_AREA_SKIP_BYTES being set to 0.
>>>
>>> I am not sure how many people are using this platform,
>>> but anyway it is how it has worked for a long time.
>>
>> The intel platform might accept 0 happily, but that's not how the
>> controller was configured for a long time.
> 
> It is.
> It worked like that for 9 years. (i.e. v2.6.35 - v4.19)

So it is broken now ?

If so, then that fix is for another patch.

>> So if I were to change the
>> code as you suggest, it would likely break some setups.
> 
> There is no perfect solution here
> when SPARE_AREA_SKIP_BYTES was set to 0
> before booting the kernel.
> 
> [A] Keep SPARE_AREA_SKIP_BYTES as it is.
>      This might affect the factory-recorded BBM,
>      but it should at least work if the firmware or the boot-loader
>      has set up the controller this way.
> 
> [B] Override SPARE_AREA_SKIP_BYTES with
>       a different value (8).
>       This can keep the factory-based BBM, but
>      this is very unlikely to work across software stages
>      if the NAND device was formatted by the firmware or
>      the boot-loader.
> 
> 
> We need to give up something.
> [A] was the original, 9 years' default, and cleaner.

Or maybe

commit 0d55c668b218a1db68b5044bce4de74e1bd0f0c8
    mtd: rawnand: denali: set SPARE_AREA_SKIP_BYTES register to 8 if unset

should be reverted, since it changed the behavior ?

[...]

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
