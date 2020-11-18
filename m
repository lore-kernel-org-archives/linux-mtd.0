Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6F8C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 04:21:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3924C238E6
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 04:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VgTZrGfx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W76esqTs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3924C238E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TO89nNh+O3+eHz3KcrqJ4W/WeV+/OYnc298VFPHTcdk=; b=VgTZrGfxQ6LfkbKGALbIr0Tad
	ETYI4iL/HMe0788EDsunx5IssAe3FbkBmN597M5sHXyeNyC+IXL3WwVmltx/Awr3uxwt0DF2GModk
	4L/Qy5yrQVjCzkFlw+xeU1c9oeH5PNASJsooGLfxUodI1Ean9J5NqG9vQzjLBtXPhdKExMfrPeAyH
	I5ky3XaKbV5ZG5ADPOVAAquD8ZamkZOJyVIGvQhovB+m8HbK4b4XisVpexix703xBg7PpT2wbm12I
	V5om9mI4LFAJHVLaokLhicnkVk235p9iGU6LJVO2jeROdctY/e5kkVsDuIAh+Sp+rKFyD6o0DGstf
	abBUg4esg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfExW-0003Cu-AP; Wed, 18 Nov 2020 04:20:42 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfExT-0003CU-Oz
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 04:20:40 +0000
Received: by mail-ot1-x344.google.com with SMTP id n89so518188otn.3
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2020 20:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6Wvxu8t2+2ioygEU2T4ArcOLVAxHUsdhIF9PdXDAJM4=;
 b=W76esqTsZ86EDM1lwch0e8uC4aT1RtvVouxGvKObeDHmB3bZMoC5oHjC2nJz9cteck
 8koiNfwuE4Z3/i5L4VnIDUfcdNiXZbW+Fr9jjzKkS1Kx+5LYisyTaMeOs3gfmR83xPBt
 mGiuQpNmNtzFg2Rm+4dtyxgp3aEI2suOJTus+WjaZ1z4n4XNxPlWrXY6pj4Yf/lK64jx
 4z8KLPyY/MdVNqTLwUaJLg4hTzTdzNuano/+1SdaiLuv+rcSyQQ5ozNgfgE/iJkGQSrM
 Si2u1p24qNr3vp49zz4qq7CydjH5Si4OSL49NNKvlLZ8lzlcUAy+tvHSdps+7yL+hhV6
 e50Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6Wvxu8t2+2ioygEU2T4ArcOLVAxHUsdhIF9PdXDAJM4=;
 b=YfK06fGDiX3XlpmA8nRhCl2/mNfJ3RQGS2VZ+LVccXjJqsfhxD6mFio0nhgNA3035H
 n/TK9GYwOpRBID2kf4M8/HPy0iDw82W55Qzt2YFtPzsoJlrY5jMFPEnRS8jYxu457kWE
 m/F+pVls6DuVEvSdaZHgXuO83kS1XaPiYJfgMM8INrowRvzS2pPJtsxd/kgEJ0z+WyZL
 MR3XuEK036qm8zhOZlOHf2uToiZZ2aXAYrOhafHEKlOd7hdoRg4Uy1qo7gfh6RgeOuU4
 94jXrb33gdDSMnWee0FUbfd8IMJSwx4SVJQBnFY0yL1a6tSadrO1CcITUXKOZbJlRQy1
 bShw==
X-Gm-Message-State: AOAM533mj3M+ediB1KqRuztvDgu3SgCejCORzm/bPH5NSHwbCXEMYi8+
 HJ+gnK8tu+gL93VNFNnrG1rWKg==
X-Google-Smtp-Source: ABdhPJwqlVmYvFehmr/fzkq8uhhNTcWyQ3lNwNUQ3Bom+EBGXSfkQub4UHEpAO+oVi/uB5L0kvpjtg==
X-Received: by 2002:a9d:6847:: with SMTP id c7mr5260354oto.134.1605673236210; 
 Tue, 17 Nov 2020 20:20:36 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id a4sm6459055otj.29.2020.11.17.20.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 20:20:35 -0800 (PST)
Date: Tue, 17 Nov 2020 22:20:33 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v2 2/4] mtd: parsers: Add Qcom SMEM parser
Message-ID: <20201118042033.GH8532@builder.lan>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
 <20201117174845.28684-3-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117174845.28684-3-manivannan.sadhasivam@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_232039_841575_90F36B9F 
X-CRM114-Status: GOOD (  32.83  )
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
Cc: devicetree@vger.kernel.org, vigneshr@ti.com, richard@nod.at,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue 17 Nov 11:48 CST 2020, Manivannan Sadhasivam wrote:

