Return-Path: <SRS0=cj04=IH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29824C433E0
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 23:00:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3BC650F5
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Mar 2021 23:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3BC650F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oRrJWEO6QNvXRJrX7p0IxnYYjSvGgrOgZ7ZnBeo+ASc=; b=FTPG08qtMdUVdbFBfz9btOq1d
	0AWQLLXpCRFVYbCC9acsV+Bh8rQhnZ/Vrwj6fCBaP0rQlNRFO8DH9Z7n9KLK4BAe7wS5k/HBqdwTi
	OgrrzbYl4DbyWI0Tqe5eAx4GD2zzeEM+BwztIcN2NZXSa3P36J/mPOxD7jrJtLbmVf9iNOva8HPu/
	P/j2pNTJm7rp5YFfnfkYB7/GFaZ68xy0oA7/IxyVm5l32ZADua2zBvyiyoTLMwqUlEUOSn0/XLAqg
	vvu2Ld0PWnysTAN33SMNo1n3xVuumtyeT/A8kC9ZMxsVPL95sOlaf02yiJDU1qiPEfhbkmYp91R6x
	E8zYKxasw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJlKk-005c30-NV; Tue, 09 Mar 2021 23:00:10 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJlKe-005c24-H1
 for linux-mtd@lists.infradead.org; Tue, 09 Mar 2021 23:00:08 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 899DA2223E;
 Tue,  9 Mar 2021 23:59:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615330799;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xjc66xppdsM/m27TCXE1d+gcnxieQJuu1mjlbGwyArE=;
 b=vv1L9XMjbDif4VxOwWm5WMkgXWlJ9xbVE50Czcsy6+HsLjl3wpUqnOQSuOF+ARl9TG4uxk
 UvHHchYvZU10EbpxaPk2vsgOxd4Je4nRRYbHWq125EzH1jzolkNxaTadr/cBG+esedQl+B
 qOQPXWpzK/L2nQ41P68b4vdiuGeXrLk=
MIME-Version: 1.0
Date: Tue, 09 Mar 2021 23:59:58 +0100
From: Michael Walle <michael@walle.cc>
To: Tim Harvey <tharvey@gateworks.com>
Cc: devicetree@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>, Fabio
 Estevam <festevam@gmail.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring
 <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: at25: add Fujitsu MB85RS4MT
In-Reply-To: <20210309220014.22205-1-tharvey@gateworks.com>
References: <20210309220014.22205-1-tharvey@gateworks.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8ca5c54140d69307f3c08ca85a09f0b5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_230004_712227_5174EB38 
X-CRM114-Status: GOOD (  16.20  )
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

Hi Tim,

Am 2021-03-09 23:00, schrieb Tim Harvey:
> Document the compatible value for the Fujitsu MB85RS4MT SPI
> FRAM EEPROM device so that it can be used in DTS files.
> 
> This is a 512KiB FRAM EEPROM.
> 
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml
> b/Documentation/devicetree/bindings/eeprom/at25.yaml
> index 6a2dc8b3ed14..f594db72b711 100644
> --- a/Documentation/devicetree/bindings/eeprom/at25.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
> @@ -26,6 +26,7 @@ properties:
>                - anvo,anv32e61w
>                - atmel,at25256B
>                - fujitsu,mb85rs1mt
> +              - fujitsu,mb85rs4mt
>                - fujitsu,mb85rs64
>                - microchip,at25160bn
>                - microchip,25lc040

Hm, the driver is spi-nor but this is for the at25 driver. Is
this correct? Doesn't it work if you just add the ID to
spi-nor/fujitsu.c and use 'compatible = "jedec,spi-nor' ?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
