Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF7FC433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Oct 2022 11:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zp9JN/oIUxv8ggM2jKFnQZEUF9tRtOsK+eNMzvP+Jfs=; b=1xqyV91qHgxKGbrT/A49QxQL5o
	PApTKT6OS0k0uhHJZ7g/uou0EJS7F7F+T1vBKmris3h77oNanHqT0SDl7JqXgoGTGu0PGm1ykGCYE
	f3IzgGmh4w9naqF+bSJUFnujPg6+er/Witm1sX0t4FynQ8p+fNH2m464cr1iQBb0IJDixT+JwFMiO
	hATsAO24aNt6ErxJg6z8qKDW9+WZgHcjvSnPTlsG5B4NxFlVF2pfVsBGQjD2staKD3UWQ4kwQW31G
	DzbEwOMf2DH9d6fPaEEx8RU/cpe/9QTyludDBvUOTWUnEUm5dv+R+CXP1efDueSJbUnNEMieu3sMg
	PS1Q3GWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPQg-0023tP-KN; Thu, 06 Oct 2022 11:52:42 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPQd-0023rQ-Tf
	for linux-mtd@lists.infradead.org; Thu, 06 Oct 2022 11:52:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id E56FA1244;
	Thu,  6 Oct 2022 13:52:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1665057154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FZe/U/2fgPatLd94i7eLXrAEz+0HGRCtOhliaKB6zJ0=;
	b=GRfAMRSc2WqOBy6QcR0DJ4tjLdZYTTLVq0XZ7XTWKS5mhxx4NRPlI9PEGJKxPbF3BnsLHm
	4zpBICbXGn+X+vA6acySvyeKCEe/U+ZOzFo4UikoqKe50L8Z65JVKO1B85qiWrOAMIyelL
	QKrnkCMlEiyt08jLsRVLgVm2nPv/YSbixbOFViuwKfeVt8DgM5bG8UL/qUm+0afQDX8o4b
	bH3SWxt0dot+2i7QjUWTDjJywc5Oi/jaVTfaDsd4NvpWcBLT0EL1G+gchJ87H68KEWEy4p
	f1J0d9Ymw8Vqgk8/+CxIQ83sshm3sVaBd3+sfEbfyuzriQqZzl70GIyc1txX8A==
MIME-Version: 1.0
Date: Thu, 06 Oct 2022 13:52:33 +0200
From: Michael Walle <michael@walle.cc>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: ~sircmpwn/email-test-drive@lists.sr.ht, patrick@stwcx.xyz,
 garnermic@fb.com, Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush
 Yadav <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for w25q01jv-im
In-Reply-To: <20221006070841.2106194-1-Delphine_CC_Chiu@Wiwynn.com>
References: <20221006070841.2106194-1-Delphine_CC_Chiu@Wiwynn.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <0dde4fa6ddeefa23314dbdcd1dd1b28b@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_045240_159993_D5251981 
X-CRM114-Status: GOOD (  12.29  )
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

Am 2022-10-06 09:08, schrieb Delphine CC Chiu:
> Add support for winbond w25q01jv-im chip.
> 
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index ffaa24055259..2b02b05ceb0a 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -139,6 +139,9 @@ static const struct flash_info winbond_nor_parts[] 
> = {
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
>  			      SPI_NOR_QUAD_READ) },
> +	{ "w25q01jv-im", INFO(0xef7021, 0, 64 * 1024, 2048)

The name should be w25q01jvm.

> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ) },

That flash should support SFDP, so please try the following:
+	{ "w25q01jvm", INFO(0xef7021, 0, 0, 0) PARSE_SFDP },

Also, we require an SFDP dump for new flash submissions, see [1].

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
