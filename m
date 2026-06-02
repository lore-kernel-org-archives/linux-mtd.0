Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB567CD6E4A
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Jun 2026 11:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmb0p5lIDmRQ0KOY18fIWYm0+8FiEzpIiDYly57JPRo=; b=10Kuhsxmkd0rYU
	D9JHIWQjlDDFNv59Wslk9SPXjkMWEX2+9SUA04H7X2+WdyeOCpe7lFMk8bpqvKcNZOVO6naYBqibn
	M2/+j8hEYPtzliu2gOy4OPYsWHpYTcfrXcrocRYt8H+5VQ3p4HMRMAR+VvoaVDdU1X5AvHr0aI17c
	SbB03oh/exzMtTC3PciFNtAxnuVva7GRcildgfWtI94hs5zqoeVMkAcY+cAadmj1fJotwmBzJsk+G
	Mtrju9dQd482Wd40YMLIHACrjUoBG/nfwljaHUrdtXi+PnDgBbPr0HeNilOxGFLLCytranW15qtwS
	XXyUL+8EWqrFjprHzjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMsf-0000000CqnD-2sq7;
	Tue, 02 Jun 2026 11:01:57 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMsd-0000000Cqlu-0vON
	for linux-mtd@lists.infradead.org;
	Tue, 02 Jun 2026 11:01:56 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4B3D8AA;
	Tue,  2 Jun 2026 13:01:44 +0200 (CEST)
Mime-Version: 1.0
Date: Tue, 02 Jun 2026 13:01:43 +0200
Message-Id: <DIYIGDO5RR8X.BYFE5UUAEAN6@kernel.org>
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: spansion: s25fl256s0: remove
 SKIP_SFDP flag
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260601125438.3481722-1-mwalle@kernel.org>
 <20260601125438.3481722-2-mwalle@kernel.org> <875x41nu2c.fsf@bootlin.com>
In-Reply-To: <875x41nu2c.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_040155_417736_34E9D0E1 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue Jun 2, 2026 at 11:57 AM CEST, Miquel Raynal wrote:
> Hi Michael,
>
>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
>> index 65227d989de1..092450375d4e 100644
>> --- a/drivers/mtd/spi-nor/spansion.c
>> +++ b/drivers/mtd/spi-nor/spansion.c
>> @@ -868,7 +868,7 @@ static const struct flash_info spansion_nor_parts[] = {
>>  		.name = "s25fl256s0",
>>  		.size = SZ_32M,
>>  		.sector_size = SZ_256K,
>> -		.no_sfdp_flags = SPI_NOR_SKIP_SFDP | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>> +		.no_sfdp_flags = SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>>  		.mfr_flags = USE_CLSR,
>>  	}, {
>>  		.id = SNOR_ID(0x01, 0x02, 0x19, 0x4d, 0x00, 0x81),
>
> Fine by me. I believe the expected behaviour should just be an empty
> feedback, leading to the SFDP to be invalid and thus SFDP parsing
> skipped, right?

Right. Probably it will read all ones or all zeros and the parsing
will fail and skipped.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
