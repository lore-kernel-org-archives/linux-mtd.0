Return-Path: <SRS0=velq=QK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D7AC169C4
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:22:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B0C02084A
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Feb 2019 07:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bepwwQ6F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBMwKNRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B0C02084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DtBaoYAVs9UanYocDUZoJ7YN8CutTxzi0obb/VYaog=; b=bepwwQ6F+75Vhl
	dMgEtWWNJFtelbx3Rs7KKoAlJ2Ewk9kLkq/cUvGeLONmtMiRwX+8HXzw00qnmaqX9FrS3KdAgUc18
	VzLuu4z+p8wouWUydR3pbN07HOwDNk51joTi3L25/yr70p+9yqVv2VgRnQU0sULqfSYX28CD8gXtD
	r18WSy83dkZlumPTj7Y2I/eUbpv8lqF0j8BMzaGfK/pXefQhE7L0SbK21oCGkN4bDMhRrApuNAUR0
	xbSK4qzKmd3rtCvk9AxBTfLSCH6XHs07wim0Qobck+lYMZ55hBmRs9JxI+t5gOan7iPggw+cLcBe3
	VyPTHOThENRvLppxtvwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqC6Y-0000Fl-9Y; Sun, 03 Feb 2019 07:22:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqC6V-0000FH-70
 for linux-mtd@lists.infradead.org; Sun, 03 Feb 2019 07:22:12 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 40A5C2084A;
 Sun,  3 Feb 2019 07:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549178530;
 bh=gHloOzVHPPKiRq0SgesrRgOpATymhPMRTzMqZ3qMGYA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IBMwKNRNgvzUdDCZxNJG+M1b4FLMCOb252xyfrxE9mrPlC545O+3S80T/5+8NYF0F
 /SVBDovOG+q/JNJH0iL8qBzJPSFKE5iyQ15mxL4XwADSU4nkUr+1RIpvtFkZ4v2t8b
 yEAm0ZUf+9rVz+J1C0GD1ziWbTmAldBV1Ob2Z75M=
Date: Sun, 3 Feb 2019 08:21:58 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 5/9] mtd: rawnand: jz4780: Add ooblayout for the JZ4725B
Message-ID: <20190203082158.205b6e38@bbrezillon>
In-Reply-To: <20190202231926.2444-6-paul@crapouillou.net>
References: <20190202231926.2444-1-paul@crapouillou.net>
 <20190202231926.2444-6-paul@crapouillou.net>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_232211_287532_9AD3FFE2 
X-CRM114-Status: GOOD (  24.33  )
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

On Sat,  2 Feb 2019 20:19:22 -0300
Paul Cercueil <paul@crapouillou.net> wrote:

> The boot ROM of the JZ4725B SoC expects a specific OOB layout on the
> NAND.
> 
> Add an optional "ingenic,oob-layout" device property. When set to
> "ingenic,jz4725b", this specific OOB layout is used.

It's a SoC-specific layout, please add a compatible for ingenic,jz4725b
and use it to determine the layout to use.

> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Changes:
> 
> v2: Instead of forcing the OOB layout, leave it to the board code or
>     devicetree to decide if the jz4725b-specific layout should be used
>     or not.
> 
>  drivers/mtd/nand/raw/ingenic/jz4780_nand.c | 51 +++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> index c0855fef7735..baebb9a5c7c8 100644
> --- a/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> +++ b/drivers/mtd/nand/raw/ingenic/jz4780_nand.c
> @@ -44,6 +44,7 @@ struct jz4780_nand_cs {
>  struct jz4780_nand_controller {
>  	struct device *dev;
>  	const struct jz_soc_info *soc_info;
> +	const struct mtd_ooblayout_ops *oob_layout;
>  	struct jz4780_bch *bch;
>  	struct nand_controller controller;
>  	unsigned int num_banks;
> @@ -213,7 +214,7 @@ static int jz4780_nand_attach_chip(struct nand_chip *chip)
>  		return -EINVAL;
>  	}
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nfc->oob_layout);
>  
>  	return 0;
>  }
> @@ -345,11 +346,47 @@ static int jz4780_nand_init_chips(struct jz4780_nand_controller *nfc,
>  	return 0;
>  }
>  
> +static int jz4725b_ooblayout_ecc(struct mtd_info *mtd, int section,
> +				 struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = 3;
> +
> +	return 0;
> +}
> +
> +static int jz4725b_ooblayout_free(struct mtd_info *mtd, int section,
> +				  struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section)
> +		return -ERANGE;
> +
> +	oobregion->length = mtd->oobsize - ecc->total - 3;
> +	oobregion->offset = 3 + ecc->total;
> +
> +	return 0;
> +}
> +
> +const struct mtd_ooblayout_ops jz4725b_ooblayout_ops = {
> +	.ecc = jz4725b_ooblayout_ecc,
> +	.free = jz4725b_ooblayout_free,
> +};
> +
>  static int jz4780_nand_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	unsigned int num_banks;
>  	struct jz4780_nand_controller *nfc;
> +	const char *layout;
>  	int ret;
>  
>  	num_banks = jz4780_nemc_num_banks(dev);
> @@ -366,6 +403,18 @@ static int jz4780_nand_probe(struct platform_device *pdev)
>  	if (!nfc->soc_info)
>  		return -EINVAL;
>  
> +	nfc->oob_layout = &nand_ooblayout_lp_ops;
> +
> +	ret = device_property_read_string(dev, "ingenic,oob-layout", &layout);
> +	if (!ret) {
> +		if (!strcmp(layout, "ingenic,jz4725b")) {
> +			nfc->oob_layout  = &jz4725b_ooblayout_ops;
> +		} else {
> +			dev_err(dev, "Unrecognized OOB layout %s\n", layout);
> +			return -EINVAL;
> +		}
> +	}
> +
>  	/*
>  	 * Check for BCH HW before we call nand_scan_ident, to prevent us from
>  	 * having to call it again if the BCH driver returns -EPROBE_DEFER.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
