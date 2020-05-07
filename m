Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E5BC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 06:39:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615012078C
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 06:39:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkXsAuoe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615012078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FXTWquWDSYV5pyiY9sfxb8WzbVEK2KFhRhGbdAu+pUs=; b=EkXsAuoeppJyDO
	28Xmly4eArjBCfFq361mm+MGc2U0xal6NimcP1kO2TLIsuBRTLS9/D29RRdiFd3eMYE8USi+iVLl2
	Y4ihQ7N/TiuyJA0kR2xyLnm18nyivsjpC0SPSs1fLnTI1f1QYiDqsHZnDReALpbzhVvO44fmJwbbC
	xqg1R6jMuSDa8fIXPxLFlgTWKQ6m0ew48zFlZr8HTLlM+cH19IgD8abT/mOtcrgZt1HSSi/kZBPgJ
	e0wgGW7S/xCvwN5JHtVlvSN6gW/OrT/H71Q6ZE0muc7TopMDnktJU6m05tydwWo6uDbLf93OpK7Cy
	A4f6JQWgQptB7ERmd2DQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWaBT-00032C-Aq; Thu, 07 May 2020 06:39:03 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWaBP-000316-Li
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 06:39:01 +0000
IronPort-SDR: +MbNHXsAnuONy02kP+qaKRwksoyb9i6YvaD5G7gUtVrYqQZi8e6Zxj2pjo6vkC+jsHzWsbphIx
 CCtHN1KsuAwg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 23:38:58 -0700
IronPort-SDR: tvK4wWX+bS5AcJ9A2a4809Q98KrU/B3Mh/c5yzxVCk6esNSjACXHutlyq3+CiEbNdRy79BWsfV
 3PvhL+rOBXlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; d="scan'208";a="249187511"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga007.jf.intel.com with ESMTP; 06 May 2020 23:38:58 -0700
Received: from [10.213.151.174] (vramuthx-mobl1.gar.corp.intel.com
 [10.213.151.174])
 by linux.intel.com (Postfix) with ESMTP id BC1E0580378;
 Wed,  6 May 2020 23:38:53 -0700 (PDT)
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507072831.1bf7f784@collabora.com>
 <440c0002-e572-7b8b-ba08-773932370eb0@linux.intel.com>
 <20200507082730.6425cd96@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <69a06362-1f9d-bf65-4a9b-98fc6b63a391@linux.intel.com>
Date: Thu, 7 May 2020 14:38:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507082730.6425cd96@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_233900_017584_FD1A6076 
X-CRM114-Status: GOOD (  16.60  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
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

   Thank you very much for the review comments and your time...

On 7/5/2020 2:27 pm, Boris Brezillon wrote:
> On Thu, 7 May 2020 14:13:42 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> 
>> Hi Boris,
>>
>>      Thank you very much for the review comments and your time...
>>
>> On 7/5/2020 1:28 pm, Boris Brezillon wrote:
>>> On Thu,  7 May 2020 08:15:37 +0800
>>> "Ramuthevar,Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>    
>>>> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
>>>> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
>>>> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
>>>
>>> Seriously, did you really think I would not notice what you're doing
>>> here?
>> Yes , I know that you have very good understanding about this.
>>    You're reading the previous value which either contains a default
>>> mapping or has the mapping set by the bootloader, and write it back to
>>> the register along with a new mask and the REGEN bit set (which
>>> BTW is wrong since you don't mask out other fields before updating
>>> them).
>> There is no other field get overwritten
>>    This confirms that this Core -> FPI address translation exists
>>> and has to be set properly, so please stop lying about that.
>>
>> Sorry, there is no SW translation, as I have mentioned that it's
>> optional only, for safer side , reading and writing the default values.
> 
> Then write EBU_ADDR_SEL_REGEN and we'll if see that works. I suspect it
> won't.

You mean, without reading just writing EBU_ADDR_SEL_REGEN bit alone in 
EBU_ADDR_SELx , as you said it won't work because it overwrites 0x174 
with 0x0 values so BASE is lost.
either we can leave it or read & write with ORed | EBU_ADDR_SEL_REGEN

Please correct me if anything is wrong, Thanks!
> 
>> The memory region to enabled that's my concern so written the same
>> register values.
> 
> I don't buy that, sorry.
> 
>>
>> This will not be impact other fields, so please see below for reference
>>
>> The EBU Address Select Registers EBU_ADDR_SEL_0 to EBU_ADDSEL3 establish
>> and control memory regions for external accesses.
>>
>> Reset Value: 17400001H
> 
> See, as suspected the reset value is exactly what you expect.

Yes , that's the reason said being optional.

Regards
Vadivel
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
