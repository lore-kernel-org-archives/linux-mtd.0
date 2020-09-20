Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD3EFC43463
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 12:23:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA0220EDD
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 12:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVgzkATl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkZphnNL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA0220EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nQq1oIT2/PDTZgIG6TDC0PlEjFG0Uji8+0+zlnTLZa0=; b=dVgzkATlkLBzzpFecgSzDJcsx
	aSgxUWoOxknBevmFChVkVOXeWeFmg72A5CMeHmNw7lIZ3gIhkl8ZuoHMhHjssHWZeGuwTwr27O0R2
	NNdMTzKeFuHpxt8x9XCeA9MKjkG8U+XUITlAoWu8YPr20trQqsGUNXEQKjP8s13ai/GKVFQnGzTp8
	YezwD4w4RGa3gZsd7myqxEvR/pcOco9zf3pxYBgIr+fTzTpxrwvUWUY6jR2dau94uMq/C4oVgbrns
	lvRCQEBAQdZ5wh3iRZFSuQGFbGH/ndfJHKT6I+reVKgYrxMS4Zkobz5gKhvlB6ZyF9v7U8hpJ6grt
	0880b0KaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJyLs-00062h-EJ; Sun, 20 Sep 2020 12:21:56 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJyLp-00062C-Ae
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 12:21:54 +0000
Received: by mail-lf1-x144.google.com with SMTP id x69so11031913lff.3
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c/tq4h6HVhMk4jxqz3D77f6e6QKvj8wb5Nh3AOfiW+s=;
 b=kkZphnNLqPhDK16jMSFug44bAhvcRzv7bj+GbAPOolhX7ktkjrU9ixVjZxCnT9Toqc
 dq3TrJSdYfUN905FU5sB0afkttJpJznhQ8N8Gnay/X7P0RnLiu143syfKIRlSFCYdG1I
 D23fEIQGwqZJmmzC6FQKzcJW6Rs7JeBKrVPtTedEYI2sagARG5ZJf66tlu2nBZATsEuc
 aTGUp2UYgk5+kIGa+4kxozanjzQQetrMPop5MzGjIwQEAnghfN1ZNW9VqPrOeiR7Gple
 7r+duiLqJWWp2VvZTrRhVs2IWStRfkB51qA/Xkz6pD0SX6fZcPKjLPNTIvDNjjPgZJbv
 nSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c/tq4h6HVhMk4jxqz3D77f6e6QKvj8wb5Nh3AOfiW+s=;
 b=Rys9IfkfM3MtGxyeseeexPlPxNkqw2BG1Wcm3xPXOFJ022kSZNDG1hKbMn5uquloTg
 K8hlolsBqr+Od4D5iumHnQsEgFF7xs67xP6r9ul9VjkVO/9v2u/Q/NGh93PeYDZs3OLf
 AVZsi5QUDF3pn5n1CCrgAcK0MOQpnCaVAUgxilnkrOI/5RcepLUmhTD5Itx6QEjkQu6p
 81rRTR72YO8HrrtqHXVKTi8Cng4sEpUGouI5gDhrnejCnQjVJdEAR7d6B9RokZJE6RAa
 o1K7M0J3zU3jGS2FvNFUztwTjl6RDRFh8DGGkQr7Gn0UNr9l5I86rfoIeTAp8RVg6Jt5
 WHPQ==
X-Gm-Message-State: AOAM532ctBeJq39jPgZqpfP+5/r7hgMTqXLgHwNymy8fVoFsj8CaKJXb
 ToNU6E9+j/ZRTMoxsR535II=
X-Google-Smtp-Source: ABdhPJxo53omewXtaxAt6TcjSmQcOwXTx6bd79G10jLNY+x97ShjV4JyfhidmQZ94VdXJ7n/g94YOA==
X-Received: by 2002:a19:e57:: with SMTP id 84mr15781838lfo.161.1600604506499; 
 Sun, 20 Sep 2020 05:21:46 -0700 (PDT)
Received: from z50.localnet (109241122244.gdansk.vectranet.pl.
 [109.241.122.244])
 by smtp.gmail.com with ESMTPSA id u17sm1815359lfi.2.2020.09.20.05.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 05:21:45 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v13 17/20] mtd: rawnand: Use the ECC framework OOB layouts
Date: Sun, 20 Sep 2020 14:21:44 +0200
Message-ID: <3339465.iIbC2pHGDl@z50>
In-Reply-To: <20200827085208.16276-18-miquel.raynal@bootlin.com>
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-18-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_082153_388905_825C1D01 
X-CRM114-Status: GOOD (  27.53  )
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thursday, August 27, 2020 10:52:05 A.M. CEST Miquel Raynal wrote:
> No need to have our own in the raw NAND core.

