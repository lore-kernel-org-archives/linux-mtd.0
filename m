Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A86B3C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 817E320674
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 17:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDiFp7aJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="Lp1Rd+uW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 817E320674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HYwpsh+tS1hDr/0EbDZ09xx0MtMU4rtrP5FRa5RFY6k=; b=iDiFp7aJJlTZRhL5XmVIM8EkQ
	capkFrv70DhS/67+XnYcx/DUaeVgYcNUusNgTVyvfgb5tp29TnTtCC7zYAoIAztQj5WsAmjyM63Qs
	Ovrt6nkp8umzfEF5EFpbwkWcfcKdz/9jQ/fszov1N0iE0PNS/jLpdBkfYBrGxMXQ3l/gOrgTBoOed
	J9yjxKZ9Emc3PYrPepWN6ZY65rxNngyFKmVBSxyLE38PB/8Fsoxm7wCtv+1WOpHzEW22Tmm3JyNfe
	W0dIsq9w7xhGnNPWNjXYsJQATXvvr7P38DRaOWoETj9TfYmlZE9aWzDhbuph+gY3TNI8pRV+HdwPN
	90VbXWBxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jajuC-0003BI-3M; Mon, 18 May 2020 17:50:24 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaju8-0003Aq-QE
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 17:50:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1589824215; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=choxfgjwtTJ2J7hkuR0GL31Fmrhpxg0imC0yJxk9Svo=;
 b=Lp1Rd+uWKTTYBGH0NgRJ8zXVEq0E6+NKIT5Ubi4+F8FqHiG6OS5aE/FiTURz6Ts5g6kb/E
 4DbYm1vqKOL4OLVjXDk0+Pumk1BgCWk4buPRKI3Ap06oUYygYUr3x6B7/pAySnxuYlYDS7
 jqRIYW3i/tGH2R34Aiv/wZ2n77l8dSM=
