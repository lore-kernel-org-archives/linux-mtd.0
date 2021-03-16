Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EC4C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 10:45:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2497B64FA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 10:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2497B64FA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QMOLCl6lg6FCjrczzqlyVE3iotEYtbkVcB6E/YSsUNc=; b=j9Mt1yK78uLVaIZWnzEjFXrl3
	2GKU4iX9o6OWJjpEDL5hWIIiqMHAu2JdbEqTqlPAzrIzFzqtKQ8P5jHIJYM01LuCGcItKmA+66ugd
	kMSQ6ISeHdl9Ig78r5piX4K+o31QD/uVwWbGQJgzikXavcHh48rkgJpgnl4hjaplW969fhRjlOrcf
	91c/mZWTsKVxrtf6A15hfd0a6G0ncTnxBw20HuzeWexAhwn27IZhXulWrrY5nejQvIZN+StzOe7We
	pYH3oS2TIV8bqYIvDnUN8L8J+tzpXZhuvO0BbmrR5LZOVJ2F2m/xh7wwpCeI6XOwxaFFxaeIb9NUX
	r7t4e9lWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7BZ-000Rch-JN; Tue, 16 Mar 2021 10:44:25 +0000
Received: from fllv0016.ext.ti.com ([198.47.19.142])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM79o-000Qsz-Rc
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 10:42:44 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GAgQak029751;
 Tue, 16 Mar 2021 05:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1615891346;
 bh=woWUaDHqVhUcUtdUKUvj06vRIr/+mBAcjXA8swBJfz0=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=tR5YiqdCx3SQLgf4rimr8J7hFqWHPBLmYenarpdx29h4mG+p+2Fi/g3o9/xjQeyxa
 l+tJ62QKDU6NgAO3Cc4yyDEYhYEtKTtdZlnKPUUG+/JgkI0ef2PwA5m7a88gmrOdJ7
 TRTB5wLLe4JRYB2froHpDCxkB2eJpHXpd9Hc2udw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GAgQa1091537
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 16 Mar 2021 05:42:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 16
 Mar 2021 05:42:26 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 16 Mar 2021 05:42:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GAgPNe023921;
 Tue, 16 Mar 2021 05:42:26 -0500
Date: Tue, 16 Mar 2021 16:12:25 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Michael Walle <michael@walle.cc>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH 1/3] mtd: spi-nor: sfdp: remember sfdp_size
Message-ID: <20210316104223.42tdob3uwjxc5vdz@ti.com>
References: <20210312190548.6954-1-michael@walle.cc>
 <20210312190548.6954-2-michael@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210312190548.6954-2-michael@walle.cc>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_104237_528266_C0515B33 
X-CRM114-Status: GOOD (  25.33  )
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

On 12/03/21 08:05PM, Michael Walle wrote:
> Save the sftp_size in the spi_nor struct so we can use it to dump the
> SFDP table without parsing the headers again.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/mtd/spi-nor/sfdp.c  | 12 ++++++++++++
>  include/linux/mtd/spi-nor.h |  1 +
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 25142ec4737b..b1814afefc33 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -16,6 +16,7 @@
>  	(((p)->parameter_table_pointer[2] << 16) | \
>  	 ((p)->parameter_table_pointer[1] <<  8) | \
>  	 ((p)->parameter_table_pointer[0] <<  0))
> +#define SFDP_PARAM_HEADER_PARAM_LEN(p) ((p)->length * 4)
>  
>  #define SFDP_BFPT_ID		0xff00	/* Basic Flash Parameter Table */
>  #define SFDP_SECTOR_MAP_ID	0xff81	/* Sector Map Table */
> @@ -1263,6 +1264,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	struct sfdp_parameter_header *param_headers = NULL;
>  	struct sfdp_header header;
>  	struct device *dev = nor->dev;
> +	size_t param_max_offset;
>  	size_t psize;
>  	int i, err;
>  
> @@ -1285,6 +1287,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  	    bfpt_header->major != SFDP_JESD216_MAJOR)
>  		return -EINVAL;
>  
> +	nor->sfdp_size = SFDP_PARAM_HEADER_PTP(bfpt_header) +
> +			 SFDP_PARAM_HEADER_PARAM_LEN(bfpt_header);
> +
>  	/*
>  	 * Allocate memory then read all parameter headers with a single
>  	 * Read SFDP command. These parameter headers will actually be parsed
> @@ -1311,6 +1316,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor,
>  		}
>  	}
>  
> +	for (i = 0; i < header.nph; i++) {
> +		param_header = &param_headers[i];
> +		param_max_offset = SFDP_PARAM_HEADER_PTP(param_header) +
> +				   SFDP_PARAM_HEADER_PARAM_LEN(param_header);
> +		nor->sfdp_size = max(nor->sfdp_size, param_max_offset);
> +	}
> +

I don't see any mention in the SFDP spec (JESD216D-01) that parameter 
tables have to be contiguous. In fact, it says that "Parameter tables 
may be located anywhere in the SFDP space. They do not need to 
immediately follow the parameter headers". But I guess we can just say 
the sysfs entry exports the entire SFDP space instead of just the tables 
so that is OK.

This patch looks good to me other than the small nitpick that we can 
merge this loop and the one below that tries to find the latest BFPT 
version.

>  	/*
>  	 * Check other parameter headers to get the latest revision of
>  	 * the basic flash parameter table.
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index a0d572855444..a58118b8b002 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -404,6 +404,7 @@ struct spi_nor {
>  	bool			sst_write_second;
>  	u32			flags;
>  	enum spi_nor_cmd_ext	cmd_ext_type;
> +	size_t			sfdp_size;

Documentation for this variable missing.

>  
>  	const struct spi_nor_controller_ops *controller_ops;
>  
> -- 
> 2.20.1
> 

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
