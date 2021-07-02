Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5A9C11F68
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 15:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03D361416
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 15:12:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03D361416
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAzMWcsDvoCBPrDsjLuIfFiIK3+unrcwgQ8b1hJkf8g=; b=TQ5to5IN0pJ/xHlcsUJNTHu7rO
	UV7ZxH2y2G4nyw/ubO8VCB8jkJhH4OKIUfNmo2VYgcFh/uiwrBp/hNz0llCljsTDNWaDNkX4dMZka
	MpfQl0LNtwbUNNkCyDPi5MTIE3XJ0eHxtIMsGEjWlN/ajaxa1XFLAD/jYmHNV2S7VFlneOibgC/Dy
	UVmfMx7pNc/EI691nIf4c4vhcrnwQNG/dDB+dTMf3SKH8GPTF39q5Ovfr1B6kBtCyXUz3AF1toFEZ
	AyLNM4KxRrJDnjbHj3fGrswIG6nqbbqh0Fz/QQyzk5d3KMzo0OvORws+DSphhgP6W/ikozzcuYJhn
	HVlxh44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzKp6-003NQK-Iy; Fri, 02 Jul 2021 15:11:20 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzKoz-003NOJ-Jy
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 15:11:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BFF9A2224D;
 Fri,  2 Jul 2021 17:11:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625238669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0CSqdI5W2i8km4QxEnZZ5yvDT6W7gIWEnqT6uA2l94=;
 b=ZfX8yn3OSL4FH3yj2/7S1ZLFjKqv722zwJAWAMusX9A5J3Ffnb/LAfIqS7/GAuiQZMgQkk
 /ky172ckeJR1iMQySXLwVo3l+FM+j7OBksl/ZmdXeElTGjwUbCw2W8PoBWEALLUhLzTUzG
 ANt2wMMWoRbu0ABX0OjyyGdI3eBfThg=
MIME-Version: 1.0
Date: Fri, 02 Jul 2021 17:11:08 +0200
From: Michael Walle <michael@walle.cc>
To: Jihoon Han <rapid_renard@renard.ga>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Sungbo Eo <mans0n@gorani.run>
Subject: Re: [PATCH] mtd: spi-nor: esmt: Add support for F25L16PA
In-Reply-To: <20210630175446.17680-1-rapid_renard@renard.ga>
References: <20210630175446.17680-1-rapid_renard@renard.ga>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c5027b34facdb4fdc21ac89cf9eb50fa@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_081113_891239_FBE9AC01 
X-CRM114-Status: GOOD (  15.82  )
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

Am 2021-06-30 19:54, schrieb Jihoon Han:
> Add support for F25L16PA which is 2MB SPI-NOR Chip manufactured by 
> ESMT.
> 
> Tested on Qualcomm QCA9557 based DW02-412H router.
> 
> Datasheet:
> https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L16PA_1(2S).pdf

Please put it into one line and just before your Signed-off-by so it
will be tag.

> 
> Signed-off-by: Jihoon Han <rapid_renard@renard.ga>
> ---
>  drivers/mtd/spi-nor/esmt.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
> index cfc9218c1053..2ebeecd6c957 100644
> --- a/drivers/mtd/spi-nor/esmt.c
> +++ b/drivers/mtd/spi-nor/esmt.c
> @@ -10,6 +10,8 @@
> 
>  static const struct flash_info esmt_parts[] = {
>  	/* ESMT */
> +	{ "f25l16pa", INFO(0x8c2115, 0, 64 * 1024, 32,
> +			   SECT_4K | SPI_NOR_HAS_LOCK) },
>  	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
>  			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
>  	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,

There is a F25L16PA which has a different ID (0x8c2015). So we have to 
agree
on a different name.

See also
https://lore.kernel.org/linux-mtd/20210620085639.143694-1-mans0n@gorani.run/

-- 
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
