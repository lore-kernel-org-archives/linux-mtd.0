Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FE9C8300A
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 09:07:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36B3B20787
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 09:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kCVAWqFQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B3B20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtTG/kyWXE3W4onAs6KH8BFKZ4hamdiu2Ykr53J3qP8=; b=kCVAWqFQgC5Aya
	1iwNonFKtpkhhOrvSolYw99lGjCtXRmK8EmeNhbInto5XkL2vqCVci8ZvYoc0Gaj1ZzGQUy8Y3WdD
	XfVHfuPiLFj+4WsBl7iPCYl6pBwyIpFUok/TgiLj2Z6qVwiqU9iPIXafLDMlbd8EqPDNixNVC63od
	is4+cys7C0tmYEhjvQ1fgp+knTjigDkRDMT2mTj8Rg0i/5uS5MLX+YMfxOsuitChO4AmTY7cn/2iE
	vYzqzUaqtxgnfW3olB45PgGBtZGPIkSxUvwxoWercdvA7SmZL5qMI3TIksQ2IHEanu83nPBCtLHbK
	6hzE3XSmHmLBo1WybFXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU5A2-0005kv-MJ; Thu, 30 Apr 2020 09:07:14 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU59z-0005jT-BD
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 09:07:12 +0000
IronPort-SDR: jbjn8Rz4TrrWa4n4GCPT99DXzX/1XOvlYClnWlgZUBlX6QpF7/wQoyFi1E3ZwGUnGhzLnD+lL5
 GgmTPiNL6kBQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 02:07:10 -0700
IronPort-SDR: sbpOouhGDHR+YMNe2Z9b1DhyJjDbwCgL2R37kKPafy2HpM2FaMg02FkpDjtspk0u1CVIcdPNTO
 FiAGmXZuWgrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="248224274"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2020 02:07:09 -0700
Received: from [10.215.169.74] (vramuthx-MOBL1.gar.corp.intel.com
 [10.215.169.74])
 by linux.intel.com (Postfix) with ESMTP id 103315805EB;
 Thu, 30 Apr 2020 02:07:04 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200429104205.18780-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429104205.18780-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200429162249.55d38ee8@collabora.com>
 <9d77c64c-d0f9-7a13-3391-d05bf458bdb1@linux.intel.com>
 <20200429164832.6800fc70@collabora.com>
 <2e83a2f7-853c-f0e2-f686-daf1e0649eae@linux.intel.com>
 <20200429173107.5c6d2f55@collabora.com>
 <1de9ba29-30f1-6829-27e0-6f141e9bb1e6@linux.intel.com>
 <20200430102114.29b6552f@collabora.com>
 <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
 <20200430103658.4b0b979e@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <1d5aec11-a7b5-01c2-6614-16e57c64511b@linux.intel.com>
Date: Thu, 30 Apr 2020 17:07:03 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430103658.4b0b979e@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_020711_434850_06DBB9DE 
X-CRM114-Status: GOOD (  13.62  )
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
 masonccyang@mxic.com.tw, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, tglx@linutronix.de, qi-ming.wu@intel.com,
 andriy.shevchenko@intel.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 30/4/2020 4:36 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 16:30:15 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>>>>>
>>>>> And now I'd like you to explain why 5 is the right value for that field
>>>>> (I guess that has to do with the position of the CS/ALE/CLE pins).
>>>>
>>>> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the
>>>
>>> That's 6 bits to me, not 5.
>>
>> No , 5 bits only the above case.
> 
> Oops, right, sorry for the brain fart.
> 
>>>
>>> The question is, is it the same value we have in nand_pa or it is
>>> different?
>>>    
>> Different address which is 0xE1400000 NAND_BASE_PHY address.
> 
> Then why didn't you tell me they didn't match when I suggested to pass

sorry, because you keep asking nand_pa after that only I realized that.

> nand_pa? So now the question is, what does this address represent?

                EBU-MODULE
  _________     _______________________
|         |   |            |NAND CTRL  |
| FPI BUS |==>| CS0(0x174) | 0xE100    ( 0xE14/0xE1C) NAND_PHY_BASE
|_________|   |_CS1(0x17C)_|__________ |

EBU_CONRTROLLER_BASE : 0xE0F0_0000
HSNAND_BASE: 0xE100_0000
NAND_CS0: 0xE140_0000
NAND_CS1: 0xE1C0_0000

MEM_REGION_BASE_CS0: 0x17400 (internal to ebu controller )
MEM_REGION_BASE_CS1: 0x17C00

>Do you have a reference manual I can look at to understand what this is?

We dont have reference manual since it is new SoC, we keep get 
information from HW team and we have only register map

Thanks a lot !!!

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
