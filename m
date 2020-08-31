Return-Path: <SRS0=zkQe=CJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 404DEC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 05:28:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0819920707
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 05:28:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t3nnnOMy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="UyGzwzHI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0819920707
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OUtWCOJ6U280Prugv5FyLD1zQZYBNWSxDHteOT+fqb4=; b=t3nnnOMy+BAkveAecE6B7ovzw
	ZZxbkXQMs8pENiXYSZbNPbMTMGjXMT0u4Dm67uudCrKQpFUDcewtYM7fdK+e6BJTekovqxOtmjWYm
	98/DFOMcJS4JjMb1j9DrSWJRwUK442z/jXxdwIVPCSXQdSkABCn8BeVE0oj9ivnD9yd1InSISceyg
	PeCz87mL1bLI9n8D62p9oI9VGag/6X9tgMHe1ObeybSHlAOSqgFyCXfyzfWOkxZUtT2oACuiA8m5u
	ZRNflF89m5891oXZ91MlEAO8IKcYwB0/u4QISOGZOSAE/85Wc+8xkLAFLKlOtABhp6TQBvxiKIubL
	EMw4fPAcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCcLy-0008KW-RP; Mon, 31 Aug 2020 05:27:38 +0000
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCcLt-0008JY-HS; Mon, 31 Aug 2020 05:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J4nrW7EbEj2baYEOG/DguM1Wt1pUpzj0QjNDSt7pL4r0JtjmijylUpGLTndv/qm2NXb9y4z2E6eAQtiRMMQePfZdEtAluuo34G6wyh6GYec6zF4/flTTHRwxQfRA33n+KQV/5Zn/Y7A6lyBK0w4JXCr10e6tCIYEQgVo2bryiUGQWjybJwwz/8q8vvLO/n2zgMGDyXbyibi6+btKv1G7FEwSutjKYfdggMmmurNZb0LjsDKbxxQyl9uLyBu0Lcc5JygfHO1UMnkAcXORRpvZv+VWHCWveYfH6GPnD9OjpHrViyQLS5ATLuitkmWCOJ34ugWQCjrqcZW/gwPpP67DVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1NjVwpG0/bqEsjr8fUZLA7UPZ25fpXOilWDBB6BSvo=;
 b=fbfTnvt1yDs0kzyfiB8vmpdgE4ICP6B84f6wJiNMzUd1ayVtYBML1f/3nRFEQfsl8PCYrbZizLFrMJr6KwET5LjGgAXzhr0SpkRRNFfNdD8+thpQJXz0dj0wv+ZK7jTHh97KDEHgfXRADexcjWIfSwFbBhFSxyvBTUWnGOv88ef6x/+AQ2zi7pvzVXjzw+8zHwesFFyu4Gayekh7wP5ipyklrYoI+eyCpJKMU0TNvrLx7GfDT8Tpi2iQv1U1WlILMKE3RZHhNEfgUHbB6PTuPvwrUakSq2T4A1ixu0Z3ygjRjobBR6VhKdqMsOxRrwec3aljLcThhac0Z8bw6ZizBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1NjVwpG0/bqEsjr8fUZLA7UPZ25fpXOilWDBB6BSvo=;
 b=UyGzwzHIfN1D0By819AB4qYQHzt8lf41OUwZrLDEi0tZo2phKv8ZJt27A3Lw3kSCLeL1qzmGn3U6x8eG33x6FrDTLxGHgRvDlSogJebS6M9pKxk/1ZieNysQEwcimsfdeklPBMfVlnZlU0sPrqaUOlqetORXnJlzdynGHbn2KTw=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2171.eurprd03.prod.outlook.com (2603:10a6:3:2c::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.25; Mon, 31 Aug 2020 05:27:27 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 05:27:27 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>, "vigneshr@ti.com" <vigneshr@ti.com>, 
 "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "krzk@kernel.org"
 <krzk@kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "lee.jones@linaro.org"
 <lee.jones@linaro.org>, "festevam@gmail.com" <festevam@gmail.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>
Subject: Re: [PATCH v2 11/19] arm64: dts: imx8mn-ddr4-evk: Align regulator
 names with schema
Thread-Topic: [PATCH v2 11/19] arm64: dts: imx8mn-ddr4-evk: Align regulator
 names with schema
Thread-Index: AQHWfVtANiMBr6KdbUCGUBkJMGxrFqlRtBwA
Date: Mon, 31 Aug 2020 05:27:26 +0000
Message-ID: <751b3933df6efde5ca9ad4148ddef8588459cd21.camel@fi.rohmeurope.com>
References: <20200828164750.10377-1-krzk@kernel.org>
 <20200828164750.10377-12-krzk@kernel.org>
In-Reply-To: <20200828164750.10377-12-krzk@kernel.org>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cbe334ae-4b6b-4383-1720-08d84d6e8c8e
x-ms-traffictypediagnostic: HE1PR0301MB2171:
x-microsoft-antispam-prvs: <HE1PR0301MB217154150E241C7981BB7A18AD510@HE1PR0301MB2171.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISKjuhEI4XumeqOSFYWCsT+nGf6yR3j3LEv1XWuFSGmyrRgGKrTpHkkCvBAYas+Dx45J1hpGJpRGP730UQLMVApcf+XS9bixS7S9jUWCupVBuDpjwinhuVJDWVBvswbSr9GHh1yY/jmbq5JQNVXR5508X9LNscPvdAWEhNyvuDlpWb8CwjbJ2qv+YSLia9hQ1ws+YyQaMisggL0oLsqEStd92wI/z07BOCuEi9RulTGKdzAJi5GH87K9fD6PuNKeqAyCkBKeAh35uV9jQjN1bAmyNziJOvjQHqF3ltKCxaJphl6PVppESbMIgcEg+E8huXvUjeEzIgxwa25A8+nnVszedMIvtLTm0xs3/H05UVIM9OipKevhYe1KIV9dvMr2J533BTaWqduhwiKn6PzRSQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39840400004)(136003)(366004)(346002)(86362001)(66556008)(3450700001)(66946007)(316002)(6512007)(7416002)(110136005)(64756008)(6506007)(478600001)(66476007)(2906002)(76116006)(26005)(186003)(8936002)(8676002)(83380400001)(71200400001)(6486002)(5660300002)(2616005)(66446008)(32563001)(921003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: aEzu3ZdMYj8JBzrBwcZhNCOni+CTTeIUAlJSizv4kkx4kZ3oAntBg7JMH1vsmDG9A5X/Ur1AdTjYapYmGy1hXNjvfTC1y1YwpZSlcv6Pm1BcuvNKckKVgUnqDGRDiCWSFSypsUv0LjbQV8h0+YVk6jNxp1zZVgiaO273mFZiw5w1zkvdIwkNijActosqSTDmJReDkTsfN1x+kiOe35MkGvaj0TMUstNJ4j18f3BvyLeK8y//t5u9Tmiib/72RODDsQHc7aKbHeez4izL51QgaKph8ImuangquSXlZdLO24Vnzn/mSYcM+ZvUEVHUXC7np2+Nk27PCyPm4laaVKo18WZICazju1P2lzq+kUE7u1OcraeXkcvh06jK10hu/ZojV6+Y/yqlENH6Maq7qkWcmnvyCAFrb//qCAGGVCQ2tVci0YRwR2Sou/WGcjTsxTW3sCWN1Mb+6e0GGr528k5aAjsDFM3ekHrBBqvJHGNWmyMZWHqwavDF3dVPeYYigbnPV8FZpZnW/t7yqrTH1r37xtCpa1J3khuK8LXIcgIzf4eJ7yLV0op98Al1Bg432N+pBHI7Scz2FlQcuS6IA/3d+ADqZMLdqC7CO/0FaFWZCkMEHO4/bmwEe/poDN8hGVzIMWt2aP4pdW4xNoIBsevSyw==
x-ms-exchange-transport-forked: True
Content-ID: <320CBFF8EACA6D4C8F6161629EA048B7@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe334ae-4b6b-4383-1720-08d84d6e8c8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 05:27:27.1199 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xfUm+vFtlpaeRf1GYQ6duRIWoz1Wm4EvmWPeJ/0ht0jrJD6zkxrTxExefX6bkJbbKu8SVc+0A+pXc1aJwwZ2Bii6RK+FiB5EzTgJaCr8Katmi1lgHRestEQ5livpy3uQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_012733_741591_9EE75D2B 
X-CRM114-Status: GOOD (  14.99  )
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


On Fri, 2020-08-28 at 18:47 +0200, Krzysztof Kozlowski wrote:
> Device tree schema expects regulator names to be lowercase.  Changing
> to
> lowercase has multiple effects:
> 1. LDO6 supply is now properly configured, because regulator driver
>    looks for supplies by lowercase name,
> 2. User-visible names via sysfs or debugfs are now lowercase,
> 2. dtbs_check warnings are fixed:
> 
>     pmic@4b: regulators:LDO1:regulator-name:0: 'LDO1' does not match
> '^ldo[1-6]$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

FWIW:
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

> ---
>  .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22 +++++++++------
> ----
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> index 3ac8f9d3c372..8f7155716c84 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> @@ -60,7 +60,7 @@
>  
>  		regulators {
>  			buck1_reg: BUCK1 {
> -				regulator-name = "BUCK1";
> +				regulator-name = "buck1";
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
>  				regulator-min-microvolt = <1605000>;
>  				regulator-max-microvolt = <1995000>;
>  				regulator-boot-on;
> @@ -104,7 +104,7 @@
>  
>  			buck6_reg: BUCK6 {
>  				// BUCK8 in datasheet
> -				regulator-name = "BUCK6";
> +				regulator-name = "buck6";
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <1400000>;
>  				regulator-boot-on;
> @@ -112,7 +112,7 @@
>  			};
>  
>  			ldo1_reg: LDO1 {
> -				regulator-name = "LDO1";
> +				regulator-name = "ldo1";
>  				regulator-min-microvolt = <1600000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-boot-on;
> @@ -120,7 +120,7 @@
>  			};
>  
>  			ldo2_reg: LDO2 {
> -				regulator-name = "LDO2";
> +				regulator-name = "ldo2";
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <900000>;
>  				regulator-boot-on;
> @@ -128,7 +128,7 @@
>  			};
>  
>  			ldo3_reg: LDO3 {
> -				regulator-name = "LDO3";
> +				regulator-name = "ldo3";
>  				regulator-min-microvolt = <1800000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-boot-on;
> @@ -136,7 +136,7 @@
>  			};
>  
>  			ldo4_reg: LDO4 {
> -				regulator-name = "LDO4";
> +				regulator-name = "ldo4";
>  				regulator-min-microvolt = <900000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-boot-on;
> @@ -144,7 +144,7 @@
>  			};
>  
>  			ldo6_reg: LDO6 {
> -				regulator-name = "LDO6";
> +				regulator-name = "ldo6";
>  				regulator-min-microvolt = <900000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-boot-on;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
