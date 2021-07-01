Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D10FC11F64
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 10:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5566D61483
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 10:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5566D61483
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qcnvVXr27/ciVFrf0XlV98WAS4QTEZEeWSppxr6GEk8=; b=Y/rhl33FTZmZcyE9ERjZCW+sTo
	BceyFc3qlOQ2UgxUnD1zaqLUdg/HR0hGsOi7m75iuCx1ATOYBUdVMS/7nltA1gPr9SOffLKpfQcE7
	3zg3GgZK6NsYKvvtzoYDFzX2YQO1Yc2PJuDEv2FORwjwLlwc3/tLyQmRn6Jw/7MIg3g7E1HxIQnOy
	al8HNhaR/D1lBZ34um059Q1TQ+wQ1B4RIEQ3Tv/oIKWfQKiOktuXQr5HiEUtJTL4R3nXa+Pup2BrC
	hNLuWKakrJAtQY0+hvx6tkXFviAVousH4JeVRhkyL5zmnqObIXthI+64RkuXzE92Y+2uF0UZYDk6B
	EodVfzOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lythS-00Gth3-Dw; Thu, 01 Jul 2021 10:13:38 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lythO-00Gtga-Qu
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 10:13:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1881A2224E;
 Thu,  1 Jul 2021 12:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625134412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RKWv/y9qcop5C9N8K/loJvjDdLoQq1TsMU/KMlaAeVI=;
 b=JbVHxU9QPRD7x8xwQ3TCBkK8ZwCuXiwPNbaeuj34APmMRXOXGrAC4cDDeNw2jc8SDAw01N
 RGijwx/ywkCG4qtcLrQnQ1rLcAhLWfZjzb65TqcL3DSCNhYCGjyzuKVL9wVxDIohnbNonZ
 gb/xfXnfCbYIPsIKBAJdTXVrBM6O8no=
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 12:13:31 +0200
From: Michael Walle <michael@walle.cc>
To: Jonathan Lemon <jonathan.lemon@gmail.com>
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, kernel-team@fb.com
Subject: Re: [PATCH] mtd: spi-nor: Enable locking for n25q128a13
In-Reply-To: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
References: <20210628211729.3625017-1-jonathan.lemon@gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <87bfecf0836a81e3e6de558776e0b524@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_031335_118155_6415CFD6 
X-CRM114-Status: GOOD (  16.46  )
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

Hi Jonathan,

Am 2021-06-28 23:17, schrieb Jonathan Lemon:
> As 4bit block protection patchset for some micron models are merged,
> n25q128a13 also uses 4 bit Block Protection scheme, so enable locking
> for it. Tested it on n25q128a13, the locking functions work well.
> 
> Signed-off-by: Jonathan Lemon <jonathan.lemon@gmail.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index c224e59820a1..f3d19b716b7b 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -146,7 +146,9 @@ static const struct flash_info st_parts[] = {
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256,
> -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ) },
> +			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> +			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
> +			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
>  	{ "mt25ql256a",  INFO6(0x20ba19, 0x104400, 64 * 1024,  512,
>  			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
>  			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },

For the maintainers: there are no configuration bits which could
change the behavior of the block protection - which we possibly
won't support yet. Thus this looks sane:

Reviewed-by: Michael Walle <michael@walle.cc>

Jonathan, could you also apply my SFDP patch [1] (or use the latest
linux-next) and send me the binary SFDP dump?

-michael

[1] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=241877

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
