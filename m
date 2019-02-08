Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCE46C169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 05:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A72EE20818
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 05:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYneKmnB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=procenne.com header.i=@procenne.com header.b="eGtf2GwG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A72EE20818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=procenne.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uVLyvphSqOwdesGcyQdPdwQ303WDrPdalt2BlnvaVBQ=; b=BYneKmnBP5DJaRCRVHl5rHcs0
	Yj32J5gXff/rlDz3JZRtFtCrwn3rrCPPBMzWV248TcK2k4LzEOJQI9op1jB7URkOrRfaAYhZ3fVB+
	YMArNGQ7RK3bAzK1TkaHw+yENP8XWNAnpepyNYAIi9D+GPN/Ko24Ba27KmkUJRIihHj7D49/31a+e
	K7MUixPRE6OTZ4Q4nFd+tfSCNGNgt44JT3PCyUPa5YE2khiMDH/N51mBaik78ueLw9yBAcyHgRTxN
	Zr9cwOLd5PfWNG3rpbD/ILIATccfQHgO94EjokLE5dWhoQh1i8HgiaNqxCA/hxeE4vadBZRBU7v3y
	ce5DIVbsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gryhg-0005ov-Vj; Fri, 08 Feb 2019 05:27:56 +0000
Received: from forward103p.mail.yandex.net ([77.88.28.106])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gryhc-0005oW-EV
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 05:27:55 +0000
Received: from mxback15g.mail.yandex.net (mxback15g.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:94])
 by forward103p.mail.yandex.net (Yandex) with ESMTP id 579F518C16DB;
 Fri,  8 Feb 2019 08:27:45 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net
 [2a02:6b8:0:1a2d::26])
 by mxback15g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id t259VpGiZz-RiP0w82d;
 Fri, 08 Feb 2019 08:27:45 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=procenne.com; s=mail;
 t=1549603665; bh=zqY4swOfC360p0DpQ3YherxPhuUuqASbGwTLZ9lYRlU=;
 h=Subject:To:Cc:References:From:Message-ID:Date:In-Reply-To;
 b=eGtf2GwGjQWACePTcuAcTec/6zHiOsAe5gRUTYnsTT9JSBToqun8+ffgYIxdb4KRn
 UAIGp/aJYMLb0XEYDScAv0DDwxVdQW6bc36n14XQxiayVPxesUu5t8Db5rNYmJbN5y
 NUIWi3gX2OKWjS0mVmGHsWi+kfc2ghA8tlQNJO3E=
Authentication-Results: mxback15g.mail.yandex.net;
 dkim=pass header.i=@procenne.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
 yROlBTpfNz-RhrCUk6J; Fri, 08 Feb 2019 08:27:43 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Subject: Re: [PATCH V3] mtd: spi-nor: split s25fl128s into s25fl128s0 and
 s25fl128s1
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <1549518234-15211-1-git-send-email-ahmet.celenk@procenne.com>
 <7b33d1ab-835b-781a-b2e9-f271dc493afa@microchip.com>
From: "A. Celenk" <ahmet.celenk@procenne.com>
Message-ID: <e885888a-7883-3600-8f75-6bafe12607ad@procenne.com>
Date: Fri, 8 Feb 2019 08:27:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <7b33d1ab-835b-781a-b2e9-f271dc493afa@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_212752_911827_F97851BD 
X-CRM114-Status: GOOD (  16.61  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, bbrezillon@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 7.02.2019 11:16, Tudor.Ambarus@microchip.com wrote:
> Hi, Ahmet,
>
> On 02/07/2019 07:43 AM, A. Celenk wrote:
>> From: "Ahmet Celenk" <ahmet.celenk@procenne.com>
>>
>> Due to two different versions (S25FL128SAGBHI200 and S25FL128SAGBHI210) of
>> the s25fl128s qspi memory, the single "s25fl128s" device entry must be
>> split into two to match the correct JEDEC ID's for each version. Solves
>> paging related issues of S25FL128SAGBHI210 chips.
>>
>> Signed-off-by: Ahmet Celenk <ahmet.celenk@procenne.com>
>> Cc: Boris Brezillon <boris.brezillon@free-electrons.com>
>> Cc: Marek Vasut <marek.vasut@gmail.com>
>> ---
>> V3: Added missing SPI_NOR_DUAL_READ flags to new entries
>> V2: Removed the old s25fl128s entry
>>
>>   drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index 6e13bbd..3cd9052 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1891,7 +1891,8 @@ static const struct flash_info spi_nor_ids[] = {
>>   	{ "s70fl01gs",  INFO(0x010221, 0x4d00, 256 * 1024, 256, 0) },
>>   	{ "s25sl12800", INFO(0x012018, 0x0300, 256 * 1024,  64, 0) },
>>   	{ "s25sl12801", INFO(0x012018, 0x0301,  64 * 1024, 256, 0) },
>> -	{ "s25fl128s",  INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
> The patch is good, there are few nitpicks however. Would you please fix them?
>
> When running checkpatch I get:
> $ ./scripts/checkpatch.pl --strict
> V3-mtd-spi-nor-split-s25fl128s-into-s25fl128s0-and-s25fl128s1.patch
> WARNING: line over 80 characters
> #43: FILE: drivers/mtd/spi-nor/spi-nor.c:1894:
> +	{ "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64, SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ | USE_CLSR) },
The spi-nor.c file has lots of over-80-characters lines,
> WARNING: line over 80 characters
> #44: FILE: drivers/mtd/spi-nor/spi-nor.c:1895:
> +	{ "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256, SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ | USE_CLSR) },
>
> Please choose the following format, it has fewer lines:
>          { "s25fl128s0", INFO6(0x012018, 0x4d0080, 256 * 1024, 64,
>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>          { "s25fl128s1", INFO6(0x012018, 0x4d0180, 64 * 1024, 256,
>                          SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ | USE_CLSR) },
>
> While here, would you please place these 2 entries in alphabetical order? They
> belong just before "s25fl256s0" entry.
Also the rest of entries seems not to be in alphabetical order.
>
> Thanks!
> ta

I can handle the whole code for 80 column fitting and alphabetical 
ordering later. For now, would you still like me to apply you requests? 
But it may look weird in the rest of the code.

Thanks,

Ahmet


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
