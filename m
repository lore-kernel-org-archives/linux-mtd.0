Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D11CA0FE8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 11:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vNEOuP0TUscQWJ2dgVi/qCHEKNqG6ayZ/AppK1Cgc3o=; b=A2LSFvjRe/zzzeYKRTPz/5cayf
	tWkPaoKn4jbE+44u9Nore3Jlx6Ziag3Cvsc9p4abAH3RhZJ+s/YNS+k4YJ9sT87DrvaJz9ZU3s5a5
	tTo9ayDthld6k77mKaUdnHkJ4/TgnxTX/dGH0tnzm224+Zppfg8j8dM7oJvmHPA3slyu4l895oAf6
	Uet9faHkx1kaXyn3BUN9X2fL0TF6pv4J38NOLWgN9xbiN54gyyS1hx0HwD970/5QtdHLaJ2se2URk
	5rOlTqWADsmmGgdCeWNQZc+Ny6UMZE5NKr0eFL8eULEjoq704/TP3AP9VMiTFXk1sLEFgI8pUqGcd
	dp7CaeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1wY-00H4RS-1g;
	Fri, 01 Sep 2023 11:04:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc1wV-00H4Ng-26
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 11:04:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43E10B823C5;
	Fri,  1 Sep 2023 11:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B10C433C8;
	Fri,  1 Sep 2023 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693566235;
	bh=I2iaub0EMUJL2Csl2POps/A2Cg6Qycr9Mjw6FoE53Yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=J/iEKDs+QjF7IKgBXNVCVQgqUW8QNAKRuOH3NTCb7+7/cUcdo2nl8cg60JNHCFVvU
	 QImMLMDULNPtYXQJJpwF08Ws+sR0Dea7MvLmxrhFyvzmvYiF72j7khZ6ky5pJyzOE9
	 pqARkGIvugKX1kraKwTSaUVMbeNKvub7bonOFrlqSwn5FO+bXFXoua53kC+gXKTkXr
	 /sXu63zw14YDvVpRnkNEhSWZouAjuEj87qcp3r6ajesk06VJ8eljRxj9KfchOEQYwo
	 3UCNWKxWC/81xDI5rspn2ubSQFefu0uGpq1rTEOVN1TaQyJ6sBVAQowSE9kKPt5Lb7
	 A3Cj3ljJZYKpQ==
MIME-Version: 1.0
Date: Fri, 01 Sep 2023 13:03:51 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 06/41] mtd: spi-nor: default page_size to 256 bytes
In-Reply-To: <f8fe1378-686f-5889-8f0f-e1cda237ee3f@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v2-0-291a0f39f8d8@kernel.org>
 <20230807-mtd-flash-info-db-rework-v2-6-291a0f39f8d8@kernel.org>
 <f8fe1378-686f-5889-8f0f-e1cda237ee3f@linaro.org>
Message-ID: <68f8c1224b5f5298ed423503f3580186@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_040359_837686_79EA1DE9 
X-CRM114-Status: GOOD (  15.16  )
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

Am 2023-08-24 10:36, schrieb Tudor Ambarus:
> On 8/22/23 08:09, Michael Walle wrote:
>> The INFO() macro always set the page_size to 256 bytes. Make that an
>> optional parameter. This default is a sane one for all older flashes,
>> newer ones will set the page size by its SFDP tables anyway.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 7 +------
>>  drivers/mtd/spi-nor/core.h | 8 ++++++--
>>  2 files changed, 7 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index f4cc2eafcc5e..d27ad1295ee0 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2018,11 +2018,6 @@ static const struct spi_nor_manufacturer 
>> *manufacturers[] = {
>>  static const struct flash_info spi_nor_generic_flash = {
>>  	.name = "spi-nor-generic",
>>  	.n_banks = 1,
>> -	/*
>> -	 * JESD216 rev A doesn't specify the page size, therefore we need a
>> -	 * sane default.
>> -	 */
>> -	.page_size = 256,
>>  	.parse_sfdp = true,
>>  };
>> 
>> @@ -3001,7 +2996,7 @@ static void spi_nor_init_default_params(struct 
>> spi_nor *nor)
>>  	params->writesize = 1;
>>  	params->size = info->size;
>>  	params->bank_size = params->size;
>> -	params->page_size = info->page_size;
>> +	params->page_size = info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
> 
> how about to get rid of info->page_size entirely and directly use the
> default?

We'd first have to get rid of the Xilinx S3AN and the everspin stuff.
They are still using a different page size. That being said, that's
on my todo list.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
