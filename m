Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7262C433E3
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:52:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A379A20782
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pGU7Qe4R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="MhiVp2uq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A379A20782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WTPY3sa2CNmftiUXCm/pjWpaUxX3Mtbe2ZqS30giSnI=; b=pGU7Qe4Rc71LvfubYmrIHP3u5
	pf8pmA/BnXyqLILyCVE0CxZr7M1qLHtxhYUUffbGykDioiaBdyq+goTG1Slvrtuu0YKOMLfQDshwh
	Z4BSpWk9tPHCRs4SuxhWExzkoPWRKUHgxQPPgyHilIp7MXew5Vh8D+Ztq4lB7hcaA8GsrN3yGLnC1
	0IYnzDsAMbCwFSCWdzXvKwC7Gps03oeiDfXEUBTZwaaySFZk8fjgGv2bdEdiftwCeoSULpp5EgOLi
	sa1hjxmmJQ0uFAub5z+Cg7iE4/lUVIg+Ta7oVHOKwcMJmEjmdYrvn8y3+rEa0jwor9cJ4vANwUt/I
	hFv5EkCcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kASny-0006xd-2w; Tue, 25 Aug 2020 06:51:38 +0000
Received: from mail-db8eur05on2089.outbound.protection.outlook.com
 ([40.107.20.89] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kASnw-0006x5-1l; Tue, 25 Aug 2020 06:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LtFmm2GUa0NqhF5/y0iASz4j2WXGw7+aAwUQ81rtwnkyMHJrCZKVd6Ahij568OAj+V4cA4w6y/coR5aucs8NJlZc32F1hdBzdbjUEEX4y1F2k4qke2p6l74At+KLFICZ/uq6YHqKIJy15zWYJ71xcp8g8dsFoBMKmRciYmfQobB44bFmJWAyG5wcPao/NtDSl3Am9I2kuQPjaBqgvn5BjyqZpoUHjieR3ybbom6RHHMhpirGA9T92pjh+saJAKKX3B2ijNKzgQiLCTOIrZU0gHdMyhjxQo0I/ksURKcoHolu4BZnhtwMoZdvhXqOoodutzBRo5HEEz3SNkpzpdBodg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImM6DIYX0r2z9CmaNABp/M4Z9LB7QUB+e993laO9wfo=;
 b=mW4EN36S2aMyAH4Xnx2JbeGMHeBbMtq8qecjakNVtSkvg7e2wosaSf38aeHobwriMc0xIrzZt0kAo7NEJuVjTXG+Qve7R5ma2dbEs4tB2msreC0BJTTiIoyEu6P016eYuKxbxRhX78Z3bqFvEmE8LC+egF5Dx+2JSAiwPjS22FqoXMnC8cOMJDFgXpMkQVfMrqaUOU2kjhroIba2orxACVeQOAPOTrZlt4baFA5ynv3CyDojsDknGGp8oz1YBmFeearDBuZPXdbRPBp6SYzYXkntY11Sw5FdqKVP/ES7jh3ACp53F2V4W7eTs9G1zTtW1kLmvI2V8lqVhaTuPVrq+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImM6DIYX0r2z9CmaNABp/M4Z9LB7QUB+e993laO9wfo=;
 b=MhiVp2uqPzcD8v7JpqJGZlKglCoauMKQtd2nqtH4zDUlLNGavrbBHpZo+FRpr81q/Ru7KW/GGO7Vo+wZc3xFEzC/z1VuWwZ6rIWgwk+LcFPzfUJvwPSBjm5OHnrodcjeJklsvS2aQZQoyVwj387TUEvE1angIIJ8N6SuScGj8Vk=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2761.eurprd03.prod.outlook.com (2603:10a6:3:f0::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Tue, 25 Aug 2020 06:51:33 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 06:51:33 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "han.xu@nxp.com" <han.xu@nxp.com>,
 "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>, "yibin.gong@nxp.com"
 <yibin.gong@nxp.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "aford173@gmail.com" <aford173@gmail.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "krzk@kernel.org" <krzk@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "daniel.baluta@nxp.com"
 <daniel.baluta@nxp.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "festevam@gmail.com" <festevam@gmail.com>, "vigneshr@ti.com"
 <vigneshr@ti.com>, "jun.li@nxp.com" <jun.li@nxp.com>
Subject: Re: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align regulator
 names with schema
Thread-Topic: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align
 regulator names with schema
Thread-Index: AQHWeknSKDZwJ6TG4kKPN+CgQ8rFoqlIY7aA
Date: Tue, 25 Aug 2020 06:51:33 +0000
Message-ID: <fa042a4f670775f340e88fca8f363252112fd538.camel@fi.rohmeurope.com>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-3-krzk@kernel.org>
In-Reply-To: <20200824190701.8447-3-krzk@kernel.org>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20fefdd0-5d9c-4aab-0c80-08d848c34dcb
x-ms-traffictypediagnostic: HE1PR0302MB2761:
x-microsoft-antispam-prvs: <HE1PR0302MB2761DA9CB3D3BF9F08886E8AAD570@HE1PR0302MB2761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AiiuacgEG8yezxCtc+tbuMa5XHTLXD3UZ7yigD2JF9Q6YG632oSVGG62pMKnO/xvg/HPbZ/L87FL6atSj+RsES33gtbh3RLPD0K1ynQ7oVzRifyFZlLgIlBTkdmfbvgsYr87xfzdFLZL8piOoSQtwnrMAqV70w7f0UxFMJ6ysgau0mn45ZQ3DdwDm2T/Ce4zC2G6LZNFrV7OtY5iaUYWezN4pqt6i5gf2oQWSGNyNNY/6X2UOesDDtvPDNwHkaKsQR1Ao9HF2QQC9ZMPIYPYhvWvwuLRSOlSK6R4vp50GJzkIUet9q9XEc/M/qOriau+wd5xwm/ID6zLaxdc8W7ngWqrf9PgIHek5h1mJFYeg4gDfLleQ/zWTmN0tv8A3atUXUfnIbDEgWzk4cL+DPPGHw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(376002)(39850400004)(396003)(6486002)(478600001)(2616005)(86362001)(186003)(26005)(5660300002)(7416002)(6506007)(316002)(8936002)(66556008)(3450700001)(6512007)(71200400001)(66446008)(64756008)(66476007)(66946007)(76116006)(8676002)(110136005)(83380400001)(2906002)(921003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: JFMoHjX2V0MQcuYDMClJzXBrOj0rmEraW+GdDwQcWqjdX/WXxBq4Q/qlLEAW++WvzK/ShP1VUx/kQbkfgAkBENjxuiPOmspiftQ+YOoKCPc7YiOTln1jjImZEotNzQPFqWz67yyvUYE+wRKXSnKrldLDUu1tbDMIWaYwQ0Itjh5uGXaIuPQE1L7w9m9EnP/fPaOocV8PsBqAES2FRrtU4bxAq/MN6b7ABxbxt6BayoE5KkXnO67YpcV0bHm5fepr6VwbwgWsvtBXocj3lckrsc1yy3ftZJaQtSiS70Ln7GiiiDTEs3124rMKFCLyA/LPWt6BTof3ZlgSVeoSrihAni+ickIpYgvMb8AR+pWKAks6Bu8yO3060NKesEtgNCUkf16GfXBPArRERAwuoTradnl93eO3f3Rq1AxvEEK1uW3QjOsB3+ERfZ2MByJLEMD1bKqyJVeMosqJSJuY79oca146rnVLnSTIO7/VeDzUhlPUHJ8GqP9/tEl3QZsCT2d2D4XE7+CWEa8UNS3kush1jwqlmpG73gnUvh7Cno5rZpnmmFEWgKyYo3b2/uswuiLUdLvtCcMlXsMzrjGmRDsmI+wRKlonRirEUUHtiOwtwEm/CYFsb6gGg4CXR00RQ9ci/SqGjeD75BXf4OvV3Gi1Mw==
x-ms-exchange-transport-forked: True
Content-ID: <A58FAF577ED39742859C2E9D3C43271D@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fefdd0-5d9c-4aab-0c80-08d848c34dcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 06:51:33.0922 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kbNBjPfE/CitspfST5gxk3HXyVvMycEdp0jRz+Ss0x6ybhOGC0lH6s9neqlqJTdsvGE+1gdl6cxUroHkmzHU9/TWQ07r8G8hICiuBplRGWKftnHIai5sX8T0NtC3WQ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2761
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_025136_102532_EED7B0E1 
X-CRM114-Status: GOOD (  19.09  )
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
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

Just some questions - please ignore if I misunderstood the impact of
the change.

On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski wrote:
> Device tree schema expects regulator names to be lowercase.  This
> fixes
> dtbs_check warnings like:
> 
>     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> regulators:LDO1:regulator-name:0: 'LDO1' does not match '^ldo[1-6]$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22 +++++++++------
> ----
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> index a1e5483dbbbe..299caed5d46e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> @@ -60,7 +60,7 @@
>  
>  		regulators {
>  			buck1_reg: BUCK1 {
> -				regulator-name = "BUCK1";
> +				regulator-name = "buck1";

I am not against this change but I would expect seeing some other
patches too? I guess this will change the regulator name in regulator
core, right? So maybe I am mistaken but it looks to me this change is
visible in suppliers, sysfs and debugfs too? Thus changing this sounds
a bit like asking for a nose bleed :) Am I right that the impact of
this change has been thoroughly tested? Are there any other patches
(that I have not seen) related to this change?

>  				regulator-min-microvolt = <700000>;
>  				regulator-max-microvolt = <1300000>;
>  				regulator-boot-on;
> @@ -69,7 +69,7 @@
>  			};
>  
>  			buck2_reg: BUCK2 {
> -				regulator-name = "BUCK2";
> +				regulator-name = "buck2";
>  				regulator-min-microvolt = <700000>;
>  				regulator-max-microvolt = <1300000>;
>  				regulator-boot-on;
> @@ -79,14 +79,14 @@
>  
>  			buck3_reg: BUCK3 {
>  				// BUCK5 in datasheet
> -				regulator-name = "BUCK3";
> +				regulator-name = "buck3";
>  				regulator-min-microvolt = <700000>;
>  				regulator-max-microvolt = <1350000>;
>  			};
>  
>  			buck4_reg: BUCK4 {
>  				// BUCK6 in datasheet
> -				regulator-name = "BUCK4";
> +				regulator-name = "buck4";
>  				regulator-min-microvolt = <3000000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-boot-on;
> @@ -95,7 +95,7 @@
>  
>  			buck5_reg: BUCK5 {
>  				// BUCK7 in datasheet
> -				regulator-name = "BUCK5";
> +				regulator-name = "buck5";

What I see in bd718x7-regulator.c for LDO6 desc is:

                        /* LDO6 is supplied by buck5 */
                        .supply_name = "buck5",

So, is this change going to change the supply-chain for the board? Is
this intended? (Or am I mistaken on what is the impact of regulator-
name property?)

Best Regards
	Matti Vaittinen
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
