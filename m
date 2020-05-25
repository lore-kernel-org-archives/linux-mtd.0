Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85046C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54DA52071C
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lfiBpuKm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54DA52071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TL/l5qw/fYj8lmSMY5mw16RMHmbNQtm/5D6uP1GKpMs=; b=lfiBpuKm0CKypC
	DTuoXWIjsjplkA1ZhKyw/HCcpXkKhMVNHptfYc9dP+YT9jD9mh6Q7gBdNFIOJw61DvN8lnLigtj27
	4aV0eJs50o7ocMiePEcLrPfR3mRXtWA94uFDeAu4W07jHGDzqBPeOrxpfYkWX7HIYxg52fKawx8GF
	h4pGTeZsl1pdHjz+kFzzCpCo81+e0nzOyqhB57k3DLS85ySCW1bzJ/rGJPIiOHT3TOgLGb2JQT/s2
	CMNAHmg3kB7ybfxEm/EOQmGLf8TLZg94OIruNkiLeV52RPIsMV5bag9nn5Vro8mJmMUTJlV7AJ2wc
	1nUCs6Y44efKt7Ton+FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdHyG-0004rW-0o; Mon, 25 May 2020 18:37:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdHyC-0004qc-II
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 18:37:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 514F32A02B5;
 Mon, 25 May 2020 19:37:03 +0100 (BST)
Date: Mon, 25 May 2020 20:37:00 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 03/19] mtd: rawnand: Create a nand_chip operations
 structure
Message-ID: <20200525203700.249af5a3@collabora.com>
In-Reply-To: <20200525174239.11349-4-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-4-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_113704_860503_F542D426 
X-CRM114-Status: GOOD (  26.26  )
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

