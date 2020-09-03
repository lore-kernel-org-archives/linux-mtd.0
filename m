Return-Path: <SRS0=UES7=CM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7607C433E7
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 06:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A54B82071B
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Sep 2020 06:01:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r6RUSiVE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yUiIUe3B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A54B82071B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qfT7uBvsla5G8/LG23ytA0dKQX0XuLwmymF6/9r8+Nk=; b=r6RUSiVE2m9tldDRcQ5ARe+6P
	yJDylR6+asBobBUwXzVwwLrnAOBo/CIF0xSN3X09yH+cyN9OuL+9tAl4BM7nVtj9qPrK75rrH308u
	6MDzXgrTmSae5208SJjnVBXgdTbsXhXR+wFyyEhn7Ct4WtLaJVhtmvoqHye7pBnFTjHo2OwaHqQZK
	S4GYhPkP7wJoXg9bXrZAwGIPTeXOJEiIoItvUe3N8jeY0sBdkFuUFsZLcVEx9QrcPSw16cNTn464B
	t7xRFi1j9I985057N9qRWdYspINcYCSfI70wb0XE+hiZJJdEC/YwkzGWA3cU3uYPgn7SoLkSA7AAA
	YQEU/B4qQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDiIB-0002vY-5w; Thu, 03 Sep 2020 06:00:15 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDiI9-0002uy-3Y
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2020 06:00:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0835xm4H033569;
 Thu, 3 Sep 2020 00:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1599112788;
 bh=L0FuZBgGNVh+3x995RUuj/atoftxngFtJH5DoX5pnLo=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=yUiIUe3BSfqc3G/3/Mn8QJvwW4QjnBnSwZA0ccogwzhT/qFlfLnpsb1Oa6lQEraL9
 qW8vYfpfqut3rCvDqI15YZDKNTDoLouqJWt+5vuZRs6+TJRRCBx/ZYee7D5bS/0DLX
 WA6XDDTLWnxh3o+NmvQkElXXqYqidwnHF5jmtVVM=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0835xmKN065016
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Sep 2020 00:59:48 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Sep
 2020 00:59:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Sep 2020 00:59:47 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0835xh1X015870;
 Thu, 3 Sep 2020 00:59:44 -0500
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Yicong Yang <yangyicong@hisilicon.com>, =?UTF-8?Q?Matthias_Wei=c3=9fer?=
 <m.weisser.m@gmail.com>, <p.yadav@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <1884fb58-9395-680c-3c10-a17199826026@ti.com>
 <2a1da276-96c6-9b5e-e7f1-563b5d2a1feb@hisilicon.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <10ab34bf-653a-ae72-286e-43b08dc7f909@ti.com>
Date: Thu, 3 Sep 2020 11:29:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2a1da276-96c6-9b5e-e7f1-563b5d2a1feb@hisilicon.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_020013_264330_A666D3C3 
X-CRM114-Status: GOOD (  24.44  )
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
Cc: sergei.shtylyov@cogentembedded.com, tudor.ambarus@microchip.com,
 richard@nod.at, me@yadavpratyush.com, john.garry@huawei.com,
 linuxarm@huawei.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 alexander.sverdlin@nokia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/2/20 3:42 PM, Yicong Yang wrote:
> Hi Vignesh,
> 
> 
> On 2020/9/2 15:50, Vignesh Raghavendra wrote:
>> Hi Yicong,
>>
>> On 9/1/20 7:50 PM, Yicong Yang wrote:
>>> Hi Mathhias and Pratyush,
>>>
[...]
>>>
>> This will break backward compatibility... Imagine a new board being 
>> flashed from Kernel. Before this series, QE bit would be set at the end of flashing
>> and  ROM/bootloader (such as the one reported by Matthias) would work fine. 
>> After this series, QE bit would no longer be set and would most likely
>> break boot..
>>
>> I still am unable to understand what is the underlying problem that is 
>> being addressed here?
>>
>> You mention addressing issue loading the driver in Quad mode first and reload it in
>> Standard SPI/Dual mode. But per s25fs128s data sheet:
>> "
>> Quad Data Width (QUAD) CR1V[1]: When set to 1, this bit switches the data width of the device to 4-bit Quad Mode. That is, WP#
>> becomes IO2 and IO3 / RESET# becomes an active I/O signal when CS# is low or the RESET# input when CS# is high. The WP#
>> input is not monitored for its normal function and is internally set to high (inactive). The commands for Serial, and Dual I/O Read still
>> function normally but, there is no need to drive the WP# input for those commands when switching between commands using
>> different data path widths. Similarly, there is no requirement to drive the IO3 / RESET# during those commands (while CS# is low)."
>>
>> So setting QE bit should have no impact for serial/dual IO modes?
> 
> yes. and I reword the commit like below,  as suggested by Tudor and send a v2 patch. This thread is the v1 one.
> "If the flash's quad mode is enabled, it'll remain in the quad mode when
> it's removed. If we drive the flash next time in Standard/Dual SPI mode,
> the QE bit is not cleared and the function of flash's WP# and RESET#/HOLD#
> have been switched to IO2 and IO3 and are not restored."
> 
> I believe we should restore the state of the flash when it's unloaded from the kernel. In previous code, if we load the flash
> in Quad mode (originally in Standard SPI mode) and shutdown, its WP# and RESET# won't be restored correctly. Seems
> the patch doesn't consider the condition that the flash has already in Quad mode before loaded and restore the flash
> in a wrong state.
> 

How do you load driver in Quad mode first and then reload in Single/Dual  
mode later on? What is the use case?

I don't think relying on WP# and RESET#/HOLD# functionality for a QSPI 
flash is right thing to do as these lines would act as data lines in 
Quad mode and thus WP# wont really protect contents of the flash 
when in Quad mode.

Also, below patch is not fool proof even for hypothetical case that you are
trying to solve: 
Consider a scenario of kernel crash or hard reset, then there will be no 
chance to call spi_nor_restore() and you would end up with QE bit set.. 
Upon reboot, kernel will find that QE bit and will simply restore the same
back on shutdown.

Given the fact that setting and unsetting NV bit causes wearing of this 
rather important bit and also breaks backward compatibility of tools 
that expect Kernel to set QE bit on flashing, I suggest reverting these patches:

cc59e6bb6cd6 mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()
be192209d5a3 mtd: spi-nor: Add capability to disable flash quad mode


Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