Date: Mon, 18 May 2020 19:50:04 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Convert the driver to exec_op()
To: Boris Brezillon <boris.brezillon@collabora.com>
Message-Id: <G7GJAQ.0VIFSQUDMC9H2@crapouillou.net>
In-Reply-To: <20200518165640.312220-1-boris.brezillon@collabora.com>
References: <20200518165640.312220-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_105021_245931_12383E2F 
X-CRM114-Status: GOOD (  16.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harveyhuntnexus@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Le lun. 18 mai 2020 =E0 18:56, Boris Brezillon =

<boris.brezillon@collabora.com> a =E9crit :
> Let's convert the driver to exec_op() to have one less driver relying
> on the legacy interface.

Great work, thanks for that.

However it does not work :( nand_scan() returns error -145.

- Paul


> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   | 136 =

> ++++++++++--------
>  1 file changed, 80 insertions(+), 56 deletions(-)
> =

> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c =

> b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> index e7bd845fdbf5..dcecd54af20b 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -27,9 +27,6 @@
> =

>  #define DRV_NAME	"ingenic-nand"
> =

> -/* Command delay when there is no R/B pin. */
> -#define RB_DELAY_US	100
> -
>  struct jz_soc_info {
>  	unsigned long data_offset;
>  	unsigned long addr_offset;
> @@ -49,7 +46,6 @@ struct ingenic_nfc {
>  	struct nand_controller controller;
>  	unsigned int num_banks;
>  	struct list_head chips;
> -	int selected;
>  	struct ingenic_nand_cs cs[];
>  };
> =

> @@ -142,51 +138,6 @@ static const struct mtd_ooblayout_ops =

> jz4725b_ooblayout_ops =3D {
>  	.free =3D jz4725b_ooblayout_free,
>  };
> =

> -static void ingenic_nand_select_chip(struct nand_chip *chip, int =

> chipnr)
> -{
> -	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> -	struct ingenic_nfc *nfc =3D to_ingenic_nfc(nand->chip.controller);
> -	struct ingenic_nand_cs *cs;
> -
> -	/* Ensure the currently selected chip is deasserted. */
> -	if (chipnr =3D=3D -1 && nfc->selected >=3D 0) {
> -		cs =3D &nfc->cs[nfc->selected];
> -		jz4780_nemc_assert(nfc->dev, cs->bank, false);
> -	}
> -
> -	nfc->selected =3D chipnr;
> -}
> -
> -static void ingenic_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
> -				  unsigned int ctrl)
> -{
> -	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> -	struct ingenic_nfc *nfc =3D to_ingenic_nfc(nand->chip.controller);
> -	struct ingenic_nand_cs *cs;
> -
> -	if (WARN_ON(nfc->selected < 0))
> -		return;
> -
> -	cs =3D &nfc->cs[nfc->selected];
> -
> -	jz4780_nemc_assert(nfc->dev, cs->bank, ctrl & NAND_NCE);
> -
> -	if (cmd =3D=3D NAND_CMD_NONE)
> -		return;
> -
> -	if (ctrl & NAND_ALE)
> -		writeb(cmd, cs->base + nfc->soc_info->addr_offset);
> -	else if (ctrl & NAND_CLE)
> -		writeb(cmd, cs->base + nfc->soc_info->cmd_offset);
> -}
> -
> -static int ingenic_nand_dev_ready(struct nand_chip *chip)
> -{
> -	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> -
> -	return !gpiod_get_value_cansleep(nand->busy_gpio);
> -}
> -
>  static void ingenic_nand_ecc_hwctl(struct nand_chip *chip, int mode)
>  {
>  	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> @@ -298,8 +249,88 @@ static int ingenic_nand_attach_chip(struct =

> nand_chip *chip)
>  	return 0;
>  }
> =

> +static int ingenic_nand_exec_instr(struct nand_chip *chip,
> +				   struct ingenic_nand_cs *cs,
> +				   const struct nand_op_instr *instr)
> +{
> +	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> +	struct ingenic_nfc *nfc =3D to_ingenic_nfc(chip->controller);
> +	unsigned int i;
> +
> +	switch (instr->type) {
> +	case NAND_OP_CMD_INSTR:
> +		writeb(instr->ctx.cmd.opcode,
> +		       cs->base + nfc->soc_info->cmd_offset);
> +		return 0;
> +	case NAND_OP_ADDR_INSTR:
> +		for (i =3D 0; i < instr->ctx.addr.naddrs; i++)
> +			writeb(instr->ctx.addr.addrs[i],
> +			       cs->base + nfc->soc_info->cmd_offset);
> +		return 0;
> +	case NAND_OP_DATA_IN_INSTR:
> +		if (instr->ctx.data.force_8bit ||
> +		    !(chip->options & NAND_BUSWIDTH_16))
> +			ioread8_rep(cs->base + nfc->soc_info->data_offset,
> +				    instr->ctx.data.buf.in,
> +				    instr->ctx.data.len);
> +		else
> +			ioread16_rep(cs->base + nfc->soc_info->data_offset,
> +				     instr->ctx.data.buf.in,
> +				     instr->ctx.data.len);
> +		return 0;
> +	case NAND_OP_DATA_OUT_INSTR:
> +		if (instr->ctx.data.force_8bit ||
> +		    !(chip->options & NAND_BUSWIDTH_16))
> +			iowrite8_rep(cs->base + nfc->soc_info->data_offset,
> +				     instr->ctx.data.buf.out,
> +				     instr->ctx.data.len);
> +		else
> +			iowrite16_rep(cs->base + nfc->soc_info->data_offset,
> +				      instr->ctx.data.buf.out,
> +				      instr->ctx.data.len);
> +		return 0;
> +	case NAND_OP_WAITRDY_INSTR:
> +		if (!nand->busy_gpio)
> +			return nand_soft_waitrdy(chip,
> +						 instr->ctx.waitrdy.timeout_ms);
> +
> +		return nand_gpio_waitrdy(chip, nand->busy_gpio,
> +					 instr->ctx.waitrdy.timeout_ms);
> +	default:
> +		break;
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static int ingenic_nand_exec_op(struct nand_chip *chip,
> +				const struct nand_operation *op,
> +				bool check_only)
> +{
> +	struct ingenic_nand *nand =3D to_ingenic_nand(nand_to_mtd(chip));
> +	struct ingenic_nfc *nfc =3D to_ingenic_nfc(nand->chip.controller);
> +	struct ingenic_nand_cs *cs;
> +	unsigned int i;
> +	int ret =3D 0;
> +
> +	if (check_only)
> +		return 0;
> +
> +	cs =3D &nfc->cs[op->cs];
> +	jz4780_nemc_assert(nfc->dev, cs->bank, true);
> +	for (i =3D 0; i < op->ninstrs; i++) {
> +		ret =3D ingenic_nand_exec_instr(chip, cs, &op->instrs[i]);
> +		if (ret)
> +			break;
> +	}
> +	jz4780_nemc_assert(nfc->dev, cs->bank, false);
> +
> +	return ret;
> +}
> +
>  static const struct nand_controller_ops ingenic_nand_controller_ops =

> =3D {
>  	.attach_chip =3D ingenic_nand_attach_chip,
> +	.exec_op =3D ingenic_nand_exec_op,
>  };
> =

>  static int ingenic_nand_init_chip(struct platform_device *pdev,
> @@ -339,8 +370,6 @@ static int ingenic_nand_init_chip(struct =

> platform_device *pdev,
>  		ret =3D PTR_ERR(nand->busy_gpio);
>  		dev_err(dev, "failed to request busy GPIO: %d\n", ret);
>  		return ret;
> -	} else if (nand->busy_gpio) {
> -		nand->chip.legacy.dev_ready =3D ingenic_nand_dev_ready;
>  	}
> =

>  	nand->wp_gpio =3D devm_gpiod_get_optional(dev, "wp", GPIOD_OUT_LOW);
> @@ -359,12 +388,7 @@ static int ingenic_nand_init_chip(struct =

> platform_device *pdev,
>  		return -ENOMEM;
>  	mtd->dev.parent =3D dev;
> =

> -	chip->legacy.IO_ADDR_R =3D cs->base + nfc->soc_info->data_offset;
> -	chip->legacy.IO_ADDR_W =3D cs->base + nfc->soc_info->data_offset;
> -	chip->legacy.chip_delay =3D RB_DELAY_US;
>  	chip->options =3D NAND_NO_SUBPAGE_WRITE;
> -	chip->legacy.select_chip =3D ingenic_nand_select_chip;
> -	chip->legacy.cmd_ctrl =3D ingenic_nand_cmd_ctrl;
>  	chip->ecc.mode =3D NAND_ECC_HW;
>  	chip->controller =3D &nfc->controller;
>  	nand_set_flash_node(chip, np);
> --
> 2.25.4
> =




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
