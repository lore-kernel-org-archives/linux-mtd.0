Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C3EC74A4B
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 10:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGzlwjNyk+oimFyleib2yOK39RUjKUTiRR64Hvbef6I=; b=HwIiGmNK8OYbgBd3Y8vLNySJeC
	Ofm9l+zBXsfcn70HlgOHteqgTiU6qYXZWbjjmT6XaCRFXYJc2ejYQBmc9nINqWuoTkGZb/0u62Voo
	FQV/rAr23c+2tWpxiPmoHORDGKcTiFK9iYhnnCmRYLqrh/QCQNR7UDhuKZNCV4iRWwOfCZ+pCLvS0
	6MiFA6XuBvgmhP7nlwBlVzxHB3au6xpQISUkWG6zRlS1yuRswT2i9+5RlZLv8wuX4nQASpiUIOKiA
	T/ukx+W1qimYHXNp07bFkEgy+2GH4GKiju3dpY82M9Itb3a7yrnDILZqvaeELXcI7spO9qbgzGbsk
	sl9tyHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfbh-005CeR-If; Mon, 13 Mar 2023 10:40:45 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbfa6-005CDG-Ba
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2023 10:39:11 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id DF1C116A7;
	Mon, 13 Mar 2023 11:39:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678703940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lG+1YG/ll6A6Rxr6tBRejWjyDoRlJTY6VGsQkKwEwtQ=;
	b=ZfB2vAd/J9L6ec8RcrVKS8Onm92C8YxZjQ03HJ1Xz0mKtoRjyMawAPug6ehODeeDvLhIyc
	jGbef7D6c/BGTxYN3g6uXJOXPgKVhlfYs8AQQHc0nmO1lbwDBpSm9NDnVExJ539UA5/4js
	lzrUArLzsP8Sg8E+tP/Fm6wq+ETNIWZWKlSBJkOnh1liJ6ojLPKcSc7ln8CUdtNN7xdlWP
	eNh0kIXdKywi1uv71/3tZ8+roPcMFXRTACoaj7Fw3TYcBctyx/KP9Zb4coOETEiR47sQ5K
	nsxogfTNu2Ob6VD/mdoees0WhdGrhECkkqsxFPzJaOBbFaEzmK+63DV8dgZ58Q==
MIME-Version: 1.0
Date: Mon, 13 Mar 2023 11:39:00 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Luke He <sixuerain@gmail.com>, tudor.ambarus@linaro.org,
 pratyush@kernel.org, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for XMC XM25QH256C / XM25QU256C
 / XM25QH512C / XM25QU512C site: https://www.xmcwh.com/site/product#
In-Reply-To: <20230313113304.1611638d@xps-13>
References: <20230313100153.15441-1-sixuerain@gmail.com>
 <d553beb1c6e38eac748d0b6b62bcd335@walle.cc> <20230313113304.1611638d@xps-13>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <17d46633869f64e029e065693e341e3b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_033906_571064_4315086D 
X-CRM114-Status: GOOD (  16.76  )
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

Am 2023-03-13 11:33, schrieb Miquel Raynal:
> Hi Michael,
> 
> michael@walle.cc wrote on Mon, 13 Mar 2023 11:08:15 +0100:
> 
>> Hi,
>> 
>> please have a look at Documentation/process/submitting-patches.rst
>> how to properly format patches. But also see below.
>> 
>> Am 2023-03-13 11:01, schrieb Luke He:
>> > Signed-off-by: Luke He <sixuerain@gmail.com>
>> > ---
>> >  drivers/mtd/spi-nor/xmc.c | 12 ++++++++++++
>> >  1 file changed, 12 insertions(+)
>> >
>> > diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
>> > index 051411e86339..6db01b80237f 100644
>> > --- a/drivers/mtd/spi-nor/xmc.c
>> > +++ b/drivers/mtd/spi-nor/xmc.c
>> > @@ -16,6 +16,18 @@ static const struct flash_info xmc_nor_parts[] = {
>> >  	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
>> >  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> >  			      SPI_NOR_QUAD_READ) },
>> > +	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
>> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> > +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> > +	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
>> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> > +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> > +	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
>> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> > +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>> > +	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
>> > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>> > +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) }
>> 
>> I've just looked at XM25QH256C [1], but I suspect all of these
>> flashes supports SFDP, therefore you shouldn't use the NO_SFDP_FLAGS.
> 
> I didn't check, do we have a kdoc or something like that which explains
> what flags to use and when?

https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/mtd/spi-nor/core.h#L429

What's missing is still some overview document when and how to add a new
entry to our database. /me looks in Tudors direction :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
