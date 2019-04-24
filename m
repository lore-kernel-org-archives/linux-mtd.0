Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8882BC10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 22:14:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 530B420835
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 22:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oKVwwBDU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 530B420835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-mips.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=46zeyxTUh8VDT2qFp1R3tPY1vESZIiY52l58HBJQ5IE=; b=oKVwwBDULveRjP
	kFFEY5d5VNfatafc+W3sSTDV87/vlF5J7sgqpfNSUwsdQ3Kl4y+SfBEs0YCHw6gIHSzCpCAPGrXPc
	DAmpB4PmfPtRWF4FLuZf681+eFu9tgFHSFFVTVW2JYuNbTAo+8J7Aw6zcPpMuv3f3Tn2AYTCGzHb+
	WF4r6y6loKCcDvAEGdiU+kIg/aG5jA0h58aMTyPsv1q5dtKH/uAg/qD+vikpc/BYjZynN3ERiBPN+
	BZAm80EPuQpDOLN9YulXDbpbcHfS1tvgT8DGzwgpP/zO5v+V9+MVtr4m09Vk/7VV4+iPMbl/Yp+8F
	Z1ZBiXnHoWZs7Pn8pMLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJQA3-0000Yi-Mo; Wed, 24 Apr 2019 22:14:39 +0000
Received: from eddie.linux-mips.org ([148.251.95.138] helo=cvs.linux-mips.org)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJQ9z-0000XX-Nh; Wed, 24 Apr 2019 22:14:37 +0000
Received: (from localhost user: 'ladis' uid#1021 fake: STDIN
 (ladis@eddie.linux-mips.org)) by eddie.linux-mips.org
 id S23990768AbfDXWOaBmp1H (ORCPT
 <rfc822;linux-mtd@lists.infradead.org> + 1 other);
 Thu, 25 Apr 2019 00:14:30 +0200
Date: Thu, 25 Apr 2019 00:14:28 +0200
From: Ladislav Michl <ladis@linux-mips.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v3] mtd: rawnand: ams-delta: Drop board specific
 partition info
Message-ID: <20190424221428.GA4172@lenoch>
References: <20190324223344.24590-1-jmkrzyszt@gmail.com>
 <20190424180212.10830-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190424180212.10830-1-jmkrzyszt@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_151435_773493_8379D18E 
X-CRM114-Status: GOOD (  27.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Janusz,

On Wed, Apr 24, 2019 at 08:02:12PM +0200, Janusz Krzysztofik wrote:
> After recent modifications, only a hardcoded partition info makes
> the driver device specific.  Other than that, the driver uses GPIO
> exclusively and can be used on any hardware.
> 
> Drop the partition info and use MTD partition parser with default list
> of parser names instead.  For the OF parser to work correctly, pass
> device of_node to mtd.
> 
> Amstrad Delta users should append the following partition info to their
> kernel command line, possibly embedding it in CONFIG_CMDLINE:
> 
> mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),\
> 256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)

now, when driver is no longer Amstrad Delta specific, why would you want
to have ams-delta-nand hardcoded on kernel cmdline? I'm assuming at some
point this driver will become gpio-nand [*] or something like that and
asking users to change their kernel cmdline twice is just unwise :)

[*] btw, it is really shame gpio-nand name is already taken by driver
living in drivers/mtd/nand/raw/gpio.c which is more likely gpio-mem-nand
used by at least CompuLab CM-X255 and Picochip picoXcell.

Otherwise your work on this driver is so amazing that I just spent
couple of hours finding that phone and compiling some decent userspace
for it :) Thank you!

