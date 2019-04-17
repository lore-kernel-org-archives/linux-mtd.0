Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F9CC10F12
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 08:49:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 735922073F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 08:49:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADcJLVv/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="NzsG7M4z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 735922073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFgIutE7FnBXwls7+q9HBevjuRTTP4jRJYRugFGFdZs=; b=ADcJLVv/c+EZv6
	sVIrW1upAuw9VUhaE/TqvAM50vB1bE+zHmH5U7KdUgjq/O+vrUYhzgNhG4D5hIoAwM2oYZFtagn6J
	+78hP1E9HB7BCiEl2Zvl+pNd3lh7QOSBLt6zMCgn/qVhsFCIQzRVacy5atPesZ3M3ReBjLEdod4ha
	BprJVV9jYCRqJVYbgHHx+D7yAqOkMdrmTEFvchXTUf/vvDCJzSesJCOU1fZmVuyImFQZsZrmED4j7
	HCUu4cyL1fOLnFxfsJgpHDYmRC3iddRaWBUt+V0c8jQq9dFAeS4/2qybtn86fR1YAOBbwDWP36pSM
	+wIoGR5PppDBTblrJaRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGgFW-0005sq-9R; Wed, 17 Apr 2019 08:48:58 +0000
Received: from esa2.microchip.iphmx.com ([68.232.149.84])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgFT-0005s1-8D
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 08:48:57 +0000
X-IronPort-AV: E=Sophos;i="5.60,361,1549954800"; d="scan'208";a="30291093"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 17 Apr 2019 01:48:48 -0700
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.38) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 17 Apr 2019 01:48:48 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSLXiXdfrDILnn1Qpe7796FrY+4nrK2YlCGuzQINbO0=;
 b=NzsG7M4z3cY/OQ9eX4BiIvHuSSExPash5YTgkGQLppQ4fn3zGmvP+n8nNiNLBxiTI034VJyrDy5xmwqoxH+AX8NNa++z+DsdhdamXeXzOzY44LgiNhiEmEnJFLAsEFIxw3WRF5t1e5tqb77XUfVk+ffZcwGiBQYX/LfVJTdLX2w=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1858.namprd11.prod.outlook.com (10.175.98.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.19; Wed, 17 Apr 2019 08:48:45 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e4c0:24a5:9a32:46e3%9]) with mapi id 15.20.1792.018; Wed, 17 Apr 2019
 08:48:45 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Topic: [PATCHv2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Index: AQHU7upgLv3qbRICSEeB0GbHGt7DDKZAFt4A
Date: Wed, 17 Apr 2019 08:48:45 +0000
Message-ID: <5e058af4-17d8-9db9-5bc5-2122d3af4c9f@microchip.com>
References: <20190409153801.6941-1-dinguyen@kernel.org>
In-Reply-To: <20190409153801.6941-1-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VE1PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:803:104::23) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Tudor.Ambarus@microchip.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1f287dc9-c983-496c-6909-08d6c3118021
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1858; 
x-ms-traffictypediagnostic: BN6PR11MB1858:
x-microsoft-antispam-prvs: <BN6PR11MB1858E83D29404D331098FC58F0250@BN6PR11MB1858.namprd11.prod.outlook.com>
x-forefront-prvs: 0010D93EFE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(346002)(376002)(366004)(136003)(199004)(189003)(105586002)(14444005)(53936002)(99286004)(71190400001)(7736002)(2501003)(31686004)(5660300002)(97736004)(110136005)(316002)(81156014)(66066001)(478600001)(81166006)(8936002)(54906003)(36756003)(6512007)(31696002)(229853002)(86362001)(305945005)(71200400001)(68736007)(6436002)(6116002)(6486002)(14454004)(53546011)(3846002)(106356001)(256004)(486006)(2616005)(6506007)(446003)(11346002)(6246003)(8676002)(52116002)(2906002)(25786009)(72206003)(476003)(76176011)(4326008)(386003)(102836004)(186003)(26005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1858;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fStDp0zYr4X9djgE3PrzL/iYjRUvbNd1i+EMxsDGZvsfQzm9YVOfBmAdhqbeeVaUyHN3fWyA2rgEX7CxWwzngCi8WqhAb0vSrN7lCiSND7uhnSQYrMZeLh3wKrp5HCdpZfBzvhIOYCtDfydAsKK0mKOnZnMqLX55P6BEad1+xwZ/L+O+DWXL7xlnOXJBsq/4KjWH/ahHn3rTEb6JSmOKdHpLi7weCmZDAd5vNa5xR+XmXdlg12waWl4LkfhEw0FuNFXSwNWiBcEPdOKGpJzBlTiDbMwWhOkdmqcrK8EHCpG8rnuyXV3v97RAFDtay0MhFBy4Nk8RliqtS8clDYCm7PI5+N/L1EHhNHLCXMLIY4MRVKouOabiJDFD9ryv6hfAmad5HPkHZbDYgGIao6v+AKOcvSX8GjlhsYHGBA7Fjhk=
Content-ID: <A2323B7239B1B547A1242E4310880CA6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f287dc9-c983-496c-6909-08d6c3118021
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2019 08:48:45.4029 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1858
X-OriginatorOrg: microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_014855_333431_C28AF064 
X-CRM114-Status: GOOD (  14.09  )
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
Cc: marex@denx.de, tien.fong.chee@intel.com, vigneshr@ti.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi, Dinh,

On 04/09/2019 06:38 PM, Dinh Nguyen wrote:
> Get the reset control for the QSPI controller and bring it out of reset.

Is there a public datasheet where I can check this?
> 
> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v2: use devm_reset_control_get_optional_exclusive
>     print an error message
>     return -EPROBE_DEFER
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 14 ++++++++++++++

would you update the bindings as well?

>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 792628750eec..c548567adcf0 100644
> --- a/drivers/mtd/spi-nor/cadence-quadspi.c
> +++ b/drivers/mtd/spi-nor/cadence-quadspi.c
> @@ -34,6 +34,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>  #include <linux/sched.h>
>  #include <linux/spi/spi.h>
>  #include <linux/timer.h>
> @@ -1336,6 +1337,7 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> +	struct reset_control *rstc;
>  	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
> @@ -1362,6 +1364,18 @@ static int cqspi_probe(struct platform_device *pdev)
>  		return PTR_ERR(cqspi->clk);
>  	}
>  
> +	/* Obtain QSPI reset control */

OSPI version of the IP has been added recently. Is this available just for QSPI?

> +	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rstc)) {
> +		dev_err(dev, "Cannot get QSPI reset.\n");
> +		if (PTR_ERR(rstc) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;

why ignoring all the other possible errors? Maybe return PTR_ERR(rstc); ?

> +	} else {
> +		reset_control_assert(rstc);

Shouldn't the clock be enabled before asserting reset?

Does it matter if reset_control_assert() is returning any error?

> +		udelay(1);

Is there a range or 1 us is the maximum time that we should wait?

> +		reset_control_deassert(rstc);

Should we check if reset_control_deassert() is returning any error?

Cheers,
ta

> +	}
> +
>  	/* Obtain and remap controller address. */
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	cqspi->iobase = devm_ioremap_resource(dev, res);
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
