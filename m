Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7798C61DA4
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Mar 2023 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irjV8cgreU86tCRG2hRMsCTyybGTd6jSN6BNHUIC8bQ=; b=dSJtza/f9RPvu6/3vNIUUnrsek
	+pMj3lDba12udmKDPHMkZYgC0OnYSDTN86fxJgZVr5/Y/phBa8dFJSQ9ZOPWr3TWBJA+1TeWcwxD2
	dQIoa0kPPxBg+PGuZlgg7dWLFqxRcaaBazbZwd7ZONuHKxSljAuo592MKLNMX2BlMoslyySQ0FXD+
	jrW1Xye3VhbF/X8Spv2wVO1oNa8PSHzoMJd6nmtnvdFK/zXV6hjaq0E/JR0xUx0SmJctjqWNU8txN
	ILzJA/74JmuHIeHW0CUM2vgKHi3VJzMW948/nW21OxzyitTMi0ocGnX6wXVqh36HC5oLSvb+mco3/
	wMtw5Hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbf6S-005732-GC; Mon, 13 Mar 2023 10:08:28 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbf6N-005712-7v
	for linux-mtd@lists.infradead.org; Mon, 13 Mar 2023 10:08:26 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 778A7D5A;
	Mon, 13 Mar 2023 11:08:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678702095;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z7HFpDnOl3q4iWUSr5nmYuABZICa90lL0/oWJXog6fQ=;
	b=IPSyNUTF1zf4GgMhTcPiQ8Yi2TqeqIj9hfapBYTBpuA7U+IujqXW1yjeF53eq+WGiHDdz8
	cArlPt4LDOqnp5PHuS4/RjiC2Q+BJVhoLf88WICB2UqWab47FerIKjKY3yI40YdXtTibch
	CQqVTxSJBm/kVYuBn5YvkIOXqdfYQMXPUBroAjrkZ6L99TncRX0sebeoH+sa6kzz/LSWq7
	F9tYNQTQFhY6iG1AbZmO+RAdmJSw7XQkI7hKyOcKNfleuZfV3T5lBMxFfaZXxNkteoUQzm
	eYOLBgga6n3V6BT/iVxBpSMe63XdXP+r73BD2G8ymhx16FRZJ++b2NfTmRs9OQ==
MIME-Version: 1.0
Date: Mon, 13 Mar 2023 11:08:15 +0100
From: Michael Walle <michael@walle.cc>
To: Luke He <sixuerain@gmail.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: Add support for XMC XM25QH256C / XM25QU256C
 / XM25QH512C / XM25QU512C site: https://www.xmcwh.com/site/product#
In-Reply-To: <20230313100153.15441-1-sixuerain@gmail.com>
References: <20230313100153.15441-1-sixuerain@gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d553beb1c6e38eac748d0b6b62bcd335@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_030823_537887_1824E752 
X-CRM114-Status: GOOD (  14.24  )
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

Hi,

please have a look at Documentation/process/submitting-patches.rst
how to properly format patches. But also see below.

Am 2023-03-13 11:01, schrieb Luke He:
> Signed-off-by: Luke He <sixuerain@gmail.com>
> ---
>  drivers/mtd/spi-nor/xmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index 051411e86339..6db01b80237f 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -16,6 +16,18 @@ static const struct flash_info xmc_nor_parts[] = {
>  	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "XM25QH256C", INFO(0x204019, 0, 64 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QU256C", INFO(0x204119, 0, 64 * 1024, 512)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QH512C", INFO(0x204020, 0, 64 * 1024, 1024)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> +	{ "XM25QU512C", INFO(0x204120, 0, 64 * 1024, 1024)
> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			     SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) }

I've just looked at XM25QH256C [1], but I suspect all of these
flashes supports SFDP, therefore you shouldn't use the NO_SFDP_FLAGS.
Then, without any additional flags, there is no need for an entry
at all, because it should be coverered by the "generic spi-nor"
driver [2].

-michael

[1] https://www.xmcwh.com/uploads/198/XM25QH256C_Ver1.8.pdf
[2] 
https://elixir.bootlin.com/linux/v6.3-rc2/source/drivers/mtd/spi-nor/core.c#L1637

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
