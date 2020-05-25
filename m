Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98057C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:51:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67BE6206DD
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 19:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pr84WPvh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67BE6206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zQ3JZgfx6RSl9aArO21Fid7DPWJLgITX2ulz6I2yzs=; b=Pr84WPvhu2yLQO
	ZOObxYZCi4glxDb9W7tB68Xm6Tr+dg9/Vl4TE1zrbZWyvkzUlkwZJE9228pBix2K95cgf/sywseBA
	cfcVOIkId45TCtcNkXCfq/Un05sdUWjWfeYFqFTCN16pltPixLoEXIPCkhzZ3Wh/ylnVkG3JGis2l
	bDdVjr9lDOcwO/gXL9VLdgkbMb+P0/Sq2XeNpirvFTtkJhIKo6+BOOo1ZxaMU4ZCN+n+pGJa+G0JD
	3YisrxcEaGLiRlkX1injx94Wrt7hGzDbTqnntmoLl7rMDZhYuQgV0rzQo85Kd4pIdLLw0F6Efpkfc
	qg6L8gqDz+u3EekEcdaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdJ8B-0000FF-Vh; Mon, 25 May 2020 19:51:27 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdJ88-0000Eu-QL
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 19:51:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6755E2A1903;
 Mon, 25 May 2020 20:51:23 +0100 (BST)
Date: Mon, 25 May 2020 21:51:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 18/19] mtd: rawnand: Add the
 ->choose_data_interface() hook
Message-ID: <20200525215120.57c28588@collabora.com>
In-Reply-To: <20200525174239.11349-19-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-19-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_125124_982163_8C505C5A 
X-CRM114-Status: GOOD (  21.20  )
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

On Mon, 25 May 2020 19:42:38 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> This hook can be overloaded by NAND manufacturer drivers to propose
> alternative timings when not following the main standards.
> 
> Vendors implementing this hook should:

"Manufacturer drivers ..."

> 1- choose the best timings and fill the data interface,
> 2- verify that the controller supports them.

#1 clearly depends on #2, so I'd just say that the manufacturer driver
is responsible for choosing the data interface config that fits both
the controller and chip capabilities (ideally the best one :)).

> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/nand/raw/internals.h | 5 +++++
>  drivers/mtd/nand/raw/nand_base.c | 8 ++++++++
>  include/linux/mtd/rawnand.h      | 2 ++
>  3 files changed, 15 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 9af6979257e2..61edbab35068 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -146,6 +146,11 @@ static inline bool nand_controller_has_setup_data_iface(struct nand_chip *chip)
>  	return true;
>  }
>  
> +static inline bool nand_can_choose_data_interface(struct nand_chip *chip)
> +{
> +	return chip->ops.choose_data_interface;
> +}
> +
>  /* BBT functions */
>  int nand_markbad_bbt(struct nand_chip *chip, loff_t offs);
>  int nand_isreserved_bbt(struct nand_chip *chip, loff_t offs);
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index d9fe7795f183..e9df339849d3 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1060,6 +1060,14 @@ static int nand_choose_data_interface(struct nand_chip *chip)
>  	if (!nand_controller_has_setup_data_iface(chip))
>  		return 0;
>  
> +	/*
> +	 * Let the NAND vendor hook identify the best timings.
> +	 * ->choose_data_interface() is expected to update the entire chip's
> +	 * nand_data_interface structure.
> +	 */
> +	if (nand_can_choose_data_interface(chip))
> +		return chip->ops.choose_data_interface(chip);
> +
>  	/*
>  	 * First try to identify the best timings from ONFI parameters and
>  	 * if the NAND does not support ONFI, fallback to the default ONFI
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index a4b68e7b246a..5b8b94521a18 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1034,6 +1034,7 @@ struct nand_legacy {
>   * @lock_area: Lock operation
>   * @unlock_area: Unlock operation
>   * @setup_read_retry: Set the read-retry mode (mostly needed for MLC NANDs)
> + * @choose_data_interface: Choose the best data interface
>   */
>  struct nand_chip_ops {
>  	int (*suspend)(struct nand_chip *chip);
> @@ -1041,6 +1042,7 @@ struct nand_chip_ops {
>  	int (*lock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, uint64_t len);
>  	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
> +	int (*choose_data_interface)(struct nand_chip *chip);
>  };
>  
>  /**


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
