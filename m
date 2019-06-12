Return-Path: <SRS0=tiqS=UL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FABEC31E46
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 15:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53E8220866
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2019 15:07:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZSQQgSD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=microchiptechnology.onmicrosoft.com header.i=@microchiptechnology.onmicrosoft.com header.b="LlIO+4BV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53E8220866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3TAwTExkas963wA2NM3JZODXBKyKkQVPVaRVRpsyfk=; b=dZSQQgSDAKF/+N
	U/4f8AEp7CoI4V8GjbYQJ64QCHgQ+Z8lkniMxiMqDXiqzGWzXZU7z4GRN/3meEo2WXdwKhkFGFcC7
	jmg7oUnUx/HMjiaq2Orzv/HtM2gTL64ld6SyjuYjekJISwC2Oib/QFskVu72N0FSzkmlrTR+sMCE7
	+fxFuJ/yTT/5s2Jlu9FoBCEolyjkxCEaIJcM0jTTelHtzJJcv8/Faa/bcQXFsLw04+PAQxYEufaJz
	Qfi1q5dr1rIXV0jjeW4wYiaFpvvzSisOBPPdzWjofG8J9kKMISHS9Vh3RQbFmED/HBYC46zKQzMdk
	4EPzO6Q0zgIrZRBT5e7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb4qp-0005Zd-TB; Wed, 12 Jun 2019 15:07:47 +0000
Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb4qm-0005YS-Bx
 for linux-mtd@lists.infradead.org; Wed, 12 Jun 2019 15:07:45 +0000
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Tudor.Ambarus@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="Tudor.Ambarus@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Tudor.Ambarus@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa4.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Tudor.Ambarus@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
X-IronPort-AV: E=Sophos;i="5.63,366,1557212400"; d="scan'208";a="36659531"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 12 Jun 2019 08:07:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex01.mchp-main.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 12 Jun 2019 08:07:36 -0700
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 12 Jun 2019 08:07:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SFUN4teCBT5pyrNrsmMfUd4knm3MgtGo4sy4L6I3TQ=;
 b=LlIO+4BVi9NLKelPSbjs6nofh7n+Aq8QYBZi2a1SwI58wt+ERo9W/snIisnpYKQ2jwm6vbfuBKVUNfnojTMNemGqjUcFX7YLuuaCikzotOdDJjPsFzVdb2d+whgBbRxyWedw9Z1dfRpNiLLzAi3vVMtSkLIo1wF3JfdV7GhYmxY=
Received: from BN6PR11MB1842.namprd11.prod.outlook.com (10.175.98.146) by
 BN6PR11MB3922.namprd11.prod.outlook.com (10.255.129.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 12 Jun 2019 15:07:35 +0000
Received: from BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36]) by BN6PR11MB1842.namprd11.prod.outlook.com
 ([fe80::e581:f807:acdc:cb36%9]) with mapi id 15.20.1965.017; Wed, 12 Jun 2019
 15:07:35 +0000
From: <Tudor.Ambarus@microchip.com>
To: <dinguyen@kernel.org>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCHv5 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Topic: [PATCHv5 2/2] mtd: spi-nor: cadence-quadspi: add reset control
Thread-Index: AQHVISx/nxExbj8ViUqf7roc85XDN6aYHryA
Date: Wed, 12 Jun 2019 15:07:35 +0000
Message-ID: <2ee32a0d-7523-0b23-072e-e68af4977db7@microchip.com>
References: <20190612143744.30718-1-dinguyen@kernel.org>
 <20190612143744.30718-2-dinguyen@kernel.org>
