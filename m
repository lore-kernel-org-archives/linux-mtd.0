Return-Path: <SRS0=BSfO=CC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF53C433E4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:01:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C1142072D
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2020 09:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BkHz7ekj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fOf2jCyr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C1142072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KGbVfZE8XGXa9ulWSnfdoKpH/iRvdMp06a2BJmVKPds=; b=BkHz7ekj0HHVx1FMA872DJxVZ
	tZy1bLDNvEvNaYYUVhYj8P6vOYi4wKKjRG23A9tj6yW9jnLtWNFXromrBSRU1NxYY3lrvgds6WAq0
	b01boCKB0SVIkzSw/dpPopksVMEq9mCMVj/RlMkKG8Ti3rT/48fGofMBoQcHsTVoXfU1QrigDoLhM
	b9gyIISIMuGcXhrf0FdQwv41x5gg6ZnEgphYLC8TP3BoN2NzVU2KL4mKIDMEa6wxPbIyq9sZrjwSa
	GUSL4La8qGRuBbEMz4RT8hHChKKm+FwsSZTj9k2kAIXD+hzSfzKZ1MBBf1Pc4vqVvA/kpGkVasHiv
	xXQaJg18Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA8LG-0004sc-K7; Mon, 24 Aug 2020 09:00:38 +0000
