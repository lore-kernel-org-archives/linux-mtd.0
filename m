Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6D4EB64DA
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 07:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeyI0y0k/SE+CYVld/MGhPLltF6Mhh1krQV0SzAfULo=; b=ELm3nFWsjOKe96O1JmY60IMT+3
	Nw026GrEB4SUSB7Ax1jQKy2NkIKjTzMkbE8bYS0YY2+Cf9y1Dw71zpuVy4d0i6K5jSTZ9yrqYJfFR
	0ip/FO9umG6O1Odt+797kymoY/E4QcSJYzSRiyXyHcSzAJsbPIKZbi8YsvxZl3giymVM7Mj3Z8EP4
	bEvAdB0bQMzll0nLcby8hH+8XHuw/fK+BUMYV7j0u/4bqNj/mW3EFoO9XtYD9frx4yKTJXJfrD7CG
	TxtTl4sWadt+oWYrTrifrgSEZt69N+dDcsVCzFgo4mdectYvRpUgS5P0nIZfahh/cWKZS8G6WU4MM
	b/6ONssA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNj4-00A31t-19;
	Thu, 20 Jul 2023 07:05:26 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNj1-00A2zH-0e
	for linux-mtd@lists.infradead.org;
	Thu, 20 Jul 2023 07:05:24 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id CC0443D5;
	Thu, 20 Jul 2023 09:05:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1689836715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZuZ0IsGyRwuV/pG7ohuA1WOX4CqA3bP0jKsrGlL0cfM=;
	b=SUVogaP+43ffhfTrNLFzMzHID7BYVfGb16nIG2mCAvEh9wVbH6PgNyQrIwWAq2SaxMe3bC
	/XSoPJE/9y0WWQ6mBkWs65q+irhyjcenJtrJlXtcbBhSsF+TOuZxhay4CnZiy3w5xdnJ5Y
	SPqXhI1mi3WWXZJd034cP5EXJPo+tRJgIiJYgaxepMoS4LLLV0auR8SVHbycUnDY5mNQkE
	sqZ00JnEgk99ZHlO+AI7Kqvj1g2FzM1SLEnruBi1+y0P9pYWCT2Qf9H99XVlnh10V20WzL
	9aEdXsgMcSg6lWl0tu7Tpay+l1HgnD+DUefPEZOfoWUNxbE0dqoHVSQpHJrF6A==
MIME-Version: 1.0
Date: Thu, 20 Jul 2023 09:05:15 +0200
From: Michael Walle <michael@walle.cc>
To: Victor Lim <vlim@gigadevice.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 akumarma@amd.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vikhyat.goyal@amd.com, Victor Lim
 <vlim@gigadevice.com>
Subject: Re: [PATCH V1 1/1] linux: drivers: mtd: spi-nor: gigadevice.c
In-Reply-To: <20230720042834.12296-1-vlim@gigadevice.com>
References: <20230720042834.12296-1-vlim@gigadevice.com>
Message-ID: <62663146a51c2beac4eff48abe1f61f8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_000523_486918_1FCD7F46 
X-CRM114-Status: GOOD (  12.34  )
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

Am 2023-07-20 06:28, schrieb Victor Lim:
> Adding gigedevice new part numbers
> 
> Signed-off-by: Victor Lim <vlim@gigadevice.com>

This is already v3 of this series. Please track and keep a change log.

Your previous ones were here:
https://lore.kernel.org/linux-mtd/20221204080000.4100-1-vlim@gigadevice.com/
https://lore.kernel.org/linux-mtd/20221206111037.8999-1-vlim@gigadevice.com/

> ---
>  drivers/mtd/spi-nor/gigadevice.c | 79 ++++++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/gigadevice.c 
> b/drivers/mtd/spi-nor/gigadevice.c
> index d57ddaf1525b..285fa42f2d97 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -67,6 +67,85 @@ static const struct flash_info 
> gigadevice_nor_parts[] = {
>  		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
>  		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
>  		.fixups = &gd25q256_fixups },
> +/* adding these parts */

Why this comment?

> +	{ "gd25lx256e",  INFO(0xc86819, 0, 64 * 1024, 512,
> +			      SECT_4K | USE_FSR | SPI_NOR_OCTAL_READ |
> +			      SPI_NOR_4B_OPCODES | SPI_NOR_OCTAL_DTR_READ |
> +			      SPI_NOR_OCTAL_DTR_PP |
> +			      SPI_NOR_IO_MODE_EN_VOLATILE)
> +		.fixups = &gd25lx256e_fixups },
> +	{"gd25b512", INFO(0xc8471A, 0, 64 * 1024, 1024,	SECT_4K |
> +	SPI_NOR_QUAD_READ | SPI_NOR_HAS_LOCK | SPI_NOR_4B_OPCODES)},

Did you even compile this? INFO() doesn't take 5 arguments.
I'll stop here.

If you decide to post another version. Please read through all
the feedback you've got and esp. 
Documentation/process/submitting-patches.rst

Make it one patch per added part, don't include legacy flags if not 
needed,
include a test report and the dump of the SFDP tables.

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
