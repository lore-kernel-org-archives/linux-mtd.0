Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1662FC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:42:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB33A20810
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 07:42:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ddHeNR6H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB33A20810
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjH3vxmObercPyKn0kfnkSV17hWPQHsRDCIKnHorK/U=; b=ddHeNR6Hpi5Hh5
	uqZYtVvO+4vZ6/6C8+gwSYmxcJJqqells30ss/qmCSmDBGZFHyhMnuK5A+g32M8anRo/0boZgoxbD
	SbS8o/DENtMAiqy80SL17/4Xmj6bOh0a6fNy9/5LeG8cUtNOrKvu9OX6H7Erdkf40A1bT3NVHYF+o
	QxzXHD6k0pvBaS8mNFUTKfi2R5slOaF3qXmf6vjrb5hHR8LKg5pJ9gqyRjS/gZGYH/Q/SKAufaII2
	y4KD1OpzbOCZyIPJmuAkNBCpzehVj38GTujq9/BPP4vfAlDdfFAvFy2P8UteqaxTSXLcScEts6hII
	GnLybZRFnrTBGvfI7Gcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeZf4-0006c3-PP; Fri, 29 May 2020 07:42:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeZf2-0006bF-2I
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 07:42:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A38262A05E6;
 Fri, 29 May 2020 08:42:32 +0100 (BST)
Date: Fri, 29 May 2020 09:42:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v6 24/30] mtd: rawnand: Add the ->choose_interface() hook
Message-ID: <20200529094229.42429d36@collabora.com>
In-Reply-To: <20200528231612.8958-25-miquel.raynal@bootlin.com>
References: <20200528231612.8958-1-miquel.raynal@bootlin.com>
 <20200528231612.8958-25-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_004236_247980_03A9954D 
X-CRM114-Status: GOOD (  19.62  )
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

On Fri, 29 May 2020 01:16:06 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This hook can be overloaded by NAND manufacturer drivers to propose
> alternative timings when not following the main standards. In this
> case, the manufacturer drivers is responsible for choosing the best
> interface configuration that fits both the controller and chip
> capabilities.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/nand_base.c | 9 +++++++--
>  include/linux/mtd/rawnand.h      | 3 +++
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 28e249beb335..132feee3ba13 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1047,7 +1047,6 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		}
>  	}
>  
> -
>  	for (mode = best_mode; mode >= 0; mode--) {
>  		onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, mode);
>  
> @@ -1065,7 +1064,9 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>   * @chip: The NAND chip
>   *
>   * Find the best data interface and NAND timings supported by the chip
> - * and the driver.
> + * and the driver. Eventually let the NAND manufacturer driver propose his own
> + * set of timings.
> + *
>   * After this function nand_chip->data_interface is initialized with the best
>   * timing mode available.
>   *
> @@ -1076,6 +1077,10 @@ static int nand_choose_interface(struct nand_chip *chip)
>  	if (!nand_controller_can_setup_interface(chip))
>  		return 0;
>  
> +	if (chip->ops.choose_interface)
> +		return chip->ops.choose_interface(chip,
> +						  &chip->interface_config);
> +
>  	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
>  					    NULL);
>  }
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 03b62f900d20..ce4a525517a6 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1033,6 +1033,7 @@ struct nand_legacy {
>   * @lock_area: Lock operation
>   * @unlock_area: Unlock operation
>   * @setup_read_retry: Set the read-retry mode (mostly needed for MLC NANDs)
> + * @choose_data_interface: Choose the best data interface
>   */
>  struct nand_chip_ops {
>  	int (*suspend)(struct nand_chip *chip);
> @@ -1040,6 +1041,8 @@ struct nand_chip_ops {
>  	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
> +	int (*choose_interface)(struct nand_chip *chip,

s/choose_interface/choose_interface_config/

> +				struct nand_interface_config *iface);
>  };
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
