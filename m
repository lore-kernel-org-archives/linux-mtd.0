Return-Path: <SRS0=bVXU=AR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B39BC433DF
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 06:48:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B512075B
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Jul 2020 06:48:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mvxfLATr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44B512075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iPabrZcTeZfKpJTysJK5pdtbr8lgUo5ymhON69nBntM=; b=mvxfLATrzCuGPBzKYz6bLnT5f
	wH0ZRYH6cCanWGYDYn50Lylg/5TWZsRwXxyQLFDjngJHQWMe25KFTSOg/W92YctVJN/HAQXIu8UL4
	xoMBuflAuI41yq0HyQT9w+KqyG+9rKbotpXvoH1H4EsTD4kf+9Yw1mXrp/2yKTg1YuvvKCiHCZqaE
	pqhwnH20QHr09uu5boAN2sVK0WQFnYXLwYyfsOAfd6lpJBzCNmAdltD2GcDBJ0gedml3mVo/rp6LT
	q1rp8WjP0Q2svH1glBID0H8/DNHvbRWuHAODcnLkKFIcjhDb7mCTOqgeXjd8bq+Sr4cqgqiJLHPSQ
	quZanJbLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsKuo-0003AK-TI; Mon, 06 Jul 2020 06:47:46 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsKuk-00037D-MT
 for linux-mtd@lists.infradead.org; Mon, 06 Jul 2020 06:47:44 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C8494357BE9DA5C148D6;
 Mon,  6 Jul 2020 14:47:25 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 6 Jul 2020 14:47:16 +0800
Subject: Re: [PATCH 2/2] mtd: spi-nor: Disable the flash quad mode in
 spi_nor_restore()
To: <Tudor.Ambarus@microchip.com>, <p.yadav@ti.com>
References: <1592312547-19239-1-git-send-email-yangyicong@hisilicon.com>
 <1592312547-19239-3-git-send-email-yangyicong@hisilicon.com>
 <193b32f7-f56d-4f78-5353-b5d47cbf71d6@microchip.com>
 <20200703111924.tyrvzbbgd7ak53qf@ti.com>
 <157c20a4-2a7e-601a-34ef-66baaa17eb7b@microchip.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <c6ec3c03-1efe-b920-5b08-856c21376bd5@hisilicon.com>
Date: Mon, 6 Jul 2020 14:47:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <157c20a4-2a7e-601a-34ef-66baaa17eb7b@microchip.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_024743_509833_8812C2BC 
X-CRM114-Status: GOOD (  20.47  )
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
Cc: vigneshr@ti.com, sergei.shtylyov@cogentembedded.com, richard@nod.at,
 me@yadavpratyush.com, john.garry@huawei.com, linuxarm@huawei.com,
 alexander.sverdlin@nokia.com, miquel.raynal@bootlin.com,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for reviewing the patch.


On 2020/7/3 19:52, Tudor.Ambarus@microchip.com wrote:
> On 7/3/20 2:19 PM, Pratyush Yadav wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 02/07/20 11:02AM, Tudor.Ambarus@microchip.com wrote:
>>> On 6/16/20 4:02 PM, Yicong Yang wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> If the flash's quad mode is enabled, it'll remain in the quad mode when
>>>> it's removed. If we drive the flash next time in SPI/Dual mode, then
>>>> problem occurs as the flash's quad enable bit is not cleared.
>>> Please describe the problems that occur. When QE bit is one the flash
>>> operates in Standard/Dual/Quad SPI modes. WP# and RESET#/HOLD# are
>>> affected as they change their functionality to IO2 and IO3 when QE
>>> is 1. Is there anything else?
>> IIUC if we do anything that introduces a state on the flash, we want to
>> clear that state up on restore. That's what we (will) do for 8D mode and
> correct
>
>> for 4-byte addressing mode. Does that not apply here?
> yes, it does. I've just asked Yicong to describe in the commit message
> the problems that he encounters, for better understanding. Standard and
> Dual modes should still work with QE = 1. The only problem that I see
> is that WP# and RESET#/HOLD# are changing their functionality to IO2
> and IO3 when QE is 1. Is there anything else that I miss?

I think I have mixup the issues.
The problem I met is when I load the driver in Quad mode first and reload it in
Standard SPI/Dual mode, and tested the flash's read/write but I got mirrored
data which differs from what I wrote.  But seems the QE bit won't cause this,
(thanks for your illustration and it may not be the same issue) so it seems
improper to mention it here and I'll reword the commit.

(PS: the flash I tested is Cypress s25fs128s1 with spi-hisi-sfc-v3xx controller. )

Thanks,
Yicong

>>> While I find the intention good, there might be some problems here:
>>> 1/ w25q jvm variants come with QE "fixed" to 1. This probably means
>>> that QE is not writable, and a writing of QE to zero will be ignored,
>>> but we have to check.
>> In that case they shouldn't have a quad_enable() hook, no?
> Right. Although this scenario should be a false positive, probably the
> write of QE bit is ignored. There is a superfluous write of QE indeed,
> but maybe we can live with it.
>
>>> 2/S25FS128S: CR1NV[1] can set the default power-on state for the
>>> CR1V[1] to 1, i.e. QE to be set to 1 at power-on by default. The
>>> logic here complicates a bit, and maybe we'll have to amend the
>>> patch.
>>>
> We can come with a patch on top of these for 2/. Yicong, please address
> the minor comments and resubmit.
> Cheers.
>
>>>> Disable the quad mode in spi_nor_restore(), the flash will leave
>>>> quad mode when remove. This will make sure the flash always enter the
>>>> correct mode when loaded.
>>> s/correct/ Standard/Dual SPI
>>>
>>> Cheers,
>>> ta
>> --
>> Regards,
>> Pratyush Yadav
>> Texas Instruments India
>>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
