Return-Path: <SRS0=SHbm=6E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7167DC54FCB
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 01:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45EF7214AF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Apr 2020 01:09:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dFLUJDHX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45EF7214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Z343RbeuRyAkjPoeyWar7QUho6KqC8QxJ2C9HiBYcc=; b=dFLUJDHXYZhnvtl24nSPaEC6q
	RZR00JFRm09HLolG7shrkx1d82tZvpTOaVAZalBq/VJQOVcPavsT5iMEBsGYKXoOv7/q8EbQRTQr2
	Z+UIl42zMvZPxFwzEA3eMyhb6hGciM3iCDIPXV6AR/o3z9QPJozH10JCv7r9nrMaBPd01RoIek/C9
	7lr+xXikGBBMufvTkz7bFluvsHHgTO94OK+CF8JaBD4nKaa97Nfcxt48VUq7lseCPc4z/nOCtLYfc
	AQZuTmf+DBfly7UNc2Unp+ein8GltBd7q0e+f3LrVm0XCw2bwL4mJ96Gn7Txs68fekjkfdwpIBEHF
	c0WETSNCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQKvx-00080D-Ua; Mon, 20 Apr 2020 01:09:13 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQKvv-0007zc-45
 for linux-mtd@lists.infradead.org; Mon, 20 Apr 2020 01:09:12 +0000
IronPort-SDR: ko9wQFTzPzwAbwxGH7Cm1sfOGtaW6XJfeAam8Q3N6XTS2UlOdv5i9r/b0oLYr0ABPNZSkzRH3F
 vgtxp3IbLaqg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2020 18:09:10 -0700
IronPort-SDR: X/D7cYW06a74LaCV/tT7wdGmh7ZQaZiVr4CoTiBaLe6FPhwwMJIRiRFxkeKQ/8L4MtZN+VyGiS
 keNyESwRE5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,405,1580803200"; d="scan'208";a="333759978"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP; 19 Apr 2020 18:09:09 -0700
Received: from [10.249.68.96] (unknown [10.249.68.96])
 by linux.intel.com (Postfix) with ESMTP id C7E275802C9;
 Sun, 19 Apr 2020 18:09:02 -0700 (PDT)
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
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <fababbbf-c520-3c03-356a-77846076151f@linux.intel.com>
Date: Mon, 20 Apr 2020 09:09:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1rYDfTW60eY3RiiSOeT9EsNxw2rxMuQ9UjaS+JDiHy3Q@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200419_180911_212478_FF45F341 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: cheol.yong.kim@intel.com, devicetree <devicetree@vger.kernel.org>,
 qi-ming.wu@intel.com, Anders Roxell <anders.roxell@linaro.org>,
 Andriy Shevchenko <andriy.shevchenko@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Richard Weinberger <richard@nod.at>, John Crispin <john@phrozen.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yixin.zhu@linux.intel.com, Vignesh R <vigneshr@ti.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, chuanhua.lei@linux.intel.com,
 masonccyang@mxic.com.tw, Songjun Wu <songjun.wu@linux.intel.com>,
 Piotr Sroka <piotrs@cadence.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Arnd,

On 16/4/2020 9:20 pm, Arnd Bergmann wrote:
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
>>> Don't we rather insist to have a MAINTAINERS record for new code to
>>> avoid (or delay at least) the fate of the legacy drivers?
>>>
>> Well, that's what we do for new drivers, but the xway driver has been
>> added in 2012 and the policy was not enforced at that time. BTW, that
>> goes for most of the legacy drivers in have in the NAND subsystems
>> (some of them even predate the git era).
>>
>> To be clear, I just checked and there's no official maintainer for this
>> driver. Best option would be to Cc the original author and contributors
>> who proposed functional changes to the code, as well as the MIPS
>> maintainers (Xway is a MIPS platform).
> A lot of the pre-acquisition code for lantiq was contributed by Hauke
> Mehrtens and John Crispin. There was an intermediate generation of
> MIPS SoCs with patches posted for review  by Intel in 2018 (presumably
> by the same organizatiob), but those were never resubmitted after v2
> and never merged:
>
> https://lore.kernel.org/linux-mips/20180803030237.3366-1-songjun.wu@linux.intel.com/
Thank you for reviewing our patches and your time...
The above patches for different SoC which is MIPS based, but whatever 
the patch is sent by me is Intel X86 ATOM based LGM SoC.

Regards
Vadivel
>
>          Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
