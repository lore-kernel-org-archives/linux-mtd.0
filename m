Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18945C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA05D2068D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:47:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IVW/mfd7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA05D2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlZ1cvvYfq1t4skseZUhbXUL1ZAZo5dNka2JzOwMODA=; b=IVW/mfd7JgRd5J
	OKBxtx1uppbrx9jy8p8HxUJh4huFCMs/0tMPMfA9QN93fl6Ee7VVFR/Cw5S9RB4pT8v24e+vekGyQ
	1T785spZNG26HgisMzgBGGkHAv4+hN/1juTVQ1Y+csS91MhBPAMgtSy60GTNodbqXJ4poB9RzGLnP
	xe4FwinArKtmpYU2AZx0/1xeD2Y47+lNeXwkUbxpPVJ0ABJtig38nCCrmpt5UKhPzf+ErXLtUNUag
	fP21jqkXAzG3tHGRNohEoKoDA5fzcn3sKbCpCAYJNlDkDHsL6yWGxv1HCf1x4nixU7oFQ8QY8hHhW
	qkJresIs/eNBwxYWEdsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdJ4H-0005Xn-6D; Mon, 25 May 2020 19:47:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdJ4E-0005XF-C7
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 19:47:23 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 13A662A17E7;
 Mon, 25 May 2020 20:47:21 +0100 (BST)
Date: Mon, 25 May 2020 21:47:18 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 16/19] mtd: rawnand: Introduce
 nand_choose_best_sdr_iface()
Message-ID: <20200525214718.07a7a377@collabora.com>
In-Reply-To: <20200525174239.11349-17-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-17-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_124722_545487_34E736CC 
X-CRM114-Status: GOOD (  24.31  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 19:42:36 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Add a new helper: given a data interface with a specific set of
> timings, check with the controller if this interface can be
> supported. If not, fallback to the closest slower ONFI mode.
> 
> Extract this logic from nand_choose_data_interface() and use the new
> helper instead, so that this code can be reused later.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 74 ++++++++++++++++++++------------
>  1 file changed, 46 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 776f2d119bad..15e10f045c9f 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1004,6 +1004,42 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  	return ret;
>  }
>  
> +/**
> + * nand_choose_best_sdr_iface - given a data interface, find the closest
> + *                              mode/timings set for this interface supported
> + *                              by both the NAND controller and the NAND chip
> + * @chip: the NAND chip
> + * @best_iface: the best data interface (can eventually be updated)
> + */
> +static int nand_choose_best_sdr_iface(struct nand_chip *chip,
> +				      struct nand_data_interface *best_iface)

You're just choosing the timings here, not the interface
configuration (SDR/DDR+timings), so I'd recommend renaming this function
nand_choose_best_sdr_timings() and passing a nand_sdr_timings object.

> +{
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	int mode, ret;
> +
> +	/* Verify the controller supports the requested interface */
> +	ret = ops->setup_data_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
> +					best_iface);
> +	if (!ret)
> +		return ret;
> +
> +	/* Fallback to slower modes */
> +	for (mode = best_iface->timings.mode - 1; mode >= 0; mode--) {
> +		ret = onfi_fill_data_interface(chip, best_iface,
> +					       NAND_SDR_IFACE, mode);
> +		if (ret)
> +			continue;
> +
> +		ret = ops->setup_data_interface(chip,
> +						NAND_DATA_IFACE_CHECK_ONLY,
> +						best_iface);
> +		if (!ret)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * nand_choose_data_interface - find the best data interface and timings
>   * @chip: The NAND chip
> @@ -1019,7 +1055,7 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>   */
>  static int nand_choose_data_interface(struct nand_chip *chip)
>  {
> -	int modes, mode, ret;
> +	int best_mode, ret;
>  
>  	if (!nand_controller_has_setup_data_iface(chip))
>  		return 0;
> @@ -1029,35 +1065,17 @@ static int nand_choose_data_interface(struct nand_chip *chip)
>  	 * if the NAND does not support ONFI, fallback to the default ONFI
>  	 * timing mode.
>  	 */
> -	if (chip->parameters.onfi) {
> -		modes = chip->parameters.onfi->async_timing_mode;
> -	} else {
> -		if (!chip->default_timing_mode)
> -			return 0;
> +	if (chip->parameters.onfi)
> +		best_mode = fls(chip->parameters.onfi->async_timing_mode) - 1;
> +	else
> +		best_mode = chip->default_timing_mode;
>  
> -		modes = GENMASK(chip->default_timing_mode, 0);
> -	}
> +	ret = onfi_fill_data_interface(chip, &chip->data_interface,
> +				       NAND_SDR_IFACE, best_mode);
> +	if (ret)
> +		return ret;
>  
> -	for (mode = fls(modes) - 1; mode >= 0; mode--) {
> -		ret = onfi_fill_data_interface(chip, &chip->data_interface,
> -					       NAND_SDR_IFACE, mode);
> -		if (ret)
> -			continue;
> -
> -		/*
> -		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
> -		 * controller supports the requested timings.
> -		 */
> -		ret = chip->controller->ops->setup_data_interface(chip,
> -						 NAND_DATA_IFACE_CHECK_ONLY,
> -						 &chip->data_interface);
> -		if (!ret) {
> -			chip->default_timing_mode = mode;
> -			break;
> -		}
> -	}
> -
> -	return 0;
> +	return nand_choose_best_sdr_iface(chip, &chip->data_interface);
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
