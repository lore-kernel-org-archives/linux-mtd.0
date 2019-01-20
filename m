Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1290C676F4
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 14:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3442087B
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 14:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="baJqbyP9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="hoPofmoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3442087B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/lDYbnvlj5xlfvK6YLdrcCK+ZidNzFa6KdH1V0xuX3Y=; b=baJqbyP9Yh4uSQ
	c/ZFCBQIwdI9mHQtcJNu8xMUrf8QSMBPh5APVSA4YnaAlD+X0Nr0dUL7kcWT/Pb0swtwWQ04KqIm1
	ur+VvNt4e/gDQUHVWebABisUTOO6JWuqsCr22i+q8okGoWXn0Xt47S6StEcFflF3zxZCcnHQp7agQ
	WbyjQ7NCiuFK34S4+p4U69hyj2axME10bqsGLaIjTdbkbejSeO93pXfzUsleBK5KO7UvmF+ndNsOk
	42WGQmQIKfqaGmdSy5DF/ml89hVowa3dmlyhkA3xrEWuUtcQfvccGdB+0Ng34UYOoT/rKHdGr0SJu
	yT5sk6XQTPqeRgXQcxCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glEWr-0008Ca-FI; Sun, 20 Jan 2019 14:56:53 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glEWm-0008Bq-DI
 for linux-mtd@lists.infradead.org; Sun, 20 Jan 2019 14:56:51 +0000
