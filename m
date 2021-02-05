Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672AAC433E0
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:47:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1E6364FBC
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 13:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1E6364FBC
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/Cawsbm1Sl+guLrMEeiGlOXHe4B8pxXm2fJyPp+V4Wk=; b=j0G+oJcwJvI2an+vU2N+7l+LG
	xPGP6ARwwMiEqNstXQpW+tu4LGd1RfbozASxF6V4Ao339CFqs2KKY80sIw9eDfbsvLf9pdtuqxGdB
	8r2gfOm1dcETZhYDaxqqT5x4MoiLx37L/9qoQiWiotfWP/B9dB/POADu/IxFk8ICFMjPBSFQPTZ5d
	LcdY9+jFh+wp+7Ie1VUkLxv67egfL3960DEIm9PFEcMwcgySn3iVM7v/zoWr+0pIJxZJ5j2VEyiVk
	d1zdCKyS6bzr9mh08qqfb8j6qIvx8JV+7TuY6kx7niqWfs+gxt/E/2wWSjQFxjRoTUR9qBRQp3OlR
	6ZA5nPIuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l81RS-0002f2-JS; Fri, 05 Feb 2021 13:46:34 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l81RP-0002ei-JU
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 13:46:32 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115DkRuB093953;
 Fri, 5 Feb 2021 07:46:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1612532787;
 bh=cB0WfTEJ3j7OEluhrKCZveupuzZyWbr/N7XfkmnBgmY=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=n/tLzFscrErJMCS0yYLR15tgBOTcIO/+yQiXgLgOtd8bDCXK3T68yhJa3Xz5TKyik
 d/LXwQsdss99IlzmzzU0Zg9064h7E/rvIlo8/pp6ZnX1ZOS7N03w1m4bSuFk5imJEe
 5St5bMdL/N7ZruQGgjb3TKilT6pFQhEh/ygdOTAs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115DkRQK039984
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Feb 2021 07:46:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 07:46:26 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 07:46:26 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115DkQ0M067702;
 Fri, 5 Feb 2021 07:46:26 -0600
Date: Fri, 5 Feb 2021 19:16:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: Re: [PATCH] mtd: spi-nor: Get rid of duplicated argument in
 spi_nor_parse_sfdp()
Message-ID: <20210205134625.6zmeit7ecqtzwyin@ti.com>
References: <20210204174507.593419-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210204174507.593419-1-tudor.ambarus@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_084631_770504_75BBB432 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 04/02/21 07:45PM, Tudor Ambarus wrote:
> spi_nor_parse_sfdp(nor, nor->params);
> passes for the second argument a member within the first argument.
> Drop the second argument and obtain it directly from the first,
> and do it across all the children functions. This is a follow up for
> 'commit 69a8eed58cc0 ("mtd: spi-nor: Don't copy self-pointing struct around")'
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c     | 10 ++--
>  drivers/mtd/spi-nor/core.h     |  6 +--
>  drivers/mtd/spi-nor/issi.c     |  3 +-
>  drivers/mtd/spi-nor/macronix.c |  3 +-
>  drivers/mtd/spi-nor/sfdp.c     | 87 +++++++++++++---------------------
>  drivers/mtd/spi-nor/sfdp.h     |  3 +-
>  drivers/mtd/spi-nor/spansion.c | 12 ++---
>  drivers/mtd/spi-nor/winbond.c  |  3 +-
>  8 files changed, 49 insertions(+), 78 deletions(-)
> 
[...]
> @@ -945,13 +935,11 @@ static int spi_nor_parse_smpt(struct spi_nor *nor,
>   * @nor:		pointer to a 'struct spi_nor'.
>   * @param_header:	pointer to the 'struct sfdp_parameter_header' describing
>   *			the 4-Byte Address Instruction Table length and version.
> - * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
>   *
>   * Return: 0 on success, -errno otherwise.
>   */
>  static int spi_nor_parse_4bait(struct spi_nor *nor,
> -			       const struct sfdp_parameter_header *param_header,
> -			       struct spi_nor_flash_parameter *params)
> +			       const struct sfdp_parameter_header *param_header)
>  {
>  	static const struct sfdp_4bait reads[] = {
>  		{ SNOR_HWCAPS_READ,		BIT(0) },
> @@ -975,8 +963,8 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		{ 0u /* not used */,		BIT(11) },
>  		{ 0u /* not used */,		BIT(12) },
>  	};
> -	struct spi_nor_pp_command *params_pp = params->page_programs;
> -	struct spi_nor_erase_map *map = &params->erase_map;
> +	struct spi_nor_pp_command *params_pp = nor->params->page_programs;
> +	struct spi_nor_erase_map *map = &nor->params->erase_map;
>  	struct spi_nor_erase_type *erase_type = map->erase_type;
>  	u32 *dwords;
>  	size_t len;
> @@ -1013,7 +1001,7 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		const struct sfdp_4bait *read = &reads[i];
>  
>  		discard_hwcaps |= read->hwcaps;
> -		if ((params->hwcaps.mask & read->hwcaps) &&
> +		if ((nor->params->hwcaps.mask & read->hwcaps) &&
>  		    (dwords[0] & read->supported_bit))
>  			read_hwcaps |= read->hwcaps;
>  	}
> @@ -1029,8 +1017,8 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  		/*
>  		 * The 4 Byte Address Instruction (Optional) Table is the only
>  		 * SFDP table that indicates support for Page Program Commands.
> -		 * Bypass the params->hwcaps.mask and consider 4BAIT the biggest
> -		 * authority for specifying Page Program support.
> +		 * Bypass the nor->params->hwcaps.mask and consider 4BAIT the
> +		 * biggest authority for specifying Page Program support.
>  		 */
>  		discard_hwcaps |= program->hwcaps;
>  		if (dwords[0] & program->supported_bit)
> @@ -1064,12 +1052,12 @@ static int spi_nor_parse_4bait(struct spi_nor *nor,
>  	 * Discard all operations from the 4-byte instruction set which are
>  	 * not supported by this memory.
>  	 */
> -	params->hwcaps.mask &= ~discard_hwcaps;
> -	params->hwcaps.mask |= (read_hwcaps | pp_hwcaps);
> +	nor->params->hwcaps.mask &= ~discard_hwcaps;
> +	nor->params->hwcaps.mask |= (read_hwcaps | pp_hwcaps);
>  
>  	/* Use the 4-byte address instruction set. */
>  	for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
> -		struct spi_nor_read_command *read_cmd = &params->reads[i];
> +		struct spi_nor_read_command *read_cmd = &nor->params->reads[i];

Nitpick: 'nor->params' is used in multiple places in this function. 
Might be worth it to make it a local variable.

Either way,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

>  
>  		read_cmd->opcode = spi_nor_convert_3to4_read(read_cmd->opcode);
>  	}
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
