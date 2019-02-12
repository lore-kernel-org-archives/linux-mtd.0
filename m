Return-Path: <SRS0=ca8F=QT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE000C282C4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 09:12:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB8F21773
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Feb 2019 09:12:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LXcD5JSK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="qEOKw80m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB8F21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+udmT5fqVW2L6KNQ6WJZGKuFkjwYh41W6gqn81XnWNc=; b=LXcD5JSKx2uhee
	WQq/n5JNP8R3ZCdETg1B6Zfn6vtnrUwzhEQLdgAwS2Z5BCOwCkRdIYccKGl/iTFKfigHMBQE3/eQT
	roNrGLxLI3cvyNx5EGkg4jn1qXfoBZHmc5gYD2+ut6aDnGq0rQIMPh7HBOxzD705Fg8PgUrg8o9QN
	yUAOvRrDKFHr2pRopDyIUxIKt6TrPQEmVkRIf34oYzi2ohzw/P1DScMgtGOnaNVBx+DtniwmAlR4d
	oOJK/QKmH2dfk4Cwo7TacV2+oKHzaIvYpSTG/+EbptQJ88PD41zOdJ5rbPFPuwRljUW4WdY16HZqF
	kXst0YL7aJ5NqlMMV0Fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtU76-0005oB-L0; Tue, 12 Feb 2019 09:12:24 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtU73-0005mS-BR
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2019 09:12:23 +0000
X-IronPort-AV: E=Sophos;i="5.58,361,1544511600"; d="scan'208";a="26128148"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 12 Feb 2019 02:12:15 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 12 Feb 2019 02:12:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAc622ONusGQ1xJrFVCqyoGTf3Ez3DzytIQtfPQbpIM=;
 b=qEOKw80m0QLfCmxtvzIYtsVXgqZl/ktZ0u9RBa9ah573M//4HLYiib+RVkiJV4gfJVD35Wo6DMhrDti5B1+kR+bWVdwUO4E8LcyBpKimmWbTaiFK5Gnyvjpbx6jZPFNGPRms6ja+30aGMKCBdHbGmRbm38FWdf+XxCxrYzK+NWI=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB0051.namprd11.prod.outlook.com (10.161.153.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.16; Tue, 12 Feb 2019 09:12:13 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::847:4296:13b9:fc9f%8]) with mapi id 15.20.1601.023; Tue, 12 Feb 2019
 09:12:13 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <bbrezillon@kernel.org>
