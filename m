Return-Path: <SRS0=Tm4b=6O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527C2C83001
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 08:30:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034BA20838
	for <linux-mtd@archiver.kernel.org>; Thu, 30 Apr 2020 08:30:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UcrTv/XA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 034BA20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GkpTVlhJ+y/uBdJDUWGIcUZqsLDtmY5awVKsk5td2Q=; b=UcrTv/XAdXoyVv
	BnXK+F5hyLd5jQbg7KwgcOjvesuWD23Qu9/U/S1OWrMfuv8RL+9JFXtQa4JgnaFQixcppLztXcjFh
	2pqtR4vLtwYxfGeZFGWJks+gwe7inNBh1g+4Y0J1LZvm+j+i1UFg2ruhdKu5opThC0QRqzt5s5u06
	gRfoWs7tX/f1mzqUHKNMln7OTxxyHOzYb4s7sePzKTfrfQTDqZZJCzOcKHPdstgVA0Z4dVMVPa+K3
	JyjgarIB8FYTKvisXZ+0/V8ln/Hs4xOYR0x5ZpO5MpzzhZiKrOZ/OULLHKLneCibhQhqkCjHFUD2M
	mlw+t/qVE03dP3otn2Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU4aV-0002Nq-7d; Thu, 30 Apr 2020 08:30:31 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU4aM-0002El-Ec
 for linux-mtd@lists.infradead.org; Thu, 30 Apr 2020 08:30:24 +0000
IronPort-SDR: idFnlGJHTK4zw5JRh0UJxdu08ZtTcIi/WVNNIaV4GhH/n0Q59wUKLIoxNcKbOTLtRJfybfPwmD
 A8waHUdotmHw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2020 01:30:21 -0700
IronPort-SDR: aSClzRUyQ6VZ04777ze9vUtggfxRFFi19ImTIhkFOA+juZG9kfSlG8+WFiRp9GwkZlSn0SNT47
 nTYUg1doFG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,334,1583222400"; d="scan'208";a="261701929"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga006.jf.intel.com with ESMTP; 30 Apr 2020 01:30:21 -0700
Received: from [10.215.169.74] (vramuthx-MOBL1.gar.corp.intel.com
 [10.215.169.74])
 by linux.intel.com (Postfix) with ESMTP id 0CD3C5805EB;
 Thu, 30 Apr 2020 01:30:16 -0700 (PDT)
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
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <1df71cf7-4cae-4cd0-864c-0812bb2cc123@linux.intel.com>
Date: Thu, 30 Apr 2020 16:30:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430102114.29b6552f@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_013022_558333_54D3F255 
X-CRM114-Status: GOOD (  20.35  )
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

H Boris,

On 30/4/2020 4:21 pm, Boris Brezillon wrote:
> On Thu, 30 Apr 2020 15:50:30 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>>     Thank you very much for keep reviewing the patches and more queries...
>>
>> On 29/4/2020 11:31 pm, Boris Brezillon wrote:
>>> On Wed, 29 Apr 2020 23:18:31 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> Hi Boris,
>>>>
>>>> On 29/4/2020 10:48 pm, Boris Brezillon wrote:
>>>>> On Wed, 29 Apr 2020 22:33:37 +0800
>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>       
>>>>>> Hi Boris,
>>>>>>
>>>>>> On 29/4/2020 10:22 pm, Boris Brezillon wrote:
>>>>>>> On Wed, 29 Apr 2020 18:42:05 +0800
>>>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>>>          
>>>>>>>> +
>>>>>>>> +#define EBU_ADDR_SEL(n)		(0x20 + (n) * 4)
>>>>>>>> +#define EBU_ADDR_MASK		(5 << 4)
>>>>>>>
>>>>>>> It's still unclear what ADDR_MASK is for. Can you add a comment
>>>>>>> explaining what it does?
>>>>>>
>>>>>> Thank you Boris, keep review and giving inputs, will update.
>>>>>
>>>>> Can you please explain it here before sending a new version?
>>>>
>>>> Memory Region Address Mask:
>>>> Specifies the number of right-most bits in the base address that should
>>>> be included in the address comparison. bits positions(7:4).
>>>
>>> Okay, then the macro should be
>>>
>>> #define EBU_ADDR_MASK(x)	((x) << 4)
>>>
>>> And now I'd like you to explain why 5 is the right value for that field
>>> (I guess that has to do with the position of the CS/ALE/CLE pins).
>>
>> 5 : bit 26, 25, 24, 23, 22 to be included for comparison in the
> 
> That's 6 bits to me, not 5.

No , 5 bits only the above case.
> 
>> ADDR_SELx , it compares only 5 bits.
> 
> Definitely not what I would qualify as right-most bits. So, you say the
> comparison always starts at bit 22, and ends at 22+<num-addr-bits>?

Correct

> 
>>>>>> Yes , we are setting both CS0 and CS1 memory access region, if you have
>>>>>> any concern to optimize, please suggest me, Thanks!
>>>>>
>>>>> If you want to setup both CS, and the address written in EBU_ADDR_SEL(x)
>>>>> is really related to the nand_pa address, then retrieve resources for
>>>>> all CS ranges.
>>>> If it's not related, please explain what those
>>>>> EBU_MEM_BASE_CS_X values encode.
>>>>
>>>> Memory Region Base Address
>>>> FPI Bus addresses are compared to this base address in conjunction with
>>>> the mask control(EBU_ADDR_MASK). Driver need to program this field!
>>>
>>> That's not explaining what the base address should be. Is 'nand_pa' the
>>> value we should have there?
>>
>> The one prorgrammed in the addr_sel register is used by the HW
>> controller, it remaps to  0x174XX-> CS0 and 0x17CXX->CS1.
>> The hardware itself, decodes only for 1740xx/17c0xx, other random values
>> cannot be programmed
> 
> The question is, is it the same value we have in nand_pa or it is
> different?
> 
Different address which is 0xE1400000 NAND_BASE_PHY address.

Thanks!

Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
