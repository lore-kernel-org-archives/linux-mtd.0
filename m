Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752C0C282C7
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 15:32:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4247021473
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 15:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PHw7XhOW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="jZFNo8/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4247021473
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t24khYoRXUza+1ZgMupBfzzLui3gnuqq9kzfKL3e2ng=; b=PHw7XhOWWeWN0A
	y38I2FvC9KI2CcJXCwD50YaUhQNy0MWl1UZ338RX743Mxim1iCosbGw6jBMaVdzg9KyXrdbDWzQy7
	oqgeYFLkQYcju7Tssw3squXP3ifMzVtCOK3AiYpZNBQSMBSj3goaGr64vcA995R/rpgwbwyf4OcZc
	EFRc6HKwECnTtwZamOllXA7jubxW9OIV0Lsu0cSOM+5ATcIuo1NU1QZpZFqBqjv2NNV9WoN0Tk++M
	rTAX49ARvCWSUKyA3ADng8gOJ4UiPA+WzhnBBum4cFhi0rSRdi8hR2g3+ZsAqKjqMjYiEfpyAtBfH
	Y4njg9y8jzHqtIdDKeyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goVMw-0001Xj-6G; Tue, 29 Jan 2019 15:32:10 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goVMs-0001Wt-Tx
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 15:32:08 +0000
X-IronPort-AV: E=Sophos;i="5.56,537,1539673200"; d="scan'208";a="23974620"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Jan 2019 08:32:04 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.106) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 29 Jan 2019 08:32:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT+UIRqZt6Qtkwv4WXB9AtgbxOCdN74nFfTtGsViVD4=;
 b=jZFNo8/2JLSRwt1m6LORxJGoL3hNLvG99SpA36rrJSYVbP0ZRzZucufaeujpO4puNs/orn3fnaOHGdSoL5CxttsYYy+Gl1/qDgYXzKsrRW2yBLkfy5cxDdcRYI0t+rPHyKT+7Q4/07M4DF133UfzVMOPJ5axwhC6CBqCOUaAAek=
Received: from DM5PR11MB1850.namprd11.prod.outlook.com (10.175.92.17) by
 DM5PR11MB1482.namprd11.prod.outlook.com (10.172.36.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1558.17; Tue, 29 Jan 2019 15:32:01 +0000
Received: from DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1]) by DM5PR11MB1850.namprd11.prod.outlook.com
 ([fe80::4125:8d55:234b:a4a1%11]) with mapi id 15.20.1558.021; Tue, 29 Jan
 2019 15:32:01 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <bbrezillon@kernel.org>
