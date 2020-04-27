Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E83EC54FD0
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:00:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D19E2078E
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 08:00:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S/YShBqn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D19E2078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=hisilicon.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gAg2KQs0wB4sk5ZOu3xG1iiEPHZ4/5GNTUcBYYr0H30=; b=S/YShBqn6SEbuW
	RZoRsxaISmJpp6bu+x582vDROefU+s8Ynz36oLYtUcULb7R9wQcm1vKVw72fXMQiIN25v3P1SWanF
	emaqjzQVUoUV0YuJsgk/avNCJrIgy9BLmgHm2/hveYdsgSCuCoIqpjbmB8oNQOh83I1XyU3b4LEgm
	pFwqumZ8jQrDfelfYj8K5ylvJIgunal5Qg0CsfXaCRrl1kryAb4HErDDmzCwAijHCPiBMUlPr1hFq
	vT+vhO2XNZlSn8ADeJ852FgFJ+CUs/NOxWiSFypdBns2XVm8UopR+uGMMujTdssKxXGZcn8YtLCkU
	NCwUmrROiJycfWwoPcug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSygj-0006U7-Ce; Mon, 27 Apr 2020 08:00:25 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSygf-0006Rz-Ry
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 08:00:23 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 70D572938F279006524B;
 Mon, 27 Apr 2020 16:00:09 +0800 (CST)
Received: from [10.65.58.147] (10.65.58.147) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0;
 Mon, 27 Apr 2020 15:59:59 +0800
Subject: Re: [PATCH] mtd: spi-nor: Fixup page size and map selection for
 S25FS-S
To: John Garry <john.garry@huawei.com>, <Tudor.Ambarus@microchip.com>
References: <20200227123657.26030-1-alexander.sverdlin@nokia.com>
 <60b272c1-ab6a-7a7a-6f56-03d7c7daf8bc@nokia.com>
 <43ae2554-06c8-59f9-153e-094a326166c2@huawei.com>
 <2955278.kW1ZWP0GTs@192.168.0.120>
 <d42386c8-9c31-ed9c-d8e7-8d09e43b46fb@huawei.com>
From: Yicong Yang <yangyicong@hisilicon.com>
Message-ID: <0f4a949e-ff1f-f8c6-bdd0-7ebd5f1118b1@hisilicon.com>
Date: Mon, 27 Apr 2020 16:03:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <d42386c8-9c31-ed9c-d8e7-8d09e43b46fb@huawei.com>
X-Originating-IP: [10.65.58.147]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_010022_073989_DED82A74 
X-CRM114-Status: GOOD (  17.25  )
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
Cc: chenxiang66@hisilicon.com, richard@nod.at, bbrezillon@kernel.org,
 stable@vger.kernel.org, marek.vasut@gmail.com, linux-mtd@lists.infradead.org,
 alexander.sverdlin@nokia.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi John and Tudor,


On 2020/4/27 15:27, John Garry wrote:
> + Yicong Yang
>
> Hi Tudor,
>
>>
>> On Monday, March 2, 2020 8:25:48 PM EEST John Garry wrote:
>>> So do you know how we can tell if the part is s25fl129p1 or S25FS128S?
>>> Is it based on family id? For the part of my board, it has the same id
>>> according to "s25fl129p1" entry in the spi-nor driver, yet the SFDP
>>> signature is not present (signature reads as 0x4d182001 vs expected
>>
>>   0x4d182001 looks like the flash id, but in reversed order.
>>
>>> 0x50444653). I printed the family id, and it is 81h, which seems to
>>> align with S25FS (which should support SFDP). Confused.
>>>
>>
>> We can differentiate between flashes by the family id:  80h for FL-S and 81h
>> for FS-S. If I understood correctly your flash id is 0x01, 0x20, 0x18, 0x4d,
>> 0x01, 0x81. According to the spansion datasheets, this should identify with a
>> s25fs128s1 entry. Please check the patch from below, let me know if it's ok.
>>
>>> What's more, the spi-nor probe is failing for this part since I enabled
>>> quad spi. So I am interested to know if there is some differences
>>> between these part families for that.
>>
>> In which conditions is it failing? Please open a separate thread.
>
> So my colleague Yicon debugged this, and it seems to be an issue with our controller. The background is that we can blacklist certain commands in firmware, and some relevant commands were blacklisted such that quad enable failed.
>
> But we have it working now, I think. Yicon can confirm (or start a thread please for outstanding issues).

Yes, now the flash is fully enabled. It's the firmware matters, not about the kernel drivers nor the flash.

>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 88183eba8ac1..ea72f0e5be73 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -22,6 +22,9 @@ static const struct flash_info spansion_parts[] = {
>>          { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
>>                                SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                                USE_CLSR) },
>> +       { "s25fs128s1", INFO6(0x012018, 0x4d0181,  64 * 1024, 256,
>> +                             SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> +                             USE_CLSR) },
>
> I wasn't sure if you wanted to add a separate entry if it has same properties as other part, due to extra maintenance. It is nice to know the exact part, though.

The flash need some post bfpt fixup. As the page size may configured as 512byte, not the 256byte
parsed from bfpt. So a separate entry is needed. Both Alexander and Sergei provide the solution,
and I add it in my patch.

Regards,
Yicong

>
>>          { "s25fl256s0", INFO(0x010219, 0x4d00, 256 * 1024, 128,
>>                               SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>                               USE_CLSR) },
>>
>>
>> .
>>
>
> .
>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
