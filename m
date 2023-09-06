Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C60FEB8FAF
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Sep 2023 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TvH/46SVQo5EP5sx235goK3kkOmh/aNqJC8ZA9WBgg=; b=BNtqT8IP5pGOb4JZBu26wbkYKl
	SyNoKJt+uo2BIGyAeM0wg9z5tIXbrPLUVrrC/WpL6f3puxsPZHlMPxczeK+STDViEVrLOimWiCIpX
	lureOH9ZvgZjKfRQKiNryp0VJuVfUiochAROkOgnmvj6/xVQWFc7Pixbi0o46RSi9BRffydhYfzir
	GF614R8Nhms6L2nhWlCe1Z30T77tZbZnEHGWY3Kfsumu0wh4ARqLB1rOBl3y0tjzmIo5ShvoFa/uQ
	jeryTozje7gI+8g42hv8lYWmhXvdnHTJqrtfEg4d6Bk8rKBy+5Vj/V17jZq/IZuS6zF0iB5xNI78b
	rSxIY4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn7B-007X0P-2T;
	Wed, 06 Sep 2023 07:38:17 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdn79-007WzB-09
	for linux-mtd@lists.infradead.org;
	Wed, 06 Sep 2023 07:38:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 782C8B8181E;
	Wed,  6 Sep 2023 07:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B747C433C8;
	Wed,  6 Sep 2023 07:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693985892;
	bh=TlFFHkQqnU9xxEpivIc2OzdDpMruk7bYtr2KqdZe+JU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lhh8tVR+xMS5I3tRz33K0Edqpq5824vTwtxpEETY8yARl5JZ39kownBAtnopmYwpq
	 XFEzK3I29FBSQk5YfzwPayL+R3YOEhexMU4b4hlKaQIgHcASFJXp4FIy7g0kYMw0xu
	 j/r+es9iAizkJxLooGwcYM6AZghHoONZrqBcjviVo/b8wHr/7KfsGY6pIkiIaLZXw0
	 J6m364nCTDxY6pGHLHN2AxORh9kyecL4mFsa5o4jV9zW4vdi+/9MUYTGmhyJ2UdAit
	 N+rLU82xEJP2pEzzpGb3mRhhTQhvi3b/O7YqSLmZltcDRHT53txfnRG0zlBc22al5g
	 nelUjNRPkWdSA==
MIME-Version: 1.0
Date: Wed, 06 Sep 2023 09:38:08 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 17/41] mtd: spi-nor: atmel: convert flash_info to new
 format
In-Reply-To: <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-17-291a0f39f8d8@kernel.org>
 <aba618e2-ad74-d716-c8d7-e77588b22509@linaro.org>
Message-ID: <50043f689a491d330eea22714f72f95a@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_003815_394689_BDAD5B1A 
X-CRM114-Status: GOOD (  14.40  )
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

Am 2023-09-06 09:35, schrieb Tudor Ambarus:
> On 22.08.2023 10:09, Michael Walle wrote:
>> The INFOx() macros are going away. Convert the flash_info database to
>> the new format.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/mtd/spi-nor/atmel.c | 122 
>> +++++++++++++++++++++++++++++---------------
>>  1 file changed, 80 insertions(+), 42 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
>> index d2de2cb0c066..ccc985c48ae3 100644
>> --- a/drivers/mtd/spi-nor/atmel.c
>> +++ b/drivers/mtd/spi-nor/atmel.c
>> @@ -163,48 +163,86 @@ static const struct spi_nor_fixups 
>> atmel_nor_global_protection_fixups = {
>>  };
>> 
>>  static const struct flash_info atmel_nor_parts[] = {
>> -	{ "at25fs010",  INFO(0x1f6601, 0, 32 * 1024,   4)
>> -		FLAGS(SPI_NOR_HAS_LOCK)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &at25fs_nor_fixups },
>> -	{ "at25fs040",  INFO(0x1f6604, 0, 64 * 1024,   8)
>> -		FLAGS(SPI_NOR_HAS_LOCK)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &at25fs_nor_fixups },
>> -	{ "at25df041a", INFO(0x1f4401, 0, 64 * 1024,   8)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at25df321",  INFO(0x1f4700, 0, 64 * 1024,  64)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at25df321a", INFO(0x1f4701, 0, 64 * 1024,  64)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at25df641",  INFO(0x1f4800, 0, 64 * 1024, 128)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at25sl321",	INFO(0x1f4216, 0, 64 * 1024, 64)
>> -		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>> -	{ "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
>> -		NO_SFDP_FLAGS(SECT_4K) },
>> -	{ "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at26df161a", INFO(0x1f4601, 0, 64 * 1024, 32)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at26df321",  INFO(0x1f4700, 0, 64 * 1024, 64)
>> -		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE)
>> -		NO_SFDP_FLAGS(SECT_4K)
>> -		.fixups = &atmel_nor_global_protection_fixups },
>> -	{ "at45db081d", INFO(0x1f2500, 0, 64 * 1024, 16)
>> -		NO_SFDP_FLAGS(SECT_4K) },
>> +	{
>> +		.id = SNOR_ID(0x1f, 0x66, 0x01),
>> +		.name = "at25fs010",
> 
> nitpick, we shall respect the order of the members declared in
> flash_info struct.

The id is the first one on purpose, because that's our main
key to the entry. I couldn't swap the properties in flash_info
yet because the old entry style used also positional parameters,
i.e. the first entry was always the name.

> And I'll let you double check if the conversion is accurate :D.

See the cover letter for the objdump trick :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
