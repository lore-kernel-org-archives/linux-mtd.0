Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 364D2C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+CzuFKsETdqCZ0J04Vhk2yx7duAb9VybCQwcKJfIR0=; b=eo+F4rl5NAOa32WHZ15b3nr+Ne
	wgOZQwP5MqA4AVv59CiMOs19LqLNml8CT+AQ13RbrGe83n9HNeI7up9V/vzgo3B3J0ZiYLAP/GVe+
	Oo/tx+A7LzHkEjvuG1b7MHcK0QFhIvPlQEDuNnF+cixL7wliBQnBFtdN4HF6y3siuCxQha0CZpbei
	FqtREOrm44goQf9KjaS4ebWnD1oZS2KqY+tC7aonuQXOpZTwcgPVNSnEke5vVxxnJxq3g8AqO8L61
	KVp4NbIESakhJ3CwbJIkKiHOycoHiSeWvfgWBoJ0QiBNLpYcF7QDjJIe3quBjgSI4TcTpr5iwfZGx
	aDLUMWUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMzQ-00Fvjv-Kn; Thu, 22 Sep 2022 14:15:44 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMzN-00Fvhg-BW
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:15:42 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id D10E41D4A;
	Thu, 22 Sep 2022 16:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1663856137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcS2jUr+tDp/xDcywsbnlmZIb0tc1E2JAogEMjNvj/8=;
	b=c1zRY1/BANezYS+BXVFkxAG/FBXkK+XvIkK8T6CoVUVoOnhH7GMN0bHWHr/JAzxXOZbFDt
	FVLVcog8WrNcRx0QVdc6SK0QLoemGwLZxZSnn3uxe3i6gYaUlR+siq2ZRqCi+3t8T6XjfV
	GVjGsgXdeJTeS35LLV3Ne6arZRx0qCXEMMsXKoKEF+xIIygExjhcNPOn1NbZDdhUV2hztJ
	QZySlPpEFOvyoGxEf8rlZX7osHam7j+lmEoGKCTeD04CZClWuk2AExGHao4+q9QPLmG47Y
	16nJLsnT5zUC+KxdXLWRnXVQr3spdC13m9Aqjhh7jtYfM2FLZyHfJToqzWn/nA==
MIME-Version: 1.0
Date: Thu, 22 Sep 2022 16:15:37 +0200
From: Michael Walle <michael@walle.cc>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for gd25lr256e
In-Reply-To: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
References: <20220922135646.49906-1-mika.westerberg@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <88d096d0c5efe43bc50f3c547634eb8b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071541_588533_0AFCA6F3 
X-CRM114-Status: GOOD (  13.48  )
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

Am 2022-09-22 15:56, schrieb Mika Westerberg:
> Add support for this 32MB serial flash.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c 
> b/drivers/mtd/spi-nor/gigadevice.c
> index 119b38e6fc2a..7a7f5cb67a9e 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -57,6 +57,10 @@ static const struct flash_info 
> gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &gd25q256_fixups },
> +	{ "gd25lr256e", INFO(0xc86719, 0, 64 * 1024, 512)

There doesn't seem to be a public datasheet. Does this flash support 
SFDP?

In that case, please just use
	{ "gd25lr256e", INFO(0xc86719, 0, 0, 0),
		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
		PARSE_SFDP
	}

-michael

> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },
>  };
> 
>  const struct spi_nor_manufacturer spi_nor_gigadevice = {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
