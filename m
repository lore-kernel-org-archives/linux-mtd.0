Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0E00C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77212068D
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RD0xcks2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77212068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5QNqEauLG7+3H9yUHId4I+siM7OYWVH0brTnJmzMI8=; b=RD0xcks2TdLz2F
	rRc/nNrqnQ9ep/ZJh9rrX5pVyjjow3MPrKAiALoQzKObZngbQFEHiVI+AKCGDN6ilNcA1pMSEouIA
	EU2fQSwESB2TDQgk/vQrN3dy+XDvPDGbA00WUyBMBbCYfEus6Ni5tfAo9gpcTPNG6c8AshAApnA9W
	d131+ZjQwMpANWyoUTspUhkUM4bry82N7QC3Zrb9UyL4swoNGQyizh+z3MBRSKrA4nUMsXfvguqQi
	759syQql3ThCcfRQ+OJcvgBFuBgR94JVZEoBRy23cKdZL/vbgaOOzdjz09NF+M5uEzT5+mLBZYY/B
	xzPRgAgkhXJLD5VSJAfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdJ2Z-00056F-Aa; Mon, 25 May 2020 19:45:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdJ2W-00054a-9j
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 19:45:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 81DF12A17E7;
 Mon, 25 May 2020 20:45:34 +0100 (BST)
Date: Mon, 25 May 2020 21:45:30 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 17/19] mtd: rawnand: Introduce
 nand_choose_best_vendor_sdr_iface()
Message-ID: <20200525214530.16cd59c1@collabora.com>
In-Reply-To: <20200525174239.11349-18-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-18-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_124536_478610_001A2113 
X-CRM114-Status: GOOD (  21.01  )
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

On Mon, 25 May 2020 19:42:37 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This helper is here to simplify the life of NAND manufacturer drivers.
> 
> Manufacturers will be allowed to propose their own set of timings and,
> if they want, use this helper to:
> 1/ verify it is supported by the controller,
> 2/ fallback on a supported default ONFI mode, slower but still faster
>    than the default mode 0.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h |  2 ++
>  drivers/mtd/nand/raw/nand_base.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index ac103d8767be..9af6979257e2 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -89,6 +89,8 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode);
>  unsigned int onfi_find_equivalent_sdr_mode(const struct nand_sdr_timings *vendor_timings);
> +int nand_choose_best_vendor_sdr_iface(struct nand_chip * chip,
> +				      struct nand_data_interface *best_iface);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 15e10f045c9f..d9fe7795f183 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1078,6 +1078,33 @@ static int nand_choose_data_interface(struct nand_chip *chip)
>  	return nand_choose_best_sdr_iface(chip, &chip->data_interface);
>  }
>  
> +/**
> + * nand_choose_best_vendor_sdr_iface - given a set of timings, find the closest
> + *                                     mode/timings set for this interface
> + *                                     supported by both the NAND controller and
> + *                                     the NAND chip
> + * @chip: the NAND chip
> + * @best_iface: the best data interface (can eventually be updated)
> + */
> +int nand_choose_best_vendor_sdr_iface(struct nand_chip * chip,
> +				      struct nand_data_interface *best_iface)
> +{
> +	int ret;
> +
> +	/* Pick the closest mode */
> +	best_iface->timings.mode = onfi_find_equivalent_sdr_mode(&best_iface->timings.sdr);
> +
> +	/* Find the closest supported data interface */
> +	ret = nand_choose_best_sdr_iface(chip, best_iface);
> +	if (ret)
> +		return ret;
> +
> +	chip->data_interface = *best_iface;
> +
> +	return 0;
> +}

Can't we just merge nand_choose_best_vendor_sdr_iface() and
nand_choose_best_sdr_iface()?

int nand_choose_best_sdr_timings(struct nand_chip * chip,
				 struct nand_data_interface *iface,
				 const struct nand_sdr_timing *spec_timings)
{
	iface->type = SDR;

	if (spec_timings) {
		iface->timings.sdr = spec_timings;
		iface->timings.mode = onfi_find_closest_sdr_mode(spec_timings);
	} else {
		unsigned int best_mode;

		if (chip->parameters.onfi)
			best_mode = fls(chip->parameters.onfi->async_timing_mode) - 1;
		else
			best_mode = chip->default_timing_mode;

		onfi_fill_data_interface(chip, iface,
					  NAND_SDR_IFACE, best_mode);
	}

	/* Verify the controller supports the requested interface */
	ret = ops->setup_data_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
					iface);
	if (!ret)
		return ret;

	/* Fallback to slower modes */
	for (mode = best_iface->timings.mode - 1; mode >= 0; mode--) {
		ret = onfi_fill_data_interface(chip, iface,
					       NAND_SDR_IFACE, mode);
		if (ret)
			continue;

		ret = ops->setup_data_interface(chip,
						NAND_DATA_IFACE_CHECK_ONLY,
						iface);
		if (!ret)
			break;
	}

	return 0;
}

> +EXPORT_SYMBOL_GPL(nand_choose_best_vendor_sdr_iface);
> +
>  /**
>   * nand_fill_column_cycles - fill the column cycles of an address
>   * @chip: The NAND chip


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
