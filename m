Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A226C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:30:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEE372074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:30:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nmMKQVrV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEE372074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vuoxGaGCqnNN0ijdpHF+dcde1eE3ijJRRsfetmUldPs=; b=nmMKQVrV0Wjx6e
	EgjT5k18eicyRT7rdaVkjzPINhBPKiVHY1cmwKwecQfc+0012OMfUR1fL48FIFZ9doavwxFi4+yyB
	kSoNjWCFGs0Pq3p4cntevS1viYYoPXVhZCbQyGMfv6KmnkExkWFRxi9m+V15Xl/+PGBWOjyrQR7sX
	uf0l4KWJa3MFRn+bMJ1d/SZzbj78cw0bhLR4kGt5Pv6fBYvsrXwvDXwnKrVqjZq6Fr1wt1QacN7C4
	EVHJL7WZg60Gnth6gaMlvVVcG6iWCLoeCFX+CQwrkd7pgdx4r+vuvo1poczO6Me06mNTsOuZkVZIi
	zRbT+Kcx9jblGq/smuog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedDG-0004s6-2o; Fri, 29 May 2020 11:30:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedDC-0003se-5S
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:30:08 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D60952A433F;
 Fri, 29 May 2020 12:30:04 +0100 (BST)
Date: Fri, 29 May 2020 13:30:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 21/28] mtd: rawnand: Introduce
 nand_choose_best_sdr_timings()
Message-ID: <20200529133001.434503a8@collabora.com>
In-Reply-To: <20200529111322.7184-22-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-22-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_043006_505918_03283D92 
X-CRM114-Status: GOOD (  25.99  )
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
Cc: Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 13:13:15 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Extract the logic out of nand_choose_interface() to create a

			   ^nand_choose_interface_config()

> public helper that can be reused by manufacturer drivers. Add the
> possibility to provide a specific set of timings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/internals.h |  3 +
>  drivers/mtd/nand/raw/nand_base.c | 95 ++++++++++++++++++++------------
>  2 files changed, 62 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 63c5af436901..5ebfbb89e572 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -90,6 +90,9 @@ void onfi_fill_interface_config(struct nand_chip *chip,
>  				unsigned int timing_mode);
>  unsigned int
>  onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
> +int nand_choose_best_sdr_timings(struct nand_chip *chip,
> +				 struct nand_interface_config *iface,
> +				 struct nand_sdr_timings *spec_timings);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 3bfd71d589cf..956a66fdccb8 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1005,6 +1005,63 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  	return ret;
>  }
>  
> +/**
> + * nand_choose_best_sdr_timings - Pick up the best SDR timings that both the
> + *                                NAND controller and the NAND chip support
> + * @chip: the NAND chip
> + * @iface: the interface configuration (can eventually be updated)
> + * @spec_timings: specific timings, when not fitting the ONFI specification
> + *
> + * If specific timings are provided, use them. Otherwise, try to retrieve
> + * supported timing modes from ONFI information. Finally, if the NAND chip does
> + * not follow the ONFI specification, rely on the ->default_timing_mode
> + * specified in the nand_ids table.
> + */
> +int nand_choose_best_sdr_timings(struct nand_chip *chip,
> +				 struct nand_interface_config *iface,
> +				 struct nand_sdr_timings *spec_timings)
> +{
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	int best_mode = 0, mode, ret;
> +
> +	iface->type = NAND_SDR_IFACE;
> +
> +	if (spec_timings) {
> +		iface->timings.sdr = *spec_timings;
> +		iface->timings.mode = onfi_find_closest_sdr_mode(spec_timings);
> +
> +		/* Verify the controller supports the requested interface */
> +		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
> +					   iface);
> +		if (!ret)
> +			return ret;
> +
> +		/* Fallback to slower modes */
> +		best_mode = iface->timings.mode;
> +	} else {
> +		if (chip->parameters.onfi) {
> +			unsigned int onfi_modes;
> +
> +			onfi_modes = chip->parameters.onfi->async_timing_mode;
> +			best_mode = fls(onfi_modes) - 1;
> +		} else {
> +			best_mode = chip->onfi_timing_mode_default;
> +		}
> +	}
> +
> +
> +	for (mode = best_mode; mode >= 0; mode--) {
> +		onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, mode);
> +
> +		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
> +					   iface);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * nand_choose_interface_config - find the best data interface and timings
>   * @chip: The NAND chip
> @@ -1016,48 +1073,14 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>   * ->onfi_timing_mode_default specified in the nand_ids table. After this
>   * function nand_chip->interface_ is initialized with the best timing mode
>   * available.
> - *
> - * Returns 0 for success or negative error code otherwise.
>   */
>  static int nand_choose_interface_config(struct nand_chip *chip)
>  {
> -	int modes, mode, ret;
> -
>  	if (!nand_controller_can_setup_interface(chip))
>  		return 0;
>  
> -	/*
> -	 * First try to identify the best timings from ONFI parameters and
> -	 * if the NAND does not support ONFI, fallback to the default ONFI
> -	 * timing mode.
> -	 */
> -	if (chip->parameters.onfi) {
> -		modes = chip->parameters.onfi->async_timing_mode;
> -	} else {
> -		if (!chip->onfi_timing_mode_default)
> -			return 0;
> -
> -		modes = GENMASK(chip->onfi_timing_mode_default, 0);
> -	}
> -
> -	for (mode = fls(modes) - 1; mode >= 0; mode--) {
> -		onfi_fill_interface_config(chip, &chip->interface_config,
> -					   NAND_SDR_IFACE, mode);
> -
> -		/*
> -		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
> -		 * controller supports the requested timings.
> -		 */
> -		ret = chip->controller->ops->setup_interface(chip,
> -						 NAND_DATA_IFACE_CHECK_ONLY,
> -						 &chip->interface_config);
> -		if (!ret) {
> -			chip->onfi_timing_mode_default = mode;
> -			break;
> -		}
> -	}
> -
> -	return 0;
> +	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
> +					    NULL);
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
