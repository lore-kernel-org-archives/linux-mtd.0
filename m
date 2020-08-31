Return-Path: <SRS0=zkQe=CJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F19AC433E6
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 05:30:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEBD206CD
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2020 05:30:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YPDrtO5Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="KbMm92/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFEBD206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nVwYQXjIwCrPF2F8la7F13pVGpQyUS3P9TsMsmnkZ6w=; b=YPDrtO5QdxikaTkPU0xpEGACo
	FxkqMAAZ1/XsOStnss7KqSQA/FwV0fqNqnmeOVi4XOX1Q7z6XnD0aEgWiXua+/QJ55U/sjjRxgjam
	PAu1cDsXKkqAYxsade3B12YmuXlnm5Go39IqqLz/xxyk0gffnFiGFZZzEKNIp0YnurhXaHYAh9MNE
	ROgFagdHSWIrLAgUByfEg2n9gdT067XZKrC1mGmdJhBpAqvi8juRSxFVLCQKWF9bnq1ss9EGwnmFb
	PI4kC9u74gG+kvCf0wBsJeDrAmCCpb/LZ1ACxYvaFDSIcJiCdAcNbLU9PJKdUOU7IH8DhSqXDCG+1
	rHvTexFwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCcOR-0000AI-Qg; Mon, 31 Aug 2020 05:30:11 +0000
