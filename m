Return-Path: <SRS0=nuHD=DC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404E3C4363D
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:40:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8058206DB
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2020 11:40:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mEjD2nHP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux-ipv6.be header.i=@linux-ipv6.be header.b="WtsC0Wwz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8058206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-ipv6.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3oIVw4ZZjdDJGllUDrfiozaGfgPlISe+bECRi3ws5EA=; b=mEjD2nHPekqdvDDQ9ClTBKbv12
	SDfji/TTN3GjPXzRPZ1McWGg4O8Bx2A72LwMo0w5ngJIdLahwWNyUk24Yo3r9uwsvDEAmFhfl4zAh
	VzwhIFeUaynr7sn72MNELw3CL3CG+qJWBujXMqq+UP0NCS2vGffWclLkTUB5W0Uzh7GpNov7p3nMk
	JzuxQwMMmTQ/cZzS+GC58rQuOZznDZ8glHyziO34FEsdpKmYRomQxAofeeGHnzxb65jgLRxPJhZVl
	WUshXyGhUs14h0F5cJCf84ta9oVSkrnsn4hNeFPD5YpesmKKvQlqFfmF3ktPfOiBh0lXqf3nNPrUk
	DItlG6gg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLm58-0007D6-PV; Fri, 25 Sep 2020 11:40:06 +0000
Received: from mail.tintel.eu ([2001:41d0:a:6e77:0:ff:fe5c:6a54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLm54-00078b-6K
 for linux-mtd@lists.infradead.org; Fri, 25 Sep 2020 11:40:03 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id D023041F4351;
 Fri, 25 Sep 2020 13:39:56 +0200 (CEST)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id z6rnvaoX7mW4; Fri, 25 Sep 2020 13:39:56 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 4E9D74234174;
 Fri, 25 Sep 2020 13:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu 4E9D74234174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
 s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1601033996;
 bh=lzGuoJir954nb6K1lm1ntTR16pujCrZ9SJCipE7NXdc=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=WtsC0Wwzz7zRj+zzg1xZ5yty5ewauEPspi7aK9lalxr6WqOM5ctVN0wUzJRH5BDNd
 1BuQJTYGuryX7eGfrMJarygM6wIIXbAkmLHpkkQzxzcfwMskONiFIN7YsA2QQVofyT
 M3yCTu8oOxDDzZC4A9hHzCza3vqkQAirbchtOY/I=
X-Virus-Scanned: amavisd-new at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id BYJiisoA70GF; Fri, 25 Sep 2020 13:39:56 +0200 (CEST)
Received: from [IPv6:2001:67c:21bc:20:52bf:b29c:6e1e:7c70]
 (taz.sof.bg.adlevio.net [IPv6:2001:67c:21bc:20:52bf:b29c:6e1e:7c70])
 (Authenticated sender: stijn@tintel.eu)
 by mail.tintel.eu (Postfix) with ESMTPSA id CC1A641F4351;
 Fri, 25 Sep 2020 13:39:55 +0200 (CEST)
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: add GD25LQ80C
To: Vignesh Raghavendra <vigneshr@ti.com>, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, linux-mtd@lists.infradead.org
References: <20200921184754.4010068-1-stijn@linux-ipv6.be>
 <49548dc7-aff5-a6de-de54-41c446620551@ti.com>
From: Stijn Tintel <stijn@linux-ipv6.be>
Autocrypt: addr=stijn@linux-ipv6.be; prefer-encrypt=mutual; keydata=
 mDMEVyfUoxYJKwYBBAHaRw8BAQdA1MKcEMI6ANXBDXjeis4mlJphy7eekzbYlJzNMhhKHwW0
 IlN0aWpuIFRpbnRlbCA8c3Rpam5AbGludXgtaXB2Ni5iZT6IlgQTFggAPgIbAwULCQgHAgYV
 CAkKCwIEFgIDAQIeAQIXgBYhBK6W52QQgFtXg7ctk2n805bY6TBsBQJcaYC5BQkK5UaWAAoJ
 EGn805bY6TBsJNQA/3sk0zwVxw69eBzVxLSoViuA4y8FcNvrdPcYsESH/YgUAQD7sgplnyB8
 zyM31C9xzEPXaUeNRoXpzhB2yrOmDQ7tBrg4BF9HtU8SCisGAQQBl1UBBQEBB0D0YkNrxaiS
 G7F1twBmb0nrzUZm7eMhOAIZiBVGG0DZVAMBCAeIfgQYFggAJhYhBK6W52QQgFtXg7ctk2n8
 05bY6TBsBQJfR7VPAhsMBQkJZgGAAAoJEGn805bY6TBsFq8BANEHr6s0Ft+pRtxF/PgavZ/J
 W34MSez4a1ml75ybECd2AP45gIAFqrDFqwTrM/P10eaxG7KBi/tr4Db4H+2VIZM1Ag==
Message-ID: <4e7c1e35-1d2a-2621-3f0a-2eeea0df2b56@linux-ipv6.be>
Date: Fri, 25 Sep 2020 14:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <49548dc7-aff5-a6de-de54-41c446620551@ti.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_074002_523498_27FE4EAC 
X-CRM114-Status: GOOD (  15.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 25/09/2020 14:36, Vignesh Raghavendra wrote:
> Hi,
>
> On 9/22/20 12:17 AM, Stijn Tintel wrote:
>> Tested on a TP-Link OC200.
>>
> But what was tested? Dual and quad mode tested (as you enable those
> flags)? And lock/unlock as well?
>
> Could you add this info to commit message?
I tested read and write with dd, verified the written image afterwards.
I enabled those flags based on what's in the datasheet. If this is not
enough, please advise an acceptable way to test those flags.
>
>> Datasheet: https://www.gigadevice.com/datasheet/gd25lq80c/
>>
>> Signed-off-by: Stijn Tintel <stijn@linux-ipv6.be>
>> ---
>>  drivers/mtd/spi-nor/gigadevice.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
>> index 447d84bb2128..840fa9f90a67 100644
>> --- a/drivers/mtd/spi-nor/gigadevice.c
>> +++ b/drivers/mtd/spi-nor/gigadevice.c
>> @@ -24,6 +24,9 @@ static struct spi_nor_fixups gd25q256_fixups = {
>>  };
>>  
>>  static const struct flash_info gigadevice_parts[] = {
>> +	{ "gd25lq80c", INFO(0xc86014, 0, 64 * 1024, 16,
>> +			   SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>> +			   SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>  	{ "gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>>  			  SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
>>  			  SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
>>
> Regards
> Vignesh

Thanks,
Stijn


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
