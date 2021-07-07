Return-Path: <SRS0=0Hpo=L7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78939C07E95
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 11:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44AE961C88
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jul 2021 11:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44AE961C88
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vY0n3uBB7BhM1p42sHpARxAoOdebXOEgZ5hoOxKE5C8=; b=dajy4YsI+eKXMSeCo60CCmOQpp
	CLGWC1qSRLiA1hsOZKnsHKljenGjfainiESnWIdGe9PJslkHRfhnGWchOyeGAar825moig6pMZAgk
	Jve+H4h5PR4XiJLtas7BjFN78Ub8/m7PE+33eSoqFqufppU7vdskL6ipz7Lj8VcwZJjXMEog9NtxV
	8RozstHX/5oxDcHVVYTpMMLorSKQ2FtpOTglEqHfA5sXxRb7w1kb3TnCD4XNcgv+TGmbcfXZBnXRr
	R0mZ6BtG3zjoaFP7YL1SXXiU9eSP1RfHqp1YlNMaOvbv0XVrz2BeRSWVXTCJGvDnPSTESNWdixut4
	WVY6uFjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m15mY-00EfNs-1g; Wed, 07 Jul 2021 11:31:58 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m15mU-00EfM8-VR
 for linux-mtd@lists.infradead.org; Wed, 07 Jul 2021 11:31:56 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B2D4122239;
 Wed,  7 Jul 2021 13:31:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625657510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ZkSO/jnFm2eNMsJZIihGEEoHvApT4t/5TAFIaDlWPQ=;
 b=QRICd7/tEKMmnydSGrR3nOBZsajiArNaSdb+ANhmm3P6QJoCrgiVjSIKB2VBy8EnSTgXSJ
 um/frCtugGLFzBvaoTTS1ypxYq12O0iEtpVmEycrtRvzAzrEvV2jPpeF1iApW37hwGqn30
 lW+L5arCklnx1bIr+mk35vPiA0gSuOg=
MIME-Version: 1.0
Date: Wed, 07 Jul 2021 13:31:49 +0200
From: Michael Walle <michael@walle.cc>
To: Steam Lin <lstfazz@gmail.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd:spi-nor:Update Winbond SPI NOR Flash device ID
In-Reply-To: <20210707101628.GA27472@pn10-Veriton-X4610>
References: <20210707101628.GA27472@pn10-Veriton-X4610>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <35c2e5faa770e228bd16a2186c8caf78@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_043155_219435_ABAA87A1 
X-CRM114-Status: GOOD (  16.01  )
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

Am 2021-07-07 12:16, schrieb Steam Lin:
> This patch is to update Winbond SPI NOR device
> ID information.
> Add new 3.3V and 1.8V device in the ID table.
> 
> Signed-off-by: Steam Lin <Stlin2@winbond.com>
> ---
>  drivers/mtd/spi-nor/winbond.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/winbond.c 
> b/drivers/mtd/spi-nor/winbond.c
> index 9a81c67a60c6..01aa49954793 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -102,6 +102,20 @@ static const struct flash_info winbond_parts[] = {
>  			    SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>  	{ "w25q512jvq", INFO(0xef4020, 0, 64 * 1024, 1024,
>  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25h512jvm", INFO(0xef9020, 0, 64 * 1024, 1024,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q01jvq", INFO(0xef4021, 0, 64 * 1024, 2048,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q02jvq", INFO(0xef4022, 0, 64 * 1024, 4096,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25h01jvm", INFO(0xef9021, 0, 64 * 1024, 2048,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25h02jvm", INFO(0xef9022, 0, 64 * 1024, 4096,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q512nwq", INFO(0xef6020, 0, 64 * 1024, 1024,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> +	{ "w25q512nwm", INFO(0xef8020, 0, 64 * 1024, 1024,
> +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
>  };

Nice to see patches from the vendor! Did you test these devices? We
only accept new IDs which are actually tested. And are you aware of any
ID collisions of these chips? Eg. sometimes the JWM reused the ID of the
FW variant. How can we distinguish these?

Also, you will have to supply SFDP data for all these chips, please have
a look at [1] how to do that.

[1] 
https://lore.kernel.org/linux-mtd/7038f037de3e224016d269324517400d@walle.cc/


-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
