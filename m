Return-Path: <SRS0=wcjI=LI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8487C48BE6
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 06:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29D2261370
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Jun 2021 06:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29D2261370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63eJZCPRCAwoLqN8guM2ZKATaW+EaesEDCdPbONMZZM=; b=Bm3b5AocLi6R4B04wSouU1RX3+
	8KQV+8qg4zyykJkVyDCAgC3rcXDr/WOHleakF8mY7hmPxF1E//KAV+GxpNjkTWrJna10NwL9MW8CR
	2KqMassDvJgP8hcRLF9pLIEofBVLDDyi1ZFWsc/D/S7Xl24NyaWYLjhuwlP49zu7jVBczLinAwPyQ
	QXPwGLJ1GvOy/JLWxKP71FWslu0puKxpaA8STGowDqA8vaxRqmGBxyXul0mOsK6wvTQKtsBi9Ou8i
	1QJVzGbCmnxOn/FwQv6YTVry8tT3wf+aUuqq7BK/LnjhZ8moHY6AqlJIrY5Yy91p5XE4llSlY7VuP
	zk1JHImw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsgX6-00CmoW-EA; Mon, 14 Jun 2021 06:57:16 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsgWz-00Cmn9-M8
 for linux-mtd@lists.infradead.org; Mon, 14 Jun 2021 06:57:11 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BFB982225B;
 Mon, 14 Jun 2021 08:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1623653820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1AgvWwEgWNbd/ZFEwqZyF0GXiy7g1Jx3V20t6vTDlAs=;
 b=PKhJIU1/cFO6ly5cziLdB3k5N19D6kgoI3OGLCIasC5+h3qhqbETiSoEo9ukKb9YxDUth8
 mB8ae63ghOZtPxByjBS8PcQPU1T8iHK+x/zi+wSTfR+H+0X3ep8jOmTW0ezrMcsLAENBoA
 Xa6ITPxxKhtfSuh4aeEXDGXcJABPHqg=
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 08:56:59 +0200
From: Michael Walle <michael@walle.cc>
To: Reto Schneider <code@reto-schneider.ch>
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>, Reto Schneider
 <reto.schneider@husqvarnagroup.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Pratyush Yadav <p.yadav@ti.com>, Richard
 Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
In-Reply-To: <20210613121248.1529292-1-code@reto-schneider.ch>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <1ba367f93650cb65122acd32fb4a4159@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210613_235709_924734_8D30182A 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Reto,

Am 2021-06-13 14:12, schrieb Reto Schneider:
> From: Reto Schneider <reto.schneider@husqvarnagroup.com>
> 
> The data sheets can be found here:
> http://xmcwh.com/Uploads/2020-12-17/XM25QH64C_Ver1.1.pdf

Could you add that as a "Datasheet:" tag before your Sob tag?

> This chip has been (briefly) tested on the MediaTek MT7688 based 
> GARDENA
> smart gateway.

Could you also apply my SFDP patch [1] and send the dump? Unfortunately,
I can't think of a good way to do that along with the patch and if this
in some way regarded as copyrighted material. So feel free to send it to
me privately. I'm starting to build a database.

> Signed-off-by: Reto Schneider <reto.schneider@husqvarnagroup.com>

With that fixed:
Reviewed-by: Michael Walle <michael@walle.cc>

NB. XMC ignores the continuation codes and this particular device will
collide with M25PE64/M45PE64. Although I couldn't find any datasheet,
so I don't know if these devices actually exist.

-michael

[1] https://patchwork.ozlabs.org/project/linux-mtd/list/?series=241877

> 
> ---
> 
>  drivers/mtd/spi-nor/xmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/xmc.c b/drivers/mtd/spi-nor/xmc.c
> index 2c7773b68993..b6ac37bd59b8 100644
> --- a/drivers/mtd/spi-nor/xmc.c
> +++ b/drivers/mtd/spi-nor/xmc.c
> @@ -12,6 +12,8 @@ static const struct flash_info xmc_parts[] = {
>  	/* XMC (Wuhan Xinxin Semiconductor Manufacturing Corp.) */
>  	{ "XM25QH64A", INFO(0x207017, 0, 64 * 1024, 128,
>  			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "XM25QH64C", INFO(0x204017, 0, 64 * 1024, 128,
> +			    SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  	{ "XM25QH128A", INFO(0x207018, 0, 64 * 1024, 256,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
