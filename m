Return-Path: <SRS0=3GE2=P6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A78F9C282C3
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 09:55:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7265B218D0
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Jan 2019 09:55:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UQghtmAc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="YXkEDndV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7265B218D0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4GGSLSbQppvYMMwckN5+tu18Dh040MA3ppfqqsRhDM=; b=UQghtmAc4iI355
	gX8+nar+Z/FhaDifd5DRPYR6cziaghYjtrcHOtau9tMH2mbi47n9UxGsYYS8OYW3ZUM6ny0I9I3RM
	Xi8ICYUtSKufjlLUBU1j6s42FfNJsNxLhNs00sfsmOI/3oEiCx0vbJD+UD6T7g99rU++SI+BF9nWb
	jecZ112LiqaMTvBOClsaYcQaWGEy+riCJvIMQckoIx7Ey0aBGO9pVUafSK/rj9Rqh8kVmTidTxJN6
	GBFhfqR4gROCUaKeegcgQKEYujJ+y43suKxYVCf8CO7WJoEDzpxHd4dHXjpe8Xe7NindzgmSghyNH
	WFMPAtAGaXAQX/aRMTfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glsmM-0001LC-FT; Tue, 22 Jan 2019 09:55:34 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glsmJ-0001Kj-Nl
 for linux-mtd@lists.infradead.org; Tue, 22 Jan 2019 09:55:33 +0000
X-IronPort-AV: E=Sophos;i="5.56,505,1539673200"; d="scan'208";a="25338478"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 22 Jan 2019 02:55:29 -0700
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.108) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Tue, 22 Jan 2019 02:55:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqEnAOZ2ImtyV7baUyoXcEzoxCxy3RPum7DteOE5EkY=;
 b=YXkEDndVRrL2+xo0uxeTFDu/Ke4R9ek8PcFfzwQWnv6Rdn9kerQ6hlpd8CdbcR/Uq8NGjfS7dTvUXuZLlcC15fog/EZ1nS792Z7YbR0UQLuJ8Xhk+ZmV8IsOcXscdsjmi4el80MA19mr6s4N1Dnqy4LF4oTS8Mkj5E+HH+59Pks=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.99.146) by
 BN6PR11MB1844.namprd11.prod.outlook.com (10.175.99.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.27; Tue, 22 Jan 2019 09:55:26 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::79d8:b977:b90a:76fa%4]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 09:55:26 +0000
From: <Tudor.Ambarus@microchip.com>
To: <vigneshr@ti.com>, <bbrezillon@kernel.org>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Topic: [PATCH v4 2/2] mtd: spi-nor: cadence-quadspi: Add support for
 Octal SPI controller
Thread-Index: AQHUsh2R/uQutu3u40+Y5WM8izS7+KW7DO+A
Date: Tue, 22 Jan 2019 09:55:26 +0000
Message-ID: <c2be17a4-4725-e68b-f6f7-1ce78fd80e14@microchip.com>
References: <20190122064137.17114-1-vigneshr@ti.com>
 <20190122064137.17114-3-vigneshr@ti.com>
In-Reply-To: <20190122064137.17114-3-vigneshr@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR07CA0192.eurprd07.prod.outlook.com
 (2603:10a6:802:3f::16) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:103::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BN6PR11MB1844;
 6:LNK44m/3+Ny78+jlcrT2CgOKLpC9v5bTtAExf3n2Zay+REIHQD3UdmBjupLnz1kCbTNlKL4j5yfO3zbhH9WRC4dK4IWyUKaZ4XzQ/I3VEjDLEZXZtkUVQXUkY21DQS5J7GQWZGHsfeu6SZXWV5jkBOCROiCOTtkiDuMPR0SGYM1iAuoe7HBBYLgY/opahioIfwHR5iEgNJtWpHb6cdrzbYi0+8cRW8wqPS/m7SstKGVgwQ7UtqG4bnczTCr8JbJorF50aH8rUICEH4b0YBVgl9ZpQN/h5iHTzhS4tyDopdoOuey/26QKk8WfI6VvjqTXnUfaQYBU1TrRpn/XbJFSiNMZ7EX2Cg7X228TwmrIFyJ8fMAVfIEvlko3oAW1LH1gTOJT4UeKvQCHOdvKJEFRYvmf3ow7ZuIIWNQ44MDmvgq6vJRvMXy7BNGiYWfl5Yk2mRzfgrsT8orFUR5jIE96TA==;
 5:wMZU75JZr0xo6fUzckGkgY9NGCsBWufRAwwqPVv9OccnXDM338VGVzvciFv2UnIOeaqbCgVn4RpaHvvcSehssmHro0NGsgfVH2aEpRzxR4BiM77D4t8woiu9PwS2FTqWye/PIoQh+UCSuksQykZtdGfrKKwBY9ZviMZh809sYfYxvPTrlQ5UlRjX3Pb3cHXe7LCTopoe5KXgE95dWDkYyA==;
 7:Dw100dTCMIpknta7AKefQS4yIORl6HQNs3Elsy2eAgpwVIHXotzne4dN7Dqevx9T8X1q+9rPBKvQkvw+z204Tt7u/Y4uECkSPDH4fHF1l1tYVbeN6i4OgyQwnwne82EFUgv0cg65+k4+fY8QOKppWA==
