Return-Path: <SRS0=GPAM=77=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAC8C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 15:00:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4987A2073E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jun 2020 15:00:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L8hIJNhj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4987A2073E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u5/gyNxXHvqI/Lj1FwrPUIcH76VWVKn2M18juZfmEo0=; b=L8hIJNhjueiZJx
	f6+mmqGfhtJxTy0X2UruMA37KDMOLR+OGUEl7FqRgs6QAcX2w7bmknhESr6BHtkR0hj0f5TvhwRTi
	7t5ae/I/p8sTaZKezepnlbmflz2cQuVaeoA+n+XyL9LxlYoPAPH4SE5Yl27SjWgsWXjndxCmE8YSj
	64NbBZoKqGMlJOGEKf3IC25EkSwHxri/Mzfo7NC5sdLzbog4CEDgI6/xu5blMGF/SVAoKD9UCrsQq
	Q+UdiqUuUcVF83LiARzOuYVMQOKrK7Cm6S9ZSIPHMZaGJpaW0J+THcxTpQcRuXIacGMVI7tnAH3Oj
	3btOuTz8PLTn41qILcmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlw1a-0002XJ-Q1; Thu, 18 Jun 2020 15:00:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlw1K-000095-Ib
 for linux-mtd@lists.infradead.org; Thu, 18 Jun 2020 15:00:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 75C122A4E5E
Subject: Re: next/master bisection: baseline.login on
 ox820-cloudengines-pogoplug-series-3N
To: kernelci-results@groups.io, miquel.raynal@bootlin.com
References: <5eeb5bf7.1c69fb81.4f6e3.8979@mx.google.com>
 <13497644-ae34-d5e3-e76a-742cddf0f0a9@collabora.com>
 <20200618152324.0b0007a9@xps13> <20200618160925.6f77b1d1@xps13>
 <0c00fe0b-c38b-3d69-8f93-3fe8c3675113@collabora.com>
 <20200618163602.1727fffd@xps13>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <bdc6d561-acfe-311e-2e57-968d15033a15@collabora.com>
Date: Thu, 18 Jun 2020 15:59:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200618163602.1727fffd@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_080002_795663_13AFBDAA 
X-CRM114-Status: GOOD (  18.47  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, kernelci@groups.io,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

+ kernelci@groups.io

On 18/06/2020 15:36, Miquel Raynal wrote:
> Hi Guillaume,
> 
> -reducing the Cc: list
> 
> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
> 2020 15:23:45 +0100:
> 
>> On 18/06/2020 15:09, Miquel Raynal wrote:
>>> Hi Guillaume,
>>>
>>> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Thu, 18 Jun 2020
>>> 15:23:24 +0200:
>>>   
>>>> Hi Guillaume,
>>>>
>>>> Guillaume Tucker <guillaume.tucker@collabora.com> wrote on Thu, 18 Jun
>>>> 2020 13:28:05 +0100:
>>>>  
>>>>> Please see the bisection report below about a kernel panic.
>>>>>
>>>>> Reports aren't automatically sent to the public while we're
>>>>> trialing new bisection features on kernelci.org but this one
>>>>> looks valid.
>>>>>
>>>>> See the kernel Oops due to a NULL pointer followed by a panic:
>>>>>
>>>>>   https://storage.kernelci.org/next/master/next-20200618/arm/oxnas_v6_defconfig/gcc-8/lab-baylibre/baseline-ox820-cloudengines-pogoplug-series-3.html#L504  
>>>>
>>>> Thanks for the report, I will not be able to manage it before Monday,
>>>> but I'll try to take care of it early next week.  
>>>
>>> Actually Boris saw the issue, I just updated nand/next, it should be
>>> part of tomorrow's linux-next. Could you please report if it fixes your
>>> boot?  
>>
>> Sure, will check tomorrow.  Thanks for the update.
>>
>> We may also consider adding the nand/next branch to kernelci.org
>> and catch issues earlier.  We can discuss that separately.
> 
> That would be great! So far, we -MTD- have been lazy and relied on
> linux-next testing only. We do code analysis with Intel's 0-day robots
> but they tend to be very slow when approaching -rc6/-rc7 which is also
> an issue for us because of the wide variety of architectures we still
> support.
> 
> Currently we maintain the following branches, which are all pulled
> in linux-next:
>  * nand/next -> Raw NAND and SPI-NAND stuff
>  * spi-nor/next -> SPI-NOR stuff
>  * cfi/next -> CFI stuff
>  * mtd/next -> everything else
>  * mtd/fixes occasionally for all MTD fixes (no subsystem specific
> branch)
> 
> Are there any kernel-ci prerequisites we should be aware of?

Each branch being added means more kernels to be built and an
increased load in test labs.  But, we can fine-tune the KernelCI
configuration to handle that.

Related to Boris' email, linux-next is built with all possible
combinations of arch/defconfig/compilers, which amounts to about
150 kernels for each revision:

  https://kernelci.org/job/next/branch/master/

For your subsystem branches, we could reduce it to only build the
main defconfigs for each architecture, or maybe even a subset of
them.  Building just the defconfigs for x86, arm and arm64 would
allow to maximise the tests/build ratio.  You would also get
results quicker than the linux-next ones, typically a couple of
hours after pushing each branch.  This is what other subsystems
do, for example GPIO (linusw):

  https://kernelci.org/job/linusw/

Then we can filter which tests to run for your subsystem, at
least the "baseline" one which are very quick checks for boot
failures and other obvious issues.  Some relevant tests could
probably be added to cover flash memory devices, it has been on
the wish list for a while.  Do you have any tests to recommend?

Thanks,
Guillaume

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
