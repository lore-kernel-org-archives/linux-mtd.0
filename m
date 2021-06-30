Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB5BDC11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A74A36143F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 14:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A74A36143F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgt2MPGvwcltI+PDNc4BQB3OhecoM4A1Zi2GXH7agAc=; b=fdVPtPFfHbAbCt/o6z34IS3ANm
	adGcjQBCBBGa14GKUEnqKShcjjSOWEaa0L4GprPZcjSxD6NWVKcHyneMFDoMybF8cJv5Vc1f3oAfA
	kpXs5ArIMTiVsOEroKMTy7BxbrxXOD+VSP9bXEji51fx9vlwxamOxL53YwyN0WTkWWEbnauQiZHnZ
	Y/OB7i4a7kZW9K4O9tDCtn4JqJdRaCnw8BwcWNOI4T5x64u4CVyGI95U/NYLF+FGWoTTnKDqT67Ns
	zs+uROUjdNsskGb1aE95IJFjCzUVkeOREFxnTO+BtrhwHXiGqaVW9TzLsdsJVXSCwsj641SBtt5n/
	giANJM8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyawU-00EIV4-As; Wed, 30 Jun 2021 14:11:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyahs-00EDkT-7p
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 13:56:54 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 7769522256;
 Wed, 30 Jun 2021 15:56:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625061401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XUNG7j6CiyOnF/U9YKLnvgfplN/scC5c3CBGJyaaHlA=;
 b=C/9rYuoWsJO+Pw3rlE0TJpcYZnGwoloC8PRKKOsyG3BegvI3BXgchO9SsmNijCIGzecNwU
 +IW0lW+1wKQNJQIhXDQNSxspEe55/gmQxs/IOP/bCKmkiN/xVQ4DVIkH1Zww8930ap1eW9
 5U1JpcJc/gcOom6R71iE1I27TaHH+FU=
MIME-Version: 1.0
Date: Wed, 30 Jun 2021 15:56:41 +0200
From: Michael Walle <michael@walle.cc>
To: Hongwei Zhang <hongweiz@ami.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] mtd: spi-nor: Add some M45PEx ids
In-Reply-To: <20210629150846.21547-2-hongweiz@ami.com>
References: <20210629150846.21547-1-hongweiz@ami.com>
 <20210629150846.21547-2-hongweiz@ami.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <95865068f95f7d75a67e8eb3ab4fe906@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_065648_486583_14A85D67 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Hongwei,

Am 2021-06-29 17:08, schrieb Hongwei Zhang:
> Add some Micron M45PEx flash memeories into the IDs table.

Did you test all these flashes?

> Fixes: dd1e9367157f900616f (ARM: dts: everest: Add phase corrections 
> for
> eMMC)

Bogus Fixes tag. First, I cannot find this commit id, which tree is
that? Secondly, adding new flash ids don't fix anything, esp not
something related to eMMC.

> 
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index ef3695080710..379b14e339ff 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -95,8 +95,12 @@ static const struct flash_info st_parts[] = {
>  	{ "m25p128-nonjedec", INFO(0, 0, 256 * 1024,  64, 0) },
> 
>  	{ "m45pe10", INFO(0x204011,  0, 64 * 1024,    2, 0) },
> +	{ "m45pe20", INFO(0x204012,  0, 64 * 1024,    4, 0) },
> +	{ "m45pe40", INFO(0x204013,  0, 64 * 1024,    8, 0) },
>  	{ "m45pe80", INFO(0x204014,  0, 64 * 1024,   16, 0) },
>  	{ "m45pe16", INFO(0x204015,  0, 64 * 1024,   32, 0) },
> +	{ "m45pe32", INFO(0x204016,  0, 64 * 1024,   64, 0) },
> +	{ "m45pe64", INFO(0x204017,  0, 64 * 1024,  128, 0) },
> 
>  	{ "m25pe20", INFO(0x208012,  0, 64 * 1024,  4,       0) },
>  	{ "m25pe80", INFO(0x208014,  0, 64 * 1024, 16,       0) },

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