In-Reply-To: <20190612143744.30718-2-dinguyen@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1P18901CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:801::19) To BN6PR11MB1842.namprd11.prod.outlook.com
 (2603:10b6:404:101::18)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28e68c79-39a1-4a27-f318-08d6ef47b310
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BN6PR11MB3922; 
x-ms-traffictypediagnostic: BN6PR11MB3922:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR11MB392245949C03441130221B0BF0EC0@BN6PR11MB3922.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0066D63CE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(39860400002)(396003)(136003)(366004)(376002)(189003)(199004)(6486002)(186003)(14454004)(66476007)(4326008)(73956011)(229853002)(316002)(66556008)(6436002)(102836004)(66946007)(31686004)(2906002)(6246003)(26005)(53546011)(6506007)(36756003)(11346002)(54906003)(68736007)(66446008)(64756008)(2501003)(3846002)(110136005)(5660300002)(386003)(6116002)(8676002)(71190400001)(71200400001)(6512007)(66066001)(486006)(446003)(81166006)(14444005)(31696002)(8936002)(52116002)(6306002)(81156014)(7736002)(256004)(99286004)(2616005)(476003)(305945005)(72206003)(966005)(478600001)(86362001)(53936002)(25786009)(76176011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR11MB3922;
 H:BN6PR11MB1842.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: EwhDRmlhhGO3jRxJ/5h7PytHMD7O6va+7yoxN/i8Gsuc//PIYOksvo5v0WyT8HUn2TNqKeb4ZAIxSSI/mHev6NIC6oOhCxtn/N2XctM/Wj+8JX7wYIBsrBrDYOjiZO5vQT/lGOavr4geLvxwtzeyLC1M8K6yVASs82szZpFu2Vb7qCXcqbSdXtCrb1AZTzTKZWFtGIZfU6OXrhD6rEfEFgYwh/peMrzg1ot/TOpVM9+7Mf6tv63QR03jctkqVdHo+qwxbamoCwem4yASxL0GTvRcPsSetqdO5PJsKCryb/Lw90YmuVeeICJpUKDHuOnxQozWFon5iy4NWqRFRwFzWNNdVdU1cN27NB4pny8+PtnR2kfMUD4dTYFo5/vJ2CLMlWVN+T373HYxT8bxvRltJzJA+lhzrdfQSLBBsijuMtU=
Content-ID: <F3F3C960F554DE449E5E524682FCB736@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e68c79-39a1-4a27-f318-08d6ef47b310
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2019 15:07:35.0397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tudor.ambarus@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3922
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_080744_448885_F8CE68C8 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: marex@denx.de, tien.fong.chee@intel.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 06/12/2019 05:37 PM, Dinh Nguyen wrote:
> External E-Mail
> 
> 
> Get the reset control properties for the QSPI controller and bring them
> out of reset. Most will have just one reset bit, but there is an additional
> OCP reset bit that is used ECC. The OCP reset bit will also need to get
> de-asserted as well. [1]
> 
> The reason this patch is needed is in the case where a bootloader leaves
> the QSPI controller in a reset state, or a state where init cannot occur
> successfully, this patch will put the QSPI controller into a clean state.
> 
> [1] https://www.intel.com/content/www/us/en/programmable/hps/arria-10/hps.html#reg_soc_top/sfo1429890575955.html
> 
> Suggested-by: Tien-Fong Chee <tien.fong.chee@intel.com>
> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v5: remove udelay(not needed) on tested hardware
>     group reset assert/deassert together
>     update commit message with reasoning for patch
> v4: fix compile error
> v3: return full error by using PTR_ERR(rtsc)
>     move reset control calls until after the clock enables
>     use udelay(2) to be safe
>     Add optional OCP(Open Core Protocol) reset signal
> v2: use devm_reset_control_get_optional_exclusive
>     print an error message
>     return -EPROBE_DEFER
> ---
>  drivers/mtd/spi-nor/cadence-quadspi.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/mtd/spi-nor/cadence-quadspi.c b/drivers/mtd/spi-nor/cadence-quadspi.c
> index 792628750eec..f8b1009e488c 100644
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
> @@ -1402,6 +1405,29 @@ static int cqspi_probe(struct platform_device *pdev)
>  		goto probe_clk_failed;
>  	}
>  
> +	/* Obtain QSPI reset control */
> +	rstc = devm_reset_control_get_optional_exclusive(dev, "qspi");
> +	if (IS_ERR(rstc)) {
> +		dev_err(dev, "Cannot get QSPI reset.\n");
> +		return PTR_ERR(rstc);
> +	}
> +
> +	rstc_ocp = devm_reset_control_get_optional_exclusive(dev, "qspi-ocp");
> +	if (IS_ERR(rstc_ocp)) {
> +		dev_err(dev, "Cannot get QSPI OCP reset.\n");
> +		return PTR_ERR(rstc_ocp);
> +	}
> +
> +	if (rstc) {

Hi, Dinh,

reset_control_assert/deassert() already have checks for null, you can call them
directly without checking for null.

> +		reset_control_assert(rstc);
> +		reset_control_deassert(rstc);

Is there any difference between:
reset_control_assert(rstc);
reset_control_assert(rstc_ocp);

reset_control_deassert(rstc);
reset_control_deassert(rstc_ocp);

and:

reset_control_assert(rstc);
reset_control_deassert(rstc);

reset_control_assert(rstc_ocp);
reset_control_deassert(rstc_ocp);

Which one would you choose?

Thanks, Dinh,
ta

> +
> +		if (rstc_ocp) {
> +			reset_control_assert(rstc_ocp);
> +			reset_control_deassert(rstc_ocp);
> +		}
> +	}
> +
>  	cqspi->master_ref_clk_hz = clk_get_rate(cqspi->clk);
>  	ddata  = of_device_get_match_data(dev);
>  	if (ddata && (ddata->quirks & CQSPI_NEEDS_WR_DELAY))
> 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
