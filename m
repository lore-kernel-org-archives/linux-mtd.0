Return-Path: <SRS0=p7/t=JC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3587FC43461
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:55:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1D776138A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Apr 2021 08:55:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1D776138A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XtiMn2eGKOApIleAAA0eWeCJy1AbmX4FVZ9IBhugKzw=; b=Hmz4jlEA6jLK8sEFZTUNINVyf
	BE9znIQuIlR2sopFITjuiLBo7Nm9dvKhwp9WfVIXxZt6Rc1gqE5hvsTTETMnYwHeOIbVh52ibWsIz
	6wt6hmVGwE7v0KuXE/uCT1F/Lfbm+rcgCLeD8WD8P13LpxdUATB68qr+Kz/8B7wxd7630r5I7Ne9B
	SvzqikEvGIHTS454PChoG+Rg2gguphSXkrk7pnJjWN/ydK/K/z+ZmdowCv1/K7u28WyjRuoqwSjJ4
	cI/LZlxlueIcJ5I3h5FTuBK0C9k41c0x47qzOTEs8ac/pcfvOfxo59i82nUEWFxG7yDb88Q06NcZz
	E1MkUMMAw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTL0E-00GzrN-0A; Mon, 05 Apr 2021 08:54:34 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTL08-00GzqK-8K
 for linux-mtd@lists.infradead.org; Mon, 05 Apr 2021 08:54:30 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1358sNJj007704;
 Mon, 5 Apr 2021 03:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617612863;
 bh=OCzpEtOx+Ta+WiZ/8wwZQ6wdcoj6LzcMnkrsTUkob4I=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=RLoksyAgTKkaT6k2rl4eC6UK8MpXX3VclI0fc+szvLl/hzXZwzs07yMMGopqcpM3u
 ciBpwuvSLzGJlm+81Ve1Mnn69CYwDJqJPVZKv1gjiKSmb2cD5fU/+OLDYNpJhKibbl
 g6sgi7UM26Z+i5ZMtU+yRRTsPLXIp40g0lFYUjJg=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1358sN7R052521
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 5 Apr 2021 03:54:23 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 5 Apr
 2021 03:54:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 5 Apr 2021 03:54:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1358sMk3039417;
 Mon, 5 Apr 2021 03:54:22 -0500
Date: Mon, 5 Apr 2021 14:24:21 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <yaliang.wang@windriver.com>
CC: <tudor.ambarus@microchip.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <tkuw584924@gmail.com>
Subject: Re: [PATCH 1/3] mtd: spi-nor: core: Add manuafacturer/chip specific
 operations
Message-ID: <20210405085419.vgrncepyds3uagbv@ti.com>
References: <20210401195012.4009166-1-yaliang.wang@windriver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401195012.4009166-1-yaliang.wang@windriver.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_095428_678315_E7C06AB9 
X-CRM114-Status: GOOD (  28.34  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 02/04/21 03:50AM, yaliang.wang@windriver.com wrote:
> From: Yaliang Wang <Yaliang.Wang@windriver.com>
> 
> This is quite similar to the patch made by Takahiro Kuwano[1], except
> replacing the bare ->ready() hook with a structure spi_nor_ops.

I don't think this belongs in the commit message. The commit message 
should describe the change in isolation. All the "metadata" like 
"depends on patch X", or "rework of patch Y", etc. should go below the 3 
dashes [2].

> 
> The purpose of this introduction is to provide a more flexible method,
> so that we can expand it when needed. Also Basing on this, the
> manufacturer specific checking ready codes can be shifted into their own
> file.
> 
> [1]http://lists.infradead.org/pipermail/linux-mtd/2021-March/085741.html
> 
> Signed-off-by: Yaliang Wang <Yaliang.Wang@windriver.com>
> ---

[2] Here.

>  drivers/mtd/spi-nor/core.c | 8 +++++---
>  drivers/mtd/spi-nor/core.h | 9 +++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 0522304f52fa..6dc8bd0a6bd4 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -785,12 +785,13 @@ static int spi_nor_fsr_ready(struct spi_nor *nor)
>  }
>  
>  /**
> - * spi_nor_ready() - Query the flash to see if it is ready for new commands.
> + * spi_nor_default_ready() - Query the flash to see if it is ready for new
> + * commands.
>   * @nor:	pointer to 'struct spi_nor'.
>   *
>   * Return: 1 if ready, 0 if not ready, -errno on errors.
>   */
> -static int spi_nor_ready(struct spi_nor *nor)
> +static int spi_nor_default_ready(struct spi_nor *nor)
>  {
>  	int sr, fsr;
>  
> @@ -826,7 +827,7 @@ static int spi_nor_wait_till_ready_with_timeout(struct spi_nor *nor,
>  		if (time_after_eq(jiffies, deadline))
>  			timeout = 1;
>  
> -		ret = spi_nor_ready(nor);
> +		ret = nor->params->ops.ready(nor);
>  		if (ret < 0)
>  			return ret;
>  		if (ret)
> @@ -2920,6 +2921,7 @@ static void spi_nor_info_init_params(struct spi_nor *nor)
>  	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
>  	params->set_4byte_addr_mode = spansion_set_4byte_addr_mode;
>  	params->setup = spi_nor_default_setup;
> +	params->ops.ready = spi_nor_default_ready;
>  	/* Default to 16-bit Write Status (01h) Command */
>  	nor->flags |= SNOR_F_HAS_16BIT_SR;
>  
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 4a3f7f150b5d..bc042a0ef94e 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -187,6 +187,14 @@ struct spi_nor_locking_ops {
>  	int (*is_locked)(struct spi_nor *nor, loff_t ofs, uint64_t len);
>  };
>  
> +/**
> + * struct spi_nor_ops - SPI manuafacturer/chip specific operations
> + * @ready:	query if a chip is ready.
> + */
> +struct spi_nor_ops {
> +	int (*ready)(struct spi_nor *nor);

I don't understand how this is more flexible than just having the 
ready() hook in spi_nor_flash_parameter like Takahiro's patch did. I'm 
not completely opposed to the idea but I'd like to understand your 
thought process first.

Also...

> +};
> +
>  /**
>   * struct spi_nor_flash_parameter - SPI NOR flash parameters and settings.
>   * Includes legacy flash parameters and settings that can be overwritten
> @@ -232,6 +240,7 @@ struct spi_nor_flash_parameter {
>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>  
>  	struct spi_nor_erase_map        erase_map;
> +	struct spi_nor_ops				ops;
>  
>  	int (*octal_dtr_enable)(struct spi_nor *nor, bool enable);
>  	int (*quad_enable)(struct spi_nor *nor);

... shouldn't octal_dtr_enable(), quad_enable(), set_4byte_addr_mode(), 
convert_addr(), and setup() hooks also be moved into spi_nor_ops? Why is 
the ready() hook different from these hooks?

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
