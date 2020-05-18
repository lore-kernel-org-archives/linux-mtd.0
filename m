Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F1F4C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:39:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32F720709
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 11:39:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qRVbFwmG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32F720709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMdlkp8NzrAxdBf8TidQ4jKvJ1bQiDJBRHOaI4L/pUE=; b=qRVbFwmGSKpuO6
	kz8VJUZtTZFNqT/HOmRGDKx9vxTZO2PABODgfvyn3onED2HDSslr4dYISrECkzX03Rnnw0eNXINkx
	xTBHtQq6ks4c+fJ9WbZbnig6TGRGwmeI3XBl8Zv9iR5Eo5Nru/Qq24WpZnUQho77y0yNSqJiqL71e
	4qyb4HvnSzh8Zd807jXaryAJllhci8H9nIM06TBzY4OBxNGuhsrJrj3PtDPUfVlbK/etVo3BLUMIb
	Mgfje1s8KhJUWvUa0RXEPEP4rVIZ0nGeO/SLNx48lwGHWwO2P0sPF/WTldrgs7p5yBaHzTssX8PfJ
	AbSiklSE131nyHhqq2QQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jae7I-00061i-4E; Mon, 18 May 2020 11:39:32 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jae7F-000617-Bx
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 11:39:30 +0000
IronPort-SDR: 6UOMOEqWQjZHJg7g7JOmNi5X35VMIq5EkBujz1+E5n3fMyG4ttOEQ37txHyXmzaqMKmQRpRUtt
 cZoB36ctUQug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 04:39:28 -0700
IronPort-SDR: okSFRIVMsoSxIzjGKYjphCgKBJy1oF0hu5qOhb55uD5mIA+RvB3XPP/62fIDUA3B65XpK9N/lJ
 d2vC7LVeQQUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,407,1583222400"; d="scan'208";a="253038325"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 18 May 2020 04:39:28 -0700
Received: from [10.214.148.4] (vramuthx-MOBL1.gar.corp.intel.com
 [10.214.148.4])
 by linux.intel.com (Postfix) with ESMTP id 151CE580100;
 Mon, 18 May 2020 04:39:23 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200515105537.4876-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <202005152142.AWvx4xc5%lkp@intel.com>
 <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
 <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
Date: Mon, 18 May 2020 19:39:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_043929_416131_91E73D56 
X-CRM114-Status: GOOD (  14.65  )
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
Cc: devicetree <devicetree@vger.kernel.org>, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 masonccyang@mxic.com.tw, Vignesh R <vigneshr@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Arnd, Andy,

On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>>
>> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:
>>
>>> sparse warnings: (new ones prefixed by >>)
>>>
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expected unsigned int val
>>>>> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got restricted __be32 [assigned] [usertype] reg
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse: incorrect type in argument 1 (different base types) @@    expected unsigned int val @@    got restricted __be32 [assignedunsigned int val @@
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expected unsigned int val
>>>     drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got restricted __be32 [assigned] [usertype] reg
>>>
>>>     440                  reg = cpu_to_be32(*pdata++);
>>>   > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
>>>     442
>>>     443                  reg = cpu_to_be32(*pdata);
>>>     444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
>>
>> On BE:
>> cpu_to_be32 -> no-op
>> writel() -> converts reg to LE
>>
>> On LE:
>> cpu_to_be32 -> converts to BE
>> writel() -> no-op (in terms of conversion)
>>
>> Seems to me that the proper API (if above is intended) should be swab32().
>> But something tells me that above is broken (or my understanding is wrong).
> 
> iowrite_be32() is the correct way to store word into a big-endian mmio register,
> if that is the intention here.
Thank you for suggestions to use iowrite32be(), it suits exactly.

Regards
Vadivel

> 
>        Arnd
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