Subject: Re: [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Topic: [PATCH v6 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Index: AQHUwq48b4jWhW2KSkah1PkAN2keT6Xb4K6A
Date: Tue, 12 Feb 2019 09:12:12 +0000
Message-ID: <f6df1931-1243-d112-fdc1-8184b561bce9@microchip.com>
References: <20190212083809.6534-1-vigneshr@ti.com>
 <20190212083809.6534-3-vigneshr@ti.com>
In-Reply-To: <20190212083809.6534-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P195CA0050.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::39) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58302064-2fed-4259-7314-08d690ca2c8d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB0051; 
x-ms-traffictypediagnostic: BN6PR11MB0051:
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtCTjZQUjExTUIwMDUxOzIzOnZNMFpiRUxWWU5TT2d3VEdYQXJldFNSUjgx?=
 =?utf-8?B?c1BsRXVIWlpGaGlESnNlcFJLNkdkWkxNNzA3V2RmT0xKZnp1bUZCSkwwTWd1?=
 =?utf-8?B?ZFpFM1Z3RHcwa01sazN6UlJIV2Iwd3lqUTFDVTI3NGZGdVJ0MlVtMStLZ3I4?=
 =?utf-8?B?Wmp1dXp4K3A4cmttUUd4YjY1NTFnM3hndUlPclNNSVZwZE5MdFplWkE2ZThQ?=
 =?utf-8?B?Z3I0SyszMVRmbzRhekpKWGNzWUY4NWxXN2l0S0YzSitLZkZITjkrMFZrREE3?=
 =?utf-8?B?Z241b3pVakd3R0xFcFoxN21TMm5GbXJ4V0taMjZId0l6K2Zsa1cwd3puY3FY?=
 =?utf-8?B?TU1NcWxuamVCcU1iNUxSaUFPdXN2MzlrSTkzQVB0NnBPazIwOU9WTi9jSkRE?=
 =?utf-8?B?alZoUFBYZlMvb1V2Ukx0N1cvb3BGUTZkVVVGWVVrU1V5WFJCNjFSVEtjZFdF?=
 =?utf-8?B?VUVOZHhJd2ltcmtHaWx1Vyt1RG0zUlk2d1orT0ZTbFFBVUN3Y25FeUR5SHNz?=
 =?utf-8?B?RFNYNEY4N05hWmY0SmlacDlucGtvSEJYYzZIZnhzaFl4dlhSemZKQmZ6Ni80?=
 =?utf-8?B?S2NVdjRWUjE1U0Y3dVNqVXRYQTdobXI5MmFnbERKbHFWazg2UmRYaE9vNGt5?=
 =?utf-8?B?aHJWYkx6SWx3ZGp5QU5CUkVvWVBKdVBYRncxbmtleEs4MERNRnUyOEFZdmJw?=
 =?utf-8?B?WktXNktIeENYVVNpQms5Rm5WcHJyKzNCeWRBY0xIOXFEQVc3bVVPbS9zVjNv?=
 =?utf-8?B?NHdJcFd1WWMwR1NNMTN1dXVUTzNOSzRCanFXdHBiZXZmL1FIM1lhalQ3RU5I?=
 =?utf-8?B?YjcrOHJlcWEzVmdkN3R5RGd2TUJVU0NFRHNtWk41ampkQzJXL05ySVJwZ3k0?=
 =?utf-8?B?WGZjL09DaFh2ak41djJXSG9LQ09kaE5zWlpKUy84eXlTZnc4b3FreHcvTUFS?=
 =?utf-8?B?WHYwaFFyV28zR2dEbDhrazFBeUtsaStKaXdRUjdwS0JVazE4NEc2RWxuWTln?=
 =?utf-8?B?UlVCeHhteVhQTDJreEF4M3BZWGFiTTlnNHJaL2FPVCtuRU1neFNJWk9QeEhQ?=
 =?utf-8?B?YTk2Y1pVR2NFbFVnV3FsN29xdWxJb21QUFBZRzNDdWRIeTIwT1IyTmRLdEE1?=
 =?utf-8?B?RXgxaGl0aW95R2tDdEVRUDkvVmFpODlLbGRwais1cGl3ZURwdkp0QXN2M2ZZ?=
 =?utf-8?B?WHFmQjAxUnlMbWtnRm0weVZhUXlBTks4QWxsYVprbHlGbnFpN3pPWFZ2c25Q?=
 =?utf-8?B?VU5Cd1RUQm5wdmJNMjV2dlBZNmhtc0x1eGJJMWt2clFXenZqejJvd01qRzhM?=
 =?utf-8?B?V0Z4cVUxTEg0ZS8vbG1sVnBKaldQVDQ4SUVyZEhldTVrdXgxL2pwRG42QlMr?=
 =?utf-8?B?REpnbmozYzBNQjNzRDJoMitsTWNpN1ZGdDhibndBS0Vsa1llT2FaWFVkaGdD?=
 =?utf-8?B?UHdmOXZVR3l5bzVMZnFCdU9Na0pzV2FtWDFuTDlpUEVTL2d3K0g3T2V4aGtV?=
 =?utf-8?B?ekFVWVQ2QWgwUTdVSXZkeTdUUi9FTTMzaHpZT29Ud0JLa1lHS1hYTnMwNFNV?=
 =?utf-8?B?S1M3TGFQTm5Zb3pyaTdmWkhLMElyTjlLSGdEUmQ2S3I5TzFad2xDUHNSS3pK?=
 =?utf-8?B?TmI2VktOMWlZbCtEbitNZlN4SDFoWnFGTks1LzRIVXlUSTg5NTZIblZtYmRX?=
 =?utf-8?B?cE9nVEpyMlgzdVpxUURzTzYxTHhOMGJkaE5KQnZ1SDJFL2xWQ2pCcEtacUVz?=
 =?utf-8?B?MFlsZmhtM3NhaVI1MFNkZz09?=
x-microsoft-antispam-prvs: <BN6PR11MB00515893E097CAC342CCCB07F0650@BN6PR11MB0051.namprd11.prod.outlook.com>
x-forefront-prvs: 0946DC87A1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(136003)(39860400002)(396003)(376002)(346002)(199004)(189003)(66066001)(2906002)(97736004)(68736007)(6436002)(106356001)(7736002)(2616005)(4326008)(476003)(486006)(31696002)(316002)(14444005)(256004)(71200400001)(71190400001)(6116002)(3846002)(53546011)(6506007)(386003)(86362001)(25786009)(81166006)(72206003)(14454004)(186003)(478600001)(53936002)(8676002)(105586002)(26005)(31686004)(6246003)(102836004)(8936002)(229853002)(446003)(11346002)(305945005)(6486002)(76176011)(52116002)(99286004)(6512007)(81156014)(110136005)(54906003)(36756003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB0051;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 733aQXQZip8LBT04SpfG1KB/1vz+J0UTCUTjSgvFcfaUEg28WJVPJnRXplT0Nn1Me8NDA/BVQ67RR8mBwb5VBkHYrxymJdUCb9AUY1Gjd2wqVmX5ZKT5rY2C2WLdOVfd40T4KYge+1T7Mc9OTQ7Z6rZult8V70srAkIqYLql2UhZJFam91IIDGSe36q9WTHpoa5M+t9AOMXtuPwouayiHQGkr6HBY8U1UsST591nJ232sJqAVnUlT6adAgW2MUi+gxx1l555bNVqndewHbJBDsodwTUWZ5cZnG6Ghx+rieZpdk61kO2zUURSHJbQ+uwySMP5BV1EG62VlOOeu1jAX+e16XyAO6ZtZqsGqq4QLfunJwombvJ0ibzX1u/j0LSs75XIbtq6mulm05nm9oLjfdyR1W8ApVGjBoI0hA2LDKc=
Content-ID: <5870068622B13F48A383633C690E53A4@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 58302064-2fed-4259-7314-08d690ca2c8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2019 09:12:11.2274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB0051
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_011221_440481_EAA8538C 
X-CRM114-Status: GOOD (  18.92  )
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



On 02/12/2019 10:38 AM, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode. Only Octal SDR read (1-1-8)mode is supported for now.
> 
> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

> ---
> v6: Return error when driver data is not found
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 59 +++++++++++++++++++++------
>  1 file changed, 47 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..c8b81e0a76cc 100644
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
> @@ -1213,21 +1228,23 @@ static void cqspi_request_mmap_dma(struct cqspi_st *cqspi)
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
> +	if (!ddata) {
> +		dev_err(dev, "Couldnt't find driver data\n");
> +		return -EINVAL;
> +	}
> +	hwcaps.mask = ddata->hwcaps_mask;
> +
>  	/* Get flash device data */
>  	for_each_available_child_of_node(dev->of_node, np) {
>  		ret = of_property_read_u32(np, "reg", &cs);
> @@ -1310,7 +1327,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> -	unsigned long data;
> +	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
>  
> @@ -1377,8 +1394,8 @@ static int cqspi_probe(struct platform_device *pdev)
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
> @@ -1460,14 +1477,32 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
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
