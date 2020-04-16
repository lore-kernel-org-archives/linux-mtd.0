Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6992EC2BB55
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:52:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5982078B
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 13:52:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CKdhEdfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5982078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WXR9oYFOIhubch14LuOJjsQ1YoGJ0fzzGyEyHRYw/PQ=; b=CKdhEdfuuKi96fPFY+NQQGlK7
	LBngyJFtvBsgkr9G9Bmcsj8QojW5OwO+4UbhMHNzMzQAoZrkvQd9mfLgV1mh0tAlmG+l8mQ/8N4Je
	FPiHAs6SsuQriTGw2FSeO4JDcuMO9Qbgj6PDrJ38oSV3qkHe787fBUofhPns5DHdRplXozrF+Y5f3
	7k9I7uOndB6jec/850/pFwddRU0XiDAYJLcwAGvSzZJpkBoYatChgmiVmgNJlIEGxKMcAEIeJkWld
	u1e50uKitXRAGUgBC/kIu5q41CYQdhE5JjUQmks+owDZwPZgXFDme6sFYnizzmf5DbbpvjtkC4uCj
	OlIw/jKdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP4vt-0000h6-So; Thu, 16 Apr 2020 13:51:57 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP4vo-0000gi-HK
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 13:51:54 +0000
Received: from [2a04:4540:1400:7b00:2d8:61ff:feed:60f5]
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <john@phrozen.org>)
 id 1jP4vV-0004e0-L6; Thu, 16 Apr 2020 15:51:33 +0200
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Arnd Bergmann <arnd@arndb.de>,
 Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
 <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
 <20200416131725.51259573@collabora.com>
 <de9f50b8-9215-d294-9914-e49701552185@linux.intel.com>
 <20200416135711.039ba85c@collabora.com>
 <CAHp75Vcpb-556imBuhsY-asrKqx7LjvQbq+P-ysK-+ii91YpWQ@mail.gmail.com>
 <20200416144036.3ce8432f@collabora.com>
 <CAK8P3a1rYDfTW60eY3RiiSOeT9EsNxw2rxMuQ9UjaS+JDiHy3Q@mail.gmail.com>
From: John Crispin <john@phrozen.org>
Message-ID: <5cb0fe27-8b65-d777-b1c5-8dc47bda2d54@phrozen.org>
Date: Thu, 16 Apr 2020 15:51:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1rYDfTW60eY3RiiSOeT9EsNxw2rxMuQ9UjaS+JDiHy3Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_065152_726853_E42DBF12 
X-CRM114-Status: GOOD (  17.71  )
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
Cc: Vignesh R <vigneshr@ti.com>, Brendan Higgins <brendanhiggins@google.com>,
 yixin.zhu@linux.intel.com,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, cheol.yong.kim@intel.com,
 Anders Roxell <anders.roxell@linaro.org>,
 Andriy Shevchenko <andriy.shevchenko@intel.com>,
 Richard Weinberger <richard@nod.at>, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, masonccyang@mxic.com.tw,
 hua.ma@linux.intel.com, Piotr Sroka <piotrs@cadence.com>,
 devicetree <devicetree@vger.kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, chuanhua.lei@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, qi-ming.wu@intel.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Songjun Wu <songjun.wu@linux.intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16.04.20 15:20, Arnd Bergmann wrote:
> On Thu, Apr 16, 2020 at 2:40 PM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
>> On Thu, 16 Apr 2020 15:26:51 +0300
>> Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>>> On Thu, Apr 16, 2020 at 3:03 PM Boris Brezillon
>>> <boris.brezillon@collabora.com> wrote:
>>>> On Thu, 16 Apr 2020 19:38:03 +0800
>>>> Note that the NAND subsystem is full of unmaintained legacy drivers, so
>>>> every time we see someone who could help us get rid or update one of
>>>> them we have to take this opportunity.
>>>
>>> Don't we rather insist to have a MAINTAINERS record for new code to
>>> avoid (or delay at least) the fate of the legacy drivers?
>>>
>>
>> Well, that's what we do for new drivers, but the xway driver has been
>> added in 2012 and the policy was not enforced at that time. BTW, that
>> goes for most of the legacy drivers in have in the NAND subsystems
>> (some of them even predate the git era).
>>
>> To be clear, I just checked and there's no official maintainer for this
>> driver. Best option would be to Cc the original author and contributors
>> who proposed functional changes to the code, as well as the MIPS
>> maintainers (Xway is a MIPS platform).
> 
> A lot of the pre-acquisition code for lantiq was contributed by Hauke
> Mehrtens and John Crispin. There was an intermediate generation of
> MIPS SoCs with patches posted for review  by Intel in 2018 (presumably
> by the same organizatiob), but those were never resubmitted after v2
> and never merged:
> 
> https://lore.kernel.org/linux-mips/20180803030237.3366-1-songjun.wu@linux.intel.com/
> 
>          Arnd
> 

Hi,

the legacy Mips SoC had a External Bus Unit (EBU), similar to an 
Intel/Hitachi style bus. It was used back then for lots of things, 
sometimes driving Leds via 74* latches, Arcadyan used it for external 
reset lines and very rarely was it used for nand.

Looking at this series and comparing it with xway_nand.c we see that the 
init sequence is near identical. Best guess is that the mountain lion 
uses an internal block very similar to what the legacy mips silicon used 
just in a newer generation and the new proposed driver is more feature 
complete.

If this is the case ideally the xway_nand.c is dropped and that silicon 
is made working with the newer driver. Chances are that we just need to 
add a "support less features" style flag.

Unfortunately i no longer have the evalkit for the Mips SoCs.

    John

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
