Return-Path: <SRS0=W1Lg=CN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E00D1C433E2
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:55:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 929BF206A5
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2020 07:55:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bwAxYsid"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 929BF206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BJ0G58v7HPvCydenkgYinrMf+ey979Sp0PBH5bCinlU=; b=bwAxYsidJzyBozUFPokjUrgBt
	H2uE2wWQBtJdeTUFYTKfaAKr16fpzesAb+OukTs/vp59otzQJrf4KULCf/IzDT910HpybhGhDAPbS
	8gdPYwRXUYeTGotuzBrFJ+/7hLFEubaS9qLv8RoQCGcVFFMvtL5c2brw5+gZkdfMsQ3wGWpk/AqTY
	qMsf8KGyfkRC7tDls3KokIv+Q2T41kBdMXuF2FNvcDRt4q41Ss7B8Ogfnyxr/pDHqKHAvGVHHLzgq
	DpLwTSksvq69ckDBNdsQBMp6N3IaDTFpXdpqfnosKQYO3KBZHE/8FaN7tIk9khA13UmEQNzWWlhma
	I6OyxmJqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6Yt-00040c-3c; Fri, 04 Sep 2020 07:55:07 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6Yo-0003z5-FI
 for linux-mtd@lists.infradead.org; Fri, 04 Sep 2020 07:55:04 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 2CEFFDC9250886B8005A;
 Fri,  4 Sep 2020 15:54:56 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0;
 Fri, 4 Sep 2020 15:54:48 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: Vignesh Raghavendra <vigneshr@ti.com>, =?UTF-8?Q?Matthias_Wei=c3=9fer?=
 <m.weisser.m@gmail.com>, <p.yadav@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <CAO8h3eFLVLRmw7u+rurKsg7=Nh2q-HVq-HgVXig8gf5Dffk8MA@mail.gmail.com>
 <30ca8ffc-74a7-92b0-5563-286967d23dc9@hisilicon.com>
 <1884fb58-9395-680c-3c10-a17199826026@ti.com>
 <2a1da276-96c6-9b5e-e7f1-563b5d2a1feb@hisilicon.com>
 <10ab34bf-653a-ae72-286e-43b08dc7f909@ti.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <0c3dcb65-3a6d-d742-da83-3b71f5417115@hisilicon.com>
Date: Fri, 4 Sep 2020 15:54:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <10ab34bf-653a-ae72-286e-43b08dc7f909@ti.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_035503_864492_EA8C796D 
X-CRM114-Status: GOOD (  23.17  )
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


On 2020/9/3 13:59, Vignesh Raghavendra wrote:
>
> On 9/2/20 3:42 PM, Yicong Yang wrote:
>> Hi Vignesh,
>>
>>
>> On 2020/9/2 15:50, Vignesh Raghavendra wrote:
>>> Hi Yicong,
>>>
>>> On 9/1/20 7:50 PM, Yicong Yang wrote:
>>>> Hi Mathhias and Pratyush,
>>>>
> [...]
>>> This will break backward compatibility... Imagine a new board being 
>>> flashed from Kernel. Before this series, QE bit would be set at the end of flashing
>>> and  ROM/bootloader (such as the one reported by Matthias) would work fine. 
>>> After this series, QE bit would no longer be set and would most likely
>>> break boot..
>>>
>>> I still am unable to understand what is the underlying problem that is 
>>> being addressed here?
>>>
>>> You mention addressing issue loading the driver in Quad mode first and reload it in
>>> Standard SPI/Dual mode. But per s25fs128s data sheet:
>>> "
>>> Quad Data Width (QUAD) CR1V[1]: When set to 1, this bit switches the data width of the device to 4-bit Quad Mode. That is, WP#
>>> becomes IO2 and IO3 / RESET# becomes an active I/O signal when CS# is low or the RESET# input when CS# is high. The WP#
>>> input is not monitored for its normal function and is internally set to high (inactive). The commands for Serial, and Dual I/O Read still
>>> function normally but, there is no need to drive the WP# input for those commands when switching between commands using
>>> different data path widths. Similarly, there is no requirement to drive the IO3 / RESET# during those commands (while CS# is low)."
>>>
>>> So setting QE bit should have no impact for serial/dual IO modes?
>> yes. and I reword the commit like below,  as suggested by Tudor and send a v2 patch. This thread is the v1 one.
>> "If the flash's quad mode is enabled, it'll remain in the quad mode when
>> it's removed. If we drive the flash next time in Standard/Dual SPI mode,
>> the QE bit is not cleared and the function of flash's WP# and RESET#/HOLD#
>> have been switched to IO2 and IO3 and are not restored."
>>
>> I believe we should restore the state of the flash when it's unloaded from the kernel. In previous code, if we load the flash
>> in Quad mode (originally in Standard SPI mode) and shutdown, its WP# and RESET# won't be restored correctly. Seems
>> the patch doesn't consider the condition that the flash has already in Quad mode before loaded and restore the flash
>> in a wrong state.
>>
> How do you load driver in Quad mode first and then reload in Single/Dual  
> mode later on? What is the use case?

we use module paramters to indicate the bus width in a private version of our driver,
yet this hasn't been upstreamed.

>
> I don't think relying on WP# and RESET#/HOLD# functionality for a QSPI 
> flash is right thing to do as these lines would act as data lines in 
> Quad mode and thus WP# wont really protect contents of the flash 
> when in Quad mode.
>
> Also, below patch is not fool proof even for hypothetical case that you are
> trying to solve: 
> Consider a scenario of kernel crash or hard reset, then there will be no 
> chance to call spi_nor_restore() and you would end up with QE bit set.. 
> Upon reboot, kernel will find that QE bit and will simply restore the same
> back on shutdown.

well this make sense to me.

>
> Given the fact that setting and unsetting NV bit causes wearing of this 
> rather important bit and also breaks backward compatibility of tools 
> that expect Kernel to set QE bit on flashing, I suggest reverting these patches:
>
> cc59e6bb6cd6 mtd: spi-nor: Disable the flash quad mode in spi_nor_restore()
> be192209d5a3 mtd: spi-nor: Add capability to disable flash quad mode

I've send the revert patches. You may found at :
https://lore.kernel.org/linux-mtd/1599205640-26690-1-git-send-email-yangyicong@hisilicon.com/

but I still have something uncertain, I think we should avoid setting the non-volatile bits
in spi-nor driver, should we?

Regards
Yicong

>
>
> Regards
> Vignesh
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
