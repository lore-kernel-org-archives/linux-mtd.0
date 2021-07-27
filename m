Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BD0C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:50:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2FCA611CE
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2FCA611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vz7MwN3LCsj8BnRyRn5pHRTtqh2yQtDGmQ7fl1WwAi0=; b=fx0EXNMhWefKGES3Qfh5tTqOZi
	bzieNkOcmdjuN39UhBrOK/yuRqilkN6lN3poUKlINpB8hUrKG94w0oaz8FWo9MruY4dZ0L7Z/X+al
	COC46C5KLlQ/nfYDM/DCMAUjRgMJJeXPueu+gjVGYm73IbFK8vK/O6VEfKQLlFoRorEv/yDR/0Owu
	m/eADUi81EHOU5qvJr3ZXmEXo/QLMMRajwEyLkS/Ol3X/MMM9BgUb4Bt+k1gRIyqPiFJUyrRuOf/v
	HN51Nhm1YXTQoMV+l03WSDuOb9ppnybhFh2G19AVUN+JGjRR5LKwE5BWYyI0IgK9JDINXZGr43JPP
	fK+y2dYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8Hqw-00Dv7J-9C; Tue, 27 Jul 2021 07:50:14 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HLF-00Dmgm-65
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 07:17:30 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 39A0C22234;
 Tue, 27 Jul 2021 09:17:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627370247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnHLdYRwFXqB9sGtryvI3Km836ruQ7zDsaH1AHnvSZ8=;
 b=lyIgvKu6k6yDVCG1D7gJDVVMSgZWMjAOwk/FrJ2dlhdWhqqkl0iDnq2mNKz/B5N2vU/Ts9
 a7xdoFoQftMUqGx69pJChkVxcOP9fJ6/ERcj2DDHOicgsO5tc7WFM/xla5FcbNx+VzrbBq
 RZWW/o0v6WKZaAwe9UtDJPThYlS1J0Q=
MIME-Version: 1.0
Date: Tue, 27 Jul 2021 09:17:26 +0200
From: Michael Walle <michael@walle.cc>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: micron-st: add support for mt25ql01g
 and mt25qu01g
In-Reply-To: <a979f3a66e9e4391844d1fae144a32646933c86f.1627039534.git.matthias.schiffer@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
 <a979f3a66e9e4391844d1fae144a32646933c86f.1627039534.git.matthias.schiffer@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1b4e1495ab019778f671661cc7bdb539@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_001729_435980_4C3B2003 
X-CRM114-Status: GOOD (  15.72  )
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

Am 2021-07-23 13:27, schrieb Matthias Schiffer:
> Split these mt25q models from the older n25q models by matching their
> extended IDs to allow adding support for 4byte opcodes.

You will have to supply SFDP data for all these chips, please have
a look at [1] how to do that.

Also, we'll switch to SFDP parsing, have a look at [2].

> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index d5baa8762c8d..2fca5de2504f 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -172,11 +172,17 @@ static const struct flash_info st_parts[] = {
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6) },
> +	{ "mt25ql01g",   INFO6(0x20ba21, 0x104400, 64 * 1024, 2048,
> +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },

As mentioned in my other mail, I don't see this chip supporting 0xc7
(BULK ERASE). Is erasing the whole chip working?

Thanks,
-michael

>  	{ "n25q00",      INFO(0x20ba21, 0, 64 * 1024, 2048,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			      SPI_NOR_4BIT_BP | SPI_NOR_BP3_SR_BIT6 |
>  			      NO_CHIP_ERASE) },
> +	{ "mt25qu01g",   INFO6(0x20bb21, 0x104400, 64 * 1024, 2048,
> +			       SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			       SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "n25q00a",     INFO(0x20bb21, 0, 64 * 1024, 2048,
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      NO_CHIP_ERASE) },

[1] 
https://lore.kernel.org/linux-mtd/7038f037de3e224016d269324517400d@walle.cc/
[2] 
https://lore.kernel.org/linux-mtd/20210727045222.905056-36-tudor.ambarus@microchip.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
