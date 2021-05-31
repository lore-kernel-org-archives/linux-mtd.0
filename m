Return-Path: <SRS0=sw+G=K2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A5BC4708F
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 07:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBB0F61278
	for <linux-mtd@archiver.kernel.org>; Mon, 31 May 2021 07:45:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBB0F61278
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ztzYVrXiPhS8EPYrel/6L2dI0kH/t4hgNtDut3Hus/c=; b=xFxeSVRvV8mdBP
	rS3AfIZ+wAApv3uaezIYvNNKn+Ckc0qRbjM0mlcUH1q722HhL1ap/l0+UKq6/YXn9H9TkYZ5YD67n
	+r5948rC8zSb85WbUAKg4fCeR80d0+25BYRymhMxviRgAPPPPDTtFyVH2DI5+rWir95nU6GvGqTTi
	QTXV5IaHIetTvWGG2Pj2z9Nm5mf4lPpGoUKI+lDz/bHqmf8I4kL6286QxdDE+3Yzm3reAf14VBr3r
	ukC63sVLH3HMCrArFpf0x3SVJ+WB+FAee4+tGc06kGQw2rs0fUjEQQUqNH/n+PsowQbxd9c9Jlz+S
	esc9/OcCJBQjH4X8D95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lncbK-00BGSt-20; Mon, 31 May 2021 07:44:42 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lncbF-00BGME-7x
 for linux-mtd@lists.infradead.org; Mon, 31 May 2021 07:44:40 +0000
Received: from mwalle01.fritz.box (ip4d17858c.dynamic.kabel-deutschland.de
 [77.23.133.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8FF7722205;
 Mon, 31 May 2021 09:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1622447070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aetr3CJLcVwBx8/n3/lNL4cKdU1lU4msQpJFawzHTUU=;
 b=HDGQGeCj9UJxgjKjWMjomZZAZF0j70f8VZjMU/ufIZvVq1HQ9USZMvd4xniyvWczLRfETR
 NzsVt1afhWxM42Ca7EWmgUeaO2wdCvjb/qPfWJ1dH9OPH4ICeuSpvn2I2TzesBaR4c7/m4
 Z3wojAVJWyNmSyFU42PGvDS0HG+HOUY=
From: Michael Walle <michael@walle.cc>
To: f.suligoi@asem.it
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, richard@nod.at, tudor.ambarus@microchip.com,
 vigneshr@ti.com, michael@walle.cc, Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v1] mtd: spi-nor: add ACPI support for non-JEDEC SPI-NOR
Date: Mon, 31 May 2021 09:44:24 +0200
Message-Id: <20210531074424.16086-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210126143748.1546187-1-f.suligoi@asem.it>
References: <20210126143748.1546187-1-f.suligoi@asem.it>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_004437_489781_494389C2 
X-CRM114-Status: GOOD (  23.45  )
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

> In a x86 machine, an additional device can be described
> inside the BIOS ACPI tables.
> For example, an I2C GPIO expander, a LED, etc.,
> can be successfully declared in ACPI, so that the related
> device driver can start automatically at the boot.
> 
> But for the SPI NOR devices, the ACPI description works
> for JEDEC-compatible devices only.
> 
> For example, an Everspin MR25H40 MRAM device (non-JEDEC
> compatible), declared using the following table,
> does not work:
> 
>     Scope (\_SB.SPI1)
>     {
>         Device (NVR0)
>         {
>             Name (_HID, "PRP0001")
>             Name (_DDN, "Everspin MR25H40 MRAM")
>             Name (_CRS, ResourceTemplate () {
>                 SpiSerialBus (
>                 1,                      // Chip select
>                 PolarityLow,            // Chip select is active low
>                 FourWireMode,           // Full duplex
>                 8,                      // Bits per word is 8 (byte)
>                 ControllerInitiated,    // Don't care
>                 10000000,               // 10 MHz
>                 ClockPolarityLow,       // SPI mode 0 ClockPolarityLow
>                 ClockPhaseFirst,        // SPI mode 0 ClockPhaseFirst
>                 "\\_SB.SPI1",           // SPI host controller
>                 0,                      // Must be 0
>                 ResourceConsumer,
>                 ,
>                 )
>             })
> 
>             Name (_DSD, Package () {
>                 ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
>                 Package () {
>                     Package () {"compatible", "mr25h40"},
>                 }
>             })
>         }
>     }

This isn't the correct compatible string, according to the devicetree
binding [1], there is no compatible = "mr25h40" binding. The correct entry
would be
 compatible = "everspin,mr25h40", "jedec,spi-nor";

I'm not familiar with ACPI and don't know wether you can specify a list,
nor am I convinced that it will work then. But it should be worth a try.

[1] Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

> 
> To enable the detection of a non-JEDEC device described
> in a BIOS ACPI table, it is necessary to add its id name
> in the spi_nor_of_table structure.
> With this change, all the SPI NOR devices (JEDEC and
> non-JEDEC) can be detected by the kernel (and the above
> example of ACPI table finally works).
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> ---
>  drivers/mtd/spi-nor/core.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 6ae7d4c2d2b6..b6fb8b15c439 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -3755,6 +3755,19 @@ static const struct of_device_id spi_nor_of_table[] = {
>  	 * JEDEC READ ID opcode (0x9F). Use this, if possible.
>  	 */
>  	{ .compatible = "jedec,spi-nor" },
> +	{ .compatible = "m25p05-nonjedec" },
> +	{ .compatible = "m25p10-nonjedec" },
> +	{ .compatible = "m25p20-nonjedec" },
> +	{ .compatible = "m25p40-nonjedec" },
> +	{ .compatible = "m25p80-nonjedec" },
> +	{ .compatible = "m25p16-nonjedec" },
> +	{ .compatible = "m25p32-nonjedec" },
> +	{ .compatible = "m25p64-nonjedec" },
> +	{ .compatible = "m25p128-nonjedec" },
> +	{ .compatible = "mr25h128" },
> +	{ .compatible = "mr25h256" },
> +	{ .compatible = "mr25h10" },
> +	{ .compatible = "mr25h40" },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, spi_nor_of_table);
> -- 
> 2.25.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
