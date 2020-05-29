Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A1CAC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:37:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA2D206A4
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:37:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YV/N/qwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA2D206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uer8waGshdvZHd2ji9YnRb6qZ6FqaHdDTp5PVWIt/WA=; b=YV/N/qwe/PJk7U
	u4d6nmyhZbiFei2LMpSDJlhn6JBwkwkJtJ0bjBWnHiHryQ87PKTZBxKgGdV+65jho7dVgCjemDo+H
	Ml6dO1oSZDM/UuAXuGkYHh7IDm4roaYjchg+gQ3RDhClkRJK8Xdu6L7FGhlDKzGJ9hT9ap2Uoe6PA
	Pk5aOQovs+RZG1UUUD5Z+9dyP7tZlwakkhhTemf2o8+2p1jbKF44ejTdpSTH1AXJA+WBstBdI7G8T
	4058qt3lVvNGJxdZU5I+Z0Ehxu/K3dRh9wnRT+j5xOGRRHou7Q5dqvDg/i8EOo2k+yq46EHkm8y6e
	6LPt8hjMsX0i6eWN7hdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedK3-00028f-BS; Fri, 29 May 2020 11:37:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedK0-00027e-Qm
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:37:10 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7F10A2A44A2;
 Fri, 29 May 2020 12:37:07 +0100 (BST)
Date: Fri, 29 May 2020 13:37:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 28/28] mtd: rawnand: Allocate the interface
 configurations dynamically
Message-ID: <20200529133704.757ac63d@collabora.com>
In-Reply-To: <20200529111322.7184-29-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-29-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_043709_135071_02227C03 
X-CRM114-Status: GOOD (  30.97  )
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

