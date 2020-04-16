Return-Path: <SRS0=O+nk=6A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6CBC352BE
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:41:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33D121D95
	for <linux-mtd@archiver.kernel.org>; Thu, 16 Apr 2020 10:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BgTr5e2b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33D121D95
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WvY2mMEFLK4h1eBu/Vh2jycGGlTd6QjRcc0IlnVmBjk=; b=BgTr5e2bUO7LHX05Bi2jSoWug
	IrNAKLzLHxsU35QWes5vrvEMh3X2xIqjDSkW2WfpVuTvcwQ1Yq7UdVLGDSDLmGPJSO3VeNG388AWS
	oGMSz7me4Rz9FdzV5/wpBWVK0hvkBIIjZ41ik2BQi6XNpJXj+jKDLFmWm3dse6r8fRayvNPHlDTdj
	6BBQeabI6q/InDrndrav6lt8YQO18HJkEw9jD5aJjqLEvnjppwtLZKnjfQAVA9ebgLqS8KFqEFfip
	v2EnD4ZcDKqUOuvUqWrJmGEihMwPFs+E7RU2jffAIzXUemHjkZtvfh1qbESFBgx1+HB+0l+0BtOnS
	ycQkBYlAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1xA-0003ie-9P; Thu, 16 Apr 2020 10:41:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1x6-0003hY-8g
 for linux-mtd@lists.infradead.org; Thu, 16 Apr 2020 10:41:02 +0000
IronPort-SDR: 7oDt0uYkupCkAq9KVC2RTCSbrHA80zG4vTE3sAIAUGpdknLCXqvGOdqokUI5guS0Ze2Zo/3+Vo
 6ICj9mPrWfLA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 03:40:59 -0700
IronPort-SDR: 1wg/ODuGBi06D2wIst8A75fcWOrchCyh2F+4Utprzj+/NzuIiYQxmuD3T45hQ2lYlnQkbDVcxb
 5dyTobpPsHAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="455224018"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 16 Apr 2020 03:40:59 -0700
Received: from [10.255.154.239] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.154.239])
 by linux.intel.com (Postfix) with ESMTP id 084F558045A;
 Thu, 16 Apr 2020 03:40:54 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200414022433.36622-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200415220533.733834-1-martin.blumenstingl@googlemail.com>
 <c33c8653-16a2-5bcd-97a9-511d958b755a@linux.intel.com>
 <20200416113822.2ef326cb@collabora.com>
 <18568cf6-2955-472e-7b68-eb35e654a906@linux.intel.com>
 <20200416122619.2c481792@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <d3e137fa-54a0-b4ec-eb24-3984eab2a247@linux.intel.com>
Date: Thu, 16 Apr 2020 18:40:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200416122619.2c481792@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_034100_313440_CC0A57FE 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, andriy.shevchenko@intel.com, arnd@arndb.de,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org, vigneshr@ti.com,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 tglx@linutronix.de, masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 16/4/2020 6:26 pm, Boris Brezillon wrote:
> On Thu, 16 Apr 2020 17:45:49 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
>>>>>> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
>>>>>>
>>>>>> This patch adds the new IP of Nand Flash Controller(NFC) support
>>>>>> on Intel's Lightning Mountain(LGM) SoC.
>>>>>>
>>>>>> DMA is used for burst data transfer operation, also DMA HW supports
>>>>>> aligned 32bit memory address and aligned data access by default.
>>>>>> DMA burst of 8 supported. Data register used to support the read/write
>>>>>> operation from/to device.
>>>>> I am wondering how this new hardware is different from the Lantiq NAND
>>>>> controller IP - for which there is already a driver in mainline (it's
>>>>> in drivers/mtd/nand/raw/xway_nand.c).
>>>>> The CON and WAIT registers look suspiciously similar.
>>>>>
>>>>> As far as I understand the "old" SoCs (VRX200 and earlier) don't have
>>>>> a built-in ECC engine. This seems to have changed with ARX300 though
>>>>> (again, AFAIK).
>>>>>
>>>>> A bit of lineage on these SoCs (initially these were developed by
>>>>> Infineon. Lantiq then started as an Infineon spin-off in 2009 and
>>>>> was then acquired by Intel in 2015):
>>>>> - Danube
>>>>> - ARX100 from 2008/2009
>>>>> - VRX200 from 2009/2010
>>>>> - ARX300 from 2014
>>>>> - GRX350 from 2015/2016
>>>>> - GRX550 from 2017
>>>>> - and now finally: LGM from 2020 (est.)
>>>>>
>>>>> The existing xway_nand driver supports the Danube, ARX100 and VRX200
>>>>> SoCs.
>>>> Lantiq upstreamed a driver for an older version of this IP core 8 years
>>>> ago, see here:
>>>> https://elixir.bootlin.com/linux/v5.5.6/source/drivers/mtd/nand/raw/xway_nand.c
>>>> It does not support DMA and ECC.
>>> Then let's just extend this driver to support the new features. Plus,
>> We do not have the platform to test also it's very old legacy driver .
> Well, if it's similar enough, we want to have one driver.

Thank you very much for the time and suggestions...

This in-review driver is written for a new nand flash controller IP 
which is used in LGM.

>>> we'll be happy to have one more of the existing driver converted to
>>> ->exec_op() ;-).
>> I have completely adapted to ->exec_op() hook up to replace the legacy
>> call-back.
> I suspect porting what you've done to the xway driver shouldn't be too
> complicated.
Not ported from xway_nand.c driver , we have developed from the scratch 
to make it work on
Intel LGM SoC , it's new x86 ATOM based SoC, IP itself completely 
different and most of the registers won't match.
if we port then it would be ugly and also what are the problem may occur 
we do not know.

Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
