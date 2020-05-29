Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4832BC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:27:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186A9207BC
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:27:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CEvctwT2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186A9207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQGAXkTlPRPcBjE+ei0FFE1VUj3UZmaDBIBDFX/mPf4=; b=CEvctwT2hLFxnW
	AG/EUtgVIimPIsSmxnB4si+qcYhl0TdSGU9BjYsB0804YzOc9zptagDMIfY9V0EwQracJZAfx4n3D
	YpoyNlP+YoGbuqdOUfIak/QP7OOBQ4lgpVz2/+CuJCiktKmbZ31IGABFKDuRaBmvx7pnpmGiy4jXd
	+HNHRs8sZNEgmQsUPOlXheCDVv+zI7KFPcBe4qmcZqrWznXMZ/6agEkTYsJQ5UzRxiRbXBApH6JgD
	gr8Vtm+oLX606UAtult2ZfewYAqFqMmc5etoYUFbXdT5WGYMXbOUKcLOJRFxpX1rKrhnQdY75g6C0
	51PkLH5HL020b8cnwz4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeZQd-0002oZ-W1; Fri, 29 May 2020 07:27:43 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeZQa-0002ny-Su
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 07:27:42 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 70FF32A42D2;
 Fri, 29 May 2020 08:27:39 +0100 (BST)
Date: Fri, 29 May 2020 09:27:35 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 18/30] mtd: rawnand: timings: Make
 onfi_fill_interface_config() a void helper
Message-ID: <20200529092735.04c02100@collabora.com>
In-Reply-To: <20200528231612.8958-19-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-19-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_002741_070557_10E3962A 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: Rickard Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 01:16:00 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Warn the user if the parameters are wrong but basically it would mean
> there is a serious issue in the NAND core. So no need to ever check
> its output, let's make this helper return void.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

One comment below.

> ---
>  drivers/mtd/nand/raw/internals.h    |  8 ++++----
>  drivers/mtd/nand/raw/nand_base.c    |  6 ++----
>  drivers/mtd/nand/raw/nand_timings.c | 19 +++++++++----------
>  3 files changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 93386bdfbad6..11415b054d2e 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -84,10 +84,10 @@ int nand_bbm_get_next_page(struct nand_chip *chip, int page);
>  int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt);
> -int onfi_fill_interface_config(struct nand_chip *chip,
> -			       struct nand_interface_config *iface,
> -			       enum nand_interface_type type,
> -			       int timing_mode);
> +void onfi_fill_interface_config(struct nand_chip *chip,
> +				struct nand_interface_config *iface,
> +				enum nand_interface_type type,
> +				int timing_mode);
>  unsigned int
>  onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index de596c06c9c2..07a7d918b462 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1041,10 +1041,8 @@ static int nand_choose_interface(struct nand_chip *chip)
>  	}
>  
>  	for (mode = fls(modes) - 1; mode >= 0; mode--) {
> -		ret = onfi_fill_interface_config(chip, &chip->interface_config,
> -						 NAND_SDR_IFACE, mode);
> -		if (ret)
> -			continue;
> +		onfi_fill_interface_config(chip, &chip->interface_config,
> +					   NAND_SDR_IFACE, mode);
>  
>  		/*
>  		 * Pass NAND_DATA_IFACE_CHECK_ONLY to only check if the
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index 997a1dd929de..6c12cd52323d 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -347,18 +347,19 @@ onfi_find_closest_sdr_mode(const struct nand_sdr_timings *spec_timings)
>   * @type: The interface type
>   * @timing_mode: The ONFI timing mode
>   */
> -int onfi_fill_interface_config(struct nand_chip *chip,
> -			       struct nand_interface_config *iface,
> -			       enum nand_interface_type type,
> -			       int timing_mode)
> +void onfi_fill_interface_config(struct nand_chip *chip,
> +				struct nand_interface_config *iface,
> +				enum nand_interface_type type,
> +				int timing_mode)
>  {
>  	struct onfi_params *onfi = chip->parameters.onfi;
>  
> -	if (type != NAND_SDR_IFACE)
> -		return -EINVAL;
> +	if (WARN_ON(type != NAND_SDR_IFACE))
> +		return;
>  
> -	if (timing_mode < 0 || timing_mode >= ARRAY_SIZE(onfi_sdr_timings))
> -		return -EINVAL;
> +	if (WARN_ON(timing_mode < 0 ||

timing_mode should probably be unsigned, that would allow us to get rid
of this test.

> +		    timing_mode >= ARRAY_SIZE(onfi_sdr_timings)))
> +		return;
>  
>  	*iface = onfi_sdr_timings[timing_mode];
>  
> @@ -378,6 +379,4 @@ int onfi_fill_interface_config(struct nand_chip *chip,
>  		/* nanoseconds -> picoseconds */
>  		timings->tCCS_min = 1000UL * onfi->tCCS;
>  	}
> -
> -	return 0;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
