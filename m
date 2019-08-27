Return-Path: <SRS0=gOwn=WX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B90C3A5A3
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:39:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E57B217F5
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2019 05:39:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HbYXrHHd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="q4X8wvaC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E57B217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nzEvfdStUOLfHbeSe8vtde03+/21bCxIdKksmQQWNtg=; b=HbYXrHHdKmQ6raD15IBMmfVfFz
	CAvnaK9B+w/Gg49lH5iAJwtmFFiGTLO1HP0bN5GUl/vt1spDsmwIHAiTKSZapG5KmbPslgeWkeGCC
	g0duDnHd5735p4J03GpjfF1iz2xoEGqwSx8CcunYvx0Ue75H09hBHFLbeB08wvNmmxw43CSSHZCuB
	sOFNbIFMqY2/T0x/gxME6JFM8FPxxBMKDMFYUQF2fjptfNZzHjdXHULRlufk12Fs0DDQ2IYbn4sWc
	mUPfHMnAiCnJPTjm3m/G5ElCiBnpLOUMPW5xdZEGuAQPEMAl7PJkV5gDK1bKa05uCI/rWvoV5cnyT
	DJinomrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2UBl-0000G8-QE; Tue, 27 Aug 2019 05:38:41 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2UBi-0000Fg-91
 for linux-mtd@lists.infradead.org; Tue, 27 Aug 2019 05:38:40 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7R5cVBJ104889;
 Tue, 27 Aug 2019 00:38:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1566884311;
 bh=Yf3S5MtpcxK4qz60nu/uaE0ppTBqRi4mAX/vfN0OX4o=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=q4X8wvaCTtEqpmaZl+WAAptzXXOMyA6n1rNtkooNu0AtAulyjBZButTClPhbRw6Z/
 zy5KeALiSyV7P6pdtDL+ot+sACAQ0HBXP8ERLedeykcn4jrcNqUqmTvnv9YKK+SQAZ
 fvXlvw4G3oQ9C3OV+PEdO+83owoZvwq7GEkdqiD0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7R5cVWd112169
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 27 Aug 2019 00:38:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 27
 Aug 2019 00:38:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 27 Aug 2019 00:38:31 -0500
Received: from [172.24.145.136] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7R5cR8r025229;
 Tue, 27 Aug 2019 00:38:28 -0500
Subject: Re: [RESEND PATCH v3 04/20] mtd: spi-nor: Move erase_map to 'struct
 spi_nor_flash_parameter'
To: <Tudor.Ambarus@microchip.com>, <boris.brezillon@collabora.com>,
 <marek.vasut@gmail.com>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20190826120821.16351-1-tudor.ambarus@microchip.com>
 <20190826120821.16351-5-tudor.ambarus@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <1313c071-9ba1-4f98-3536-03a3881d6602@ti.com>
