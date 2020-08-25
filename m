Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B333EC433E1
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:24:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AFF820782
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 06:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dKjLBKnV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="W+6NM9A+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AFF820782
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Cc:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bB8Gvx9ZCdzUkhGCvewfrWYtFjD3aArWVHv+UT4TzUI=; b=dKjLBKnVYm9z0HWnLpuQ++dmr
	uxPEO8Z1i5Tdf4RYHAg1gLzGXWBxnyVUbab2/4voZpYD2MG6P4uj49vel8GzUe9HXy0K5ZyMb5aRG
	/cuyOGO11NHGpW/4o4eq7NhLIoCy1+eEYxARbd/aKvrfu1xQU8/nZQwRXDHQUalVvwO0UoRHAcc5g
	rltUHLj3X2ZMQCRY+JKFXT2jilybghITubWsi9aRZnsemXdu2faLYUcfOcIKNIRKqQ+AjLcF/L8Yf
	/mEMnVvZdNHRV8MQfujBXS7xFtLBwF0nVYHnlKcKQ8P46MV30kNShfLrQMZxG7bjRtHclOq5vX/TD
	1GlQb3A0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kASMz-0003Y7-HI; Tue, 25 Aug 2020 06:23:45 +0000
Received: from mail-eopbgr60081.outbound.protection.outlook.com ([40.107.6.81]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kASMw-0003XQ-T4; Tue, 25 Aug 2020 06:23:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANPiE/arf9zyZgzSmn+X5+FlCj2XYLSJ8kdyZrrUPQEywi2FOKjqpvK5+APXlNmg2tqRftOr+nXTPjr/LZgc5cQH6THgaYLHasyVHmpchiQLm1BOeW9StWUtf/63OKIXrXzlguJ4SYyH+RYO8/WId1NjiaX9md/q3Tm4U/dYkULibMUh3cENDMO7uOMZvdDnhJqSvK4CO9cI8jcprHcn5g5TDwF4jWB2v5kiPHkWzh6nhZQpbAWf19nenmdX9S6mvZvr4+X4Tf1X5D+w/sWJXIaXr1/amruq6AXIjHm5Flv4Azn3y5ODvhTLBIoPyAQdk2icAlqJRHUzmU9+dhsb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGUYPdytWs5jTgMyFeXfYZss7n4ulafRNGAIMX2BQ1I=;
 b=LNCMLM9WgL0xHjFY041nbUkbgImyzSgqo09nzalearVwGA9jd5TrE2zf8LRIlzFXOIUAVRkfntvHQEvw9eE3ar5aXuLp4ek0FQR/2V8H8zXDTHFzHLi5zuR5gOmCmVLTdzSBJOTXlGr0fJj3CAoLFOBJKRGRiFJUDiq/McK9N34qq8Mv2cEs0P1lmYtEfn3njnPY9bAO0WW5J0A1X1sHNNNRsf5j9byCzK+0p/7JlCMwe4SlDDgz8+MAt8cvgLNKZE79dEaUDufNHRDxhuQlgNCZm1YREexsIOnwt+O9Hxb9coM9scknx0PDxHzOkKjusba3sT1NWUKJjYhwYZwX+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JGUYPdytWs5jTgMyFeXfYZss7n4ulafRNGAIMX2BQ1I=;
 b=W+6NM9A+WaGSbuNuZUIC/ePqVQsymAcnrQEvcR4Ir5gkt2ebOGLtg7sjncVFHUF5DL/cO0hWhYbrfufOxZgTeyZDkYFC4n66dYp5d9fWl71YlCo0pgAWA8mmb7SmQ4au1xvswTlBXj4sjONpYoFNQWxBR4hBmWW2SBjRkVAdRvg=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0302MB2588.eurprd03.prod.outlook.com (2603:10a6:3:ed::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24; Tue, 25 Aug 2020 06:23:36 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 06:23:36 +0000
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
Subject: Re: [PATCH 01/16] dt-bindings: mfd: rohm, bd71847-pmic: Correct clock
 properties requirements
Thread-Topic: [PATCH 01/16] dt-bindings: mfd: rohm, bd71847-pmic: Correct clock
 properties requirements
Thread-Index: AQHWeknKF7zhD8z2dUixSNbUKRgNrKlIW/KA
Date: Tue, 25 Aug 2020 06:23:36 +0000
Message-ID: <b75867fd1c662a83d933ae8f0c4373ba017eb808.camel@fi.rohmeurope.com>
References: <20200824190701.8447-1-krzk@kernel.org>
In-Reply-To: <20200824190701.8447-1-krzk@kernel.org>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: bootlin.com; dkim=none (message not signed)
 header.d=none;bootlin.com; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e19692d-76bf-4b38-2b45-08d848bf6646
x-ms-traffictypediagnostic: HE1PR0302MB2588:
x-microsoft-antispam-prvs: <HE1PR0302MB25885AE3B9B19344A4662773AD570@HE1PR0302MB2588.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dSvTySrxoT+wWTzmV9d+Y+ZgSF3peVOhtpfeLbzrdLpRC37lwbAfMheJhBHfeJ9f5vi85qhBQlQK4xKp4LrHCmi5CzhFj9kfuonWA9+q4aew9E+yEkf4lC9TGbFLeG4Cur0P72NnIv+xOrzvw0b9u7bYjxxVYTptMUhIVS3cVaONK1wxbPZXqF37gOqHzXvpXNtAfLAJIRI2xs6qdKbKGhbCCRlgSaF4exu63CKHRqramwTPTOAzDmOaowx3ecMP48Yzdk3sljU4uduP8XxBcHAB7Q35lcGwUQYmKYhFtywI06Fs8p5bbz5eaD7H2+sR6Cmr+xtLp7uL9GKmnaa5O1AfGk/phxQJ4E2j/nThCkO1FzCSmD5YClr45O0UxtzzpZofIZmtXAjQSGjY8k0DQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(376002)(346002)(366004)(136003)(66556008)(478600001)(2906002)(6512007)(6486002)(110136005)(316002)(66446008)(64756008)(66476007)(2616005)(66946007)(83380400001)(3450700001)(76116006)(71200400001)(7416002)(86362001)(5660300002)(26005)(8936002)(8676002)(186003)(6506007)(921003)(142933001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 8uY199Cv7TSIpGTZSA+FMRAeNhlbqgOrto9jjaOOaq9FWDhvzcjz1FQI0InEZjsAUkI6Je2vzIeJJwN2nwb2HQYuXhVezWxkxL8efQIrvuw6L8Vkw8LsXEuHjSaQccpa3JnQvQDxnYS8Gp2Bp3PEVvLiLD1KCZkaE4svASVB+cqNyzM3BJTgpdvivQ2++FWHWxPA9GoJyHCUHt1TVXpTLPBHmlwF2C08sb5d01cc7qbT1OV0iBtnsmErZetAZ1kSsP+hB6gRqhJ/01S36FERNaStT/zuAmuWPNrLN8zUIE0RhriB6AL+oWZb8HiaGNqQjSt956ceNKIKo94TAsJ1KvzAQmX1MpuTHJ6f5xIZ7PQCo9QjKQs2nUwYY3OzcbBnS8FqR+1CeJxL3u8C9m2CKfDN3RsC7P5tU1WwyUFDdEUjKnaW2zKWP1Z612v1eigBFcMMlFVlgOI0/Uzp4HbcNJ0Pf96ARX29A1sTXbfMpKixQxV7BN9pRVo5FHzHCxAfyBV8nPewILjzaExZw1QxJQcm6GQZgRWMg+OSu2IMJ6aQ8Z8n+X6PHaXKrspZreTFPICnflSoUzB59Uz4bAOeSE6mL2PRd1oPVl7pe4S7PM2L5FC9hmtQcDBIs7bW3owFEpCAcp+CeF1dA/jbEYy4Mw==
x-ms-exchange-transport-forked: True
Content-ID: <96248C2974A23E4EA92B2A6CDC880321@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e19692d-76bf-4b38-2b45-08d848bf6646
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 06:23:36.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M37XZgAHd5rE0U1MI8Rg/CQ15DS+SBR7jqwlQMRIZANW6bbaMXMhldoYDGw2owOvhoyS2AHNpthDKqCTnaQHC0sF7MyzAX8/HIpi/U+9PLcuBB51ci3NI0bvKC1lDL1t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0302MB2588
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_022343_098160_F14BA185 
X-CRM114-Status: GOOD (  21.85  )
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

On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski wrote:
> The input clock and number of clock provider cells are not required
> for
> the PMIC to operate.  They are needed only for the optional bd718x7
> clock driver.

I have always found the DT bindings hard to do. I quite often end up
having a different view with Rob so I probably could just shut-up and
watch how this evolves :)

But as keeping my mouth is so difficult...

...All of the drivers are optional. The PMIC can power-on without any
drivers. Drivers are mostly used just for disabling the voltage from
graphics accelerator block when it is not needed (optional). Or some
DVS (optional). But yes, maybe the clk driver is "more optional" than
the rest. XD So, I am not against this.

> Add also clock-output-names as driver takes use of it.
> 
> This fixes dtbs_check warnings like:
> 
>     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> 'clocks' is a required property
>     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: pmic@4b:
> '#clock-cells' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../devicetree/bindings/mfd/rohm,bd71847-pmic.yaml       | 9
> +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/rohm,bd71847-
> pmic.yaml b/Documentation/devicetree/bindings/mfd/rohm,bd71847-
> pmic.yaml
> index 77bcca2d414f..5d531051a153 100644
> --- a/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/rohm,bd71847-pmic.yaml
> @@ -38,6 +38,9 @@ properties:
>    "#clock-cells":
>      const: 0
>  
> +  clock-output-names:
> +    maxItems: 1

I had this in original binding (text) document patch series. For some
reason it was later dropped. Unfortunately I didn't easily find a
reason as to why. Adding it back now is absolutely fine for me though.

> +
>  # The BD71847 abd BD71850 support two different HW states as reset
> target
>  # states. States are called as SNVS and READY. At READY state all
> the PMIC
>  # power outputs go down and OTP is reload. At the SNVS state all
> other logic
> @@ -116,12 +119,14 @@ required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - "#clock-cells"
>    - regulators
>  
>  additionalProperties: false
>  
> +dependencies:
> +  '#clock-cells': [clocks]
> +  clocks: ['#clock-cells']

This is new to me. Please educate me - does this simply mean that if
'#clock-cells' is given, then also the 'clocks' must be given - and the
other way around?

If so, then:
Acked-By: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>



--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
K
iviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
