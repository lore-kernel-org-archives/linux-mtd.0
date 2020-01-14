Return-Path: <SRS0=A3dn=3D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58C5C33CB1
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97A2F2084D
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Jan 2020 09:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tER2h509";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ncentric-com.20150623.gappssmtp.com header.i=@ncentric-com.20150623.gappssmtp.com header.b="JwOss2vb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97A2F2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ncentric.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=be9uihiRUi4tlGJwjTGFq5gDDsm0gF/aP3s7Gh/ic3g=; b=tER2h5098YwDuqLEWjSP0If/P
	PhWDKMVUUuP575QZbtwT3LFGLYFiJI+3xZDYE+u30/ZzZLOA2BSSHCDFt0QBxEBEnOwfNyKRb00qM
	lxcAcEuU4l8b4MT6VlUPG9DHg9mqM2UFUbcTleuWa11f1fGZlGZ6fqxkfPNQWBPxKNgdTtmEh7uGp
	UwUQUvYKB8G/rEA94i0ILoUL388Uk5fRSqZIYGle9aFWX8FPp3857CdIDYcGMslXcC6471n02Bhue
	ccQb8jAAufe++KsxcKVpBPBCh52OB/bS5wQ7LEVKG5HtbZB5FGBe6SGy7LJl7n7b9veH0YR9Iefgv
	8Os979f/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irIGx-00047s-NW; Tue, 14 Jan 2020 09:14:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irIGq-000477-2b
 for linux-mtd@lists.infradead.org; Tue, 14 Jan 2020 09:14:02 +0000
Received: by mail-wr1-x441.google.com with SMTP id z3so11353126wru.3
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2020 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ncentric-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=J8RuIaC9ODNiKiftogw3E5SVeFU/k5CPNBAfp0+d3t4=;
 b=JwOss2vb5LzJRMrlgvwsBPlt+IPCesG4DLO4OWP1B3Jtb22B8FCT8IRwltgt8swaV5
 VAn8PtNkAyW/AKoJWoM0ryViCyZoZPob8CZbYbCi+AI2vKYvBFYR0zMjZWN4KpLvO4c4
 57gQ88X4rFJWjtkhP7GmEV/zaV2q7L9sqejPWaQJ25/JyK+EaKaGvMw/C2cg4mgrOCDA
 T8PQewOaRW7GEBK9qlvEFyvfqOupAGhL8Okdtu8iZsZ+3gq6geEnumq/7BfgHyAJuAOI
 OvOqVAizfAIUzqrPAWp0+JFOhhipcl81xGllvrR3Ol1rtajDoxKHXeAoX1cK4+U2V3a6
 Nz0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=J8RuIaC9ODNiKiftogw3E5SVeFU/k5CPNBAfp0+d3t4=;
 b=JoP3fGzeb3RH5ymhG88XQBO5D92UPP86Cijla64gyv47KU4LDIsX+ZtaKy1IJGM82C
 ZLQlbb5YTu1sTKX1v/5rmYkLdyuyL6IRF/Kh80B+jAF41RtqBZJXUr8EPtFq/PcbW098
 Ojny4x+OD+0pqgjoemtTZgyWMq9bTmbiHWyA8+3E1z880KL4FXN8MtpesVimUU9BgP9Y
 N9bH28JdR9/vXshJz4YKipkOQ9k8Tgxbx5zH3NkmRW2upoyzxegwPrbb9N3XFzi5j8yu
 k8ohT84ulhFts/9kJ27VaYHVATF1jxZjK4cqKuc7SJeed9Lr0aan9JHLNbIjZUlxdqQB
 5MZg==
X-Gm-Message-State: APjAAAWCZ1+JNvHcihb2Z6Muy6tT/S/S03r4XEEA3xRjPM4T0AwFcOOh
 X4f2YJHLcbj/v7Yokh5FMqutzl19v2s=