Received: from mail-db8eur05on2072.outbound.protection.outlook.com
 ([40.107.20.72] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCcOP-00009G-6f; Mon, 31 Aug 2020 05:30:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b22NKGwdXCJmZW4T8ayBtJovIg6OGzFIrCEPLTxt1spyY1x1CTt5YHh1TAYdOUEDdu0Wt/YfomRVHuzR2dBtP5e9TTIMRiX+1xP1M4jeYr6PmJP6b5vfJDLcZQUpbsYPZ3252J3miLGWCKrpBCWGAWwdFExHvmSm4Tdfxfq4JYn1NXtEVOD/LZTQXGEBWOdJjmtIqccnVWFnRSaS6MfO+HRrMqUCSwwfZMejaRASikufwiXJdSGMJry1TWgSot182WmzociG7s0fXhWXZV2CdglRSn4JkUvjRKNM1thLtasQWVQCnl6jRIidMiQ8VfPyI+mhNJ9OsAScJhC4W2LYlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuIhBKsS32sDuz65JCLD3NF/IO7hnmriQ7ZJ+t2NASg=;
 b=oIdIGB3wx/MODY4ynrGvEKxd5+L+yc+RU9eMUnSKhiBML/73eiXKIIV/jlZGAbeAK6DD/b71m8T6hAuRnxXzVp9dUHI8FRyPvr8HrHVDxJ+9j9wA+N3G5+wZrTIgWnQmBUxZDdBo/+QEJzfNBzth3cBiAZf1f1Up8ChiH4eYj59s3Q10vz9ieS50vBwuqWdsgrEDTOo0BOnypkxuCCLsNoI+6id8Non0qRb7Lclcbog00zVcoNIH8xaWsQNsxtWoBXcdcas+VXZRUBQLRFLPYWZY2r0z6VDraX5bvYR8zc5no+PMjA1KuSozZrzbfWIkEOqzlR2bjQGl4XxSPJdRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuIhBKsS32sDuz65JCLD3NF/IO7hnmriQ7ZJ+t2NASg=;
 b=KbMm92/tzNytiKD2VvdbB8Tt4RpGPG3d8k4B6baBxGXOIBa1k99yFL/2oKJ0X9V88J7wCCW86AIMzBx24ZcsAotdsNIvN+8Zzyp5oj/FmySS3leJtGjmLDjJFbDAujZtWlNUj7xxxwJ67bT7dp59d4LTHC0VrceZM7z6Eo4htEk=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2171.eurprd03.prod.outlook.com (2603:10a6:3:2c::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.25; Mon, 31 Aug 2020 05:30:02 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 05:30:02 +0000
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
Subject: Re: [PATCH v2 08/19] arm64: dts: imx8mm-evk: Add 32.768 kHz clock to
 PMIC
Thread-Topic: [PATCH v2 08/19] arm64: dts: imx8mm-evk: Add 32.768 kHz clock to
 PMIC
Thread-Index: AQHWfVs3qYAjSZXoH0mZ365PL1Fx96lRtNYA
Date: Mon, 31 Aug 2020 05:30:02 +0000
Message-ID: <3fa98bbdc9aaa60d9fefa9034cd23441713b2e85.camel@fi.rohmeurope.com>
References: <20200828164750.10377-1-krzk@kernel.org>
 <20200828164750.10377-9-krzk@kernel.org>
In-Reply-To: <20200828164750.10377-9-krzk@kernel.org>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77614314-ff6c-46cf-d4c6-08d84d6ee95a
x-ms-traffictypediagnostic: HE1PR0301MB2171:
x-microsoft-antispam-prvs: <HE1PR0301MB2171355911C37A62737E3231AD510@HE1PR0301MB2171.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +uenvtESHIiBNf3zloAkNaUaaq0g/giAz+DYw5ZjQAkjU3XhD/RiyIf7ZSYSicQPgcfw2eZX2oiXwpt7t7+sqDy3meby/MxGHS8NS/pNPDqNXcSqoW9uzax504sGeY+R6TCkeimUKhcDspP2mIuIPlnNIuEHu506k0dwUqaWCgtRnwoEOcangizw0MZo7vNai583yrXFy0ZOwC61LdgqMHFYmENasndTSqc3KjUWFEUF+m2xCkA7K87q7yI1FyNpCHFxtf+BoUMxwZZBUNMK6gHDKATYJSPEEs6+UyyNSAScMzwfAgJzfr9T4ztvzRIRP6uG2N8owKY3zC7aHQQ9Ur+aGNbfPFNyLgzDnFrWrcmJ43z7Xym4hwZ6teaAqTeKpIB0IbLLUlHjvPckDKTJlg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39840400004)(376002)(396003)(66476007)(2906002)(64756008)(478600001)(6506007)(71200400001)(66446008)(6486002)(5660300002)(2616005)(76116006)(26005)(186003)(8676002)(83380400001)(8936002)(66946007)(3450700001)(86362001)(66556008)(7416002)(4744005)(6512007)(316002)(110136005)(921003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: WdfdoyQafJ+igjIGEf2RaVrH7a4QzIaq8L7jtJ5Q7O29yfhbdUvw8Nuy8zPN9Jdx6mstfz7R6b9u10MqRx7UP6kmUKLw6k/R/zhHCl18vEqZR7MVoV735/p2g8Hawo4NJxxutA8TCngAQeMRHg+OUkfXsKO1Y+zwOqzRT8Md1gWt6K2XngXTZ4HiLtxeD9V6lWv8RGdZYt4PdcQZ6UDzwRgav3PQizTQ1OIdM2W1UulxDvLkj79YDJZEh4OkeQOSsPazn2amn0LwSfSpmqxmdyCWqKGmGaM2rzFA6o8zc4APJ10iwG6yZLa0k7KsRq5RIdZTMJmypjcPAy8mko3ztUmfcXhrnisHTmzSGqNQvHjtOq6mrGMlGWlfZU0uA592Z9MLRM6XV0ZNxbSVKb7Cp97giHE/qYFfftDrOULnF4AQy57oN1Og/YGFlRswze8I9zV6ohdycVQaqRqMfIuo0JdDAUcGmNvC3GpDL69ORKN2igUdIo7xeuDsIua/4HhC7FZ32TDqhyXW7EX36FaeZHKCbI1YQHR2r5fmzyTTPnvhBIm9y2kJpGqMR/2QZrMnmaFdOYRBL1faX/S+gzyBXL7Axsym7jUk93i0ngnPtbtGmvB367ROjUrwVCLpO+IFe39FmBpzeHPz9/2J0bzHHg==
x-ms-exchange-transport-forked: True
Content-ID: <5E8AD64092C9294B96DAAF233D46A5F4@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77614314-ff6c-46cf-d4c6-08d84d6ee95a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 05:30:02.8021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FwBBlYioCr+wm6yVvJrN+wdFT0uzlSSXvFbp2zgndNtpNYJ23OZaMALFOB01xElJEIdPRVgsvczqRKdRB90xhW37zSY567xB/087MdeMmBoGirXJmYpT0ls7hNt70VEC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_013009_282297_F8F31509 
X-CRM114-Status: GOOD (  15.56  )
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
> The ROHM BD71847 PMIC has a 32.768 kHz clock.  Adding necessary
> parent
> allows to probe the bd718x7 clock driver fixing boot errors:
> 
>     bd718xx-clk bd71847-clk.1.auto: No parent clk found
>     bd718xx-clk: probe of bd71847-clk.1.auto failed with error -22
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

FWIW:
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index 3cb8b6bcb657..0115f07bbc9d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -149,6 +149,10 @@
>  		interrupts = <3 GPIO_ACTIVE_LOW>;
>  		rohm,reset-snvs-powered;
>  
> +		#clock-cells = <0>;
> +		clocks = <&osc_32k 0>;
> +		clock-output-names = "clk-32k-out";
> +
>  		regulators {
>  			buck1_reg: BUCK1 {
>  				regulator-name = "buck1";

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
