Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE864C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:38:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACE5520723
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 18:38:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E8pBjbp2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACE5520723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3Jg3ocsp/371Yuwkl4Z2+h8/Z8PWqR3fM232xMf4qQ=; b=E8pBjbp2NrQsh6
	+TgRcfY+vJIkd0pejz5UhtFKUvdw4QhTvuyOcJFLizZg3j9SKYh4NmVI7T7pDYkBQXCPh8+H90/e+
	zstQ5ia1d5Ag756Ncd/rdeKgL0sqEc4ZFfe4UcYyJepHgUozppb34wE6quiWfqALOsyET9OrX5X69
	0olEplDpXXiNyKZoU2VlmPVXc4uQttZFQJ4O98sebkSqva9ulC3mGKekv01+gbVdWguMOsE3sy/tM
	dUbWbb8JhZ7LdRrEGZufeZWicNAPC95K1OpyRpjVXb0pdg09YbLORqKRJJaRFPXzw3vrVA7iCuPGy
	aVbpHXeOHZUmy33fen1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdHzd-0005CT-Qe; Mon, 25 May 2020 18:38:33 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdHza-0005C9-HT
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 18:38:32 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 50E5B2A1899;
 Mon, 25 May 2020 19:38:29 +0100 (BST)
Date: Mon, 25 May 2020 20:38:26 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v4 04/19] mtd: rawnand: Rename the manufacturer structure
Message-ID: <20200525203826.49c21b92@collabora.com>
In-Reply-To: <20200525174239.11349-5-miquel.raynal@bootlin.com>
References: <20200525174239.11349-1-miquel.raynal@bootlin.com>
 <20200525174239.11349-5-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_113830_842290_4A563D56 
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
Cc: Rickard Andersson <rickaran@axis.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 25 May 2020 19:42:24 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> It is currently called nand_manufacturer but could actually be called
> nand_manufacturer_desc, like its instances, so that the former name is
> left unused for now.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/internals.h |  6 +++---
>  drivers/mtd/nand/raw/nand_base.c | 14 +++++++-------
>  drivers/mtd/nand/raw/nand_ids.c  | 16 ++++++++--------
>  include/linux/mtd/rawnand.h      |  2 +-
>  4 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
> index 03866b0aadea..a518acfd9b3f 100644
> --- a/drivers/mtd/nand/raw/internals.h
> +++ b/drivers/mtd/nand/raw/internals.h
> @@ -53,12 +53,12 @@ struct nand_manufacturer_ops {
>  };
>  
>  /**
> - * struct nand_manufacturer - NAND Flash Manufacturer structure
> + * struct nand_manufacturer_desc - NAND Flash Manufacturer descriptor
>   * @name: Manufacturer name
>   * @id: manufacturer ID code of device.
>   * @ops: manufacturer operations
>   */
> -struct nand_manufacturer {
> +struct nand_manufacturer_desc {
>  	int id;
>  	char *name;
>  	const struct nand_manufacturer_ops *ops;
> @@ -79,7 +79,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
>  extern const struct mtd_pairing_scheme dist3_pairing_scheme;
>  
>  /* Core functions */
> -const struct nand_manufacturer *nand_get_manufacturer(u8 id);
> +const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
>  int nand_bbm_get_next_page(struct nand_chip *chip, int page);
>  int nand_markbad_bbm(struct nand_chip *chip, loff_t ofs);
>  int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index b86f641f6d74..14f1359a60b8 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -4880,9 +4880,9 @@ static void nand_manufacturer_cleanup(struct nand_chip *chip)
>  }
>  
>  static const char *
> -nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
> +nand_manufacturer_name(const struct nand_manufacturer_desc *manufacturer_desc)
>  {
> -	return manufacturer ? manufacturer->name : "Unknown";
> +	return manufacturer_desc ? manufacturer_desc->name : "Unknown";
>  }
>  
>  /*
> @@ -4890,7 +4890,7 @@ nand_manufacturer_name(const struct nand_manufacturer *manufacturer)
>   */
>  static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  {
> -	const struct nand_manufacturer *manufacturer;
> +	const struct nand_manufacturer_desc *manufacturer_desc;
>  	struct mtd_info *mtd = nand_to_mtd(chip);
>  	struct nand_memory_organization *memorg;
>  	int busw, ret;
> @@ -4947,8 +4947,8 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  	chip->id.len = nand_id_len(id_data, ARRAY_SIZE(chip->id.data));
>  
>  	/* Try to identify manufacturer */
> -	manufacturer = nand_get_manufacturer(maf_id);
> -	chip->manufacturer.desc = manufacturer;
> +	manufacturer_desc = nand_get_manufacturer_desc(maf_id);
> +	chip->manufacturer.desc = manufacturer_desc;
>  
>  	if (!type)
>  		type = nand_flash_ids;
> @@ -5027,7 +5027,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  		 */
>  		pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
>  			maf_id, dev_id);
> -		pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> +		pr_info("%s %s\n", nand_manufacturer_name(manufacturer_desc),
>  			mtd->name);
>  		pr_warn("bus width %d instead of %d bits\n", busw ? 16 : 8,
>  			(chip->options & NAND_BUSWIDTH_16) ? 16 : 8);
> @@ -5062,7 +5062,7 @@ static int nand_detect(struct nand_chip *chip, struct nand_flash_dev *type)
>  
>  	pr_info("device found, Manufacturer ID: 0x%02x, Chip ID: 0x%02x\n",
>  		maf_id, dev_id);
> -	pr_info("%s %s\n", nand_manufacturer_name(manufacturer),
> +	pr_info("%s %s\n", nand_manufacturer_name(manufacturer_desc),
>  		chip->parameters.model);
>  	pr_info("%d MiB, %s, erase size: %d KiB, page size: %d, OOB size: %d\n",
>  		(int)(targetsize >> 20), nand_is_slc(chip) ? "SLC" : "MLC",
> diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
> index ba27902fc54b..e0dbc2e316c7 100644
> --- a/drivers/mtd/nand/raw/nand_ids.c
> +++ b/drivers/mtd/nand/raw/nand_ids.c
> @@ -166,7 +166,7 @@ struct nand_flash_dev nand_flash_ids[] = {
>  };
>  
>  /* Manufacturer IDs */
> -static const struct nand_manufacturer nand_manufacturers[] = {
> +static const struct nand_manufacturer_desc nand_manufacturer_descs[] = {
>  	{NAND_MFR_AMD, "AMD/Spansion", &amd_nand_manuf_ops},
>  	{NAND_MFR_ATO, "ATO"},
>  	{NAND_MFR_EON, "Eon"},
> @@ -186,20 +186,20 @@ static const struct nand_manufacturer nand_manufacturers[] = {
>  };
>  
>  /**
> - * nand_get_manufacturer - Get manufacturer information from the manufacturer
> - *			   ID
> + * nand_get_manufacturer_desc - Get manufacturer information from the
> + *                              manufacturer ID
>   * @id: manufacturer ID
>   *
> - * Returns a pointer a nand_manufacturer object if the manufacturer is defined
> + * Returns a nand_manufacturer_desc object if the manufacturer is defined
>   * in the NAND manufacturers database, NULL otherwise.
>   */
> -const struct nand_manufacturer *nand_get_manufacturer(u8 id)
> +const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id)
>  {
>  	int i;
>  
> -	for (i = 0; i < ARRAY_SIZE(nand_manufacturers); i++)
> -		if (nand_manufacturers[i].id == id)
> -			return &nand_manufacturers[i];
> +	for (i = 0; i < ARRAY_SIZE(nand_manufacturer_descs); i++)
> +		if (nand_manufacturer_descs[i].id == id)
> +			return &nand_manufacturer_descs[i];
>  
>  	return NULL;
>  }
> diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> index b33cd68852c4..d8492d966b40 100644
> --- a/include/linux/mtd/rawnand.h
> +++ b/include/linux/mtd/rawnand.h
> @@ -1163,7 +1163,7 @@ struct nand_chip {
>  	void *priv;
>  
>  	struct {
> -		const struct nand_manufacturer *desc;
> +		const struct nand_manufacturer_desc *desc;
>  		void *priv;
>  	} manufacturer;
>  };


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