X-Google-Smtp-Source: APXvYqwVVxUIe0T4fN3ibntS/PzATHC6VU/C4x6LzoVgM4eH8dpu4QSqU08u3P6z/6PSHXwrnEkV3w==
X-Received: by 2002:adf:f1c6:: with SMTP id z6mr24859346wro.279.1578993233803; 
 Tue, 14 Jan 2020 01:13:53 -0800 (PST)
Received: from [10.202.0.7] (d5152e8e2.static.telenet.be. [81.82.232.226])
 by smtp.gmail.com with ESMTPSA id p5sm17860493wrt.79.2020.01.14.01.13.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2020 01:13:53 -0800 (PST)
Subject: Re: [PATCH] mtd: spi-nor: add support for GigaDevice GD25D05
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
References: <20200106124624.28779-1-koen.vandeputte@ncentric.com>
 <1873152.psFcFxbH5H@192.168.0.113>
From: Koen Vandeputte <koen.vandeputte@ncentric.com>
Message-ID: <7e896e80-da33-5bd3-16bd-e62b43f5eecc@ncentric.com>
Date: Tue, 14 Jan 2020 10:13:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1873152.psFcFxbH5H@192.168.0.113>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_011358_266530_A62B258C 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: richard@nod.at, vigneshr@ti.com, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


On 11.01.20 16:52, Tudor.Ambarus@microchip.com wrote:
> Hi, Koen,
>
> On Monday, January 6, 2020 2:46:24 PM EET Koen Vandeputte wrote:
>> Tested on a MikroTik RB912UAG-5HPnD r2
>>
>> [    0.641714] m25p80 spi0.0: found gd25d05, expected m25p80
>> [    0.649916] m25p80 spi0.0: gd25d05 (64 Kbytes)
>> [    0.655122] Creating 4 MTD partitions on "spi0.0":
>> [    0.660164] 0x000000000000-0x00000000c000 : "routerboot"
>> [    0.667782] 0x00000000c000-0x00000000d000 : "hard_config"
>> [    0.675073] 0x00000000d000-0x00000000e000 : "bios"
>> [    0.682613] 0x00000000e000-0x00000000f000 : "soft_config"
> I'm afraid that this is not enough. You'll have to test all the flags that you
> advertised. Typically one should do a read, erase, write, read-back test, and
> then to exercise the lock and unlock features. If you want to be exhaustive,
> you can force the controller to do the reads in single, dual or quad modes,
> but if you choose to test just the best supported read mode, it is fine too.
> Please specify in the commit message what you tested.
>
> Cheers,
> ta
Hi Tudor,

Thanks for the guidance here as it's my first patch towards this part of 
the kernel.

I've not only went through the datasheet of this device, but also the 
datasheet from another very similar GD chip carrying the same specs
All features as indicated by the flags are clearly described in both 
datasheets. (like, Single, Dual, Quad modes)

The only delta is the amount of advertised blocks, and some other chip 
package details out-of-scope from electrical performance.

Is this clarification enough to send a V2 with a modified commit msg?

Please advice,
Thanks again,

Koen
>> Signed-off-by: Koen Vandeputte <koen.vandeputte@ncentric.com>
>> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
>> Cc: Richard Weinberger <richard@nod.at>
>> Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
>> Cc: Vignesh Raghavendra <vigneshr@ti.com>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>> index f4afe123e9dc..a34fa42d47a2 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -2346,6 +2346,11 @@ static const struct flash_info spi_nor_ids[] = {
>>   	{ "mb85rs1mt", INFO(0x047f27, 0, 128 * 1024, 1, SPI_NOR_NO_ERASE)
> },
>>   	/* GigaDevice */
>> +	{
>> +		"gd25d05", INFO(0xc84010, 0, 64 * 1024,  1,
>> +			SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ |
>> +			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
>> +	},
>>   	{
>>   		"gd25q16", INFO(0xc84015, 0, 64 * 1024,  32,
>>   			SECT_4K | SPI_NOR_DUAL_READ |
> SPI_NOR_QUAD_READ |
>
>
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
