Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B8FCD54B5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A3o70yZSTb7SPxqKTmEegGUhp/buG5UJqG8+xpsYkM=; b=K/ut5wlwQR237amq58Fb6Vx1cZ
	1mKaIZYAYWg4980K49x9yold06kjV3HVxwrU7z4jqgw8eY4+KtZ9Qpvf7O2KfGQTr/byEU2Q+HoTZ
	h9AG1MBYd2n5i05HR400Ya3cYYkIHhwRFtmNDLd3qwuVHCtTlpHhHk/dg9NeOL/94zv1Vw7tOvo87
	tG+Qu54EoCTlLsdKQ6LuLLJx+7q/VCZW1j8wAhSQfsKaxAhvWK2HoHnZg+uV9p+dwoAhs1tHApT9q
	fYJboCZuRlrn3ZTI5FhiHt+PzixjqYHHnbt5IcPp6fA0K9U1CJhUdZNAzU7MeaNKD1SrCHaHzOzF+
	uxLJWL8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYwo-000IGQ-2Q;
	Tue, 19 Sep 2023 11:31:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYwm-000IG3-1V
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 11:31:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0A8286159C;
	Tue, 19 Sep 2023 11:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EFB5C433C8;
	Tue, 19 Sep 2023 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695123074;
	bh=5ru64uTo5hwHfPq+Yd9EZrxiNaBgze2zLhEfszCpNks=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LAGgnB3BNs4lvtH8Yw6xVsRZpHrBq36ruK9GIGsoX4J4lgqZGh6iZP7HDGjIsBDKm
	 unyQeXKZyBAmYthMTXvUOmeR9S4qPRUcnEduQBNVsCVHHqIum5P22K2qivM2j+Dc2d
	 o9Uv/ebSLQtp1qRnsksRcU2FxEM2UWi1CT6G6srYgY+JvpOij8JfVkHlqWZZvnqEsl
	 kZslLoqs6jiciZ4j+JncoXNuci3gDt8uTPYVemFA24KzX6CiRK4KEmrDdM+/DzCeM4
	 DrGUy8bWZ5pXNs3r145iG/ThXrrJnCU9800t1k58Oh6hvTofuB0mKmUYRezuL90OJu
	 kfyGOd6GFjyUw==
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 13:31:10 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 10/41] mtd: spi-nor: make sector_size optional
In-Reply-To: <417fb0fa-e774-c744-8641-7618347a8d1a@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-10-e60548861b10@kernel.org>
 <417fb0fa-e774-c744-8641-7618347a8d1a@linaro.org>
Message-ID: <4ec7192b6bfaf956e1b8e747e5fd07e7@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_043116_609120_9CB4EAB3 
X-CRM114-Status: GOOD (  21.00  )
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

Am 2023-09-19 11:25, schrieb Tudor Ambarus:
> On 08.09.2023 13:16, Michael Walle wrote:
>> Most of the (old, non-SFDP) flashes use a sector size of 64k. Make 
>> that
>> a default value so it can be optional in the flash_info database.
>> 
>> As a preparation for conversion to the new database format, set the
>> sector size to zero if the default value is used. This way, the actual
>> change is happening with this patch ant not with a later conversion
>> patch.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/mtd/spi-nor/core.c | 6 ++++--
>>  drivers/mtd/spi-nor/core.h | 8 +++++---
>>  drivers/mtd/spi-nor/swp.c  | 6 +++++-
>>  3 files changed, 14 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index c84be791341e..368851ff9f40 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2756,7 +2756,8 @@ static void spi_nor_no_sfdp_init_params(struct 
>> spi_nor *nor)
>>  {
>>  	struct spi_nor_flash_parameter *params = nor->params;
>>  	struct spi_nor_erase_map *map = &params->erase_map;
>> -	const u8 no_sfdp_flags = nor->info->no_sfdp_flags;
>> +	const struct flash_info *info = nor->info;
>> +	const u8 no_sfdp_flags = info->no_sfdp_flags;
>>  	u8 i, erase_mask;
>> 
>>  	if (no_sfdp_flags & SPI_NOR_DUAL_READ) {
>> @@ -2810,7 +2811,8 @@ static void spi_nor_no_sfdp_init_params(struct 
>> spi_nor *nor)
>>  		i++;
>>  	}
>>  	erase_mask |= BIT(i);
>> -	spi_nor_set_erase_type(&map->erase_type[i], nor->info->sector_size,
>> +	spi_nor_set_erase_type(&map->erase_type[i],
>> +			       info->sector_size ?: SPI_NOR_DEFAULT_SECTOR_SIZE,
>>  			       SPINOR_OP_SE);
> 
> all these info->sector_size checks can be removed if we use
> params->sector_size. I'll do it after applying the series.

See previous reply, there will be just this check. The one in swp.c
will go away. I don't have a strong opinion. I just didn't want to
have redundant information.

Speaking of.. there is a check missing in

--snip--
diff --git a/drivers/mtd/spi-nor/spansion.c 
b/drivers/mtd/spi-nor/spansion.c
index fd2652aa6c1e..e4c725000964 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -1053,7 +1053,8 @@ static int spansion_nor_late_init(struct spi_nor 
*nor)
  		nor->flags |= SNOR_F_4B_OPCODES;
  		/* No small sector erase for 4-byte command set */
  		nor->erase_opcode = SPINOR_OP_SE;
-		nor->mtd.erasesize = nor->info->sector_size;
+		nor->mtd.erasesize = nor->info->sector_size ?:
+				     SPI_NOR_DEFAULT_SECTOR_SIZE;
  	}

  	if (mfr_flags & (USE_CLSR | USE_CLPEF)) {
--snip--

Is it possible to amend this patch while you apply it? A later patch
should probably fixup the erase_map instead of setting the erase_opcode
and erasesize itself.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
