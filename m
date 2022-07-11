Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD56C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Jul 2022 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTDyaADxtpN8xjCf/6Chx4s5DMITdnBNIwWtVrkX2FE=; b=riwZ+/L9TZY6nk
	z6AdNwiuyCr3i3UEVhUH7B2hVMU+4oTGtO0bWeJrzaS/kIgUrcwVHKPYgQgay5qGyGm24VKOF2dXo
	RMITMJlFOf3tbfO5RL96QuEe9SKwmGkL92Dg6JnEnHn9eKrJ2ECBWqUfuBCvjLop1O9vQUlIbTfJR
	u81mJs3ajyAKFp7xkUr6m3sau9BI91CSD6CszpFjBpfZKyo3ALwWkcwZXsDwDSE3KwqbibLDaZOed
	LkcXPIcydj+w/gH21Qtzz1Ynh2QfHxMTPaOGqSJAQ+xVpZfhNBNYHi6c+1+Xpl4s1QnEcARx0EmUr
	KSUw9vvzWnsoKnoFYwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAq4G-000MYN-GS; Mon, 11 Jul 2022 09:51:04 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAq4C-000MR1-T7
	for linux-mtd@lists.infradead.org; Mon, 11 Jul 2022 09:51:02 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 846112223B;
	Mon, 11 Jul 2022 11:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657533050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMeX1vZTy7LXb6VdBKmKA4HS7JM9KLAcJ9+NNMAnB6I=;
	b=I4izBmkxo3qy/qgmt5u4bUud1eMkmJjka9XGuEOPNg0FVuMQ2idiXPbwjeqBiFBMdJXrqi
	3Hbz9B0J5JWvRrSVzQcOiYo5Y2oeNmuOV2QJLEU5IrTZMvcjVPqTAzv7ZBKwDDYcxtLDE6
	vwCSyAXi1ZaJ7dNhBf73F31cICI7jSo=
From: Michael Walle <michael@walle.cc>
To: quic_jaehyoo@quicinc.com
Cc: clg@kaod.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	p.yadav@ti.com,
	quic_ggregory@quicinc.com,
	quic_jiles@quicinc.com,
	tudor.ambarus@microchip.com,
	Michael Walle <michael@walle.cc>
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
Date: Mon, 11 Jul 2022 11:50:42 +0200
Message-Id: <20220711095042.2095360-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_025101_162494_D257C248 
X-CRM114-Status: GOOD (  15.44  )
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

> Add support for Winbond W25Q512NW-IQ/IN
> 
> datasheet:
> https://www.winbond.com/resource-files/W25Q512NW%20RevB%2007192021.pdf

Please add that as a Link: tag before your SoB tag.

> Test result on AST2600 SoC's SPI controller:
> $ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/jedec_id
> ef6020
> 
> $ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/manufacturer
> winbond
> 
> $ cat /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/partname
> w25q512nwq
> 
> $ hexdump /sys/bus/platform/devices/1e620000.spi/spi_master/spi0/spi0.1/spi-nor/sfdp
> 0000000 4653 5044 0106 ff01 0600 1001 0080 ff00
> 0000010 0084 0201 00d0 ff00 ffff ffff ffff ffff
> 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> *
> 0000080 20e5 fffb ffff 1fff eb44 6b08 3b08 bb42
> 0000090 fffe ffff ffff 0000 ffff eb40 200c 520f
> 00000a0 d810 0000 0233 00a6 e781 d914 63e9 3376
> 00000b0 757a 757a bdf7 5cd5 f719 ff5d 70e9 a5f9
> 00000c0 ffff ffff ffff ffff ffff ffff ffff ffff
> 00000d0 0aff fff0 ff21 ffdc
> 00000d8

This information goes below the --- line

> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
> index ffaa24055259..d6f1a3b7267e 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -133,6 +133,9 @@ static const struct flash_info winbond_nor_parts[] = {
>  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024)
>  		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ |
>  			      SPI_NOR_DUAL_READ) },
> +	{ "w25q512nwq", INFO(0xef6020, 0, 64 * 1024, 1024)

Please use INFO(0xef6020, 0, 0, 0) and test wether it will still
work correctly. We will then be able to convert it to SNOR_ID3()
later.

> +		PARSE_SFDP
> +		OTP_INFO(256, 3, 0x1000, 0x1000) },

Did you test OTP?

-michael

>  	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024)
>  		PARSE_SFDP
>  		OTP_INFO(256, 3, 0x1000, 0x1000) },
> -- 
> 2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
