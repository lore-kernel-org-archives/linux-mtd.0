Return-Path: <SRS0=lC14=N7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16ADEC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:46:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF5C861131
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Sep 2021 21:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BF5C861131
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCGn3SaOLnxr/kcqAvH7tb0XBAkU5Pjo9pl4Pumz4YI=; b=iZBzPj7mD9Us9THxC8bv/vGaYl
	UGa5RqRUIxoBmFCAZ+WdrhqrDEefvTAeYvV0Xorh+O1x4NqAwZsytgrzgcKq3zDuz7+DAYwf2PXv7
	2HelMpgruvrIRe0mou9L/7h+EVV9U9x0IxouY3LptNpkd0iBX1NRaSsiZpCLM2MOnWySaOk6vXiPa
	96pDslNZ1r79hyM/xeXqRODnMVx6sQB/w2T4ECsQBMM8aCigjqPWfJXvfLlhbzo/rv9anAKRzZo9y
	v6Qxmxycz7hBKfupDTxIZuzvTINYpGlOsUl3w7q+1U8q5XhGBirJLUKnhQLFW7lLAUJn3g/9eNI+C
	M57nliDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mORr0-00AyCq-DV; Thu, 09 Sep 2021 21:45:06 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mORqn-00AyAr-It; Thu, 09 Sep 2021 21:44:55 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 21FEE22236;
 Thu,  9 Sep 2021 23:44:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1631223890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bHF2dFVRpeHS5rKXumjD0HfKfZSkrDI/OI/i7yMt+r8=;
 b=G4xnojwTQuFb0E9eeeG9atvsXfo9JU2XA/kdeoqDDiEQOKDAEFGQKZFffTctbdNkFFKLLj
 sD6RdbezjfttqmzUK6jZ/GYvwv3GchKyIFayqE5l6CGJYeeBbfw6uB4pN3AI8MCV+cfcIf
 3vV6RlCbKMvYXQm/04DE9a2Rdq6E3Kc=
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 23:44:50 +0200
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, macromorgan@hotmail.com,
 vigneshr@ti.com, jaimeliao@mxic.com.tw, richard@nod.at, esben@geanix.com,
 linux@rasmusvillemoes.dk, knaerzche@gmail.com, nicolas.ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, mail@david-bauer.net, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v2 09/35] mtd: spi-nor: atmel: Use flash late_init() for
 locking
In-Reply-To: <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-10-tudor.ambarus@microchip.com>
 <20210816190629.3kg4cbf5d7h7gyk5@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a9d41aa96a8749b599d4479f18479c5d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_144453_846025_FB1FE3AB 
X-CRM114-Status: GOOD (  18.64  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-08-16 21:06, schrieb Pratyush Yadav:
> On 27/07/21 07:51AM, Tudor Ambarus wrote:
>> Locking is not described in JESD216 SFDP standard, place the locking
>> init in late_init().

Btw, we should differentiate between the block protection
bits and individual block locking. At least the latter is described
in the SFDP (I've seen it in the XTX SFDP, haven't checked the
standard yet).

> You are chaning the order of setting the locking ops here. Earlier, 
> they
> were set before we parsed SFDP. Now they are set after we parse SFDP.
> Though I don't see it making much of a difference.
> 
>> 
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> ---
>>  drivers/mtd/spi-nor/atmel.c | 30 +++++++++++-------------------
>>  1 file changed, 11 insertions(+), 19 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>> index 1fea5cab492c..b937ef734e55 100644
>> --- a/drivers/mtd/spi-nor/atmel.c
>> +++ b/drivers/mtd/spi-nor/atmel.c
>> @@ -48,15 +48,11 @@ static const struct spi_nor_locking_ops 
>> atmel_at25fs_locking_ops = {
>>  	.is_locked = atmel_at25fs_is_locked,
>>  };
>> 
>> -static void atmel_at25fs_default_init(struct spi_nor *nor)
>> +static void atmel_at25fs_late_init(struct spi_nor *nor)
>>  {
>>  	nor->params->locking_ops = &atmel_at25fs_locking_ops;
>>  }
>> 
>> -static const struct spi_nor_fixups atmel_at25fs_fixups = {
>> -	.default_init = atmel_at25fs_default_init,
>> -};
>> -
>>  /**
>>   * atmel_set_global_protection - Do a Global Protect or Unprotect 
>> command
>>   * @nor:	pointer to 'struct spi_nor'
>> @@ -146,34 +142,30 @@ static const struct spi_nor_locking_ops 
>> atmel_global_protection_ops = {
>>  	.is_locked = atmel_is_global_protected,
>>  };
>> 
>> -static void atmel_global_protection_default_init(struct spi_nor *nor)
>> +static void atmel_global_protection_late_init(struct spi_nor *nor)
>>  {
>>  	nor->params->locking_ops = &atmel_global_protection_ops;
>>  }
>> 
>> -static const struct spi_nor_fixups atmel_global_protection_fixups = {
>> -	.default_init = atmel_global_protection_default_init,
>> -};
>> -
>>  static const struct flash_info atmel_parts[] = {
>>  	/* Atmel -- some are (confusingly) marketed as "DataFlash" */
>>  	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4, SECT_4K | 
>> SPI_NOR_HAS_LOCK)
>> -		.fixups = &atmel_at25fs_fixups },
>> +		.late_init = atmel_at25fs_late_init },
>>  	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8, SECT_4K | 
>> SPI_NOR_HAS_LOCK)
>> -		.fixups = &atmel_at25fs_fixups },
>> +		.late_init = atmel_at25fs_late_init },
>> 
>>  	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8,
>>  			     SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -			.fixups = &atmel_global_protection_fixups },
>> +		.late_init = atmel_global_protection_late_init },
> 
> Won't you be better off setting this in the manufacturer late_init()? 
> It
> seems common for most atmel flashes.
> 
> Of course, this would cause a problem for atmel flashes that don't have
> this at all, since we would set locking for those as well. But I think
> we can avoid that by checking for SNOR_F_HAS_LOCK in
> spi_nor_register_locking_ops().

+1

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
