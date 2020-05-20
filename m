Return-Path: <SRS0=rTSM=7C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E21C433DF
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 21:15:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 760E0206C3
	for <linux-mtd@archiver.kernel.org>; Wed, 20 May 2020 21:15:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l4huugyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 760E0206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOQmzhApCnjThDwPk8cC7v40Ddse8fS2zjgCOK7KEP8=; b=l4huugyW6Cf3AT
	5DjPCbY+hjJrtZnHRs0AfzEQ/pR4RawadrMu8iIene9nRPW1GvYvkMS5GmhESlTX7yNbS8nKeIcga
	C5XIPo+I2PKyAcYpG5g8VLfdRpHIIHAfJLDXRVwnwxhSEkxvDtPDkVp7YfQ8z2kwI78EHgmgWLjjK
	xixLBKqnogRCFaVxfq7ez5W4BJZimmwLi7+1X6J8n76cs80QM1l8Q9H1o2lGRrYbwKXYtx3qzyxzX
	iJ3fvfM0mstIGrgJ5YO29IaFqZ6HuJOgIJ1Vk3/UANyuHIHN9e1h0dL2ax2PmEiKButRWkFYpGs/k
	jS0VvvD6sRtRGgEOEH3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbW3a-00004q-VU; Wed, 20 May 2020 21:15:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbW3V-0008NR-DA
 for linux-mtd@lists.infradead.org; Wed, 20 May 2020 21:15:15 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F2C2F2A22BD;
 Wed, 20 May 2020 22:15:11 +0100 (BST)
Date: Wed, 20 May 2020 23:15:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rickard Andersson <rickaran@axis.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add timings for Kioxia
 TH58NVG2S3HBAI4
Message-ID: <20200520231508.7216afe8@collabora.com>
In-Reply-To: <20200520133854.25241-2-rickaran@axis.com>
References: <20200520133854.25241-1-rickaran@axis.com>
 <20200520133854.25241-2-rickaran@axis.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_141513_588272_1E7437AD 
X-CRM114-Status: GOOD (  21.35  )
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
Cc: linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 20 May 2020 15:38:54 +0200
Rickard Andersson <rickaran@axis.com> wrote:

> From: Rickard x Andersson <rickaran@axis.com>
> 
> The Kioxia/Toshiba TH58NVG2S3HBAI4 NAND memory is not a
> ONFI compliant memory. The timings of the memory is quite
> close to ONFI mode 4 but is breaking that spec.
> 
> Erase block read speed is increased from 6910 KiB/s to
> 13490 KiB/s. Erase block write speed is increased from
> 3350 KiB/s to 4410 KiB/s.
> 
> Tested on IMX6SX which has a NAND controller supporting
> EDO mode.
> 
> Signed-off-by: Rickard x Andersson <rickaran@axis.com>
> ---
>  drivers/mtd/nand/raw/nand_ids.c     |  3 ++
>  drivers/mtd/nand/raw/nand_toshiba.c | 66 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
> index e0dbc2e316c7..8b676e8b481b 100644
> --- a/drivers/mtd/nand/raw/nand_ids.c
> +++ b/drivers/mtd/nand/raw/nand_ids.c
> @@ -52,6 +52,9 @@ struct nand_flash_dev nand_flash_ids[] = {
>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>  		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
>  		  NAND_ECC_INFO(40, SZ_1K), 4 },
> +	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
> +		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
> +		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
>  
>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index b6efaf5195bb..60ca895b1775 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -26,6 +26,52 @@
>  /* Max ECC Steps for BENAND */
>  #define TOSHIBA_NAND_MAX_ECC_STEPS		8
>  
> +static const struct nand_data_interface th58nvg2s3hbai4_timings = {
> +	.type = NAND_SDR_IFACE,
> +	.timings.mode = 0,
> +	.timings.sdr = {
> +		.tPROG_max = 700000000,
> +		.tBERS_max = 5000000000,
> +		.tCCS_min = 500000,
> +		.tR_max = 200000000,
> +		.tADL_min = 400000,
> +		.tALH_min = 5000,
> +		.tALS_min = 12000,
> +		.tAR_min = 10000,
> +		.tCEA_max = 25000,
> +		.tCEH_min = 20000,
> +		.tCH_min = 5000,
> +		.tCHZ_max = 20000,
> +		.tCLH_min = 5000,
> +		.tCLR_min = 10000,
> +		.tCLS_min = 12000,
> +		.tCOH_min = 0,
> +		.tCS_min = 20000,
> +		.tDH_min = 5000,
> +		.tDS_min = 12000,
> +		.tFEAT_max = 1000000,
> +		.tIR_min = 0,
> +		.tITC_max = 1000000,
> +		.tRC_min = 25000,
> +		.tREA_max = 20000,
> +		.tREH_min = 10000,
> +		.tRHOH_min = 25000,
> +		.tRHW_min = 30000,
> +		.tRHZ_max = 60000,
> +		.tRLOH_min = 5000,
> +		.tRP_min = 12000,
> +		.tRR_min = 20000,
> +		.tRST_max = 500000000,
> +		.tWB_max = 100000,
> +		.tWC_min = 25000,
> +		.tWH_min = 10000,
> +		.tWHR_min = 60000,
> +		.tWP_min = 12000,
> +		.tWW_min = 100000,
> +	}
> +};

If we don't want the RO section to grow considerably we should try to
come with a solution to express things in term of deviation from an
existing ONFI timing mode. I'd expect most parameters to match.

> +
> +
>  static int toshiba_nand_benand_read_eccstatus_op(struct nand_chip *chip,
>  						 u8 *buf)
>  {
> @@ -194,6 +240,18 @@ static void toshiba_nand_decode_id(struct nand_chip *chip)
>  	}
>  }
>  
> +static int th58nvg2s3hbai4_choose_data_interface(struct nand_chip *chip)
> +{
> +	int ret;
> +
> +	chip->data_interface = th58nvg2s3hbai4_timings;

Something like:

	/* Start from the closest timing mode. */
	onfi_fill_data_interface(chip, SDR, modeX);

	/* Patch only what you need to patch. */
	chip->data_interface.timings.tXX = YY;

	...
	

> +
> +	/* Check if the controller can handle the timings */
> +	ret = nand_test_data_interface(chip);
> +
> +	return ret;
> +}
> +
>  static int tc58teg5dclta00_init(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -205,6 +263,12 @@ static int tc58teg5dclta00_init(struct nand_chip *chip)
>  	return 0;
>  }
>  
> +static int th58nvg2s3hbai4_init(struct nand_chip *chip)
> +{
> +	chip->ops.choose_data_interface = th58nvg2s3hbai4_choose_data_interface;
> +	return 0;
> +}
> +
>  static int toshiba_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> @@ -217,6 +281,8 @@ static int toshiba_nand_init(struct nand_chip *chip)
>  
>  	if (!strcmp("TC58TEG5DCLTA00", chip->parameters.model))
>  		tc58teg5dclta00_init(chip);
> +	if (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model, 15))
> +		th58nvg2s3hbai4_init(chip);

I think we should add a table with all the chips needing a specific
initialization.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
