Return-Path: <SRS0=ASOq=UF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F14C04AB5
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:26:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB452207E0
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2019 08:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNLWJiNf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="ysQ4rtfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB452207E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gF58QOXQ57t8HeNhDAtMZDBrUzEIf0yszQu7Atf/Jdg=; b=GNLWJiNfiYzUrr
	1AMoUEx0YDvR88upi7rwmHWRl6my7jSBSspVwYUnO2zKCK9HzWBoRLhzevbuRm36ef17Ko1Hl+Gog
	oiCsft/UOy1czLZbeB3Z+KM/HP13D1FVGHOO6Z/+ZdZVG8CmIzIoEbu1TvUej++bUKDZMZ0/cQ9Hb
	jO9OAKcl8v/sANm+j7UoN954kuUZasWLWZa6b0p+XFhn91mPncKRpCn+XRfrN6wBLiamws/YTD6gn
	yWCTi8vouFcX+EE3p3LVD+ZgtUG5+LXDX+pFZnA5hyFX9MrAxLlUTBIUJ4ShSlPw6yUVzztftHuni
	AXLQ2tP9paJF60edpwQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYnj3-00035W-Tz; Thu, 06 Jun 2019 08:26:21 +0000
Received: from esa1.microchip.iphmx.com ([68.232.147.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYnj0-000350-7c
 for linux-mtd@lists.infradead.org; Thu, 06 Jun 2019 08:26:20 +0000
Received-SPF: Pass (esa1.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa1.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa1.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa1.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,558,1557212400"; d="scan'208";a="37793596"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 06 Jun 2019 01:26:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 6 Jun 2019 01:26:17 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Thu, 6 Jun 2019 01:26:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odeFWaFpZNwa5JZJNwP5azheMwlbXo60RP5RHJq7i54=;
 b=ysQ4rtfO8uobkYXHoRzkJq+nZ/L3AiIzl7d5+zDL7jJHTyeqEqgdVsFzIj5zwpYKRVIrmI/eXEvWB+lRr6Oa1/b/VfQHwlpGnfXcW0/sxQvbqzHzPFV7FQWOFbYJEuCXl0Q1AuSONJuoU9G28MCf0HLMK8ir9rNZwwjpSs9OLrU=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB1282.namprd11.prod.outlook.com (10.173.33.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Thu, 6 Jun 2019 08:26:15 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 08:26:15 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv4 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Topic: [PATCHv4 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Index: AQHVBaRFi6wbqwZTWkWm4oxToh2HuaaOd6yA
Date: Thu, 6 Jun 2019 08:26:14 +0000
Message-ID: <73c8c69a-0756-811f-7a75-dd2255db7d7b@microchip.com>
References: <20190508134338.20565-1-dinguyen@kernel.org>
 <20190508134338.20565-2-dinguyen@kernel.org>
In-Reply-To: <20190508134338.20565-2-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR08CA0154.eurprd08.prod.outlook.com
 (2603:10a6:800:d5::32) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e3e5938-5646-4929-24ce-08d6ea58a3b9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN6PR11MB1282; 
x-ms-traffictypediagnostic: BN6PR11MB1282:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <BN6PR11MB1282A76AA767FBD2692BE4E2F0170@BN6PR11MB1282.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(346002)(396003)(366004)(376002)(199004)(189003)(6306002)(36756003)(186003)(6436002)(486006)(2616005)(476003)(26005)(446003)(76176011)(53546011)(52116002)(102836004)(316002)(229853002)(86362001)(386003)(99286004)(6506007)(256004)(2501003)(6486002)(14444005)(110136005)(71200400001)(54906003)(66066001)(71190400001)(31696002)(8676002)(8936002)(81166006)(81156014)(11346002)(6512007)(5660300002)(6246003)(72206003)(305945005)(4326008)(7736002)(25786009)(53936002)(66476007)(66556008)(64756008)(478600001)(68736007)(66446008)(966005)(66946007)(6116002)(73956011)(2906002)(14454004)(31686004)(3846002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB1282;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IaP4CEjGn62ajzgjJzXwxHWK6LQhXnWbPC5YGL36wab/zjgzmeHG/Z5FhyBd4/zfs05scqwpsolmrrZd1Tvu3x0OEUYxPccykuu/urzNJzs3J0QNBb7h1Ah2ClXAIm3Bt5mhaSfnjB9KTf1ETj0SjH4y+hQrnTKQKGeHKRnkKIOmnn5IG6BYPXPMU3Ux8AOCWk8jNWbg8VSzode81BnklW7Dgq3dVE+19ls7iR4H16Qvl0C3KiA47lGrZQdN7PShLBmOU0nwONQeHLeUmD70ffJj8mAIPAZhhnRuLw0rZs5dUiq5cbJhDv0Htcf35LuxW1zj+08D2c8weciuraoDo35HU/5FVsdfMadeOd3BD53J/I56rc2q3ws7dez4CJDg10kT/tauSrXlIwOVEeIYILPUurZE2rrwOFNwIaLbFVU=
Content-ID: <AE9381236212B2468C06D51844F00A69@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3e5938-5646-4929-24ce-08d6ea58a3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 08:26:14.9699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1282
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_012618_546708_7D554C6B 
X-CRM114-Status: GOOD (  19.06  )
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
Cc: marex@denx.de, devicetree@vger.kernel.org, tien.fong.chee@intel.com,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 05/08/2019 04:43 PM, Dinh Nguyen wrote:
> Get the reset control properties for the QSPI controller and bring them
> out of reset. Most will have just one reset bit, but there is an additional
> OCP reset bit that is used ECC. The OCP reset bit will also need to get
> de-asserted as well. [1]
> 

It's always good to say why the change is needed, e.g. reset the controller at
init to have it in a clean state in case the bootloader messed with it.

> [1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html
> 
> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: fix compile error
> v3: return full error by using PTR_ERR(rtsc)
>     move reset control calls until after the clock enables
>     use udelay(2) to be safe
>     Add optional OCP(Open Core Protocol) reset signal
> v2: use devm_reset_control_get_optional_exclusive
>     print an error message
>     return -EPROBE_DEFER
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 30 +++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 792628750eec..d3906e5a1d44 100644
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
> @@ -1336,6 +1337,8 @@ static int cqspi_probe(struct platform_device *pdev)
>  	struct cqspi_st *cqspi;
>  	struct resource *res;
>  	struct resource *res_ahb;
> +	struct reset_control *rstc;
> +	struct reset_control *rstc_ocp;
>  	const struct cqspi_driver_platdata *ddata;
>  	int ret;
>  	int irq;
> @@ -1402,6 +1405,33 @@ static int cqspi_probe(struct platform_device *pdev)
>  		goto probe_clk_failed;
>  	}
>  
> +	/* Obtain QSPI reset control */
> +	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
> +	if (IS_ERR(rstc)) {
> +		dev_err(dev, "Cannot get QSPI reset.\n");
> +		if (PTR_ERR(rstc) == -EPROBE_DEFER)

what I meant was to get rid of this if and return PTR_ERR(rstc) directly.

> +			return PTR_ERR(rstc);
> +	}
> +
> +	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
> +	if (IS_ERR(rstc_ocp)) {
> +		dev_err(dev, "Cannot get QSPI OCP reset.\n");
> +		if (PTR_ERR(rstc_ocp) == -EPROBE_DEFER)
> +			return PTR_ERR(rstc_ocp);
> +	}
> +
> +	if (rstc) {> +		reset_control_assert(rstc);
> +		udelay(2);

why 2us? what's the appropriate length of time that we should wait between
assert and deassert?

> +		reset_control_deassert(rstc);
> +	}
> +
> +	if (rstc_ocp) {
> +		reset_control_assert(rstc_ocp);

Does it mater the order in which you assert these signals? can we group these
module resets asserts, i.e. first do the assert for both rstc and rstcp and then
the deassert?

> +		udelay(2);
> +		reset_control_deassert(rstc_ocp);
Is software deassert needed? I'm looking at [2], Table 46. PER1 Group, Generated
Module Resets, and it seems that software deassert is not an option for
qspi_flash_ecc_rst_n

[2]https://www.intel.com/content/dam/www/programmable/us/en/pdfs/literature/hb/arria-10/a10_5v4.pdf

> +	}
> +
>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
>  	ddata  = of_device_get_match_data(dev);
>  	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
