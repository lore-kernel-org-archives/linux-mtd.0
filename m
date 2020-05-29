Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A93AC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:32:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA4B32074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:31:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iC6mNVMu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA4B32074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PaMyRDc3qG1Jxi5/8QbX8oJJ34PWV5yV3Pg41S69hfk=; b=iC6mNVMugdsy+l
	w8wp39aAjskt7AEomgNpmNagbMo7Mo018QRRJZMcPZ0SGQDVHl6/M6CjDm9nuKG10xg527lHlz3OQ
	cCxktMMlMtGzmD/JiG3rpPBJ5W2VMgjC+scRfgkqkm/BPKxk5C4c0lUBhM3/pASRc7LhYirYqVA64
	gDs6exhHZPe3jNwF0WrnhX8QB8UXB8W/16Xmug+EZzdPVV0xOkz42MYKqwW4V3T8WCGwkvyZIRxYM
	MuGNCAMTsfaTVBXJ+ZKbzUNopR3LrEaKpeMaQWHM4GuBE/TWG8B3W53JkyvspjEDwLp39qTzl9EXE
	mVbDpCvydpnK/f/WU5sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedEr-0006gS-NP; Fri, 29 May 2020 11:31:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedEo-0006fb-QP
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:31:48 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 74CFA2A4358;
 Fri, 29 May 2020 12:31:45 +0100 (BST)
Date: Fri, 29 May 2020 13:31:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 22/28] mtd: rawnand: Add the
 ->choose_interface_config() hook
Message-ID: <20200529133141.5410ea0a@collabora.com>
In-Reply-To: <20200529111322.7184-23-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-23-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_043146_987053_A9F6516F 
X-CRM114-Status: GOOD (  22.32  )
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

On Fri, 29 May 2020 13:13:16 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This hook can be overloaded by NAND manufacturer drivers to propose
> alternative timings when not following the main standards. In this
> case, the manufacturer drivers is responsible for choosing the best
> interface configuration that fits both the controller and chip
> capabilities.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_base.c | 18 +++++++++++-------
>  include/linux/mtd/rawnand.h      |  3 +++
>  2 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index 956a66fdccb8..2f4eba1a1082 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1049,7 +1049,6 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>  		}
>  	}
>  
> -

Still this unrelated blank line removal :-).

>  	for (mode = best_mode; mode >= 0; mode--) {
>  		onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, mode);
>  
> @@ -1067,18 +1066,23 @@ int nand_choose_best_sdr_timings(struct nand_chip *chip,
>   * @chip: The NAND chip
>   *
>   * Find the best data interface and NAND timings supported by the chip
> - * and the driver.
> - * First tries to retrieve supported timing modes from ONFI information,
> - * and if the NAND chip does not support ONFI, relies on the
> - * ->onfi_timing_mode_default specified in the nand_ids table. After this
> - * function nand_chip->interface_ is initialized with the best timing mode
> - * available.
> + * and the driver. Eventually let the NAND manufacturer driver propose his own
> + * set of timings.
> + *
> + * After this function nand_chip->interface_config is initialized with the best
> + * timing mode available.
> + *
> + * Returns 0 for success or negative error code otherwise.
>   */
>  static int nand_choose_interface_config(struct nand_chip *chip)
>  {
>  	if (!nand_controller_can_setup_interface(chip))
>  		return 0;
>  
> +	if (chip->ops.choose_interface_config)
> +		return chip->ops.choose_interface_config(chip,
> +							 &chip->interface_config);
> +
>  	return nand_choose_best_sdr_timings(chip, &chip->interface_config,
>  					    NULL);
>  }
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index 2ca56eef0f07..316a02189da1 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1033,6 +1033,7 @@ struct nand_legacy {
>   * @lock_area: Lock operation
>   * @unlock_area: Unlock operation
>   * @setup_read_retry: Set the read-retry mode (mostly needed for MLC NANDs)
> + * @choose_interface_config: Choose the best interface configuration
>   */
>  struct nand_chip_ops {
>  	int (*suspend)(struct nand_chip *chip);
> @@ -1040,6 +1041,8 @@ struct nand_chip_ops {
>  	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
> +	int (*choose_interface_config)(struct nand_chip *chip,
> +				       struct nand_interface_config *iface);
>  };
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