On Fri, 29 May 2020 13:13:22 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Instead of manipulating the statically allocated structure and copy
> timings around, allocate one at identification time and save it in the
> nand_chip structure once it has been initialized.
> 
> All NAND chips using the same interface configuration during reset and
> startup, we define a helper to retrieve a single reset interface
> configuration object, shared across all NAND chips.
> 
> We use a second pointer to always have a reference on the currently
> applied interface configuration, which may either point to the "best
> interface configuration" or to the "default reset interface
> configuration".
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c    | 59 +++++++++++++++++++----------
>  drivers/mtd/nand/raw/nand_timings.c |  6 +++
>  include/linux/mtd/rawnand.h         | 14 +++++--
>  3 files changed, 56 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 753328f106c1..9912a3afa1c9 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -928,9 +928,9 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
>  	 * timings to timing mode 0.
>  	 */
>  
> -	onfi_fill_interface_config(chip, &chip->interface_config,
> -				   NAND_SDR_IFACE, 0);
> -	ret = ops->setup_interface(chip, chipnr, &chip->interface_config);
> +	chip->current_interface_config = nand_get_reset_interface();
> +	ret = ops->setup_interface(chip, chipnr,
> +				   chip->current_interface_config);
>  	if (ret)
>  		pr_err("Failed to configure data interface to SDR timing mode 0\n");
>  
> @@ -949,7 +949,8 @@ static int nand_reset_interface(struct nand_chip *chip, int chipnr)
>   */
>  static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  {
> -	u8 mode = chip->interface_config.timings.mode;
> +	const struct nand_controller_ops *ops = chip->controller->ops;
> +	u8 mode = chip->best_interface_config->timings.mode;
>  	u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] = { mode, };
>  	int ret;
>  
> @@ -967,14 +968,13 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  	}
>  
>  	/* Change the mode on the controller side */
> -	ret = chip->controller->ops->setup_interface(chip, chipnr,
> -						     &chip->interface_config);
> +	ret = ops->setup_interface(chip, chipnr, chip->best_interface_config);
>  	if (ret)
>  		return ret;
>  
>  	/* Check the mode has been accepted by the chip, if supported */
>  	if (!nand_supports_get_features(chip, ONFI_FEATURE_ADDR_TIMING_MODE))
> -		return 0;
> +		goto update_interface_config;
>  
>  	memset(tmode_param, 0, ONFI_SUBFEATURE_PARAM_LEN);
>  	nand_select_target(chip, chipnr);
> @@ -990,6 +990,9 @@ static int nand_setup_interface(struct nand_chip *chip, int chipnr)
>  		goto err_reset_chip;
>  	}
>  
> +update_interface_config:
> +	chip->current_interface_config = chip->best_interface_config;
> +
>  	return 0;
>  
>  err_reset_chip:
> @@ -1031,8 +1034,10 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		/* Verify the controller supports the requested interface */
>  		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
>  					   iface);
> -		if (!ret)
> +		if (!ret) {
> +			chip->best_interface_config = iface;
>  			return ret;
> +		}
>  
>  		/* Fallback to slower modes */
>  		best_mode = iface->timings.mode;
> @@ -1046,9 +1051,11 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		ret = ops->setup_interface(chip, NAND_DATA_IFACE_CHECK_ONLY,
>  					   iface);
>  		if (!ret)
> -			return 0;
> +			break;
>  	}
>  
> +	chip->best_interface_config = iface;
> +
>  	return 0;
>  }
>  
> @@ -1067,15 +1074,25 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>   */
>  static int nand_choose_interface_config(struct nand_chip *chip)
>  {
> +	struct nand_interface_config *iface;
> +	int ret;
> +
>  	if (!nand_controller_can_setup_interface(chip))
>  		return 0;
>  
> +	iface = kzalloc(sizeof(*iface), GFP_KERNEL);
> +	if (!iface)
> +		return -ENOMEM;
> +
>  	if (chip->ops.choose_interface_config)
> -		return chip->ops.choose_interface_config(chip,
> -							 &chip->interface_config);
> +		ret = chip->ops.choose_interface_config(chip, iface);
> +	else
> +		ret = nand_choose_best_sdr_timings(chip, iface, NULL);
>  
> -	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
> -					    NULL);
> +	if (ret)
> +		kfree(iface);
> +
> +	return ret;
>  }
>  
>  /**
> @@ -2501,7 +2518,6 @@ EXPORT_SYMBOL_GPL(nand_subop_get_data_len);
>   */
>  int nand_reset(struct nand_chip *chip, int chipnr)
>  {
> -	struct nand_interface_config saved_intf_config = chip->interface_config;
>  	int ret;
>  
>  	ret = nand_reset_interface(chip, chipnr);
> @@ -2526,11 +2542,9 @@ int nand_reset(struct nand_chip *chip, int chipnr)
>  	 * nand_setup_interface() uses ->set/get_features() which would
>  	 * fail anyway as the parameter page is not available yet.
>  	 */
> -	if (!memcmp(&chip->interface_config, &saved_intf_config,
> -		    sizeof(saved_intf_config)))
> +	if (!chip->best_interface_config)
>  		return 0;
>  
> -	chip->interface_config = saved_intf_config;
>  	ret = nand_setup_interface(chip, chipnr);
>  	if (ret)
>  		return ret;
> @@ -5198,7 +5212,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  	mutex_init(&chip->lock);
>  
>  	/* Enforce the right timings for reset/detection */
> -	onfi_fill_interface_config(chip, &chip->interface_config, NAND_SDR_IFACE, 0);
> +	chip->current_interface_config = nand_get_reset_interface();
>  
>  	ret = nand_dt_init(chip);
>  	if (ret)
> @@ -5994,7 +6008,7 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	for (i = 0; i < nanddev_ntargets(&chip->base); i++) {
>  		ret = nand_setup_interface(chip, i);
>  		if (ret)
> -			goto err_nanddev_cleanup;
> +			goto err_free_interface_config;
>  	}
>  
>  	/* Check, if we should skip the bad block table scan */
> @@ -6004,10 +6018,12 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	/* Build bad block table */
>  	ret = nand_create_bbt(chip);
>  	if (ret)
> -		goto err_nanddev_cleanup;
> +		goto err_free_interface_config;
>  
>  	return 0;
>  
> +err_free_interface_config:
> +	kfree(chip->best_interface_config);
>  
>  err_nanddev_cleanup:
>  	nanddev_cleanup(&chip->base);
> @@ -6101,6 +6117,9 @@ void nand_cleanup(struct nand_chip *chip)
>  			& NAND_BBT_DYNAMICSTRUCT)
>  		kfree(chip->badblock_pattern);
>  
> +	/* Free the data interface */
> +	kfree(chip->best_interface_config);
> +
>  	/* Free manufacturer priv data. */
>  	nand_manufacturer_cleanup(chip);
>  
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 1e22006c79ba..d999f48ca105 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -292,6 +292,12 @@ static const struct nand_interface_config onfi_sdr_timings[] = {
>  	},
>  };
>  
> +/* All NAND chips share the same reset data interface: SDR mode 0 */
> +const struct nand_interface_config *nand_get_reset_interface(void)
> +{
> +	return &onfi_sdr_timings[0];
> +}
> +
>  /**
>   * onfi_find_closest_sdr_mode - Derive the closest ONFI SDR timing mode given a
>   *                              set of timings
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index a2427c67d38b..219086e56d76 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1069,7 +1069,11 @@ struct nand_manufacturer {
>   * @options: Various chip options. They can partly be set to inform nand_scan
>   *           about special functionality. See the defines for further
>   *           explanation.
> - * @interface_config: NAND interface timing information
> + * @current_interface_config: The currently used NAND interface configuration
> + * @best_interface_config: The best NAND interface configuration which fits both
> + *                         the NAND chip and NAND controller constraints. If
> + *                         unset, the default reset interface configuration must
> + *                         be used.
>   * @bbt_erase_shift: Number of address bits in a bbt entry
>   * @bbt_options: Bad block table specific options. All options used here must
>   *               come from bbm.h. By default, these options will be copied to
> @@ -1116,7 +1120,8 @@ struct nand_chip {
>  	unsigned int options;
>  
>  	/* Data interface */
> -	struct nand_interface_config interface_config;
> +	const struct nand_interface_config *current_interface_config;
> +	struct nand_interface_config *best_interface_config;
>  
>  	/* Bad block information */
>  	unsigned int bbt_erase_shift;
> @@ -1201,6 +1206,9 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  	return mtd_get_of_node(nand_to_mtd(chip));
>  }
>  
> +/* Default/reset data interface */
> +const struct nand_interface_config *nand_get_reset_interface(void);

nand_get_reset_interface_config(), and I'm not sure you need to
expose that one. I'd expect it to be used only by the core.

> +
>  /**
>   * nand_get_interface_config - Retrieve the current interface configuration
>   *                             of a NAND chip
> @@ -1209,7 +1217,7 @@ static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
>  static inline const struct nand_interface_config *
>  nand_get_interface_config(struct nand_chip *chip)
>  {
> -	return &chip->interface_config;
> +	return chip->current_interface_config;
>  }
>  
>  /*


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
