Return-Path: <SRS0=kjCr=7L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE326C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:33:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AF32074D
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2020 11:33:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T7ToEKoY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84AF32074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRBoISTZr0M3gm4Y402ckxE8XrV0PFtKLQgZLc8ETXA=; b=T7ToEKoY1p4pUb
	5Cl11501pIoojqFK8w366yoCq9fzpFnzp1qsw9pRIydNOICHXt91hUyJsX6EdjAGgyVlqRBG/UopE
	DTl/K5FX71SWuFn0Nfv6rF/PWBu72snBoqGS7mHz0r4BWllz2wz1HOMo+o+0hqF5UZkkS4mw9xeYb
	y0QEgdVplkq7DFp7s4LdKafaabSUbaoqxUAPh2kn1L+1O8BgHs94rHoM1E5EwdpSS/jm6N35jaOdU
	JXRe7G9KCMf8Gy1cNx7O/BWiGMtOQdGxX54qyCKFTtr4GwpyfYPdlLLZgUzXYrco/KrVKdH7PnU+u
	cAADbVYWyLkBs7mlC0Yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jedGI-0007Eu-3r; Fri, 29 May 2020 11:33:18 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jedGF-0007DL-H9
 for linux-mtd@lists.infradead.org; Fri, 29 May 2020 11:33:17 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5C4132A0233;
 Fri, 29 May 2020 12:33:13 +0100 (BST)
Date: Fri, 29 May 2020 13:33:11 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v7 26/28] mtd: rawnand: toshiba: Choose the interface
 configuration for TH58NVG2S3HBAI4
Message-ID: <20200529133311.28a8123d@collabora.com>
In-Reply-To: <20200529111322.7184-27-miquel.raynal@bootlin.com>
References: <20200529111322.7184-1-miquel.raynal@bootlin.com>
 <20200529111322.7184-27-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_043315_696240_E037C22E 
X-CRM114-Status: GOOD (  20.58  )
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
Cc: Rickard x Andersson <rickaran@axis.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 May 2020 13:13:20 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> From: Rickard x Andersson <rickaran@axis.com>
> 
> The Kioxia/Toshiba TH58NVG2S3HBAI4 NAND memory is not ONFI compliant.
> The timings of the NAND chip memory are quite close to ONFI mode 4 but
> is breaking that spec.
> 
> By providing our own set of timings, erase block read speed is increased
> from 6910 kiB/s to 13490 kiB/s and erase block write speed is increased
> from 3350 kiB/s to 4410 kiB/s.
> 
> Tested on IMX6SX which has a NAND controller supporting EDO mode.
> 
> Signed-off-by: Rickard x Andersson <rickaran@axis.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/mtd/nand/raw/nand_ids.c     |  3 +++
>  drivers/mtd/nand/raw/nand_toshiba.c | 38 +++++++++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> diff --git a/drivers/mtd/nand/raw/nand_ids.c b/drivers/mtd/nand/raw/nand_ids.c
> index 3b890d55703d..b9945791a9d7 100644
> --- a/drivers/mtd/nand/raw/nand_ids.c
> +++ b/drivers/mtd/nand/raw/nand_ids.c
> @@ -51,6 +51,9 @@ struct nand_flash_dev nand_flash_ids[] = {
>  		{ .id = {0xad, 0xde, 0x94, 0xda, 0x74, 0xc4} },
>  		  SZ_8K, SZ_8K, SZ_2M, NAND_NEED_SCRAMBLING, 6, 640,
>  		  NAND_ECC_INFO(40, SZ_1K) },
> +	{"TH58NVG2S3HBAI4 4G 3.3V 8-bit",
> +		{ .id = {0x98, 0xdc, 0x91, 0x15, 0x76} },
> +		  SZ_2K, SZ_512, SZ_128K, 0, 5, 128, NAND_ECC_INFO(8, SZ_512) },
>  
>  	LEGACY_ID_NAND("NAND 4MiB 5V 8-bit",   0x6B, 4, SZ_8K, SP_OPTIONS),
>  	LEGACY_ID_NAND("NAND 4MiB 3,3V 8-bit", 0xE3, 4, SZ_8K, SP_OPTIONS),
> diff --git a/drivers/mtd/nand/raw/nand_toshiba.c b/drivers/mtd/nand/raw/nand_toshiba.c
> index 6d53f9b7a817..f746c19f3b2c 100644
> --- a/drivers/mtd/nand/raw/nand_toshiba.c
> +++ b/drivers/mtd/nand/raw/nand_toshiba.c
> @@ -212,6 +212,33 @@ tc58nvg0s3e_choose_interface_config(struct nand_chip *chip,
>  	return nand_choose_best_sdr_timings(chip, iface, NULL);
>  }
>  
> +static int
> +th58nvg2s3hbai4_choose_interface_config(struct nand_chip *chip,
> +					struct nand_interface_config *iface)
> +{
> +	struct nand_sdr_timings *sdr = &iface->timings.sdr;
> +
> +	/* Start with timings from the closest timing mode, mode 4. */
> +	onfi_fill_interface_config(chip, iface, NAND_SDR_IFACE, 4);
> +
> +	/* Patch timings that differ from mode 4. */
> +	sdr->tALS_min = 12000;
> +	sdr->tCHZ_max = 20000;
> +	sdr->tCLS_min = 12000;
> +	sdr->tCOH_min = 0;
> +	sdr->tDS_min = 12000;
> +	sdr->tRHOH_min = 25000;
> +	sdr->tRHW_min = 30000;
> +	sdr->tRHZ_max = 60000;
> +	sdr->tWHR_min = 60000;
> +
> +	/* Patch timings not part of onfi timing mode. */
> +	sdr->tPROG_max = 700000000;
> +	sdr->tBERS_max = 5000000000;
> +
> +	return nand_choose_best_sdr_timings(chip, iface, sdr);
> +}
> +
>  static int tc58teg5dclta00_init(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd = nand_to_mtd(chip);
> @@ -232,6 +259,14 @@ static int tc58nvg0s3e_init(struct nand_chip *chip)
>  	return 0;
>  }
>  
> +static int th58nvg2s3hbai4_init(struct nand_chip *chip)
> +{
> +	chip->ops.choose_interface_config =
> +		&th58nvg2s3hbai4_choose_interface_config;
> +
> +	return 0;
> +}
> +
>  static int toshiba_nand_init(struct nand_chip *chip)
>  {
>  	if (nand_is_slc(chip))
> @@ -247,6 +282,9 @@ static int toshiba_nand_init(struct nand_chip *chip)
>  	if (!strncmp("TC58NVG0S3E", chip->parameters.model,
>  		     sizeof("TC58NVG0S3E") - 1))
>  		tc58nvg0s3e_init(chip);
> +	if (!strncmp("TH58NVG2S3HBAI4", chip->parameters.model,
> +		     sizeof("TH58NVG2S3HBAI4") - 1))
> +		th58nvg2s3hbai4_init(chip);
>  
>  	return 0;
>  }


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