Received: from mail-vi1eur05on2073.outbound.protection.outlook.com
 ([40.107.21.73] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA8L9-0004qy-P5; Mon, 24 Aug 2020 09:00:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGQLYBAOUvkgGSljhGAu5G6xFtKdD+mfC8RBAb3oeTeOIjXC8PHDBAKZ8lbz72Of1bIdXnRtVo3Dcd2xRgHYYb0Um0EH5/vO3VNoD7v4rAH8BOVlm+jjQ56Vd7vgSmXmc0lKuMDqnF4OUnm8gu7RCGZRjrU9FKwK405Yiy/0UdiGN44hK6GLuOZMFr3GLHBs7tBsXGbt4n9p2Wh7qju4gcfZze37DaPHgMs5/neKCZaugdIFJRXCFet/jmFtIDGhoEzhi8nosnrhobu/51PNNpjVPrc+xe0B9B1AyxBu19XsidWI4Us0lR1QP7WIR/KoQGSk8ZG0ub0464IvUfUAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oi07fpJKhwidrgeiwmkna4p8Jzdtdd08CuuGi7iEqQ=;
 b=fiw407YCAcraZ7XGHx6W3vb8cd/a1AXY9+9W1wC+j0DpeX6WPVR00GWsR94SR1xuGxNL35hllUbFQlbweDPet7IDjrQrRy0mxLtspiRevA8pbvZjhKakRzM8ZLFzts6m0Xbj16diyWdTzCN4WwoTVvylLIHjFhKXmoaVgeuiiyJweOeG+aD7rFeP0uo5fsKTXJ8tryM9Oe720aKw44gTvRFHtpTZ5by2KzsNeQnO02MHIdAC/pENZ5xepOC8t0yiTVa3TXZfA99boY+q43z7jbQu7mGsTG/gkeHyXwf4c7KjYfxLo5U+2tCFEUml/OQiAIpjHmt91PnqLdB9LcgsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Oi07fpJKhwidrgeiwmkna4p8Jzdtdd08CuuGi7iEqQ=;
 b=fOf2jCyrVMDFH/YYVps6YuPEphvx76u90mJYkfArfa82WG0vWO1SIogABWFktWPBB5p4gDX7HUsaYOJDd6l+EI5kHgXVafsBAKNo3b0QF+PwzNjrSN05U/i7ajjZ2uqWItSb8p942iFaEl0cd8QtbpYsJdtvJZtv22cmI6oVtO8=
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com (2603:10a6:20b:2::14)
 by AM6PR0402MB3894.eurprd04.prod.outlook.com (2603:10a6:209:20::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Mon, 24 Aug
 2020 09:00:20 +0000
Received: from AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca]) by AM6PR04MB4966.eurprd04.prod.outlook.com
 ([fe80::99b5:145d:16cc:78ca%3]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 09:00:19 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <bgolaszewski@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mmc@vger.kernel.org"
 <linux-mmc@vger.kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "linux-serial@vger.kernel.org"
 <linux-serial@vger.kernel.org>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
 <linux-watchdog@vger.kernel.org>
Subject: RE: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
Thread-Topic: [PATCH 21/22] arm64: dts: imx8qxp: Remove i.MX7 compatible from
 USDHC
Thread-Index: AQHWeWjs3+F925Bk106zrc9FAFewr6lG9uLw
Date: Mon, 24 Aug 2020 09:00:19 +0000
Message-ID: <AM6PR04MB49668B0F67B02B2A33603B4880560@AM6PR04MB4966.eurprd04.prod.outlook.com>
References: <20200823161550.3981-1-krzk@kernel.org>
 <20200823161550.3981-21-krzk@kernel.org>
In-Reply-To: <20200823161550.3981-21-krzk@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3f9b0d02-acba-4307-918e-08d8480c20c6
x-ms-traffictypediagnostic: AM6PR0402MB3894:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0402MB389430D49307CE2BAA78F7BC80560@AM6PR0402MB3894.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 67I/EcZQbxLD8cgq45bPaFHWiAgYKRlN6FdV/oA7EsQbON53d7MTJrro7YJ+LXT92IfXAgjDJDviHocnXa1xVQ6KI003EMt7a+M/3Q+O1YO39MiQ8T48jwio62qhcOxJC11ugn45a3cudhkehhdoIQhiMxqWy0AyR6HoM4HEmoQWz0uiicUzGX0gOU0NcECeQl3/lAryj/SHhcBNJV3EPMdODrKx5ubPAU3co7eq8AFbRBybfcRNByfzd4J4/J+HPr9pifpgtHg2UaOiUOd1eIwofpB1D2fPH3opy9mGlEHEcGj8iEpBC80qOHH9Jbf/Ewz/5girr/oLsCXmpP7uD8AlbQx/OtWzcq/wDGoZe+dkdYbwTghS75HLbK/dEUis3s+bpaIZKHzo8XwEDiGjKg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB4966.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(366004)(136003)(376002)(396003)(316002)(110136005)(44832011)(8936002)(7696005)(9686003)(26005)(4326008)(186003)(7416002)(2906002)(478600001)(8676002)(54906003)(6506007)(66946007)(76116006)(5660300002)(83380400001)(66476007)(33656002)(86362001)(66556008)(66446008)(64756008)(52536014)(55016002)(71200400001)(921003)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: RkLyOxMxPiIXid+HwKWJ/5uHIVEUO0bTM+49E57o2YxuyHxmxIDTCZM9HqxdIcxhO3do+NdNJn9+oeQPfkfibdKlIwZD50XB3qvs29Nc6hcTDBSTGcQbrnso1Edpsy75EVL/sv/tfZwxF99WQboSJ7C+FsOIFwKUSHxhGnbUxi7gahLgLK1DcTJi3MSFe8wSTGvtFeu3FuYO+wG0iZV7KDnWAlOzhV36kAXv+skpesA4AuO07q55j8YzXvi1qGqOaubt4lKCRsfujpUjJyBnO6lcCMGm1vt4FA+bb8NTABeppxdgPxz3Bi9tuW7oDAiDXW7I94magYMUK18jLl93q2IrUEmU11K8TLuPbXh79UV5ncUPBN3eu/tKQxGPSYn9DJdPAOjEUz8K5P4XO3W8PAcIYWtXc6Hr4XS9FsI2uxKI994TJYZSRC+tV94+OQ+R4hnqfClFA1uie90Al4IprD9pz5cey2/NDNRlDc/lhymVzr2zj0VmmZuDzAVsxHoNXlCmXwNwWBRIVdYePOxwL229UjoiXmn0gBFUs73cI7H7FKIl+xQbkic1L59HhVBij3kfmaOBb3tWy5IufVKpsdWEeLuZNYP6Wf8a8H0h7PDMWEXYlHV0i88O4tq+jfD5B1vub5G1lX3kZ6mtgOPaKw==
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4966.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9b0d02-acba-4307-918e-08d8480c20c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 09:00:19.7937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P2X+PmlpoE6tIjOjAM2mB1F0wDKpA7ypCLWmTpoFTCbMfQwijkKRz6eEFG8L0wjQUMC78JXRWFpB0AC1geZxeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0402MB3894
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200824_050033_241119_0B814DE9 
X-CRM114-Status: GOOD (  18.77  )
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Anson Huang <anson.huang@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Monday, August 24, 2020 12:16 AM
> 
> The USDHC on i.MX 8QXP has its own compatible described in bindings and
> used in the driver (with its own quirks).  Remove additional fsl,imx7d-usdhc
> compatible to fix dtbs_check warnings like:
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
>     compatible: ['fsl,imx8qxp-usdhc', 'fsl,imx7d-usdhc'] is too long
>     From schema:
> /ocumentation/devicetree/bindings/mmc/fsl-imx-esdhc.yaml
> 
>   arch/arm64/boot/dts/freescale/imx8qxp-ai_ml.dt.yaml: mmc@5b010000:
>     compatible: Additional items are not allowed ('fsl,imx7d-usdhc' was
> unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

For Patch 19-22, I think we should fix dt binding doc.

Regards
Aisheng

> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> index 61bccb69f09e..26c4fcdfe290 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> @@ -362,7 +362,7 @@
>  		};
> 
>  		usdhc1: mmc@5b010000 {
> -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> +			compatible = "fsl,imx8qxp-usdhc";
>  			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
>  			reg = <0x5b010000 0x10000>;
>  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>, @@
> -374,7 +374,7 @@
>  		};
> 
>  		usdhc2: mmc@5b020000 {
> -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> +			compatible = "fsl,imx8qxp-usdhc";
>  			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
>  			reg = <0x5b020000 0x10000>;
>  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC1_IPG_CLK>, @@
> -388,7 +388,7 @@
>  		};
> 
>  		usdhc3: mmc@5b030000 {
> -			compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
> +			compatible = "fsl,imx8qxp-usdhc";
>  			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
>  			reg = <0x5b030000 0x10000>;
>  			clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC2_IPG_CLK>,
> --
> 2.17.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
