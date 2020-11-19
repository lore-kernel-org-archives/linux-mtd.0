Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C42FC2D0E4
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 12:58:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D0A21D7A
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 12:58:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PT6to1hR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MQ7px4nO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D0A21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JCSQ9YUzNayUwi92VHkLh9nU2q49PsxXTy7NfvCfNVE=; b=PT6to1hRd0elBbtk8CXFAO0H2
	dFUEYPWV2zIdhuXaT7sqxDd+Kj3ScaNU4QecAo2LOaB7p0i9JhUaC3B5U/nzwwfWZNLR65RL9DwRn
	2zpFysuO8gI0jGr5PJtEXe9DUKaT8OxvCrUxHuCZ/fePTRyukPvjgW8MxJ2ona4NrT44vLPdtKOOK
	qjGzRFv70RezyGKzhOiJmCL42CnskZorimeTnZ2BwNT0Q3pqDawrSE+Us1MkTn6X0tvhxj0e42ZDF
	X3FjbC/QvVX6iTSLqvRRhfDmmIaJvs8VdfP9fBBFcvNdNcPNOxZKdjF9d7EKPOopXP+hFss+RiyHg
	LgnBfGr0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfjV7-0002Ee-Hx; Thu, 19 Nov 2020 12:57:25 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfjUz-0002EF-Na
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 12:57:18 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AJCvD9f062375;
 Thu, 19 Nov 2020 06:57:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605790633;
 bh=xiRtA5FYZ6iAiUYGUphkNw2hMyqBTr+KLMd36v13y7Y=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=MQ7px4nOSErv2I9cBLM6Ga1RHWEY3S2VPhjwv43HkmF5GGYVH1OUfWzhCHoCImxE1
 cdmxDSgY3bMH7uiOrIup5BZ4M/u8/udRZ10oZwtD/0JxHLNMWBMGuAjNzCs9p4kHuL
 9JZ2wSFbRkIqgE7xd/vtmUuTuVxWRkeEOsTQCfWE=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AJCvDjE054676
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 19 Nov 2020 06:57:13 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 19
 Nov 2020 06:57:12 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 19 Nov 2020 06:57:12 -0600
Received: from [10.250.233.179] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AJCv9G6120288;
 Thu, 19 Nov 2020 06:57:10 -0600
Subject: Re: [PATCH v8 3/6] spi: cadence-quadspi: Add multi-chipselect support
 for Intel LGM SoC
To: "Ramuthevar,Vadivel MuruganX"
 <vadivel.muruganx.ramuthevar@linux.intel.com>,
 <broonie@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>
References: <20201119055551.26493-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20201119055551.26493-4-vadivel.muruganx.ramuthevar@linux.intel.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <9fc328cc-1f4d-1896-6dde-a107d76e14cb@ti.com>
Date: Thu, 19 Nov 2020 18:27:09 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119055551.26493-4-vadivel.muruganx.ramuthevar@linux.intel.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_075717_937019_69C7F998 
X-CRM114-Status: GOOD (  22.58  )
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
Cc: cheol.yong.kim@intel.com, qi-ming.wu@intel.com,
 linux-mtd@lists.infradead.org, p.yadav@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 11/19/20 11:25 AM, Ramuthevar,Vadivel MuruganX wrote:
> From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> 
> Add multiple chipselect support for Intel LGM SoCs,
> currently QSPI-NOR and QSPI-NAND supported.
> 
> Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> ---
>  drivers/spi/spi-cadence-quadspi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
> index d12b765e87be..337778f75d5d 100644
> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c
> @@ -38,6 +38,7 @@
>  
>  /* Capabilities */
>  #define CQSPI_SUPPORTS_OCTAL		BIT(0)
> +#define CQSPI_SUPPORTS_MULTI_CHIPSELECT BIT(1)
>  
>  struct cqspi_st;
>  
> @@ -75,6 +76,7 @@ struct cqspi_st {
>  	bool			is_decoded_cs;
>  	u32			fifo_depth;
>  	u32			fifo_width;
> +	u32			num_chipselect;
>  	bool			rclk_en;
>  	u32			trigger_address;
>  	u32			wr_delay;
> @@ -1049,6 +1051,7 @@ static int cqspi_of_get_flash_pdata(struct platform_device *pdev,
>  
>  static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
>  {
> +	const struct cqspi_driver_platdata *ddata;

Unused variable?

>  	struct device *dev = &cqspi->pdev->dev;
>  	struct device_node *np = dev->of_node;
>  
> @@ -1070,6 +1073,14 @@ static int cqspi_of_get_pdata(struct cqspi_st *cqspi)
>  		return -ENXIO;
>  	}
>  
> +	ddata  = of_device_get_match_data(dev);
> +	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT) {

I don't see a need for this flag... Controller by default supports
multiple CS.

> +		if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect)) {
> +			dev_err(dev, "couldn't determine number of cs\n");
> +			return -ENXIO;
> +		}
> +	}
> +


Entire hunk can be replaced with:

        if (of_property_read_u32(np, "num-cs", &cqspi->num_chipselect))
		cqspi->num_chipselect = CQSPI_MAX_CHIPSELECT;


>  	cqspi->rclk_en = of_property_read_bool(np, "cdns,rclk-en");
>  
>  	return 0;
> @@ -1302,6 +1313,9 @@ static int cqspi_probe(struct platform_device *pdev)
>  	cqspi->current_cs = -1;
>  	cqspi->sclk = 0;
>  
> +	if (ddata->hwcaps_mask & CQSPI_SUPPORTS_MULTI_CHIPSELECT)
> +		master->num_chipselect = cqspi->num_chipselect;
> +

And then this becomes:
	master->num_chipselect = cqspi->num_chipselect;

>  	ret = cqspi_setup_flash(cqspi);
>  	if (ret) {
>  		dev_err(dev, "failed to setup flash parameters %d\n", ret);
> @@ -1391,6 +1405,7 @@ static const struct cqspi_driver_platdata am654_ospi = {
>  };
>  
>  static const struct cqspi_driver_platdata intel_lgm_qspi = {
> +	.hwcaps_mask = CQSPI_SUPPORTS_MULTI_CHIPSELECT,
>  	.quirks = CQSPI_DISABLE_DAC_MODE,
>  };
>  
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
