Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56971C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:42:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D77208C3
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 22:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GrLeja4E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D77208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PB3Y17knqh/fGVaQCviZJyaA0+/uH7mW4ui/5SZmLL4=; b=GrLeja4Era1esF
	tH1w7uzypS9QvnrsY/sIp/4/+yUg2WatlMWcDLI0STQsaQhRUQ+fKXfkCvLjF+ATXwXbeNcHuaILJ
	JrNNZ4GWvBNTs8/B1rzh+DLAfySSaGJOIMoFEizXvM2exj1PG7f9EJujgecgsESL7V4kWLv/c0KZv
	LUH7b70B8rIs0FgFum7VVwj9e/dUFdBcbDQ+FAOpMTuzyXFPIaWNZafV2DBZ5uQ2PgKpzqboiw81t
	yND4UUCprYXuyuDTK8s12Koo5dGHCO6qTjRC5knfGBh0AItrh1NM7CIhYX0jpaBaavswT2dreiZl9
	nhYNFiM31bfVX/rlVBQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdiGs-00062L-SR; Tue, 26 May 2020 22:42:06 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdiGq-00061c-1M
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 22:42:05 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5904C2A3607;
 Tue, 26 May 2020 23:42:02 +0100 (BST)
Date: Wed, 27 May 2020 00:41:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [RESEND v5 05/21] mtd: rawnand: Return an enum from
 of_get_nand_ecc_algo()
Message-ID: <20200527004159.0a8e29a6@collabora.com>
In-Reply-To: <20200526195633.11543-6-miquel.raynal@bootlin.com>
References: <20200526195633.11543-1-miquel.raynal@bootlin.com>
 <20200526195633.11543-6-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_154204_207142_4D151EAC 
X-CRM114-Status: GOOD (  18.10  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:56:17 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> There is an enumeration to list ECC algorithm, let's use it instead of
> returning an int.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 35 +++++++++++++++++---------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 7176e513a0bb..a756f3193558 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -5048,17 +5048,20 @@ static const char * const nand_ecc_algos[] = {
>  	[NAND_ECC_RS]		= "rs",
>  };
>  
> -static int of_get_nand_ecc_algo(struct device_node *np)
> +static enum nand_ecc_algo of_get_nand_ecc_algo(struct device_node *np)
>  {
> +	enum nand_ecc_algo ecc_algo;
>  	const char *pm;
> -	int err, i;
> +	int err;
>  
>  	err = of_property_read_string(np, "nand-ecc-algo", &pm);
>  	if (!err) {
> -		for (i = NAND_ECC_HAMMING; i < ARRAY_SIZE(nand_ecc_algos); i++)
> -			if (!strcasecmp(pm, nand_ecc_algos[i]))
> -				return i;
> -		return -ENODEV;
> +		for (ecc_algo = NAND_ECC_HAMMING;
> +		     ecc_algo < ARRAY_SIZE(nand_ecc_algos);
> +		     ecc_algo++) {
> +			if (!strcasecmp(pm, nand_ecc_algos[ecc_algo]))
> +				return ecc_algo;
> +		}
>  	}
>  
>  	/*
> @@ -5066,15 +5069,14 @@ static int of_get_nand_ecc_algo(struct device_node *np)
>  	 * for some obsoleted values that were specifying ECC algorithm.
>  	 */
>  	err = of_property_read_string(np, "nand-ecc-mode", &pm);
> -	if (err < 0)
> -		return err;
> +	if (!err) {
> +		if (!strcasecmp(pm, "soft"))
> +			return NAND_ECC_HAMMING;
> +		else if (!strcasecmp(pm, "soft_bch"))
> +			return NAND_ECC_BCH;
> +	}
>  
> -	if (!strcasecmp(pm, "soft"))
> -		return NAND_ECC_HAMMING;
> -	else if (!strcasecmp(pm, "soft_bch"))
> -		return NAND_ECC_BCH;
> -
> -	return -ENODEV;
> +	return NAND_ECC_UNKNOWN;
>  }
>  
>  static int of_get_nand_ecc_step_size(struct device_node *np)
> @@ -5119,7 +5121,8 @@ static bool of_get_nand_on_flash_bbt(struct device_node *np)
>  static int nand_dt_init(struct nand_chip *chip)
>  {
>  	struct device_node *dn = nand_get_flash_node(chip);
> -	int ecc_mode, ecc_algo, ecc_strength, ecc_step;
> +	enum nand_ecc_algo ecc_algo;
> +	int ecc_mode, ecc_strength, ecc_step;
>  
>  	if (!dn)
>  		return 0;
> @@ -5141,7 +5144,7 @@ static int nand_dt_init(struct nand_chip *chip)
>  	if (ecc_mode >= 0)
>  		chip->ecc.mode = ecc_mode;
>  
> -	if (ecc_algo >= 0)
> +	if (ecc_algo != NAND_ECC_UNKNOWN)
>  		chip->ecc.algo = ecc_algo;
>  
>  	if (ecc_strength >= 0)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