x-ms-office365-filtering-correlation-id: 99cc6cfc-8608-45c1-0287-08d6804fbbde
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
 SRVR:BN6PR11MB1844; 
x-ms-traffictypediagnostic: BN6PR11MB1844:
x-microsoft-antispam-prvs: <BN6PR11MB18442847A661F4151E5C5C17F0980@BN6PR11MB1844.namprd11.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(39860400002)(136003)(376002)(366004)(189003)(199004)(39060400002)(31686004)(106356001)(6246003)(25786009)(6512007)(4326008)(72206003)(53936002)(478600001)(6486002)(105586002)(6436002)(14454004)(68736007)(36756003)(229853002)(97736004)(53546011)(66066001)(6506007)(86362001)(102836004)(31696002)(7736002)(2906002)(3846002)(446003)(386003)(186003)(76176011)(305945005)(71190400001)(316002)(110136005)(8676002)(99286004)(8936002)(54906003)(71200400001)(256004)(26005)(52116002)(14444005)(81156014)(81166006)(11346002)(6116002)(476003)(2616005)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1844;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4oOLaNaGMhRbRCv/kl+wA9/CqDV6dopesnRUf1wMTPgv+yDQs4caksMmC+f+JxrtJGpi+v7Sgy0MinQC8gEENhLcOpUKKZwQ2yZ1bn0T7UuOlUWssn3ELHhLj2j8YIPoS71nhGReh0KCAc1Vw5cWuDNyAIcu1JaP3d0OlvKS+HfqPhbjBY+Wg7GgjlKLTe+LBtBDzjmhOTnZ50wE6/xyc3uJTNQKT6Tj5OmGcTJ2oSPWA9JriIB4P266wka+KEn4ig25eCCtNUT8iLJmwZur59HFMIP8FqPAPFk3zzV4gi2CSKVn6Z5hf/mZO657/snS1Z4P3eYYQKRt1jd9eIKrwf/Z2FCwkSaZWi2UO/RhmDsvxNAOXsE4EG001MBoNQHwgS7wtQvDLFhOrWl0t7BxO5j/fIGkpZ9I5DYjqxS7PVM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-ID: <CB74544DBD439C4585655E1B01B82001@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 99cc6cfc-8608-45c1-0287-08d6804fbbde
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 09:55:24.2318 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1844
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190122_015531_813730_449700DA 
X-CRM114-Status: GOOD (  20.50  )
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



On 01/22/2019 08:41 AM, Vignesh R wrote:
> Cadence OSPI controller IP supports Octal IO (x8 IO lines),
> It also has an integrated PHY. IP register layout is very
> similar to existing QSPI IP except for additional bits to support Octal
> and Octal DDR mode. Therefore, extend current driver to support Octal
> mode. Only Octal SDR read (1-1-8)mode is supported for now.
> 
> Tested with mt35xu512aba Octal flash on TI's AM654 EVM.
> 
> Signed-off-by: Vignesh R <vigneshr@ti.com>
> ---
> 
> v4: Fix comments by Tudor on v3
> v3: No changes
> v2: Declare Octal mode capability based on compatible.
> 
>  drivers/mtd/spi-nor/cadence-quadspi.c | 53 +++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 04cedd3a2bf6..2091addc45a3 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -44,6 +44,12 @@
>  /* Quirks */
>  #define CQSPI_NEEDS_WR_DELAY		BIT(0)
>  
> +/* Capabilities mask */
> +#define cqspi_base_hwcaps_mask					\
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
> +		hwcaps.mask = cqspi_base_hwcaps_mask;

Nice!

Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>

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
> @@ -1460,14 +1476,27 @@ static const struct dev_pm_ops cqspi__dev_pm_ops = {
>  #define CQSPI_DEV_PM_OPS	NULL
>  #endif
>  
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
