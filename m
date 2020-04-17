Return-Path: <SRS0=sSnz=6B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C83C2BB1D
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 07:54:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE47214AF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2020 07:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bobvbU/p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE47214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l9qOcfLVJ3YUU9kUJjmCRbWzBHo/JhFJXvWJahzkdX4=; b=bobvbU/paJ3xGdNcVdozAcZyN
	kEvKWPkVU1/kxtSR3b74AFx527MtQf6lA0cTuR61619tvcsAh+zcsvTokyopovuuOR6wzG67GSIIA
	WHV6c9W1n+7V1/TS2rdx7kb8uk/wzkk8IigXIBIfTZyxaZ4JsA+B3g3XL9osy000LMbY6D7ad0rCV
	KHtGxGQuJqMWtt03gZxQFrqG9gQlTHUNKyhUTeXJtSuBRQ/z6TJbLn7QJSS0P7C3ujrBy3cV/cZn5
	Ry+sRKGRVY52mOB+jO2o/G86EYMtd8SXaRRVjzBUGLvrwbKc4fEQMCr+XsA6TU9IIGvP+X1U9yWaj
	YZqpp9h5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPLpC-000091-UT; Fri, 17 Apr 2020 07:54:10 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPLp9-00008T-9p
 for linux-mtd@lists.infradead.org; Fri, 17 Apr 2020 07:54:08 +0000
IronPort-SDR: QfomAaBdTXV4GJx8PaA13cSvaGMeCytnqXuNg4Q3SjPzu78XBYwghOdemwW1aurB70qkLXdBNP
 nuWvxwnumNsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 00:54:06 -0700
IronPort-SDR: Px9yLcqRBmj56jfaP+rRX6jDKBHOo8gm5ANSSCS9GGBKdDOvt1ZF+D+XGMGxZ8l6+ldxjV2EUs
 qv+2ehWgYF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,394,1580803200"; d="scan'208";a="299548159"
Received: from linux.intel.com ([10.54.29.200])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Apr 2020 00:54:05 -0700
Received: from [10.255.156.142] (vramuthx-MOBL1.gar.corp.intel.com
 [10.255.156.142])
 by linux.intel.com (Postfix) with ESMTP id 154325802C9;
 Fri, 17 Apr 2020 00:54:00 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] mtd: rawnand: Add NAND controller support on Intel
 LGM SoC
To: Boris Brezillon <boris.brezillon@collabora.com>
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
 <003fa549-08c5-5867-2b02-54b483c16465@linux.intel.com>
 <20200417090234.059418f6@collabora.com>
From: "Ramuthevar, Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>
Message-ID: <c26d937a-e9f1-f0f0-5b08-f20a0bd380ab@linux.intel.com>
Date: Fri, 17 Apr 2020 15:53:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200417090234.059418f6@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_005407_394482_4F02245D 
X-CRM114-Status: GOOD (  18.30  )
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

Hi Boris,

On 17/4/2020 3:02 pm, Boris Brezillon wrote:
> On Fri, 17 Apr 2020 13:21:39 +0800
> "Ramuthevar, Vadivel MuruganX"
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>
>> Hi Boris,
>>
>> On 16/4/2020 7:57 pm, Boris Brezillon wrote:
>>> On Thu, 16 Apr 2020 19:38:03 +0800
>>> "Ramuthevar, Vadivel MuruganX"
>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>   
>>>> On 16/4/2020 7:17 pm, Boris Brezillon wrote:
>>>>> On Thu, 16 Apr 2020 18:40:53 +0800
>>>>> "Ramuthevar, Vadivel MuruganX"
>>>>> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
>>>>>      
>>>>>>>>> we'll be happy to have one more of the existing driver converted to
>>>>>>>>> ->exec_op() ;-).
>>>>>>>> I have completely adapted to ->exec_op() hook up to replace the legacy
>>>>>>>> call-back.
>>>>>>> I suspect porting what you've done to the xway driver shouldn't be too
>>>>>>> complicated.
>>>>>> Not ported from xway_nand.c driver , we have developed from the scratch
>>>>>> to make it work on
>>>>>> Intel LGM SoC , it's new x86 ATOM based SoC, IP itself completely
>>>>>> different and most of the registers won't match.
>>>>>> if we port then it would be ugly and also what are the problem may occur
>>>>>> we do not know.
>>>>> Sorry but IMO they look similar enough to try to merge them.
>>>> Thanks! Boris, need suggestion from you since you are maintainer and
>>>> also expertise on mtd-subsystem.
>>> I *was* the maintainer :).
>>>   
>>>> There are different features involved and lines of code is more, if we
>>>> add new driver patches over xway-nand driver
>>> How about retro-fitting the xway logic into your driver then? I mean,
>>> adding a 100 lines of code to your driver to get rid of the 500+ lines
>>> we have in xway_nand.c is still a win.
>>>   
>>>> is completely looks ugly and it may disturb the existing functionality
>>>> as well since we don't have platform to validate:'(.
>>> How ugly? Can you show us? Maybe we can come with a solution to make it
>>> less ugly.
>>>
>>> As for the testing part, there are 4 scenarios:
>>>
>>> 1/ Your changes work perfectly fine on older platforms. Yay \o/!
>>> 2/ You break the xway driver and existing users notice it before this
>>>      series gets merged. Now you found someone to validate your changes.
>>> 3/ You break the xway driver and none of the existing users notice it
>>>      before the driver is merged, but they notice it afterwards. Too bad
>>>      this happened after we've merged the driver, but now you've found
>>>      someone to help you fix the problem :P.
>>> 4/ You break things for old platforms but no one ever complains about
>>>      it, either because there's no users left or because they never
>>>      update their kernels. In any case, that's no longer your problem.
>>>      Someone will remove those old platforms one day and get rid of the
>>>      unneeded code in the NAND driver.
>>>
>>> What's more likely to happen is #3 or #4, and I think the NAND
>>> maintainer would be fine with both.
>>>
>>> Note that the NAND subsystem is full of unmaintained legacy drivers, so
>>> every time we see someone who could help us get rid or update one of
>>> them we have to take this opportunity.
>> Agreed!, Thank you very much for the suggestions and clear inputs.
>> To proceed further, can you please share your inputs to dividing the tasks
>> and patches to be sent if possible.
> Let's start with the new version you were about to post. We'll see how
> we can merge both drivers based on that.

Thank you very much for the review comments and inputs , will post the 
patches soon.

Regards
Vadivel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