> For their convenience, that information is added to the board Kconfig
> entry help text, as well as CONFIG_MTD_CMDLINE_PARTS symbol is selected
> automatically from the board Kconfig entry if the NAND driver is also
> selected.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> ---
> Changelog:
> v2->v3:
> - add information on the requirement for passing partition info via
>   kernel command line to the board Kconfig entry help text
> v1->v2:
> - fix a typo poitned out by Aaro - thanks!
> - fix device_node not passed to OF parser via mtd_info
> - commit message reworded and reformatted a bit for better readability
> 
>  arch/arm/mach-omap1/Kconfig      |  7 ++++++-
>  drivers/mtd/nand/raw/ams-delta.c | 29 ++---------------------------
>  2 files changed, 8 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
> index c4694f26b5c4..41a47d251cac 100644
> --- a/arch/arm/mach-omap1/Kconfig
> +++ b/arch/arm/mach-omap1/Kconfig
> @@ -164,17 +164,22 @@ config MACH_NOKIA770
>  	  have such a device.
>  
>  config MACH_AMS_DELTA
> -	bool "Amstrad E3 (Delta)"
> +	bool "Amstrad E3 (Delta) - see help for important information"
>  	depends on ARCH_OMAP1 && ARCH_OMAP15XX
>  	select FIQ
>  	select GPIO_GENERIC_PLATFORM
>  	select LEDS_GPIO_REGISTER
>  	select REGULATOR
>  	select REGULATOR_FIXED_VOLTAGE
> +	select MTD_CMDLINE_PARTS if MTD_NAND_AMS_DELTA
>  	help
>  	  Support for the Amstrad E3 (codename Delta) videophone. Say Y here
>  	  if you have such a device.
>  
> +	  If you are using built-in NAND, append the following partition
> +	  info to kernel command line:
> +	  mtdparts=ams-delta-nand:3584k(Kernel),256k(u-boot),256k(u-boot_params),256k(Amstrad_LDR),27m(File_system),768k(PBL_reserved)
> +
>  config MACH_OMAP_GENERIC
>  	bool "Generic OMAP board"
>  	depends on ARCH_OMAP1 && (ARCH_OMAP15XX || ARCH_OMAP16XX)
> diff --git a/drivers/mtd/nand/raw/ams-delta.c b/drivers/mtd/nand/raw/ams-delta.c
> index 8312182088c1..e0f09179bbda 100644
> --- a/drivers/mtd/nand/raw/ams-delta.c
> +++ b/drivers/mtd/nand/raw/ams-delta.c
> @@ -41,31 +41,6 @@ struct ams_delta_nand {
>  	bool			data_in;
>  };
>  
> -/*
> - * Define partitions for flash devices
> - */
> -
> -static const struct mtd_partition partition_info[] = {
> -	{ .name		= "Kernel",
> -	  .offset	= 0,
> -	  .size		= 3 * SZ_1M + SZ_512K },
> -	{ .name		= "u-boot",
> -	  .offset	= 3 * SZ_1M + SZ_512K,
> -	  .size		= SZ_256K },
> -	{ .name		= "u-boot params",
> -	  .offset	= 3 * SZ_1M + SZ_512K + SZ_256K,
> -	  .size		= SZ_256K },
> -	{ .name		= "Amstrad LDR",
> -	  .offset	= 4 * SZ_1M,
> -	  .size		= SZ_256K },
> -	{ .name		= "File system",
> -	  .offset	= 4 * SZ_1M + 1 * SZ_256K,
> -	  .size		= 27 * SZ_1M },
> -	{ .name		= "PBL reserved",
> -	  .offset	= 32 * SZ_1M - 3 * SZ_256K,
> -	  .size		=  3 * SZ_256K },
> -};
> -
>  static void ams_delta_write_commit(struct ams_delta_nand *priv)
>  {
>  	gpiod_set_value(priv->gpiod_nwe, 0);
> @@ -238,6 +213,7 @@ static int ams_delta_init(struct platform_device *pdev)
>  	mtd->dev.parent = &pdev->dev;
>  
>  	nand_set_controller_data(this, priv);
> +	nand_set_flash_node(this, pdev->dev.of_node);
>  
>  	priv->gpiod_rdy = devm_gpiod_get_optional(&pdev->dev, "rdy", GPIOD_IN);
>  	if (IS_ERR(priv->gpiod_rdy)) {
> @@ -315,8 +291,7 @@ static int ams_delta_init(struct platform_device *pdev)
>  		return err;
>  
>  	/* Register the partitions */
> -	err = mtd_device_register(mtd, partition_info,
> -				  ARRAY_SIZE(partition_info));
> +	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
>  	if (err)
>  		goto err_nand_cleanup;
>  
> -- 
> 2.21.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
