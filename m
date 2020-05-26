Return-Path: <SRS0=PBLV=7I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A753C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1983A20888
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2020 21:50:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f7h773bx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1983A20888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KcaGU1giRoPH7Oyp2/R/cZlv+zG8nl2NgGtliX2Oscw=; b=f7h773bxeFdnCD
	vgyTh/46fD9ugd9hFBJYsKH1FpHzgkZtLU1eqd7BVIPEhcpLId+i5AMUN5onFz2GWR/1GEXUKH+9E
	8fhOL+qOJeJ03jzkpk1bvm1YB9Vu/vbfRuKy5CYHIFFxqp516j44w74CB/9KpSVD8/xHaOCmPacmU
	v3xU2hO3bb0LaHQNDEX9cK3xwzAcJVQcv1S5GE9ZIq7gudurf5NpebqqbC6FheegHUhTcwVH7PsV6
	LRfLhc1QAzPlGL16B4h/QwluRhY5SY9QbU2khf2wVhMyl54+peMIRha8pTIwoYt/atAybApShjXxe
	QA0nka8SRhtYX5wWsm2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdhSg-0006iG-9H; Tue, 26 May 2020 21:50:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdhSd-0005xv-47
 for linux-mtd@lists.infradead.org; Tue, 26 May 2020 21:50:13 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DE7B52A2CCF;
 Tue, 26 May 2020 22:50:05 +0100 (BST)
Date: Tue, 26 May 2020 23:50:03 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v5 21/28] mtd: rawnand: Introduce
 nand_choose_best_sdr_timings()
Message-ID: <20200526235003.5bb0ba91@collabora.com>
In-Reply-To: <20200526191725.7591-22-miquel.raynal@bootlin.com>
References: <20200526191725.7591-1-miquel.raynal@bootlin.com>
 <20200526191725.7591-22-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_145011_439748_B126E784 
X-CRM114-Status: GOOD (  28.74  )
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
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 26 May 2020 21:17:18 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Extract the logic out of nand_choose_data_interface() to create a
> public helper that can be reused by manufacturer drivers. Add the
> possibility to provide a specific set of timings.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h |   3 +
>  drivers/mtd/nand/raw/nand_base.c | 104 +++++++++++++++++++------------
>  2 files changed, 66 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index c7357ae86eeb..5c49c4d1e231 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -90,6 +90,9 @@ int onfi_fill_data_interface(struct nand_chip *chip,
>  			     int timing_mode);
>  unsigned int
>  onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
> +int nand_choose_best_sdr_timings(struct nand_chip *chip,
> +				 struct nand_data_interface *iface,
> +				 struct nand_sdr_timings *spec_timings);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_set_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
>  int nand_read_page_raw_notsupp(struct nand_chip *chip, u8 *buf,
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 6a7edd2e1357..b2e833a8ab9d 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1003,61 +1003,83 @@ static int nand_setup_data_interface(struct nand_chip *chip, int chipnr)
>  	return ret;
>  }
>  
> +/**
> + * nand_choose_best_sdr_timings - Pick up the best SDR timings that both the
> + *                                NAND controller and the NAND chip support
> + * @chip: the NAND chip
> + * @iface: the data interface (can eventually be updated)
> + * @spec_timings: specific timings, when not fitting the ONFI specification
> + *
> + * If specific timings are provided, use them. Otherwise, try to retrieve
> + * supported timing modes from ONFI information. Finally, if the NAND chip does
> + * not follow the ONFI specification, rely on the ->default_timing_mode
> + * specified in the nand_ids table.
> + */
> +int nand_choose_best_sdr_timings(struct nand_chip *chip,
> +				 struct nand_data_interface *iface,
> +				 struct nand_sdr_timings *spec_timings)
> +{
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	int best_mode = 0, onfi_modes, mode, ret;
> +
> +	iface->type = NAND_SDR_IFACE;
> +
> +	if (spec_timings) {
> +		iface->timings.sdr = *spec_timings;
> +		iface->timings.mode = onfi_find_closest_sdr_mode(spec_timings);
> +
> +		/* Verify the controller supports the requested interface */
> +		ret = ops->setup_data_interface(chip,
> +						NAND_DATA_IFACE_CHECK_ONLY,
> +						iface);
> +		if (!ret)
> +			return ret;
> +
> +		/* Fallback to slower modes */
> +		best_mode = iface->timings.mode;
> +	} else {
> +		if (chip->parameters.onfi) {

onfi_modes var should be declared here.

> +			onfi_modes = chip->parameters.onfi->async_timing_mode;
> +			best_mode = fls(onfi_modes) - 1;
> +		} else {
> +			best_mode = chip->onfi_timing_mode_default;
> +		}
> +	}
> +
> +
> +	for (mode = best_mode; mode >= 0; mode--) {
> +		ret = onfi_fill_data_interface(chip, iface, NAND_SDR_IFACE,
> +					       mode);
> +		if (ret)
> +			continue;

In practice onfi_fill_data_interface() will only return an error if you
pass a type that's not SDR (not the case here, or a mode that's outside
the SDR mode bounds). Maybe we should just clamp the value/warn when
that happens and make onfi_fill_data_interface() a void function.

> +
> +		ret = ops->setup_data_interface(chip,
> +						NAND_DATA_IFACE_CHECK_ONLY,
> +						iface);
> +		if (!ret)
> +			break;

			return 0;

> +	}
> +
> +	return 0;
> +}
> +
>  /**
>   * nand_choose_data_interface - find the best data interface and timings
>   * @chip: The NAND chip
>   *
>   * Find the best data interface and NAND timings supported by the chip
>   * and the driver.
> - * First tries to retrieve supported timing modes from ONFI information,
> - * and if the NAND chip does not support ONFI, relies on the
> - * ->onfi_timing_mode_default specified in the nand_ids table. After this
> - * function nand_chip->data_interface is initialized with the best timing mode
> - * available.
> + * After this function nand_chip->data_interface is initialized with the best
> + * timing mode available.
>   *
>   * Returns 0 for success or negative error code otherwise.
>   */
>  static int nand_choose_data_interface(struct nand_chip *chip)
>  {
> -	int modes, mode, ret;
> -
>  	if (!nand_controller_has_setup_data_iface(chip))
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
> -			chip->onfi_timing_mode_default = mode;
> -			break;
> -		}
> -	}
> -
> -	return 0;
> +	return nand_choose_best_sdr_timings(chip, &chip->data_interface, NULL);
>  }
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
