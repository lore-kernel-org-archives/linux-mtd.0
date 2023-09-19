Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A46CD54AF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Sep 2023 11:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R0l+HzWoLaWAfjF6NIjAkp5/W2XhGCtcBcwwhFCgjmU=; b=swwfIwgZjbWGAXE98JKoDBSlay
	rznOO6z8JJLpCwdgA7VXERH1g8j98Z1QnPeEU1IAVvG7AP4wv8uBC94+KnHvdD/Z/WcL2W9ft6Fwk
	o/ZOT+9uc586HkBBA2yEBbxCiY2mGb9eTHQ6Vymd0cFibl+Ib6xdsaFORpZP+2dXDKwryIwapxhQG
	rwmWAHqjEP0BVwQ+azIQ61Gr8SEPuQYnKT2jbKAgJ1++tSCE0JiyLg78HRgfaaevkViNUF3yNphsl
	V2FkK552avYxHrSFkCtSw4UYleASsEAI6hluBmA3vEqLvEsHgWaL2cKphLjcXNZtS0Imu17qei1QJ
	mU7D1oug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYz4-000IVK-0S;
	Tue, 19 Sep 2023 11:33:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiYz1-000IUX-2c
	for linux-mtd@lists.infradead.org;
	Tue, 19 Sep 2023 11:33:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A5DF615BF;
	Tue, 19 Sep 2023 11:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC17C433C7;
	Tue, 19 Sep 2023 11:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695123214;
	bh=oSAfuJuJoAkvG41btmzxmDdHDNRt675GLYS925NJ/K0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cGS7C36SFKY3HbPNdzJfObib4KXB8l0OK9PVF8LMO57N/Z9NS6651rPLThLE7D3vZ
	 TY1Q96jd+LihiJD9aptxhNWtbzSg9z/k3proslMz2bJcDwAcKx8PY8xbuNhpAljZVL
	 07mOyxu+WWIiuGLt0qPp6xIfKB0YP94rGHEauFZBWKdXLwl4CbyxN6d4IHZZ6rPeWy
	 A5MCMRbRmy0EB5k98+sz4ES5Fm8GsH6DT8F8i6EXoZMfyIsBVlw8SY+UzoMjBHMVTv
	 UepPwRDSLFK3VzSHd7yMh05BGkcpVqDHaCPwKNy4fg1UZg0GvwwtB2RcORx8yuuV5z
	 cdHeUS731nESw==
MIME-Version: 1.0
Date: Tue, 19 Sep 2023 13:33:30 +0200
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 20/41] mtd: spi-nor: everspin: convert flash_info to
 new format
In-Reply-To: <647d3775-a71d-a880-6d4d-3eb5a89ec9d6@linaro.org>
References: <20230807-mtd-flash-info-db-rework-v3-0-e60548861b10@kernel.org>
 <20230807-mtd-flash-info-db-rework-v3-20-e60548861b10@kernel.org>
 <647d3775-a71d-a880-6d4d-3eb5a89ec9d6@linaro.org>
Message-ID: <e7a48b040541f783773d9d0039816633@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_043335_896208_A852955E 
X-CRM114-Status: GOOD (  13.71  )
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

Am 2023-09-19 11:24, schrieb Tudor Ambarus:
> On 08.09.2023 13:16, Michael Walle wrote:
>> The INFOx() macros are going away. Convert the flash_info database to
>> the new format.
>> 
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>>  drivers/mtd/spi-nor/everspin.c | 33 +++++++++++++++++++++++++++++----
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/everspin.c 
>> b/drivers/mtd/spi-nor/everspin.c
>> index d02c32f2f7ad..46776bc10b27 100644
>> --- a/drivers/mtd/spi-nor/everspin.c
>> +++ b/drivers/mtd/spi-nor/everspin.c
>> @@ -9,10 +9,35 @@
>>  #include "core.h"
>> 
>>  static const struct flash_info everspin_nor_parts[] = {
>> -	{ "mr25h128", CAT25_INFO(16 * 1024, 1, 256, 2) },
>> -	{ "mr25h256", CAT25_INFO(32 * 1024, 1, 256, 2) },
>> -	{ "mr25h10",  CAT25_INFO(128 * 1024, 1, 256, 3) },
>> -	{ "mr25h40",  CAT25_INFO(512 * 1024, 1, 256, 3) },
>> +	{
>> +		.name = "mr25h128",
>> +		.size = SZ_16K,
>> +		.sector_size = SZ_16K,
>> +		.page_size = 256,
> 
> page size defaults to 256, isn't it? Can we get rid of the page_size
> assignments?

Yes!

> 
>> +		.addr_nbytes = 2,
>> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
>> +	}, {
>> +		.name = "mr25h256",
>> +		.size = SZ_32K,
>> +		.sector_size = SZ_32K,
>> +		.page_size = 256,
>> +		.addr_nbytes = 2,
>> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
>> +	}, {
>> +		.name = "mr25h10",
>> +		.size = SZ_128K,
>> +		.sector_size = SZ_128K,
>> +		.page_size = 256,
>> +		.addr_nbytes = 3,

also "addr_nbytes = 3" is the default.

-michael

>> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
>> +	}, {
>> +		.name = "mr25h40",
>> +		.size = SZ_512K,
>> +		.sector_size = SZ_512K,
>> +		.page_size = 256,
>> +		.addr_nbytes = 3,
>> +		.flags = SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
>> +	}
>>  };
>> 
>>  const struct spi_nor_manufacturer spi_nor_everspin = {
>> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
