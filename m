Return-Path: <SRS0=TDhY=6N=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF22C83000
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E20F20575
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Apr 2020 15:18:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZolTrL9N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E20F20575
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sOzu8JdaZDsUiAfc+LtzCFQZ3QqEhIlnbJHq4ukrcGw=; b=ZolTrL9NjJssV2
	oKa6bIWHxKlFPAK6uOVhNdc9QEqEfv+Gg4T05Vv3yM5GBQW5pI6g7RE0VczL18pu3O/BOqLrddFu2
	28UrRnVxcsfUoCYTh3hLSPlnZ6mRzoUI3iur9v1hlenqSLDwMev2S2HHEFvOuFvvgqpzRnatEYGC2
	gSieqpfe9oYLT2RqL6AVqv8sEow3XJ3ulKUkKixg0wn/adyTy2x7ggQY9R9niuK8QHAgEdb5Y93Al
	H088mJ9/hRgEK54RBvIRTJRueo8iEaXNBRgOHNJ4qMRmW+0OwcXziCbEMnPWukVHRZz7sMwp5VBz9
	4qrLcxOLez0W7ecAswew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jToU1-0008Vp-Og; Wed, 29 Apr 2020 15:18:45 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jToTy-0008Ut-EP
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2020 15:18:43 +0000
IronPort-SDR: NcozhrvuxMogLBiBBo6MNAWi7VS05vUrMPiX7lkmUet364Y52ooZe0eV3qWZdICYpSgUzoMbwY
 GGvJXTR4JeFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2020 08:18:38 -0700
IronPort-SDR: L8Im9C8854t13HQozVXYhDTvYu1vq8EQ0is7FixfPmD9cMUV10VOlhf4Iqj0lH7qW6Kra/x3QW
 PYr9HkbTeUug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,332,1583222400"; d="scan'208";a="303019043"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Apr 2020 08:18:38 -0700
Received: from [10.255.166.42] (vramuthx-mobl1.gar.corp.intel.com
 [10.255.166.42])
 by linux.intel.com (Postfix) with ESMTP id 75FBF5802C8;
 Wed, 29 Apr 2020 08:18:33 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>, qi-ming.wu@intel.com
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
Date: Wed, 29 Apr 2020 23:18:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429164832.6800fc70@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_081842_523923_B2761946 
X-CRM114-Status: GOOD (  16.29  )
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
Reply-To: vadivel.muruganx.ramuthevar@linux.intel.com
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 29/4/2020 10:48 pm, Boris Brezillon wrote:
> On Wed, 29 Apr 2020 22:33:37 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>> On 29/4/2020 10:22 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> +
>>>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
>>>> +#define EBU_ADDR_MASK		(5 << 4)
>>>
>>> It's still unclear what ADDR_MASK is for. Can you add a comment
>>> explaining what it does?
>>
>> Thank you Boris, keep review and giving inputs, will update.
> 
> Can you please explain it here before sending a new version?

Memory Region Address Mask:
Specifies the number of right-most bits in the base address that should 
be included in the address comparison. bits positions(7:4).

>>>    
>>>> +#define EBU_ADDR_SEL_REGEN	0x1
>>>
>>>    
>>>> +
>>>> +	writel(lower_32_bits(ebu_host->cs[ebu_host->cs_num].nand_pa) |
>>>> +	       EBU_ADDR_SEL_REGEN | EBU_ADDR_MASK,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
>>>> +
>>>> +	writel(EBU_MEM_BASE_CS_0 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(0));
>>>> +	writel(EBU_MEM_BASE_CS_1 | EBU_ADDR_MASK | EBU_ADDR_SEL_REGEN,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(reg));
>>>
>>> That's super weird. You seem to set EBU_ADDR_SEL(reg) twice. Are you
>>> sure that's needed, and are we setting EBU_ADDR_SEL(0) here?
>>
>> You are right, its weird only, but we need it, since different chip
>> select has different memory region access address.
> 
> Well, that doesn't make any sense, the second write to
> EBU_ADDR_SEL(reg) overrides the first one, meaning that nand_pa is
> actually never written to ADDR_SEL(reg).

it will not overwrite the first one, since two different registers
EBU_ADDR_SEL_0 EBU_ADDR_SEL  20H
EBU_ADDR_SEL_1 EBU_ADDR_SEL  24H

it is an internal address selection w.r.t chip select for nand physical 
address update.


> 
>>
>> Yes , we are setting both CS0 and CS1 memory access region, if you have
>> any concern to optimize, please suggest me, Thanks!
> 
> If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
> is really related to the nand_pa address, then retrieve resources for
> all CS ranges. 
If it's not related, please explain what those
> EBU_MEM_BASE_CS_X values encode.

Memory Region Base Address
FPI Bus addresses are compared to this base address in conjunction with 
the mask control(EBU_ADDR_MASK). Driver need to program this field!

Regards
Vadivel

> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
