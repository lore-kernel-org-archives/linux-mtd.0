Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ECEC43387
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:27:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA13C20823
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 08:27:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sw+oaN5+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fuu1sJ8e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA13C20823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPy5GEt5Lx09fhJc3gAef294jglLshPK8XKIS/cFmKg=; b=sw+oaN5+9mcDCk
	ZuHrTH6xfwpqvwdFyNQHptUd8bTpyPKQE1bMfKaU+PPA6BREtCMuKyVO8MWBQPfEDSn3PeQDuBnPG
	sCBZyZ8Kf6W3jxga8C9QsosvaKYNims7kuphbj68OYpWyRBJSugY8HBeZ0l/LVdKNYGrLMESXUDw8
	GE/jkNKIZUMeW6rONCFuw2D/teb9mDSAc18Wf3m88SqxbznJw7JcVBWO3eq6N23aLOue+u/MC+uwV
	a4aU5jtP5Y2pLCEZQ4mD8Q/J85svz8p5l4i6R9l/0b4K85LSVIo38pCowTHrI9zqgeOk9rJKKvcs7
	cIUPpR2Q2qvvYjjVLs8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkPVK-0007C5-M9; Fri, 18 Jan 2019 08:27:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkPUc-0006SS-9B
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 08:27:23 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6B1C2087E;
 Fri, 18 Jan 2019 08:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547800029;
 bh=YcQaC4KFmcrUUhdlDPZXzh5YuwmNVmg5BMnMczBl5ns=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fuu1sJ8eIHlNHmopJlyGNumnHw7m4UopHbCkGFwaUvh0ES6tL3UVCQVn1lUEUJULS
 DdQAUtyfyl2xb2DebxkQEXN4H5YmT1Sfb6JKKTpRQDeojIQXolqSk7xOHf5xg37g91
 WNgPuBvXf4Ewd1ZXKrHlhtr+R7sVll3ClUM6l+Bw=
Date: Fri, 18 Jan 2019 09:26:57 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 4/8] mtd: rawnand: jz4780: Add support for the JZ4725B
Message-ID: <20190118092657.0293b819@bbrezillon>
In-Reply-To: <20190118010634.27399-4-paul@crapouillou.net>
References: <20190118010634.27399-1-paul@crapouillou.net>
 <20190118010634.27399-4-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_002710_684312_9F22D4E5 
X-CRM114-Status: GOOD (  22.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 linux-mips@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Paul Burton <paul.burton@mips.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Harvey Hunt <harveyhuntnexus@gmail.com>,
 James Hogan <jhogan@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 17 Jan 2019 22:06:30 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add support for probing the jz4780-nand driver on the JZ4725B SoC from
> Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Reviewed-by: Boris Brezillon <bbrezillon@kernel.org>

BTW, if you have some time, maybe you could convert this driver to
->exec_op() ;-).

> ---
>  drivers/mtd/nand/raw/jz4780_nand.c | 39 +++++++++++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/jz4780_nand.c b/drivers/mtd/nand/raw/jz4780_nand.c
> index 7f55358b860f..cf24bf12884f 100644
> --- a/drivers/mtd/nand/raw/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/jz4780_nand.c
> @@ -13,6 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
> @@ -26,13 +27,15 @@
>  
>  #define DRV_NAME	"jz4780-nand"
>  
> -#define OFFSET_DATA	0x00000000
> -#define OFFSET_CMD	0x00400000
> -#define OFFSET_ADDR	0x00800000
> -
>  /* Command delay when there is no R/B pin. */
>  #define RB_DELAY_US	100
>  
> +struct jz_soc_info {
> +	unsigned long data_offset;
> +	unsigned long addr_offset;
> +	unsigned long cmd_offset;
> +};
> +
>  struct jz4780_nand_cs {
>  	unsigned int bank;
>  	void __iomem *base;
> @@ -40,6 +43,7 @@ struct jz4780_nand_cs {
>  
>  struct jz4780_nand_controller {
>  	struct device *dev;
> +	const struct jz_soc_info *soc_info;
>  	struct jz4780_bch *bch;
>  	struct nand_controller controller;
>  	unsigned int num_banks;
> @@ -101,9 +105,9 @@ static void jz4780_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
>  		return;
>  
>  	if (ctrl & NAND_ALE)
> -		writeb(cmd, cs->base + OFFSET_ADDR);
> +		writeb(cmd, cs->base + nfc->soc_info->addr_offset);
>  	else if (ctrl & NAND_CLE)
> -		writeb(cmd, cs->base + OFFSET_CMD);
> +		writeb(cmd, cs->base + nfc->soc_info->cmd_offset);
>  }
>  
>  static int jz4780_nand_dev_ready(struct nand_chip *chip)
> @@ -272,8 +276,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
>  		return -ENOMEM;
>  	mtd->dev.parent = dev;
>  
> -	chip->legacy.IO_ADDR_R = cs->base + OFFSET_DATA;
> -	chip->legacy.IO_ADDR_W = cs->base + OFFSET_DATA;
> +	chip->legacy.IO_ADDR_R = cs->base + nfc->soc_info->data_offset;
> +	chip->legacy.IO_ADDR_W = cs->base + nfc->soc_info->data_offset;
>  	chip->legacy.chip_delay = RB_DELAY_US;
>  	chip->options = NAND_NO_SUBPAGE_WRITE;
>  	chip->legacy.select_chip = jz4780_nand_select_chip;
> @@ -353,6 +357,10 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!nfc)
>  		return -ENOMEM;
>  
> +	nfc->soc_info = device_get_match_data(dev);
> +	if (!nfc->soc_info)
> +		return -EINVAL;
> +
>  	/*
>  	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
>  	 * having to call it again if the BCH driver returns -EPROBE_DEFER.
> @@ -390,8 +398,21 @@ static int jz4780_nand_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct jz_soc_info jz4725b_soc_info = {
> +	.data_offset = 0x00000000,
> +	.cmd_offset  = 0x00008000,
> +	.addr_offset = 0x00010000,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info = {
> +	.data_offset = 0x00000000,
> +	.cmd_offset  = 0x00400000,
> +	.addr_offset = 0x00800000,
> +};
> +
>  static const struct of_device_id jz4780_nand_dt_match[] = {
> -	{ .compatible = "ingenic,jz4780-nand" },
> +	{ .compatible = "ingenic,jz4725b-nand", .data = &jz4725b_soc_info },
> +	{ .compatible = "ingenic,jz4780-nand",  .data = &jz4780_soc_info  },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
