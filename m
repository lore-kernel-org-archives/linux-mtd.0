Return-Path: <SRS0=XIAy=2A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DA1C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 03:36:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 317582071E
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Dec 2019 03:36:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YojDOwJU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 317582071E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:Subject:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CiCeqR87E9T+E5ACeh88zK+mQ6hghOj6Dk/Tq0uergY=; b=YojDOwJUDpc8Bk
	v0e2gp1Kfva32XLGYiT5JvsDigPCba97hF/CzO5cRtVx63jzBsjCHvNqTlNVTryClDMcoV4tdt36T
	lH1pYCNRVWuV8AygpvRCKTjtAew/Zye3o9ARnDhrHug5v6ijRSzuS2pBMUk94eeQu2yxBH3gZwOpX
	kHRf6fa5NKPcWHvbLE7d3gD9hX2ZEY3HKYNWsZLkVOzbJLazOCGpYTboDoqkZrFHOJeRB7BrTDLHo
	YjW4MgYfhnQLK0IT8e/szp+aWRZfoHZh4QNkz11bvuTgrIuArgf6hkjs9UWF417XQmFYTH6QQNUW1
	LmjM1JYcwjPUjNHGbEzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieWJd-0003YA-Ax; Tue, 10 Dec 2019 03:36:01 +0000
Received: from mail-out.m-online.net ([212.18.0.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieWJX-0003XR-Ms
 for linux-mtd@lists.infradead.org; Tue, 10 Dec 2019 03:35:59 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 47X5LZ44mpz1rY6H;
 Tue, 10 Dec 2019 04:35:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 47X5LZ2VnVz1rjr3;
 Tue, 10 Dec 2019 04:35:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id RAtZKdGAb3Er; Tue, 10 Dec 2019 04:35:45 +0100 (CET)
X-Auth-Info: p/UGFxsXR+XKXNn1JgbjIyDH44+MDD+fc3lPVPCD490=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue, 10 Dec 2019 04:35:44 +0100 (CET)
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] mtd: rawnand: denali_dt: Add support for configuring
 SPARE_AREA_SKIP_BYTES
To: Masahiro Yamada <masahiroy@kernel.org>
References: <20191207004855.11334-1-marex@denx.de>
 <CAK7LNAQsejXuwAZ6G5=G88GMj6P10bFkBwr4czL_BXkONSHsGw@mail.gmail.com>
 <ffdfa74a-f3cf-1c8a-4917-dabf7d8fc393@denx.de>
 <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
Message-ID: <c611d4ab-443d-1041-9301-6129fb3fcf81@denx.de>
Date: Tue, 10 Dec 2019 04:32:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR=y0hTFYzNodPr9LvGad76V7MeMfsX+58s+zCERx6Y-A@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_193556_049411_AE7B628C 
X-CRM114-Status: GOOD (  25.77  )
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

On 12/10/19 4:15 AM, Masahiro Yamada wrote:
> On Mon, Dec 9, 2019 at 9:57 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/9/19 6:38 AM, Masahiro Yamada wrote:
>> [...]
>>
>>>> diff --git a/drivers/mtd/nand/raw/denali.c b/drivers/mtd/nand/raw/denali.c
>>>> index 3102ddbd8abdb..b6c463d021677 100644
>>>> --- a/drivers/mtd/nand/raw/denali.c
>>>> +++ b/drivers/mtd/nand/raw/denali.c
>>>> @@ -1302,14 +1302,21 @@ int denali_init(struct denali_controller *denali)
>>>>
>>>>         /*
>>>>          * Set how many bytes should be skipped before writing data in OOB.
>>>> +        * If a non-zero value has already been configured, update it in HW.
>>>>          * If a non-zero value has already been set (by firmware or something),
>>>>          * just use it. Otherwise, set the driver's default.
>>>>          */
>>>> -       denali->oob_skip_bytes = ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>>>> -       if (!denali->oob_skip_bytes) {
>>>> -               denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>>>> +       if (denali->oob_skip_bytes) {
>>>>                 iowrite32(denali->oob_skip_bytes,
>>>>                           denali->reg + SPARE_AREA_SKIP_BYTES);
>>>> +       } else {
>>>> +               denali->oob_skip_bytes =
>>>> +                       ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
>>>> +               if (!denali->oob_skip_bytes) {
>>>> +                       denali->oob_skip_bytes = DENALI_DEFAULT_OOB_SKIP_BYTES;
>>>> +                       iowrite32(denali->oob_skip_bytes,
>>>> +                                 denali->reg + SPARE_AREA_SKIP_BYTES);
>>>
>>> This fallback is ugly, and should be removed, I think.
>>> It is only reachable by PCI platform (Intel MRST), where
>>> DENALI_DEFAULT_OOB_SKIP_BYTES is probably useless.
>>
>> This fallback retains the original behavior on all platforms. It might
>> not be to your liking, but it does not break other platforms while
>> fixing SoCFPGA. We don't know what other platforms might be depending on
>> this behavior, do we ?
> 
>      if (denali->oob_skip_bytes) {
>                  iowrite32(denali->oob_skip_bytes,
>                                  denali->reg + SPARE_AREA_SKIP_BYTES);
>      else
>                 denali->oob_skip_bytes =
>                                  ioread32(denali->reg + SPARE_AREA_SKIP_BYTES);
> 
> 
> ... retains the original behavior.

It does not, because if the readback in the else branch sets
oob_skip_bytes to 0, the controller is not updated with the default value.

> For denali_dt.c, it now explicitly sets SPARE_AREA_SKIP_BYTES
> to the well-defined value.
> 
> denali_pci.c is the only platform that can read back the
> register value.
> 
> See, how Intel originally wrote the code.
> 
> https://github.com/torvalds/linux/blob/v3.0/drivers/mtd/nand/denali.c#L1345
> 
> 
> Please notice the part "if this value is 0, just let it be."
> The Intel MRST platform happily accepts
> SPARE_AREA_SKIP_BYTES being set to 0.
> 
> I am not sure how many people are using this platform,
> but anyway it is how it has worked for a long time.

The intel platform might accept 0 happily, but that's not how the
controller was configured for a long time. So if I were to change the
code as you suggest, it would likely break some setups.

>>>> @@ -209,6 +213,8 @@ static int denali_dt_probe(struct platform_device *pdev)
>>>>         denali->clk_rate = clk_get_rate(dt->clk);
>>>>         denali->clk_x_rate = clk_get_rate(dt->clk_x);
>>>>
>>>> +       denali->oob_skip_bytes = data->oob_skip_bytes;
>>>> +
>>>
>>> Please move this to the relevant hunk.
>>> Preferably, based on this:
>>> http://patchwork.ozlabs.org/patch/1205912/
>>
>> I don't understand what you want me to change ? Shall I rebase this on
>> top of your patch from today and repost ?
> 
> Yes.
> 
> I do not want to scatter the relevant code
> (coping struct fields) to random places.
> 
> I want the code to look like this:
> 
>        denali->revision = data->revision;
>        denali->caps = data->caps;
> +     denali->oob_skip_bytes = data->oob_skip_bytes;
>        denali->ecc_caps = data->ecc_caps;

Maybe you can rebase your patch on top of this one then ? It was posted
later after all.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