Hi Miquel,

This patch introduced a regression for me, at least on ams-delta which sets 
nand_chip->ecc.engine_type to NAND_ECC_ENGINE_TYPE_SOFT and 
nand_chip.ecc->algo to NAND_ECC_ALGO_HAMMING.  No related kernel messages 
could be observed, but nanddump fails with "pread: Numerical result out of 
range" for me.

The ECC framework OOB layouts refer to nand_device->ecc.ctx.total which no 
driver nor ECC engine initializes so far, while the old layouts used to refer 
to nand_chip->ecc.total, still initialized by nand_scan_tail().  Is there any 
work in progress which will address the issue (initialization of 
nand_device->ecc.ctx.total at least)?

Thanks,
Janusz

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/arasan-nand-controller.c |   2 +-
>  drivers/mtd/nand/raw/atmel/nand-controller.c  |   2 +-
>  drivers/mtd/nand/raw/davinci_nand.c           |   3 +-
>  .../mtd/nand/raw/ingenic/ingenic_nand_drv.c   |   6 +-
>  drivers/mtd/nand/raw/nand_base.c              | 171 +-----------------
>  drivers/mtd/nand/raw/nand_toshiba.c           |   2 +-
>  drivers/mtd/nand/raw/vf610_nfc.c              |   2 +-
>  include/linux/mtd/rawnand.h                   |   4 +-
>  8 files changed, 16 insertions(+), 176 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/arasan-nand-controller.c b/drivers/mtd/
nand/raw/arasan-nand-controller.c
> index 006bc3d3ce20..fbb4ea751be8 100644
> --- a/drivers/mtd/nand/raw/arasan-nand-controller.c
> +++ b/drivers/mtd/nand/raw/arasan-nand-controller.c
> @@ -980,7 +980,7 @@ static int anfc_init_hw_ecc_controller(struct arasan_nfc 
*nfc,
>  		return -EINVAL;
>  	}
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
>  
>  	ecc->steps = mtd->writesize / ecc->size;
>  	ecc->algo = NAND_ECC_ALGO_BCH;
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/
raw/atmel/nand-controller.c
> index 3d162fdc9ce2..7fcc5e67163e 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1108,7 +1108,7 @@ static int atmel_nand_pmecc_init(struct nand_chip 
*chip)
>  
>  	chip->options |= NAND_NO_SUBPAGE_WRITE;
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
>  
>  	return 0;
>  }
> diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/
davinci_nand.c
> index 58966a9706b1..427f320fb79b 100644
> --- a/drivers/mtd/nand/raw/davinci_nand.c
> +++ b/drivers/mtd/nand/raw/davinci_nand.c
> @@ -645,7 +645,8 @@ static int davinci_nand_attach_chip(struct nand_chip 
*chip)
>  				mtd_set_ooblayout(mtd,
>  						  
&hwecc4_small_ooblayout_ops);
>  			} else if (chunks == 4 || chunks == 8) {
> -				mtd_set_ooblayout(mtd, 
&nand_ooblayout_lp_ops);
> +				mtd_set_ooblayout(mtd,
> +						  
nand_get_large_page_ooblayout());
>  				info->chip.ecc.read_page = 
nand_davinci_read_page_hwecc_oob_first;
>  			} else {
>  				return -EIO;
> diff --git a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c b/drivers/mtd/
nand/raw/ingenic/ingenic_nand_drv.c
> index 70309f18124c..0e9d426fe4f2 100644
> --- a/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> +++ b/drivers/mtd/nand/raw/ingenic/ingenic_nand_drv.c
> @@ -243,8 +243,10 @@ static int ingenic_nand_attach_chip(struct nand_chip 
*chip)
>  	/* For legacy reasons we use a different layout on the qi,lb60 
board. */
>  	if (of_machine_is_compatible("qi,lb60"))
>  		mtd_set_ooblayout(mtd, &qi_lb60_ooblayout_ops);
> -	else
> +	else if (nfc->soc_info->oob_layout)
>  		mtd_set_ooblayout(mtd, nfc->soc_info->oob_layout);
> +	else
> +		mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
>  
>  	return 0;
>  }
> @@ -532,7 +534,6 @@ static const struct jz_soc_info jz4740_soc_info = {
>  	.data_offset = 0x00000000,
>  	.cmd_offset = 0x00008000,
>  	.addr_offset = 0x00010000,
> -	.oob_layout = &nand_ooblayout_lp_ops,
>  };
>  
>  static const struct jz_soc_info jz4725b_soc_info = {
> @@ -546,7 +547,6 @@ static const struct jz_soc_info jz4780_soc_info = {
>  	.data_offset = 0x00000000,
>  	.cmd_offset = 0x00400000,
>  	.addr_offset = 0x00800000,
> -	.oob_layout = &nand_ooblayout_lp_ops,
>  };
>  
>  static const struct of_device_id ingenic_nand_dt_match[] = {
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/
nand_base.c
> index b4ea831ecd85..77f60849dfb4 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -46,166 +46,6 @@
>  
>  #include "internals.h"
>  
> -/* Define default oob placement schemes for large and small page devices */
> -static int nand_ooblayout_ecc_sp(struct mtd_info *mtd, int section,
> -				 struct mtd_oob_region 
*oobregion)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -
> -	if (section > 1)
> -		return -ERANGE;
> -
> -	if (!section) {
> -		oobregion->offset = 0;
> -		if (mtd->oobsize == 16)
> -			oobregion->length = 4;
> -		else
> -			oobregion->length = 3;
> -	} else {
> -		if (mtd->oobsize == 8)
> -			return -ERANGE;
> -
> -		oobregion->offset = 6;
> -		oobregion->length = ecc->total - 4;
> -	}
> -
> -	return 0;
> -}
> -
> -static int nand_ooblayout_free_sp(struct mtd_info *mtd, int section,
> -				  struct mtd_oob_region 
*oobregion)
> -{
> -	if (section > 1)
> -		return -ERANGE;
> -
> -	if (mtd->oobsize == 16) {
> -		if (section)
> -			return -ERANGE;
> -
> -		oobregion->length = 8;
> -		oobregion->offset = 8;
> -	} else {
> -		oobregion->length = 2;
> -		if (!section)
> -			oobregion->offset = 3;
> -		else
> -			oobregion->offset = 6;
> -	}
> -
> -	return 0;
> -}
> -
> -const struct mtd_ooblayout_ops nand_ooblayout_sp_ops = {
> -	.ecc = nand_ooblayout_ecc_sp,
> -	.free = nand_ooblayout_free_sp,
> -};
> -EXPORT_SYMBOL_GPL(nand_ooblayout_sp_ops);
> -
> -static int nand_ooblayout_ecc_lp(struct mtd_info *mtd, int section,
> -				 struct mtd_oob_region 
*oobregion)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -
> -	if (section || !ecc->total)
> -		return -ERANGE;
> -
> -	oobregion->length = ecc->total;
> -	oobregion->offset = mtd->oobsize - oobregion->length;
> -
> -	return 0;
> -}
> -
> -static int nand_ooblayout_free_lp(struct mtd_info *mtd, int section,
> -				  struct mtd_oob_region 
*oobregion)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -
> -	if (section)
> -		return -ERANGE;
> -
> -	oobregion->length = mtd->oobsize - ecc->total - 2;
> -	oobregion->offset = 2;
> -
> -	return 0;
> -}
> -
> -const struct mtd_ooblayout_ops nand_ooblayout_lp_ops = {
> -	.ecc = nand_ooblayout_ecc_lp,
> -	.free = nand_ooblayout_free_lp,
> -};
> -EXPORT_SYMBOL_GPL(nand_ooblayout_lp_ops);
> -
> -/*
> - * Support the old "large page" layout used for 1-bit Hamming ECC where ECC
> - * are placed at a fixed offset.
> - */
> -static int nand_ooblayout_ecc_lp_hamming(struct mtd_info *mtd, int section,
> -					 struct mtd_oob_region 
*oobregion)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -
> -	if (section)
> -		return -ERANGE;
> -
> -	switch (mtd->oobsize) {
> -	case 64:
> -		oobregion->offset = 40;
> -		break;
> -	case 128:
> -		oobregion->offset = 80;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	oobregion->length = ecc->total;
> -	if (oobregion->offset + oobregion->length > mtd->oobsize)
> -		return -ERANGE;
> -
> -	return 0;
> -}
> -
> -static int nand_ooblayout_free_lp_hamming(struct mtd_info *mtd, int 
section,
> -					  struct 
mtd_oob_region *oobregion)
> -{
> -	struct nand_chip *chip = mtd_to_nand(mtd);
> -	struct nand_ecc_ctrl *ecc = &chip->ecc;
> -	int ecc_offset = 0;
> -
> -	if (section < 0 || section > 1)
> -		return -ERANGE;
> -
> -	switch (mtd->oobsize) {
> -	case 64:
> -		ecc_offset = 40;
> -		break;
> -	case 128:
> -		ecc_offset = 80;
> -		break;
> -	default:
> -		return -EINVAL;
> -	}
> -
> -	if (section == 0) {
> -		oobregion->offset = 2;
> -		oobregion->length = ecc_offset - 2;
> -	} else {
> -		oobregion->offset = ecc_offset + ecc->total;
> -		oobregion->length = mtd->oobsize - oobregion->offset;
> -	}
> -
> -	return 0;
> -}
> -
> -static const struct mtd_ooblayout_ops nand_ooblayout_lp_hamming_ops = {
> -	.ecc = nand_ooblayout_ecc_lp_hamming,
> -	.free = nand_ooblayout_free_lp_hamming,
> -};
> -
>  static int nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
>  				       struct mtd_pairing_info 
*info)
>  {
> @@ -5377,7 +5217,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip 
*chip)
>  				return -EINVAL;
>  			}
>  
> -			mtd_set_ooblayout(mtd, 
&nand_ooblayout_lp_ops);
> +			mtd_set_ooblayout(mtd, 
nand_get_large_page_ooblayout());
>  
>  		}
>  
> @@ -5386,7 +5226,7 @@ static int nand_set_ecc_soft_ops(struct nand_chip 
*chip)
>  		 * used, otherwise we don't know how many bytes can 
really be
>  		 * used.
>  		 */
> -		if (mtd->ooblayout == &nand_ooblayout_lp_ops &&
> +		if (mtd->ooblayout == nand_get_large_page_ooblayout() &&
>  		    ecc->options & NAND_ECC_MAXIMIZE) {
>  			int steps, bytes;
>  
> @@ -5788,11 +5628,12 @@ static int nand_scan_tail(struct nand_chip *chip)
>  		switch (mtd->oobsize) {
>  		case 8:
>  		case 16:
> -			mtd_set_ooblayout(mtd, 
&nand_ooblayout_sp_ops);
> +			mtd_set_ooblayout(mtd, 
nand_get_small_page_ooblayout());
>  			break;
>  		case 64:
>  		case 128:
> -			mtd_set_ooblayout(mtd, 
&nand_ooblayout_lp_hamming_ops);
> +			mtd_set_ooblayout(mtd,
> +					  
nand_get_large_page_hamming_ooblayout());
>  			break;
>  		default:
>  			/*
> @@ -5804,7 +5645,7 @@ static int nand_scan_tail(struct nand_chip *chip)
>  			 */
>  			if (ecc->engine_type == 
NAND_ECC_ENGINE_TYPE_NONE) {
>  				mtd_set_ooblayout(mtd,
> -						
&nand_ooblayout_lp_ops);
> +						  
nand_get_large_page_ooblayout());
>  				break;
>  			}
>  
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/
nand_toshiba.c
> index fb6662337b90..cf4f37959421 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -140,7 +140,7 @@ static void toshiba_nand_benand_init(struct nand_chip 
*chip)
>  
>  	chip->options |= NAND_SUBPAGE_READ;
>  
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
>  }
>  
>  static void toshiba_nand_decode_id(struct nand_chip *chip)
> diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/
vf610_nfc.c
> index 8ee2c1f539c4..50dc0c93140c 100644
> --- a/drivers/mtd/nand/raw/vf610_nfc.c
> +++ b/drivers/mtd/nand/raw/vf610_nfc.c
> @@ -779,7 +779,7 @@ static int vf610_nfc_attach_chip(struct nand_chip *chip)
>  		mtd->oobsize = 64;
>  
>  	/* Use default large page ECC layout defined in NAND core */
> -	mtd_set_ooblayout(mtd, &nand_ooblayout_lp_ops);
> +	mtd_set_ooblayout(mtd, nand_get_large_page_ooblayout());
>  	if (chip->ecc.strength == 32) {
>  		nfc->ecc_mode = ECC_60_BYTE;
>  		chip->ecc.bytes = 60;
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 967b616c50df..1bbce6fa1b08 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -14,6 +14,7 @@
>  #define __LINUX_MTD_RAWNAND_H
>  
>  #include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
>  #include <linux/mtd/flashchip.h>
>  #include <linux/mtd/bbm.h>
>  #include <linux/mtd/jedec.h>
> @@ -1156,9 +1157,6 @@ struct nand_chip {
>  	void *priv;
>  };
>  
> -extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;
> -extern const struct mtd_ooblayout_ops nand_ooblayout_lp_ops;
> -
>  static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
>  {
>  	return container_of(mtd, struct nand_chip, base.mtd);
> 





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
