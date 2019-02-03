Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A833C169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ED492082E
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LHpBarmf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pv0fyfyd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0ED492082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yje08csBp8vggr4u8/l5axFKUWnfC+DTYv3eGh4IzNk=; b=LHpBarmfSgGNji
	AU1MtTNaMMC2JiQA5jz0dnjZMZgQac4nmVqI8Rg9QURkmhZPEQAdRUs0ynz2exmfYngacFaACFfYN
	oBYv/DyvGFVX9TaxUNgN9BePxlG0f/CNm0zgtScLC5p/ZPBT1arbxhgfyqXUt2Jld0yl1agLyNknI
	+1WpvRa8hj0F0A8asg4vMOiOI+pmXZjWFxRvOcbHWPSdyifnzD6Cr5QWhAV/bCdNbeZz43AaJ7e4v
	p4Diram7xmoAHz8QMgtIEVnPz8eMTU0r5ZvsJ5tzSj8CV6RuqFGD9FSv5BuZQgId44Be+iDt7rH32
	ypvu0naw/NqIvoExoN1A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqCG7-0003SS-Rq; Sun, 03 Feb 2019 07:32:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqCG4-0003S3-Lz
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 07:32:06 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 03C4C2082E;
 Sun,  3 Feb 2019 07:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549179124;
 bh=E1li+sR43opcyj9fXWSnngJTEKssSfRWXqVMq/94hrA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pv0fyfydRWJCTqbCNBXLb5JBvoL9a93TiOt/pVlh+uE+FaWJvV6qLsQMn9y0t0P2T
 kIMDMYJEAsyd0ubChCV34LvyqUR2ZW18LbG6AkPS4B+uUBIR9Gj+73RMhHmugkJspE
 Eybybs0Xzfbe4NHgfZaDHILE8KceCr60A8Y7Ug3k=
Date: Sun, 3 Feb 2019 08:31:51 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 4/9] mtd: rawnand: jz4780: Add support for the JZ4740
Message-ID: <20190203083151.4fc29c5b@bbrezillon>
In-Reply-To: <20190202231926.2444-5-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-5-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_233204_751357_5A83BFE8 
X-CRM114-Status: GOOD (  28.03  )
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
 Mathieu Malaterre <malat@debian.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Harvey Hunt <harveyhuntnexus@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat,  2 Feb 2019 20:19:21 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> Add support for probing the jz4780-nand driver on the JZ4740 SoC from
> Ingenic.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: - Add support for the JZ4740 and not the JZ4725B: they behave the
>       same, and JZ4740 is fully upstream while JZ4725B is not. The
>       JZ4725B devicetree will then simply use the "ingenic,jz4740-nand"
>       compatible string.
>     - Fix the number of bytes for the ECC when the ECC strength is 4.
>       This is needed for the JZ4740, which uses Reed-Solomon instead of
>       BCH.
> 
>  drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 48 +++++++++++++++++-----

If we're going to make the driver compatible with jz4740 and jz4725b
maybe we should rename the source files jz47xx_{nand,bch}.{c,h}.

>  1 file changed, 37 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> index 7f55358b860f..c0855fef7735 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
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
> @@ -161,8 +165,13 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
>  	struct jz4780_nand_controller *nfc = to_jz4780_nand_controller(chip->controller);
>  	int eccbytes;
>  
> -	chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
> -				(chip->ecc.strength / 8);
> +	if (chip->ecc.strength == 4) {
> +		/* JZ4740 uses 9 bytes of ECC to correct maximum 4 errors */
> +		chip->ecc.bytes = 9;
> +	} else {
> +		chip->ecc.bytes = fls((1 + 8) * chip->ecc.size)	*
> +				  (chip->ecc.strength / 8);
> +	}
>  
>  	switch (chip->ecc.mode) {
>  	case NAND_ECC_HW:
> @@ -272,8 +281,8 @@ static int jz4780_nand_init_chip(struct platform_device *pdev,
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
> @@ -353,6 +362,10 @@ static int jz4780_nand_probe(struct platform_device *pdev)
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
> @@ -390,8 +403,21 @@ static int jz4780_nand_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct jz_soc_info jz4740_soc_info = {
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
> +	{ .compatible = "ingenic,jz4740-nand", .data = &jz4740_soc_info },
> +	{ .compatible = "ingenic,jz4780-nand",  .data = &jz4780_soc_info  },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, jz4780_nand_dt_match);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
