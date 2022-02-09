Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D03C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 13:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=16ujmERO604FnCxxTmZhcIrp+CIpknNjg1vdssUvcak=; b=a1kMaGHJMfpZHd
	otelCfQnQ339wG2Ur1SE3JGAJ6t3F9cC8XvZFxh+mrEACq/URJWSOwbe9Of3b0/DrHTSwulhZ5YnC
	2Ray+kp+j9zTnv/gD2jcjA/MQaF+QmCy+P6DSk8LBnOKEV2ItI+/L54d9AdTG/QbrMoJVhAxxOU4/
	w0qrtm+Wm6tmy0Scf/oSNfkhLNa8a6ELum0idTKOBGhk4q2FWI3UloBZXAiCKtvfzMFGSpT8SKtCS
	sZ5kLVyBYjk3o8QNbvryakAM4eBDnjMrSwtM0rXTZFtDEcDgenf+kWQ4gChyJaVjGMbu0fxG1EQ3Q
	i+yVn71aPltSlPd3o8JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHnUk-000Gwb-Ln; Wed, 09 Feb 2022 13:58:55 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHnTb-000Gfr-W5; Wed, 09 Feb 2022 13:57:45 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 219DvWhp089321;
 Wed, 9 Feb 2022 07:57:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1644415052;
 bh=jxddzgNLxfzab2xprizNnScG5AWpvmxEJHYxmwSkVig=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=GMHdpFYdXP11sxsf0bJT9PhT3V73dfhVft+SzClUDU+PQbHtRA4x9cMGwYs993jpz
 vNh/Jn1xvCS9z46kvI4wfZX5xYucOmhZgsrLYkhpOUshsntZAAwvV7MYLet5pXX5Id
 HCzL5lkPJ29e4uqte55TcXwDY+YP3IGXxc461ku0=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 219DvW5n129065
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Feb 2022 07:57:32 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 9
 Feb 2022 07:57:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 9 Feb 2022 07:57:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 219DvWd8115406;
 Wed, 9 Feb 2022 07:57:32 -0600
Date: Wed, 9 Feb 2022 07:57:32 -0600
From: Nishanth Menon <nm@ti.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <rogerq@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 <linux-arm-kernel@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Uwe
 =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] mtd/memory: omap: Fix build dependencies
Message-ID: <20220209135732.fig35edxzgwdgugd@those>
References: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220127105652.1063624-1-miquel.raynal@bootlin.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_055744_169456_457D7BBB 
X-CRM114-Status: GOOD (  24.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 11:56-20220127, Miquel Raynal wrote:
> The Omap2 raw NAND controller (MTD_NAND_OMAP2) selects the Omap memory
> controller (OMAP_GPMC) for the ARCH_K3 platforms and for compile
> testing.
> =

> The Omap memory controller (OMAP_GPMC) depends on OF_ADDRESS because the
> driver uses of_address_to_resource().
> =

> This may produce the following warning:
> WARNING: unmet direct dependencies detected for OMAP_GPMC
> Depends on [n]:
>   - MEMORY [=3Dy] && OF_ADDRESS [=3Dn]
> Selected by [m]:
>   - MTD_NAND_OMAP2 [=3Dm] && MTD [=3Dm] && MTD_RAW_NAND [=3Dm] &&
>     (ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3 || COMPILE_TEST [=3Dy]) &&
>     HAS_IOMEM [=3Dy]
> =

> As the of_address_to_resource() helper has a dummy implementation
> returning an error when OF_ADDRESS is not selected, we do not need to
> select OF_ADDRESS from the OMAP_GPMC Kconfig menu for compile testing
> purposes. Nor we actually do for K3 platforms, but in order to not break
> these platforms we can just select OF_ADDRESS from ARCH_K3 directly.
> =

> Fixes: dbcb124acebd ("mtd: rawnand: omap2: Select GPMC device driver for =
ARCH_K3")
> Reported-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Suggested-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 +
>  drivers/memory/Kconfig       | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 7d5d58800170..1a0d4b575b95 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -123,6 +123,7 @@ config ARCH_K3
>  	select TI_SCI_INTR_IRQCHIP
>  	select TI_SCI_INTA_IRQCHIP
>  	select TI_K3_SOCINFO
> +	select OF_ADDRESS

I understand the build failure, but, I don't see any other SoC selecting
OF_ADDRESS because a driver has a problem?


>  	help
>  	  This enables support for Texas Instruments' K3 multicore SoC
>  	  architecture.
> diff --git a/drivers/memory/Kconfig b/drivers/memory/Kconfig
> index 30bff6cb1b8d..241f0925cbf1 100644
> --- a/drivers/memory/Kconfig
> +++ b/drivers/memory/Kconfig
> @@ -104,7 +104,6 @@ config TI_EMIF
>  =

>  config OMAP_GPMC
>  	bool "Texas Instruments OMAP SoC GPMC driver" if COMPILE_TEST
> -	depends on OF_ADDRESS

Thoughts Roger?
>  	select GPIOLIB
>  	help
>  	  This driver is for the General Purpose Memory Controller (GPMC)
> -- =

> 2.27.0
> =

> =

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- =

Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