X-IronPort-AV: E=Sophos;i="5.56,499,1539673200"; d="scan'208";a="25547920"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 20 Jan 2019 07:56:46 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Sun, 20 Jan 2019 07:56:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NDX3Jxit3kh+vZtT2NVF8aGOrRlNIil2/0oqz7Hutdg=;
 b=hoPofmoPEHyMSK+t2NuTbKs5qEpxQuyjtzSHIzNRVU4h6iiJpoFW63jXVaTJ+l5hPAd2PidutR8ZY5FalFw0kNDMc8SlPKY5XqZN9M9tMdxsVZscRC1Q/eHYGHdAK3rtJXfyIksS7gJbeiNqr8X6aCtXh/W2h1/rxIYQog7eG7o=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.92.17) by
 DM5PR11MB1483.namprd11.prod.outlook.com (10.172.36.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Sun, 20 Jan 2019 14:56:42 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1%10]) with mapi id 15.20.1537.031; Sun, 20 Jan
 2019 14:56:42 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <bbrezillon@kernel.org>
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Topic: [PATCH v3 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Index: AQHUrYaDrXUj68GKYkqwbPlWtM/dE6W4RZ4A
Date: Sun, 20 Jan 2019 14:56:42 +0000
Message-ID: <6e6f7c3a-4772-1a17-0f5f-547ea9809283@microchip.com>
References: <20190116103027.22657-1-vigneshr@ti.com>
 <20190116103027.22657-3-vigneshr@ti.com>
In-Reply-To: <20190116103027.22657-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0802CA0021.eurprd08.prod.outlook.com
 (2603:10a6:800:aa::31) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:114::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [86.121.188.235]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR11MB1483;
 6:UBhHxVezT8VOgi+rjEH64/gYKJsQHp+RPAMlyZsVtzR4CL+WsjXTGHax8ANbXfKrd3zcEyRzbvrtqvbAl7ilzQhM15H2z2vQGR21MppDmmHQpS4J5ZZWaF3T7whAP8qih+yCvFv08qstk/Pxqp0PY1wvLtRr8DfidZgMRKHdtSw2T//eGzA7Kd0sgVtAXRtRG/hN/ingX/INLLzoycWBOND1Oaa2ty5tyqucsGpkEhHFb6WiiZscCSuwVkK7Ax5yArlRV4Kq+lQVeW6D02s0/4kSuf4kD81wiOn1C70q/v97LVxl4UCxMXPK5MSgQiVz0opU8B4v0k4PWkjUwHYWS67irkgB9BA9Jj5dIj4gUvnOqz/m2FVZwANo60vrvkQywWy9gNSx4lTfFaaS+VtgK9249SnqZ8X8WIQ/JhB4wkdAm25hK8nfd7uYdfwdw9unZkA98+aovuWAHVi88ocVgA==;
 5:9KnOiXwWuirQeiR+FqVos0fTbBlsa7ZxaTLWZAS19+nAsNnx+NFyopLuQ0bDbHDD5FBjDMpitPV2re4bM82L9aR6PIfbOjH1OYFAtOq/o/dZwSY54flg3nt8+sqlCvJIOQozzJaWE3bYmDNZwzzB8cSUFEJOKtrV5jzACw3nokU1Led8xodvEXMFnQ4S8BpjxZr4ZFsW+9Z+WPH8g8fD7g==;
 7:y2N7Kzdw7U13Q2Bej0nTgMxOCF54D43mQZHn4C8Fefj5o32bMFqqS61gckls2Q+CHcUFTdNGD9GQ64wk8+K/JFSda5cmWWPh90uFf7a/UstH2ZXCelP3uxBvqnG7UeaOl9b+WahW83AExgynOzzy1A==
x-ms-office365-filtering-correlation-id: 0d16e82d-ecbb-4da1-4463-08d67ee77cf0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600109)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR11MB1483; 
x-ms-traffictypediagnostic: DM5PR11MB1483:
x-microsoft-antispam-prvs: <DM5PR11MB1483A186B6B7CF2967FED1C9F09E0@DM5PR11MB1483.namprd11.prod.outlook.com>
x-forefront-prvs: 0923977CCA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39850400004)(396003)(346002)(366004)(136003)(199004)(189003)(11346002)(446003)(52116002)(478600001)(76176011)(97736004)(110136005)(31686004)(386003)(102836004)(6506007)(72206003)(53546011)(316002)(14454004)(26005)(6116002)(68736007)(2906002)(66066001)(54906003)(2616005)(3846002)(31696002)(86362001)(476003)(486006)(106356001)(186003)(6246003)(14444005)(71190400001)(71200400001)(81166006)(229853002)(4326008)(105586002)(256004)(53936002)(305945005)(6512007)(6486002)(36756003)(8676002)(81156014)(6436002)(25786009)(39060400002)(8936002)(99286004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1483;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uvTUf4nWz6Zmuim4sHaoDKw8FMmUK+fANgiIyhCyIfbn42/uPJcuTkqkj9v9qXDRTJ9Da/FmD8OZPBST1A6jikX6ThpL5hL9y8S4zXOA0tTNOhqEDRYhNnhEBTYgjHDWmyRv0664JkC4z6Nt3n2Yb9W8zpM9ykqgQ5tBwNDbS+YyiTzQduPt4cj9N7hnFgeFQvHbXbKThxCXphWOxBGux+TfhIbZn7fxOqa3UL8bAsXsXtVUQOrDZhMUzjluP+TZ6jBd5z5u5eRlZVwdvjKyZpVW6Z+cMUyefolP3eGHnUWurHR+QYmHxqxRc3bDgPOWCXtW1E9JI4+IUsQPkPrmbZZ2cBNK1tsrOg41aOIi5qksUlhme6Cmlx0WE0FndhFfOgiYcaZQ3z7RHBKHawlNsq1/yKa05xocd9uCHYp5b+c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <1A099F846579D24294CF38020A4C0E14@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d16e82d-ecbb-4da1-4463-08d67ee77cf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2019 14:56:40.3326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1483
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_065648_799485_A54D2E86 
X-CRM114-Status: GOOD (  20.82  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: marek.vasut@gmail.com, robh+dt@kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Vignesh,

On 01/16/2019 12:30 PM, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
> v3: No changes
> 
> v2:
> Declare Octal mode capability based on compatible.
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 54 +++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..31ed50f78972 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -93,6 +93,11 @@ struct cqspi_st {
>  	struct cqspi_flash_pdata f_pdata[CQSPI_MAX_CHIPSELECT];
>  };
>  
> +struct cqspi_driver_platdata {
> +	u32 hwcaps_mask;
> +	u8 quirks;
> +};
> +
>  /* Operation timeout value */
>  #define CQSPI_TIMEOUT_MS			500
>  #define CQSPI_READ_TIMEOUT_MS			10
> @@ -101,6 +106,7 @@ struct cqspi_st {
>  #define CQSPI_INST_TYPE_SINGLE			0
>  #define CQSPI_INST_TYPE_DUAL			1
>  #define CQSPI_INST_TYPE_QUAD			2
> +#define CQSPI_INST_TYPE_OCTAL			3
>  
>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>  #define CQSPI_DUMMY_BYTES_MAX			4
> @@ -911,6 +917,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>  		case SNOR_PROTO_1_1_4:
>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>  			break;
> +		case SNOR_PROTO_1_1_8:
> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -1213,21 +1222,19 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
>  
>  static int cqspi_setup_flash(struct cqspi_st *cqspi, struct device_node *np)
>  {
> -	const struct spi_nor_hwcaps hwcaps = {
> -		.mask = SNOR_HWCAPS_READ |
> -			SNOR_HWCAPS_READ_FAST |
> -			SNOR_HWCAPS_READ_1_1_2 |
> -			SNOR_HWCAPS_READ_1_1_4 |
> -			SNOR_HWCAPS_PP,
> -	};
>  	struct platform_device *pdev = cqspi->pdev;
>  	struct device *dev = &pdev->dev;
> +	struct cqspi_driver_platdata *ddata;

const struct cqspi_driver_platdata *ddata;

> +	struct spi_nor_hwcaps hwcaps;
>  	struct cqspi_flash_pdata *f_pdata;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	unsigned int cs;
>  	int i, ret;
>  
> +	ddata = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);

You forgot to check for NULL. Also, I would expect an implicit type cast, you
can drop the explicit cast.

> +	hwcaps.mask = ddata->hwcaps_mask;
> +
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		ret = of_property_read_u32(np, "reg", &cs);
> @@ -1310,7 +1317,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> -	unsigned long data;
> +	struct cqspi_driver_platdata *ddata;

const struct cqspi_driver_platdata *ddata;

>  	int ret;
>  	int irq;
>  
> @@ -1377,8 +1384,8 @@ static int cqspi_probe(struct platform_device *pdev)
>  	}
>  
>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> -	data  = (unsigned long)of_device_get_match_data(dev);
> -	if (data & CQSPI_NEEDS_WR_DELAY)
> +	ddata  = (struct cqspi_driver_platdata *)of_device_get_match_data(dev);

I would expect an implicit type cast, you can drop the explicit cast.

> +	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
>  		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
>  						   cqspi->master_ref_clk_hz);
>  
> @@ -1460,14 +1467,37 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>  #define CQSPI_DEV_PM_OPS	NULL
>  #endif
>  
> +#define cqspi_base_hwcaps_mask					\
> +	(SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST |		\
> +	SNOR_HWCAPS_READ_1_1_2 | SNOR_HWCAPS_READ_1_1_4 |	\
> +	SNOR_HWCAPS_PP)
> +
> +static const struct cqspi_driver_platdata cdns_qspi = {
> +	.hwcaps_mask = cqspi_base_hwcaps_mask,
> +};
> +
> +static const struct cqspi_driver_platdata k2g_qspi = {
> +	.hwcaps_mask = cqspi_base_hwcaps_mask,
> +	.quirks = CQSPI_NEEDS_WR_DELAY,
> +};
> +
> +static const struct cqspi_driver_platdata am654_ospi = {
> +	.hwcaps_mask = cqspi_base_hwcaps_mask | SNOR_HWCAPS_READ_1_1_8,
> +	.quirks = CQSPI_NEEDS_WR_DELAY,
> +};
> +
>  static const struct of_device_id cqspi_dt_ids[] = {
>  	{
>  		.compatible = "cdns,qspi-nor",
> -		.data = (void *)0,
> +		.data = (void *)&cdns_qspi,

You can drop the (void *) cast.

Looks good. Did you test the octal mode with mt35xu512aba? If yes, it would be
nice to specify this in the commit message.

Cheers,
ta

>  	},
>  	{
>  		.compatible = "ti,k2g-qspi",
> -		.data = (void *)CQSPI_NEEDS_WR_DELAY,
> +		.data = (void *)&k2g_qspi,
> +	},
> +	{
> +		.compatible = "ti,am654-ospi",
> +		.data = (void *)&am654_ospi,
>  	},
>  	{ /* end of table */ }
>  };
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