On Mon, 25 May 2020 19:42:23 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> And move nand_chip hooks there.
> 
> While moving entries from one structure to the other, adapt the
> documentation style.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c     | 20 ++++++++---------
>  drivers/mtd/nand/raw/nand_hynix.c    |  2 +-
>  drivers/mtd/nand/raw/nand_macronix.c | 10 ++++-----
>  drivers/mtd/nand/raw/nand_micron.c   |  2 +-
>  include/linux/mtd/rawnand.h          | 32 ++++++++++++++++------------
>  5 files changed, 35 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 6a6a0a36b3fd..b86f641f6d74 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -3285,10 +3285,10 @@ static int nand_setup_read_retry(struct nand_chip *chip, int retry_mode)
>  	if (retry_mode >= chip->read_retries)
>  		return -EINVAL;
>  
> -	if (!chip->setup_read_retry)
> +	if (!chip->ops.setup_read_retry)
>  		return -EOPNOTSUPP;
>  
> -	return chip->setup_read_retry(chip, retry_mode);
> +	return chip->ops.setup_read_retry(chip, retry_mode);
>  }
>  
>  static void nand_wait_readrdy(struct nand_chip *chip)
> @@ -4532,8 +4532,8 @@ static int nand_suspend(struct mtd_info *mtd)
>  	int ret = 0;
>  
>  	mutex_lock(&chip->lock);
> -	if (chip->suspend)
> -		ret = chip->suspend(chip);
> +	if (chip->ops.suspend)
> +		ret = chip->ops.suspend(chip);
>  	if (!ret)
>  		chip->suspended = 1;
>  	mutex_unlock(&chip->lock);
> @@ -4551,8 +4551,8 @@ static void nand_resume(struct mtd_info *mtd)
>  
>  	mutex_lock(&chip->lock);
>  	if (chip->suspended) {
> -		if (chip->resume)
> -			chip->resume(chip);
> +		if (chip->ops.resume)
> +			chip->ops.resume(chip);
>  		chip->suspended = 0;
>  	} else {
>  		pr_err("%s called for a chip which is not in suspended state\n",
> @@ -4581,10 +4581,10 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	if (!chip->lock_area)
> +	if (!chip->ops.lock_area)
>  		return -ENOTSUPP;
>  
> -	return chip->lock_area(chip, ofs, len);
> +	return chip->ops.lock_area(chip, ofs, len);
>  }
>  
>  /**
> @@ -4597,10 +4597,10 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
>  {
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  
> -	if (!chip->unlock_area)
> +	if (!chip->ops.unlock_area)
>  		return -ENOTSUPP;
>  
> -	return chip->unlock_area(chip, ofs, len);
> +	return chip->ops.unlock_area(chip, ofs, len);
>  }
>  
>  /* Set default functions */
> diff --git a/drivers/mtd/nand/raw/nand_hynix.c b/drivers/mtd/nand/raw/nand_hynix.c
> index 7caedaa5b9e5..7d1be53f27f3 100644
> --- a/drivers/mtd/nand/raw/nand_hynix.c
> +++ b/drivers/mtd/nand/raw/nand_hynix.c
> @@ -337,7 +337,7 @@ static int hynix_mlc_1xnm_rr_init(struct nand_chip *chip,
>  	rr->nregs = nregs;
>  	rr->regs = hynix_1xnm_mlc_read_retry_regs;
>  	hynix->read_retry = rr;
> -	chip->setup_read_retry = hynix_nand_setup_read_retry;
> +	chip->ops.setup_read_retry = hynix_nand_setup_read_retry;
>  	chip->read_retries = nmodes;
>  
>  out:
> diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
> index 09c254c97b5c..1472f925f386 100644
> --- a/drivers/mtd/nand/raw/nand_macronix.c
> +++ b/drivers/mtd/nand/raw/nand_macronix.c
> @@ -130,7 +130,7 @@ static void macronix_nand_onfi_init(struct nand_chip *chip)
>  		return;
>  
>  	chip->read_retries = MACRONIX_NUM_READ_RETRY_MODES;
> -	chip->setup_read_retry = macronix_nand_setup_read_retry;
> +	chip->ops.setup_read_retry = macronix_nand_setup_read_retry;
>  
>  	if (p->supports_set_get_features) {
>  		bitmap_set(p->set_feature_list,
> @@ -242,8 +242,8 @@ static void macronix_nand_block_protection_support(struct nand_chip *chip)
>  	bitmap_set(chip->parameters.set_feature_list,
>  		   ONFI_FEATURE_ADDR_MXIC_PROTECTION, 1);
>  
> -	chip->lock_area = mxic_nand_lock;
> -	chip->unlock_area = mxic_nand_unlock;
> +	chip->ops.lock_area = mxic_nand_lock;
> +	chip->ops.unlock_area = mxic_nand_unlock;
>  }
>  
>  static int nand_power_down_op(struct nand_chip *chip)
> @@ -312,8 +312,8 @@ static void macronix_nand_deep_power_down_support(struct nand_chip *chip)
>  	if (i < 0)
>  		return;
>  
> -	chip->suspend = mxic_nand_suspend;
> -	chip->resume = mxic_nand_resume;
> +	chip->ops.suspend = mxic_nand_suspend;
> +	chip->ops.resume = mxic_nand_resume;
>  }
>  
>  static int macronix_nand_init(struct nand_chip *chip)
> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> index 3589b4fce0d4..4385092a9325 100644
> --- a/drivers/mtd/nand/raw/nand_micron.c
> +++ b/drivers/mtd/nand/raw/nand_micron.c
> @@ -84,7 +84,7 @@ static int micron_nand_onfi_init(struct nand_chip *chip)
>  		struct nand_onfi_vendor_micron *micron = (void *)p->onfi->vendor;
>  
>  		chip->read_retries = micron->read_retry_options;
> -		chip->setup_read_retry = micron_nand_setup_read_retry;
> +		chip->ops.setup_read_retry = micron_nand_setup_read_retry;
>  	}
>  
>  	if (p->supports_set_get_features) {
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 7d62e0e719ac..b33cd68852c4 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1027,16 +1027,31 @@ struct nand_legacy {
>  	struct nand_controller dummy_controller;
>  };
>  
> +/**
> + * struct nand_chip_ops - NAND chip operations
> + * @suspend: Suspend operation
> + * @resume: Resume operation
> + * @lock_area: Lock operation
> + * @unlock_area: Unlock operation
> + * @setup_read_retry: Set the read-retry mode (mostly needed for MLC NANDs)
> + */
> +struct nand_chip_ops {
> +	int (*suspend)(struct nand_chip *chip);
> +	void (*resume)(struct nand_chip *chip);
> +	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> +	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> +	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
> +};
> +
>  /**
>   * struct nand_chip - NAND Private Flash Chip Data
>   * @base:		Inherit from the generic NAND device
> + * @ops:		NAND chip operations
>   * @legacy:		All legacy fields/hooks. If you develop a new driver,
>   *			don't even try to use any of these fields/hooks, and if
>   *			you're modifying an existing driver that is using those
>   *			fields/hooks, you should consider reworking the driver
>   *			avoid using them.
> - * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
> - *			setting the read-retry mode. Mostly needed for MLC NAND.
>   * @ecc:		[BOARDSPECIFIC] ECC control structure
>   * @buf_align:		minimum buffer alignment required by a platform
>   * @oob_poi:		"poison value buffer," used for laying out OOB data
> @@ -1081,8 +1096,6 @@ struct nand_legacy {
>   * @lock:		lock protecting the suspended field. Also used to
>   *			serialize accesses to the NAND device.
>   * @suspended:		set to 1 when the device is suspended, 0 when it's not.
> - * @suspend:		[REPLACEABLE] specific NAND device suspend operation
> - * @resume:		[REPLACEABLE] specific NAND device resume operation
>   * @bbt:		[INTERN] bad block table pointer
>   * @bbt_td:		[REPLACEABLE] bad block table descriptor for flash
>   *			lookup.
> @@ -1096,17 +1109,13 @@ struct nand_legacy {
>   * @manufacturer:	[INTERN] Contains manufacturer information
>   * @manufacturer.desc:	[INTERN] Contains manufacturer's description
>   * @manufacturer.priv:	[INTERN] Contains manufacturer private information
> - * @lock_area:		[REPLACEABLE] specific NAND chip lock operation
> - * @unlock_area:	[REPLACEABLE] specific NAND chip unlock operation
>   */
>  
>  struct nand_chip {
>  	struct nand_device base;
> -
> +	struct nand_chip_ops ops;
>  	struct nand_legacy legacy;
>  
> -	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
> -
>  	unsigned int options;
>  	unsigned int bbt_options;
>  
> @@ -1138,8 +1147,6 @@ struct nand_chip {
>  
>  	struct mutex lock;
>  	unsigned int suspended : 1;
> -	int (*suspend)(struct nand_chip *chip);
> -	void (*resume)(struct nand_chip *chip);
>  
>  	u8 *oob_poi;
>  	struct nand_controller *controller;
> @@ -1159,9 +1166,6 @@ struct nand_chip {
>  		const struct nand_manufacturer *desc;
>  		void *priv;
>  	} manufacturer;
> -
> -	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
> -	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  };
>  
>  extern const struct mtd_ooblayout_ops nand_ooblayout_sp_ops;


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
