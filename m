Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2ACFC433E1
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:17:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78002208A7
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:17:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rz9YRidA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78002208A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90aA9SRFv5SLqAxjbvQ4bJ0yyxmBQG13tyI1mC0bhwg=; b=Rz9YRidAxFOoP2
	nsmWakIYIVFnmw85AFoC0F4PV+SIF8I5r8QqTChpqyuOJDJnG+0nU2Nof/jaH184wOs4xq/53hTcK
	PP4BhEZx/4fDoNr7oiVMnou9KI59chl01THq2YsICvwPwFKK2wRwXKGHQOjEyVUxPEmvVO0Gma19B
	H+oZbJF6SpiJZ58/1HRsCPatZ0ztiM263zdGcsEb/JWV/CLetomqExgmIXeOpeO7GJ4Tesv19uCSt
	o5mqoh4p0AdTRfSRpDqMmFCeYvX4Qmi18DO6mklRgD065PoXvvlDVy6jkO/OB++Y9dsW/XMjZB1IJ
	3Kavsa2fPlnAEaEf1g6w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeZGO-0004FW-OL; Fri, 29 May 2020 07:17:08 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeZGK-00047N-DB
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 07:17:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6E4C02A42B1;
 Fri, 29 May 2020 08:17:02 +0100 (BST)
Date: Fri, 29 May 2020 09:16:59 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 13/30] mtd: rawnand: timings: Provide
 onfi_fill_data_interface() with a data interface
Message-ID: <20200529091659.7d2ef884@collabora.com>
In-Reply-To: <20200528231612.8958-14-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-14-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_001704_574382_BFA5D03E 
X-CRM114-Status: GOOD (  21.94  )
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

On Fri, 29 May 2020 01:15:55 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> We rely be default on the data interface which is in the nand_chip

          ^by

> structure but it should be possible to fill any other data interface.

But even then it sounds weird. How about:

"
Right now the core uses onfi_fill_data_interface() to initialize the
nand_data_interface object embedded in nand_chip, but we are about to
allocate this object dynamically and let manufacturer drivers provide
their own interface config. Let's patch the onfi_fill_data_interface()
so it can initialize an interface config that's not the one
currently attached to the nand_chip.
"

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/mtd/nand/raw/internals.h    | 1 +
>  drivers/mtd/nand/raw/nand_base.c    | 7 ++++---
>  drivers/mtd/nand/raw/nand_timings.c | 3 ++-
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index a5e2cec7e301..0f74509abc4c 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -85,6 +85,7 @@ int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
>  		    int allowbbt);
>  int onfi_fill_data_interface(struct nand_chip *chip,
> +			     struct nand_data_interface *iface,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode);
>  int nand_get_features(struct nand_chip *chip, int addr, u8 *subfeature_param);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 1d9cf02d164b..b4de85794e07 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -927,7 +927,7 @@ static int nand_reset_data_interface(struct nand_chip *chip, int chipnr)
>  	 * timings to timing mode 0.
>  	 */
>  
> -	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
> +	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
>  	ret = chip->controller->ops->setup_data_interface(chip, chipnr,
>  							&chip->data_interface);
>  	if (ret)
> @@ -1040,7 +1040,8 @@ static int nand_choose_data_interface(struct nand_chip *chip)
>  	}
>  
>  	for (mode = fls(modes) - 1; mode >= 0; mode--) {
> -		ret = onfi_fill_data_interface(chip, NAND_SDR_IFACE, mode);
> +		ret = onfi_fill_data_interface(chip, &chip->data_interface,
> +					       NAND_SDR_IFACE, mode);
>  		if (ret)
>  			continue;
>  
> @@ -5182,7 +5183,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
>  	mutex_init(&chip->lock);
>  
>  	/* Enforce the right timings for reset/detection */
> -	onfi_fill_data_interface(chip, NAND_SDR_IFACE, 0);
> +	onfi_fill_data_interface(chip, &chip->data_interface, NAND_SDR_IFACE, 0);
>  
>  	ret = nand_dt_init(chip);
>  	if (ret)
> diff --git a/drivers/mtd/nand/raw/nand_timings.c b/drivers/mtd/nand/raw/nand_timings.c
> index a73d934e86f9..ce6bb87db2e8 100644
> --- a/drivers/mtd/nand/raw/nand_timings.c
> +++ b/drivers/mtd/nand/raw/nand_timings.c
> @@ -276,14 +276,15 @@ static const struct nand_data_interface onfi_sdr_timings[] = {
>  /**
>   * onfi_fill_data_interface - Initialize a data interface from a given ONFI mode
>   * @chip: The NAND chip
> + * @iface: The data interface to fill
>   * @type: The data interface type
>   * @timing_mode: The ONFI timing mode
>   */
>  int onfi_fill_data_interface(struct nand_chip *chip,
> +			     struct nand_data_interface *iface,
>  			     enum nand_data_interface_type type,
>  			     int timing_mode)
>  {
> -	struct nand_data_interface *iface = &chip->data_interface;
>  	struct onfi_params *onfi = chip->parameters.onfi;
>  
>  	if (type != NAND_SDR_IFACE)


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