> NAND based Qualcomm platforms have the partition table populated in the
> Shared Memory (SMEM). Hence, add a parser for parsing the partitions
> from it.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/mtd/parsers/Kconfig        |   8 ++
>  drivers/mtd/parsers/Makefile       |   1 +
>  drivers/mtd/parsers/qcomsmempart.c | 169 +++++++++++++++++++++++++++++
>  3 files changed, 178 insertions(+)
>  create mode 100644 drivers/mtd/parsers/qcomsmempart.c
> 
> diff --git a/drivers/mtd/parsers/Kconfig b/drivers/mtd/parsers/Kconfig
> index e72354322f62..d90c30229052 100644
> --- a/drivers/mtd/parsers/Kconfig
> +++ b/drivers/mtd/parsers/Kconfig
> @@ -160,3 +160,11 @@ config MTD_REDBOOT_PARTS_READONLY
>  	  'FIS directory' images, enable this option.
>  
>  endif # MTD_REDBOOT_PARTS
> +
> +config MTD_QCOMSMEM_PARTS
> +	tristate "Qualcomm SMEM NAND flash partition parser"
> +	depends on MTD_NAND_QCOM || COMPILE_TEST
> +	depends on QCOM_SMEM
> +	help
> +	  This provides support for parsing partitions from Shared Memory (SMEM)
> +	  for NAND flash on Qualcomm platforms.
> diff --git a/drivers/mtd/parsers/Makefile b/drivers/mtd/parsers/Makefile
> index b0c5f62f9e85..50eb0b0a2210 100644
> --- a/drivers/mtd/parsers/Makefile
> +++ b/drivers/mtd/parsers/Makefile
> @@ -9,3 +9,4 @@ obj-$(CONFIG_MTD_AFS_PARTS)		+= afs.o
>  obj-$(CONFIG_MTD_PARSER_TRX)		+= parser_trx.o
>  obj-$(CONFIG_MTD_SHARPSL_PARTS)		+= sharpslpart.o
>  obj-$(CONFIG_MTD_REDBOOT_PARTS)		+= redboot.o
> +obj-$(CONFIG_MTD_QCOMSMEM_PARTS)	+= qcomsmempart.o
> diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
> new file mode 100644
> index 000000000000..d8c2a3fa4dfe
> --- /dev/null
> +++ b/drivers/mtd/parsers/qcomsmempart.c
> @@ -0,0 +1,169 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Qualcomm SMEM NAND flash partition parser
> + *
> + * Copyright (C) 2020, Linaro Ltd.
> + */
> +
> +#include <linux/ctype.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/slab.h>
> +#include <linux/soc/qcom/smem.h>
> +
> +#define SMEM_AARM_PARTITION_TABLE	9
> +#define SMEM_APPS			0
> +
> +#define SMEM_FLASH_PART_MAGIC1		0x55ee73aa
> +#define SMEM_FLASH_PART_MAGIC2		0xe35ebddb
> +#define SMEM_FLASH_PTABLE_V3		3
> +#define SMEM_FLASH_PTABLE_V4		4
> +#define SMEM_FLASH_PTABLE_MAX_PARTS_V3	16
> +#define SMEM_FLASH_PTABLE_MAX_PARTS_V4	48
> +#define SMEM_FLASH_PTABLE_HDR_LEN	(4 * sizeof(u32))
> +#define SMEM_FLASH_PTABLE_NAME_SIZE	16
> +
> +/**
> + * struct smem_flash_pentry - SMEM Flash partition entry
> + * @name: Name of the partition
> + * @offset: Offset in blocks
> + * @length: Length of the partition in blocks
> + * @attr: Flags for this partition
> + */
> +struct smem_flash_pentry {
> +	char name[SMEM_FLASH_PTABLE_NAME_SIZE];
> +	u32 offset;

It would be nice if you noted that these are little endian (using
__le32) and used le32_to_cpu() below.


Apart from that I think this looks really good.

> +	u32 length;
> +	u8 attr;
> +} __packed __aligned(4);
> +
> +/**
> + * struct smem_flash_ptable - SMEM Flash partition table
> + * @magic1: Partition table Magic 1
> + * @magic2: Partition table Magic 2
> + * @version: Partition table version
> + * @numparts: Number of partitions in this ptable
> + * @pentry: Flash partition entries belonging to this ptable
> + */
> +struct smem_flash_ptable {
> +	u32 magic1;
> +	u32 magic2;
> +	u32 version;
> +	u32 numparts;
> +	struct smem_flash_pentry pentry[SMEM_FLASH_PTABLE_MAX_PARTS_V4];
> +} __packed __aligned(4);
> +
> +static int parse_qcomsmem_part(struct mtd_info *mtd,
> +			       const struct mtd_partition **pparts,
> +			       struct mtd_part_parser_data *data)
> +{
> +	struct smem_flash_pentry *pentry;
> +	struct smem_flash_ptable *ptable;
> +	size_t len = SMEM_FLASH_PTABLE_HDR_LEN;
> +	struct mtd_partition *parts;
> +	char *name, *c;
> +	int ret, i;
> +
> +	pr_debug("Parsing partition table info from SMEM\n");
> +	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
> +	if (IS_ERR(ptable)) {
> +		pr_err("Error reading partition table header\n");
> +		return PTR_ERR(ptable);
> +	}
> +
> +	/* Verify ptable magic */
> +	if (ptable->magic1 != SMEM_FLASH_PART_MAGIC1 ||
> +	    ptable->magic2 != SMEM_FLASH_PART_MAGIC2) {
> +		pr_err("Partition table magic verification failed\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Ensure that # of partitions is less than the max we have allocated */
> +	if (ptable->numparts > SMEM_FLASH_PTABLE_MAX_PARTS_V4) {
> +		pr_err("Partition numbers exceed the max limit\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Find out length of partition data based on table version */
> +	if (ptable->version <= SMEM_FLASH_PTABLE_V3) {
> +		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V3 *
> +			sizeof(struct smem_flash_pentry);
> +	} else if (ptable->version == SMEM_FLASH_PTABLE_V4) {
> +		len = SMEM_FLASH_PTABLE_HDR_LEN + SMEM_FLASH_PTABLE_MAX_PARTS_V4 *
> +			sizeof(struct smem_flash_pentry);
> +	} else {
> +		pr_err("Unknown ptable version (%d)", ptable->version);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Now that the partition table header has been parsed, verified
> +	 * and the length of the partition table calculated, read the
> +	 * complete partition table
> +	 */
> +	ptable = qcom_smem_get(SMEM_APPS, SMEM_AARM_PARTITION_TABLE, &len);
> +	if (IS_ERR_OR_NULL(ptable)) {
> +		pr_err("Error reading partition table\n");
> +		return PTR_ERR(ptable);
> +	}
> +
> +	parts = kcalloc(ptable->numparts, sizeof(*parts), GFP_KERNEL);
> +	if (!parts)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ptable->numparts; i++) {
> +		pentry = &ptable->pentry[i];
> +		if (pentry->name[0] == '\0')
> +			continue;
> +
> +		name = kstrdup(pentry->name, GFP_KERNEL);
> +		if (!name) {
> +			ret = -ENOMEM;
> +			goto out_free_parts;
> +		}
> +
> +		/* Convert name to lower case */
> +		for (c = name; *c != '\0'; c++)
> +			*c = tolower(*c);
> +
> +		parts[i].name = name;
> +		parts[i].offset = pentry->offset * mtd->erasesize;
> +		parts[i].mask_flags = pentry->attr;
> +		parts[i].size = pentry->length * mtd->erasesize;
> +		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
> +			 i, pentry->name, pentry->offset, pentry->length,
> +			 pentry->attr);
> +	}
> +
> +	pr_debug("SMEM partition table found: ver: %d len: %d\n",
> +		 ptable->version, ptable->numparts);
> +	*pparts = parts;
> +
> +	return i;

Had to check a few times, but afaict this is just ptable->numparts in
disguise... So how about just writing that instead?

Regards,
Bjorn

> +
> +out_free_parts:
> +	while (--i >= 0)
> +		kfree(parts[i].name);
> +	kfree(parts);
> +	*pparts = NULL;
> +
> +	return ret;
> +}
> +
> +static const struct of_device_id qcomsmem_of_match_table[] = {
> +	{ .compatible = "qcom,smem-part" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, qcomsmem_of_match_table);
> +
> +static struct mtd_part_parser mtd_parser_qcomsmem = {
> +	.parse_fn = parse_qcomsmem_part,
> +	.name = "qcomsmem",
> +	.of_match_table = qcomsmem_of_match_table,
> +};
> +module_mtd_part_parser(mtd_parser_qcomsmem);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>");
> +MODULE_DESCRIPTION("Qualcomm SMEM NAND flash partition parser");
> -- 
> 2.17.1
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
