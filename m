Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C95C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2BqxrK3J5bhQSIMxLJ0SK+aZcq1SW/PKDTVb9lfiUvw=; b=QWHIbM3uhjeWEs
	8CLfPEekw6HGsidj78OkXzGlPa+GpTSxztAtTpL19g82eptGh+DP+5y/WaSWVw0wY5UObhhyI2FtQ
	yY1Zpkdg2Kwt0cujIEX7rc9yYdwrmHjN/7x+AK61VtfTzYtEadcwu7Ldg9lTuIE6L7gS47mkzAdmQ
	yR12LlihsKyIfcyag/FqfJtmRk5baDpO409vUmOkZl6tX88Jl6Eld78PE6HRGPQc1xD/l1msI4Dan
	MtgPceZvKEh1XSPl546gr3t/0EcQ3DFwCz3oFjXimAUEMk24KS2GliW3nHjk1tvPxWaxkP7FYQd/S
	Edrr96sBUQJtZ+7Jaa9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlUbV-0011ib-IM; Mon, 02 May 2022 11:52:37 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlUbS-0011hh-Rr
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 11:52:36 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 254DE221D4;
 Mon,  2 May 2022 13:52:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1651492352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vfb6SMVVEmgksQwyCgcCEYh5SQrC0QqGYaX9/ZQQMmI=;
 b=Prg08Lb7ix670wCWe/rtYa3go+E9aWX1MPC7/Tg0jxVQykT1MW69XwVGmNo9S5/6rGu716
 qgr+hjpYjKcV9/SP88OBmhtdEa6UOe+xfUQKOwg7uknHJ5s2Ddmeiav2E6Tt9RVZu3RcD8
 Sx+zdpAVr3DnyYc262OtE91MbX0vYNY=
From: Michael Walle <michael@walle.cc>
To: leon@georgemail.eu
Cc: linux-mtd@lists.infradead.org, p.yadav@ti.com,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: support eon en25qh256a variant
Date: Mon,  2 May 2022 13:52:27 +0200
Message-Id: <20220502115227.2435850-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220430164847.144710-2-leon@georgemail.eu>
References: <20220430164847.144710-2-leon@georgemail.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_045235_114517_6231EEAC 
X-CRM114-Status: GOOD (  22.66  )
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

Hi,

> This patch allows accessing the upper 8m on the A variant (EN25QH256A) of

8m? It's a 32MiB flash right? So it should be the upper 16MiB?

> the EN25QH256 that shares same JEDEC ID.
> 
> Without this patch, addr_with is detected to be '4' but the read_opcode is
> a plain READ (supporting only 3 byte addresses).
> Setting PARSE_SFDP is enough to detect the read_opcode READ_4B on the A
> variant. READ_4B is not available on the no-A variant.
> 
> Both variants support 4-byte address mode (spi_nor_set_4byte_addr_mode)
> but that is prone to breaking on unexpected reboots if the reset pin isn't
> connected (broken-flash-reset).
> 
> The no-A variant supports a 'high bank latch mode' that affects read,
> program, and erase commands - similar to the extended address register
> (EAR).
> The HBL bit is manipulated using the ENHBL (0x67) and EXHBL (0x98)
> opcodes.

So the upper 16MiB never really worked, correct?

> Should it become necessary to distinguish the two variants in the future,
> the A variant sets the SNOR_HWCAPS_READ_1_1_4 SFDP param - the no-A
> variant doesn't.
> 
> Tested with and without fast read on the A variant only.

Do you have the A variant only? Where did you get the SFDP from the
non-A variant? datasheet?

> 
> Signed-off-by: Leon M. George <leon@georgemail.eu>
> Tested-by: Leon M. George <leon@georgemail.eu>

No need for the Tested-by:. That is already implied by the SoB (unless
noted otherwise).

> ---
>  drivers/mtd/spi-nor/eon.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/spi-nor/eon.c b/drivers/mtd/spi-nor/eon.c
> index 8c1c57530281..50a11053711f 100644
> --- a/drivers/mtd/spi-nor/eon.c
> +++ b/drivers/mtd/spi-nor/eon.c
> @@ -25,7 +25,8 @@ static const struct flash_info eon_nor_parts[] = {
>  	{ "en25qh64",   INFO(0x1c7017, 0, 64 * 1024,  128)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
>  	{ "en25qh128",  INFO(0x1c7018, 0, 64 * 1024,  256) },
> -	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512) },
> +	{ "en25qh256",  INFO(0x1c7019, 0, 64 * 1024,  512)
> +		PARSE_SFDP },

Please also submit a SFDP dump, see [1].

-michael

[1] https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