Subject: Re: [PATCH v5 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Topic: [PATCH v5 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Index: AQHUts0ncEJQIKZPZEqSdXwhQs20vaXGYe2A
Date: Tue, 29 Jan 2019 15:32:01 +0000
Message-ID: <2efbca08-c4ab-34ea-0e34-05aed7168df8@microchip.com>
References: <20190128054935.4972-1-vigneshr@ti.com>
 <20190128054935.4972-3-vigneshr@ti.com>
In-Reply-To: <20190128054935.4972-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:800:92::16) To DM5PR11MB1850.namprd11.prod.outlook.com
 (2603:10b6:3:114::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR11MB1482;
 6:sdwVUv6h+VrdG9tcYXtJknz3nUEYb962RnLS94asnNZR/AG/1aUiugql3U553bNgEOmymcvbQal1sG7nKMjuQsonDL2j9sSTyO34F1wAEFQwbt8jE1r+CdLyUWAvZj6LvxbLAgrUMx/hMGpgol5YILUzh1SKBLYCUBi506atC3LtqJZE23YDd6zbJwhpuHoTLV1leDz5pVT4FcWOWAtqF8/0Eeo4DqnrfRXWNyF1WuL74QfS/MSP+H22qu1qWIIlm+hFzXG8nxj3VJmLJxWanVD9O1HFWwC9y/JW0qwq39H/SsrBsOQD4KuZxYQ4h5sEk1yeCJGRgD53NyyWYsKmiUeDjhfE12Q103kTfGahObecdm//hivjbq3qgrIvYg62c2fzTXYL5LBejDyagl2asd3lrla/z9HdTsJ1ST5x3Wq6iPpIAgzrSCgWJIgt3ndnSpwDT1P7U/fJ/w0aR2CN8w==;
 5:Z9EOttrWDBKk2R/uResPeku7OoqnIEHlWI21nJCwBpfG7U7N3q4d2SQHv3aWluxfKoM5ym/Kp7PL7Bni0pBUOXeG/y+BG9mvMQla6NncTP00gXU+1OCe2QHZBZ2JQT9BWPfwT5rPiud/oW/eZwfdvZ6FuW0id7TPiywlgnR1iVCr6Ad/F2beL9HT+1K5ydWjE6AVMJd9J7YJrkeSmHTNvQ==;
 7:60KEjNqfXqCw8RtyW6CycfBKafTa5hRqJhdXhvHWvcBwaivdixdF1ZnqddZ0rgyp4naZZjIdJ7gULmj8ZPxbzsJiaBgLoT85fps/ibbwhKbs2hh4MfZQDq+gi1CfQZhTLx/DgfgRPE8/p6YDYZrF7Q==
x-ms-office365-filtering-correlation-id: f52fa4e7-1791-412e-7f9b-08d685fee9ca
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:DM5PR11MB1482; 
x-ms-traffictypediagnostic: DM5PR11MB1482:
x-microsoft-antispam-prvs: <DM5PR11MB1482C7A884B930DCA71715FBF0970@DM5PR11MB1482.namprd11.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(366004)(376002)(346002)(136003)(396003)(39860400002)(199004)(189003)(6486002)(31696002)(53936002)(39060400002)(68736007)(76176011)(97736004)(86362001)(4326008)(256004)(52116002)(14444005)(2906002)(6246003)(6436002)(25786009)(229853002)(6512007)(476003)(2616005)(11346002)(8936002)(81166006)(81156014)(36756003)(54906003)(110136005)(71200400001)(106356001)(102836004)(3846002)(316002)(446003)(14454004)(53546011)(31686004)(66066001)(478600001)(386003)(105586002)(8676002)(486006)(186003)(7736002)(26005)(6506007)(71190400001)(72206003)(99286004)(6116002)(305945005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR11MB1482;
 H:DM5PR11MB1850.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YCvIXoQVPResnyu/8dfQGUgw4ng8iUjcj5ImZ38lYt/AUHcSdGGaEjijRkV/+ccDUF4ygooOFjnScZQkD0vyDp1OTO2KNBSgh+90HxS+nKFgfMmJ6gMV6A+akuPWnbOHMQlISjZp6Ah+0QFCJ2zjq7t/FaB1Zbtx/VSyn3wYHRHVIkZ97aOhlGVXIa15zzSigM1lmDmotCgYqP80YPSf+lOxHoiHmwxsE4wCn9HRikTC6yDkV1QMtY2JjJnPptPliE9RuNZuK6hs9TwKaQWqV/iFSJI2yNpJBzMRVYSacFza+8kDJkF9GGOks/PTI+CzPIoAuwLIEPxvhN0wVSjVWcc70xvtRr7H9k6/ufmDmBfLbRiUAEc8Oh+rMCicwtxVtW1vc+8Xg4HFhx1qB0BdZ9Q/Ghy+xh2EKYTQi45/2Rw=
Content-ID: <6C03ECA0C3DEFA4D81C0A2EB1F62BB94@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f52fa4e7-1791-412e-7f9b-08d685fee9ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 15:31:59.4230 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1482
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_073207_124838_7B5780E0 
X-CRM114-Status: GOOD (  21.64  )
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



On 01/28/2019 07:49 AM, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode. Only Octal SDR read (1-1-8)mode is supported for now.
> 
> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> 
> v5:
> s/cqsi_base_hwcaps_mask/CQSPI_BASE_HWCAPS_MASK/g
> Add back cqspi_driver_platdata definition for base compatible.
> 
> v4: Fix comments by Tudor on v3
> v3: No changes
> v2: Declare Octal mode capability based on compatible.
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 58 +++++++++++++++++++++------
>  1 file changed, 46 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..c8113ebe44fd 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -44,6 +44,12 @@
>  /* Quirks */
>  #define CQSPI_NEEDS_WR_DELAY		BIT(0)
>  
> +/* Capabilities mask */
> +#define CQSPI_BASE_HWCAPS_MASK					\
> +	(SNOR_HWCAPS_READ | SNOR_HWCAPS_READ_FAST |		\
> +	SNOR_HWCAPS_READ_1_1_2 | SNOR_HWCAPS_READ_1_1_4 |	\
> +	SNOR_HWCAPS_PP)
> +
>  struct cqspi_st;
>  
>  struct cqspi_flash_pdata {
> @@ -93,6 +99,11 @@ struct cqspi_st {
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
> @@ -101,6 +112,7 @@ struct cqspi_st {
>  #define CQSPI_INST_TYPE_SINGLE			0
>  #define CQSPI_INST_TYPE_DUAL			1
>  #define CQSPI_INST_TYPE_QUAD			2
> +#define CQSPI_INST_TYPE_OCTAL			3
>  
>  #define CQSPI_DUMMY_CLKS_PER_BYTE		8
>  #define CQSPI_DUMMY_BYTES_MAX			4
> @@ -911,6 +923,9 @@ static int cqspi_set_protocol(struct spi_nor *nor, const int read)
>  		case SNOR_PROTO_1_1_4:
>  			f_pdata->data_width = CQSPI_INST_TYPE_QUAD;
>  			break;
> +		case SNOR_PROTO_1_1_8:
> +			f_pdata->data_width = CQSPI_INST_TYPE_OCTAL;
> +			break;
>  		default:
>  			return -EINVAL;
>  		}
> @@ -1213,21 +1228,22 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
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
> +	const struct cqspi_driver_platdata *ddata;
> +	struct spi_nor_hwcaps hwcaps;
>  	struct cqspi_flash_pdata *f_pdata;
>  	struct spi_nor *nor;
>  	struct mtd_info *mtd;
>  	unsigned int cs;
>  	int i, ret;
>  
> +	ddata = of_device_get_match_data(dev);
> +	if (!ddata)
> +		hwcaps.mask = CQSPI_BASE_HWCAPS_MASK;

Now that .data is set in all cqspi_dt_ids[], maybe it's better to print a
message and return an error here. But I guess it's a matter of taste, so not a
show stopper.

> +	else
> +		hwcaps.mask = ddata->hwcaps_mask;
> +
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		ret = of_property_read_u32(np, "reg", &cs);
> @@ -1310,7 +1326,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> -	unsigned long data;
> +	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
>  
> @@ -1377,8 +1393,8 @@ static int cqspi_probe(struct platform_device *pdev)
>  	}
>  
>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
> -	data  = (unsigned long)of_device_get_match_data(dev);
> -	if (data & CQSPI_NEEDS_WR_DELAY)
> +	ddata  = of_device_get_match_data(dev);
> +	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
>  		cqspi->wr_delay = 5 * DIV_ROUND_UP(NSEC_PER_SEC,
>  						   cqspi->master_ref_clk_hz);
>  
> @@ -1460,14 +1476,32 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>  #define CQSPI_DEV_PM_OPS	NULL
>  #endif
>  
> +static const struct cqspi_driver_platdata cdns_qspi = {
> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
> +};
> +
> +static const struct cqspi_driver_platdata k2g_qspi = {
> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK,
> +	.quirks = CQSPI_NEEDS_WR_DELAY,
> +};
> +
> +static const struct cqspi_driver_platdata am654_ospi = {
> +	.hwcaps_mask = CQSPI_BASE_HWCAPS_MASK | SNOR_HWCAPS_READ_1_1_8,
> +	.quirks = CQSPI_NEEDS_WR_DELAY,
> +};
> +
>  static const struct of_device_id cqspi_dt_ids[] = {
>  	{
>  		.compatible = "cdns,qspi-nor",
> -		.data = (void *)0,
> +		.data = &cdns_qspi,
>  	},
>  	{
>  		.compatible = "ti,k2g-qspi",
> -		.data = (void *)CQSPI_NEEDS_WR_DELAY,
> +		.data = &k2g_qspi,
> +	},
> +	{
> +		.compatible = "ti,am654-ospi",
> +		.data = &am654_ospi,
>  	},
>  	{ /* end of table */ }
>  };
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