Date: Tue, 27 Aug 2019 11:09:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826120821.16351-5-tudor.ambarus@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_223838_406223_7E9EB832 
X-CRM114-Status: GOOD (  28.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 26/08/19 5:38 PM, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> All flash parameters and settings should reside inside
> 'struct spi_nor_flash_parameter'. Move the SMPT parsed erase map
> from 'struct spi_nor' to 'struct spi_nor_flash_parameter'.
> 
> Please note that there is a roll-back mechanism for the flash
> parameter and settings, for cases when SFDP parser fails. The SFDP
> parser receives a Stack allocated copy of nor->params, called
> sfdp_params, and uses it to retrieve the serial flash discoverable
> parameters. JESD216 SFDP is a standard and has a higher priority
> than the default initialized flash parameters, so will overwrite the
> sfdp_params data when needed. All SFDP code uses the local copy of
> nor->params, that will overwrite it in the end, if the parser succeds.
> 
> Saving and restoring the nor->params.erase_map is no longer needed,
> since the SFDP code does not touch it.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---


Reviewed-by: Vignesh Raghavendra <vigneshr@ti.com>

Regards
Vignesh

> v3: Collect R-b
> 
>  drivers/mtd/spi-nor/spi-nor.c | 40 +++++++++++++++++++++-------------------
>  include/linux/mtd/spi-nor.h   |  8 +++++---
>  2 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> index effda372cb33..9dd6cd8cd13c 100644
> --- a/drivers/mtd/spi-nor/spi-nor.c
> +++ b/drivers/mtd/spi-nor/spi-nor.c
> @@ -600,7 +600,7 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor)
>  	nor->erase_opcode = spi_nor_convert_3to4_erase(nor->erase_opcode);
>  
>  	if (!spi_nor_has_uniform_erase(nor)) {
> -		struct spi_nor_erase_map *map = &nor->erase_map;
> +		struct spi_nor_erase_map *map = &nor->params.erase_map;
>  		struct spi_nor_erase_type *erase;
>  		int i;
>  
> @@ -1133,7 +1133,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
>  				       struct list_head *erase_list,
>  				       u64 addr, u32 len)
>  {
> -	const struct spi_nor_erase_map *map = &nor->erase_map;
> +	const struct spi_nor_erase_map *map = &nor->params.erase_map;
>  	const struct spi_nor_erase_type *erase, *prev_erase = NULL;
>  	struct spi_nor_erase_region *region;
>  	struct spi_nor_erase_command *cmd = NULL;
> @@ -3328,7 +3328,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  			      const struct sfdp_parameter_header *bfpt_header,
>  			      struct spi_nor_flash_parameter *params)
>  {
> -	struct spi_nor_erase_map *map = &nor->erase_map;
> +	struct spi_nor_erase_map *map = &params->erase_map;
>  	struct spi_nor_erase_type *erase_type = map->erase_type;
>  	struct sfdp_bfpt bfpt;
>  	size_t len;
> @@ -3409,7 +3409,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
>  	 * Erase Types defined in the bfpt table.
>  	 */
>  	erase_mask = 0;
> -	memset(&nor->erase_map, 0, sizeof(nor->erase_map));
> +	memset(&params->erase_map, 0, sizeof(params->erase_map));
>  	for (i = 0; i < ARRAY_SIZE(sfdp_bfpt_erases); i++) {
>  		const struct sfdp_bfpt_erase *er = &sfdp_bfpt_erases[i];
>  		u32 erasesize;
> @@ -3684,14 +3684,18 @@ spi_nor_region_check_overlay(struct spi_nor_erase_region *region,
>  /**
>   * spi_nor_init_non_uniform_erase_map() - initialize the non-uniform erase map
>   * @nor:	pointer to a 'struct spi_nor'
> + * @params:     pointer to a duplicate 'struct spi_nor_flash_parameter' that is
> + *              used for storing SFDP parsed data
>   * @smpt:	pointer to the sector map parameter table
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
> -static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
> -					      const u32 *smpt)
> +static int
> +spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
> +				   struct spi_nor_flash_parameter *params,
> +				   const u32 *smpt)
>  {
> -	struct spi_nor_erase_map *map = &nor->erase_map;
> +	struct spi_nor_erase_map *map = &params->erase_map;
>  	struct spi_nor_erase_type *erase = map->erase_type;
>  	struct spi_nor_erase_region *region;
>  	u64 offset;
> @@ -3770,6 +3774,8 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>   * spi_nor_parse_smpt() - parse Sector Map Parameter Table
>   * @nor:		pointer to a 'struct spi_nor'
>   * @smpt_header:	sector map parameter table header
> + * @params:		pointer to a duplicate 'struct spi_nor_flash_parameter'
> + *                      that is used for storing SFDP parsed data
>   *
>   * This table is optional, but when available, we parse it to identify the
>   * location and size of sectors within the main data array of the flash memory
> @@ -3778,7 +3784,8 @@ static int spi_nor_init_non_uniform_erase_map(struct spi_nor *nor,
>   * Return: 0 on success, -errno otherwise.
>   */
>  static int spi_nor_parse_smpt(struct spi_nor *nor,
> -			      const struct sfdp_parameter_header *smpt_header)
> +			      const struct sfdp_parameter_header *smpt_header,
> +			      struct spi_nor_flash_parameter *params)
>  {
>  	const u32 *sector_map;
>  	u32 *smpt;
> @@ -3807,11 +3814,11 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
>  		goto out;
>  	}
>  
> -	ret = spi_nor_init_non_uniform_erase_map(nor, sector_map);
> +	ret = spi_nor_init_non_uniform_erase_map(nor, params, sector_map);
>  	if (ret)
>  		goto out;
>  
> -	spi_nor_regions_sort_erase_types(&nor->erase_map);
> +	spi_nor_regions_sort_erase_types(&params->erase_map);
>  	/* fall through */
>  out:
>  	kfree(smpt);
> @@ -3867,7 +3874,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		{ 0u /* not used */,		BIT(12) },
>  	};
>  	struct spi_nor_pp_command *params_pp = params->page_programs;
> -	struct spi_nor_erase_map *map = &nor->erase_map;
> +	struct spi_nor_erase_map *map = &params->erase_map;
>  	struct spi_nor_erase_type *erase_type = map->erase_type;
>  	u32 *dwords;
>  	size_t len;
> @@ -4097,7 +4104,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  
>  		switch (SFDP_PARAM_HEADER_ID(param_header)) {
>  		case SFDP_SECTOR_MAP_ID:
> -			err = spi_nor_parse_smpt(nor, param_header);
> +			err = spi_nor_parse_smpt(nor, param_header, params);
>  			break;
>  
>  		case SFDP_4BAIT_ID:
> @@ -4129,7 +4136,7 @@ static int spi_nor_parse_sfdp(struct spi_nor *nor,
>  static int spi_nor_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params = &nor->params;
> -	struct spi_nor_erase_map *map = &nor->erase_map;
> +	struct spi_nor_erase_map *map = &params->erase_map;
>  	const struct flash_info *info = nor->info;
>  	u8 i, erase_mask;
>  
> @@ -4229,17 +4236,12 @@ static int spi_nor_init_params(struct spi_nor *nor)
>  	if ((info->flags & (SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)) &&
>  	    !(info->flags & SPI_NOR_SKIP_SFDP)) {
>  		struct spi_nor_flash_parameter sfdp_params;
> -		struct spi_nor_erase_map prev_map;
>  
>  		memcpy(&sfdp_params, params, sizeof(sfdp_params));
> -		memcpy(&prev_map, &nor->erase_map, sizeof(prev_map));
>  
>  		if (spi_nor_parse_sfdp(nor, &sfdp_params)) {
>  			nor->addr_width = 0;
>  			nor->flags &= ~SNOR_F_4B_OPCODES;
> -			/* restore previous erase map */
> -			memcpy(&nor->erase_map, &prev_map,
> -			       sizeof(nor->erase_map));
>  		} else {
>  			memcpy(params, &sfdp_params, sizeof(*params));
>  		}
> @@ -4353,7 +4355,7 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map,
>  
>  static int spi_nor_select_erase(struct spi_nor *nor, u32 wanted_size)
>  {
> -	struct spi_nor_erase_map *map = &nor->erase_map;
> +	struct spi_nor_erase_map *map = &nor->params.erase_map;
>  	const struct spi_nor_erase_type *erase = NULL;
>  	struct mtd_info *mtd = &nor->mtd;
>  	int i;
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index 17787238f0e9..a86c0d9fb01d 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -479,6 +479,8 @@ struct spi_nor;
>   *                      in the array, the higher priority.
>   * @page_programs:	page program capabilities ordered by priority: the
>   *                      higher index in the array, the higher priority.
> + * @erase_map:		the erase map parsed from the SFDP Sector Map Parameter
> + *                      Table.
>   * @quad_enable:	enables SPI NOR quad mode.
>   */
>  struct spi_nor_flash_parameter {
> @@ -489,6 +491,8 @@ struct spi_nor_flash_parameter {
>  	struct spi_nor_read_command	reads[SNOR_CMD_READ_MAX];
>  	struct spi_nor_pp_command	page_programs[SNOR_CMD_PP_MAX];
>  
> +	struct spi_nor_erase_map        erase_map;
> +
>  	int (*quad_enable)(struct spi_nor *nor);
>  };
>  
> @@ -519,7 +523,6 @@ struct flash_info;
>   * @read_proto:		the SPI protocol for read operations
>   * @write_proto:	the SPI protocol for write operations
>   * @reg_proto		the SPI protocol for read_reg/write_reg/erase operations
> - * @erase_map:		the erase map of the SPI NOR
>   * @prepare:		[OPTIONAL] do some preparations for the
>   *			read/write/erase/lock/unlock operations
>   * @unprepare:		[OPTIONAL] do some post work after the
> @@ -562,7 +565,6 @@ struct spi_nor {
>  	enum spi_nor_protocol	reg_proto;
>  	bool			sst_write_second;
>  	u32			flags;
> -	struct spi_nor_erase_map	erase_map;
>  
>  	int (*prepare)(struct spi_nor *nor, enum spi_nor_ops ops);
>  	void (*unprepare)(struct spi_nor *nor, enum spi_nor_ops ops);
> @@ -610,7 +612,7 @@ spi_nor_region_mark_overlay(struct spi_nor_erase_region *region)
>  
>  static bool __maybe_unused spi_nor_has_uniform_erase(const struct spi_nor *nor)
>  {
> -	return !!nor->erase_map.uniform_erase_type;
> +	return !!nor->params.erase_map.uniform_erase_type;
>  }
>  
>  static inline void spi_nor_set_flash_node(struct spi_nor *nor,
> 

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
