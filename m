Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD5BEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=axMaPDBLLk+Z9KgMRr/Bg4E5GLYbtymCx0IOR/znyDg=; b=DnsrlnyNJu8DOmtWGOPlOdhGlC
	uKIkewrpH7on0+DMo8u9X50H5+9KawiNvXcssIQdvoAML36aq2Hd0A0k047rLuPDus2oKHke/XCdd
	K6w8Q0xy19HfoLON8F5qqypYNdVKSndNGuo5gwXGQDOQMwciYrb4A4n9SazUGe3iw14k1BlIe+TGn
	oLIE+/yqACwxfpm/xtl1ydRAlghW7gwRG6NW6SRfsiF9U3fTWlHEhnR4mNYqV0xh26ZPW64/aThGC
	4Qbi6tZ7XbvhUV8di3StJU1vvJuoyAeBoRANx9q3gRijSWbbGpzQTdbDY8DZxGUKtUt7TvEh0Anoj
	J7dqw2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH2SR-00FzGV-1b;
	Wed, 05 Jul 2023 13:22:11 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH2SO-00FzFC-2C
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jul 2023 13:22:10 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 9C47814B;
	Wed,  5 Jul 2023 15:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1688563321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RkmkIlJf0GjA86yR5StuTraBthXgR2TiG3EKV+pp7/8=;
	b=MIuToiibmRuNOsgyP95Q+/yln7OkbL8XaE0hNyTBLNl0clVQtFTR7u+cZ7iEhn1HnsVs4A
	ZAq8ptlaI1fphBqH7B4MjBqQjiGX1s3OisvMzmLQVxVzjKeY4lbXB4GtNwAwWYI1rTwHaZ
	uYLw7B5EEUWOBfR0qkX2Yzk7vX7DhABrMh0f37elMQm9rdkZZTjmVWkrDdDVOWM/HRQtA0
	S9cUM3ERcMNYV27GmNOLYQo+P4TMl+sxFcdDy6A519A8CzmGSETsCDcdeAz6qe64xj4qWr
	VQqgBRjAV059rn6TB8GkoQMlHW2SuCkVs+ENs7HWyE5L7GIf3fuJL7vRGbT/4g==
MIME-Version: 1.0
Date: Wed, 05 Jul 2023 15:22:01 +0200
From: Michael Walle <michael@walle.cc>
To: Mamta Shukla <mamta.shukla@leica-geosystems.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 bsp-development.geo@leica-geosystems.com, Mamta Shukla
 <mamta.shukla@leica-geosystems.com>
Subject: Re: [PATCH] mtd: micron-st: enable lock/unlock for mt25qu512a
In-Reply-To: <20230705130010.2999839-1-mamta.shukla@leica-geosystems.com>
References: <20230705130010.2999839-1-mamta.shukla@leica-geosystems.com>
Message-ID: <419d80f252f12f091b9c555da0965c84@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_062208_902338_34005461 
X-CRM114-Status: GOOD (  14.56  )
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

Am 2023-07-05 15:00, schrieb Mamta Shukla:
> mt25qu512a[1] supports locking/unlocking through BP bits in SR.
> 
> Tested using mtd-utils- flash_lock/flash_unlock for MT25QU512ABB8E12.
> 

> [1] 
> https://media-www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-b/mt25q_qlkt_u_512_abb_0.pdf?rev=b259aadc3bea49ea8210a41c9ad58211

Link: tag please

> Signed-off-by: Mamta Shukla <mamta.shukla@leica-geosystems.com>
> ---
>  drivers/mtd/spi-nor/micron-st.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/micron-st.c 
> b/drivers/mtd/spi-nor/micron-st.c
> index 4b919756a205..5d1dc8e0bbba 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -218,6 +218,8 @@ static const struct flash_info st_nor_parts[] = {
>  		MFR_FLAGS(USE_FSR)
>  	},
>  	{ "mt25ql512a",  INFO6(0x20ba20, 0x104400, 64 * 1024, 1024)
> +		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
> +		      SPI_NOR_BP3_SR_BIT6)

With the changes above:

Reviewed-by: Michael Walle <michael@walle.cc>

Unrelated to this patch, but could you please dump the SFDP tables,
see [1].

FWIW, I noticed the difference between MT25QU and MT25QL here. But
I don't think we can do anything about it. It is just another example,
that the name is mostly irrelavant/cannot be trusted. Vendors tend to
reuse the id for different (software compatible probably) parts. Maybe
we can get rid of it entirely. Tudor, Pratyush?

-michael

[1] 
https://lore.kernel.org/all/4304e19f3399a0a6e856119d01ccabe0@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
