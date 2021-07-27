Return-Path: <SRS0=5ASP=MT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2479C4338F
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91DBF611CE
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Jul 2021 07:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 91DBF611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/h9otl7/ai/qxYGU7U8IVd1QDzVdVvHkjYrIRCF5ag8=; b=ApVecvLje5hT92yxGwH/lxUM7+
	ST6gbXeWgJBn1nbqgFIiMvbRHnNCFtAifX9aA7AmIncPR8j9Cj9SkaFw1ogEqbLlcvjIzOjFS3Jtl
	+KTydjd7zuZKc8yfnJArpSnj/qf4xY9meGVeTGshewSoy29fmXkEd5JP8yDK0sgEmA+DC4Gv3rgnf
	LkMKmkg+5I6SA7R5dXYICbKYtzr1FK1/t2eTAVQ6gXu5xTI2nmBilKJWXJ64V6Wb0LkUjvPh+ybZ0
	FMvwnAef7skaG9YmrExETd1axbLzD09XIIfy1b1actMtz9xiM09LBsOfUhG7hPVa1ex5NNFXEkOxC
	bJmnnMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8HnV-00DuIG-1F; Tue, 27 Jul 2021 07:46:41 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8HDx-00DkwL-Q0
 for linux-mtd@lists.infradead.org; Tue, 27 Jul 2021 07:09:59 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 204F922234;
 Tue, 27 Jul 2021 09:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1627369794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOJFW/hcqRz7AGRgmL25IuiXB0pKdensyRUsdiGJkUc=;
 b=FRBttgS1hRR69hjIKmi0XFB4cO3NI6oDhr6RpxoZAuCt0K7N0h3I9jS9ueGlrgYQ70SFNu
 btGz4vze57Q466VTcBdC8Qwa82G8pu13diNNG7qBhRojLDvUdaA44WJcXGVvycpAA576I1
 919MAB1DGYKZ9Tqvx1NmFVn7172rwyw=
MIME-Version: 1.0
Date: Tue, 27 Jul 2021 09:09:53 +0200
From: Michael Walle <michael@walle.cc>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: micron-st: sync flags of mt25ql02g and
 mt25qu02g with other mt25q
In-Reply-To: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
References: <c7b6c666aef9a8a2195acabe9954a417f04b6582.1627039534.git.matthias.schiffer@ew.tq-group.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <f3dbab898e9f1946129e5733095bdf3c@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_000958_059872_C024F8E3 
X-CRM114-Status: GOOD (  18.21  )
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
> All mt25q variants have the same features.
> 
> Unlike the smaller variants, no n25q with 2G exists, so we don't need 
> to
> match on the extended ID to distinguish n25q and mt25q series for these
> models.

But why shouldn't we? What if there will be another flash with
the same first three id bytes?

> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index c224e59820a1..d5baa8762c8d 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -181,11 +181,11 @@ static const struct flash_info st_parts[] = {
>  			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
>  			      NO_CHIP_ERASE) },
>  	{ "mt25ql02g",   INFO(0x20ba22, 0, 64 * 1024, 4096,
> -			      SECT_4K | USE_FSR | SPI_NOR_QUAD_READ |
> -			      NO_CHIP_ERASE) },

This bothers me. I'm not sure how this will work. I see that
chip erase is command 0xc7, but both the new and the old flash
just supports 0xc3 (DIE ERASE). Did you test these changes?

> +			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
>  	{ "mt25qu02g",   INFO(0x20bb22, 0, 64 * 1024, 4096,
>  			      SECT_4K | USE_FSR | SPI_NOR_DUAL_READ |
> -			      SPI_NOR_QUAD_READ | NO_CHIP_ERASE) },
> +			      SPI_NOR_QUAD_READ | SPI_NOR_4B_OPCODES) },
> 
>  	{ "m25p05",  INFO(0x202010,  0,  32 * 1024,   2, 0) },
>  	{ "m25p10",  INFO(0x202011,  0,  32 * 1024,   4, 0) },

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
