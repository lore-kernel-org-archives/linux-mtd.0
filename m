Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0729C433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 08:23:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EBDF20639
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 08:23:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c5MrmkZ3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="AFDBS4+m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EBDF20639
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+GHrUtSKJhUlzoh8RBvvpzXERFCMGmsd8xp0wc2tmA=; b=c5MrmkZ3mjhapO7VCdNkwxR+4K
	SdHZ0OUOJwrpUHBeoBLMiuMqrXs6iizTDON9OUnxDX6gNaIutDMl+9/inlLofa2UpdreXmA1PY3DD
	SCVFvyeRw8/qjpBTyKFfAqIoYjhaHwvGKsmhXFDj5p+JVX9agOqNglSQUPkZQK3Ff4x9dEM8x8hqR
	tq+hWwepC8h3ABBuZS9iKyc5Q/NH6HEoudm+q7szF5t1elYFIwvANFCqZftfnA8c86xxDm8j2YGDQ
	KelsRf4zaKSMvPRVKqIOtLof8ekBEyDVusl3dSWJi45UWAgtktu6t3Hfir4SEmTOgtW59aS3lAl/G
	vSwC2THg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUDu-00048u-55; Tue, 25 Aug 2020 08:22:30 +0000
Received: from mail-eopbgr70083.outbound.protection.outlook.com ([40.107.7.83]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUDr-00046U-02; Tue, 25 Aug 2020 08:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFebFEf3cLr583LAiYqoqzwtPij4SGottvjrCNE/PUzi39meJRA5bXY9nPqb+GQ7nhTOQvaiWE4AEFd0kpT7g8AXmVmZ1cqe6lLNdXs5bg8O5olDd7/Rd3jxrUMJHE1fyfiYRo5C26uBBM/MUJwPfrAW3eZhOitENgBOhi+ruY+UVWJzic3W+Oq5YFsIUQ+GEEngKehR0kHdv9K/wOKT8kJDAPmYVKsn3kqZP+mY/O+E3cn0lwsr1CNTzOnLxpBIN/T5vEZVQ/H+5CenyRdBttVzBBjvWSzESxyB94AuN7LVZ1TyIuAJQ0y2PXMlHKXniVQLfjF/APzmpGOhae1GgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OdrVh1i1J7k5sepOy2HQBkQYZCXdmfuL5SQwaXL2dw=;
 b=bIgsihn4wR5GKehgLVl3tQUvYr5K+OF3AWJlRIr0jrUf7ME5X0Cp702vwCUSUCjohCYZo1sLef+8F7wNoBuCmJkpFLKrV/Thy0vS8ZTdawiuYOsIIqBtGnCJbFm0sgm4umHLPOj/A9fz2H66/3ol/ZfxAJuk0iwKLwH3PDXY0gZMJbax2OIN9w6YpqKZsMkoffnbS1dbK/lpmAuy7vus5GDQTwS4Np1uicH6ukU9YRgUGMGI4zbZH3W4FMjRj+xF7FLBOwe97QGF0ZMgjjMOe2zzbj9bdgVIHPeBtGFDkC6AHyhDjZzubGzeLtLJjuO7Ea2WZkk/ka7R2md9XcAPKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/OdrVh1i1J7k5sepOy2HQBkQYZCXdmfuL5SQwaXL2dw=;
 b=AFDBS4+maA3CeTs/lLe5Xg9Vc292lCrrLxqh5QB5FIwI/i284k376k6Abe6CbFhrzfwqsZR7fsF3jGb9rgUUCIKICIzxPWm69AgqAr3/OxHHLNugj7OT9QYSSEOlmEoCnNXUKfvAbw71DMIu3P/F4tvy78Alee0NJ1FcnTGvKbk=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2474.eurprd03.prod.outlook.com (2603:10a6:3:6a::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.26; Tue, 25 Aug 2020 08:22:18 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 08:22:18 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "krzk@kernel.org" <krzk@kernel.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>
Subject: Re: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align regulator
 names with schema
Thread-Topic: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align
 regulator names with schema
Thread-Index: AQHWeknSKDZwJ6TG4kKPN+CgQ8rFoqlIY7aAgAAJkYCAAAVqAIAAAZMAgAAIzwA=
Date: Tue, 25 Aug 2020 08:22:18 +0000
Message-ID: <3018d638b5753e629ebdb6a25973aeff7e446720.camel@fi.rohmeurope.com>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-3-krzk@kernel.org>
 <fa042a4f670775f340e88fca8f363252112fd538.camel@fi.rohmeurope.com>
 <20200825072537.GA5914@kozik-lap> <20200825074500.GA19323@kozik-lap>
 <20200825075038.GA10148@kozik-lap>
In-Reply-To: <20200825075038.GA10148@kozik-lap>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7660cffb-a123-4424-9991-08d848cffb39
x-ms-traffictypediagnostic: HE1PR0301MB2474:
x-microsoft-antispam-prvs: <HE1PR0301MB24749394F1B215CA2646F4F2AD570@HE1PR0301MB2474.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: M4V04EokFfhpp90NOGg9S26VFAHyncal3nEJQ5fU8gDuiJVOYc1LFVMUkViZxDX2QidzwFerxlpPw5BfaZ1KWRJWOQhgohW8Fxvkm5VwGGuV29FDuINWOMfVNJOmsVby8iwT6FJo66nT/zJShL/wZjiLp3JcuqmOkQ+OUDH6Ws1p58X7Ogaj3Xx0VYEp9QCrTwmqL7hrlWv3cCBtze6QQ1efuc+C+PSfHyfjm3E2PoXEXubqjciUkJwCuz4zivq0lO8zXmm5oC2XXroCkZtcPdoG0PEWRjWjOxp/kXFx5WZI6xk8j8t/4ThABmpdL8elyHVUW3ni+c1d3deIsZeBqEPdd64EgcRMJAkpT5Qdq3lU+PEYc8Hx9jv/35c9w3zf
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(396003)(136003)(376002)(83380400001)(66476007)(6512007)(71200400001)(66946007)(66446008)(26005)(478600001)(186003)(66556008)(2616005)(76116006)(4326008)(54906003)(64756008)(8676002)(7416002)(316002)(8936002)(2906002)(6486002)(110136005)(3450700001)(6506007)(86362001)(5660300002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: a0eNTMDt9ooO0PYtdbsFPuRG3LpYzEwUuNKEzxqT7d49cKvEspwGz/vllrn1kb8KXl4BasM1GmULFxcmJRhqU1hdzs1NRiRHKlMW+y2T4u5MbhDevrXh8AVraC1XgC7fcq63wXeA3VelWiq7RDznYSOhrc9clKviW0hndf/dqHbWIXGqbRAOTK7RIZzY4NKCnMkh3vTVzM/S0Qcd1Zvwsfix27HhiUiQuwMRq3GSo5R6IDfD9j5AL5y80nnU86V8ahiHqBvE8kXoDj3988loYz8ePcw73uu435VB3DpkbwStGQQDIWLWXLKnC1kF8nU6rsZhidCnjOwEE0C/otmiBj+IhXzeLLDIpTh3dNzwmmp057EtY2PJaXYvERVTvgjv+Dr1ecl+tz2UlwHUoEANnTumWnTraeAqn2DwDgT8rcXWAhMuDaBGNEyumqHuO0ojn3T9Gf/8uO/cOikwKWHxMfarm/HzK3xAYSezmtNxyt0BFn6xoUT682c4lIzCghqExXSSNKVF62AFJG1kWQlWjPhejDk+uOKns5KJXhMNIno3yrUeWW/aavQoRDF4DwM0U1+gPKVhHPZe7DHUnMooDwrjonVVtUIj9ibv2usAAuPHT0hW0zV9yUAIr/HoPpvSh7jcIbf21/EPrSCfMAx0Hw==
x-ms-exchange-transport-forked: True
Content-ID: <1B579BB338DAB74699D1A1FAD4D60B3D@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7660cffb-a123-4424-9991-08d848cffb39
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 08:22:18.0802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DRfKlk0bqHa3Z36hqd7uTUxjojb3XwSLwgjoo+WbUY7Dk1sq3N4XbLkwdEzbs+YJFd13GWKXFONMe6glrMkmzJk+tafC+qJVZ7grrF+L8NErFN2dcDi5RTXVEcHfjULO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2474
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_042227_277302_CF685A96 
X-CRM114-Status: GOOD (  39.84  )
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
Cc: "daniel.baluta@nxp.com" <daniel.baluta@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "Anson.Huang@nxp.com" <Anson.Huang@nxp.com>,
 "aford173@gmail.com" <aford173@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-imx@nxp.com" <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "han.xu@nxp.com" <han.xu@nxp.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "yibin.gong@nxp.com" <yibin.gong@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jun.li@nxp.com" <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Krzysztof,

On Tue, 2020-08-25 at 09:50 +0200, krzk@kernel.org wrote:
> On Tue, Aug 25, 2020 at 09:45:00AM +0200, krzk@kernel.org wrote:
> > On Tue, Aug 25, 2020 at 09:25:37AM +0200, krzk@kernel.org wrote:
> > > On Tue, Aug 25, 2020 at 06:51:33AM +0000, Vaittinen, Matti wrote:
> > > > Hello Krzysztof,
> > > > 
> > > > Just some questions - please ignore if I misunderstood the
> > > > impact of
> > > > the change.
> > > > 
> > > > On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski wrote:
> > > > > Device tree schema expects regulator names to be
> > > > > lowercase.  This
> > > > > fixes
> > > > > dtbs_check warnings like:
> > > > > 
> > > > >     arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dt.yaml: 
> > > > > pmic@4b:
> > > > > regulators:LDO1:regulator-name:0: 'LDO1' does not match
> > > > > '^ldo[1-6]$'
> > > > > 
> > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > ---
> > > > >  .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22
> > > > > +++++++++------
> > > > > ----
> > > > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-
> > > > > evk.dts
> > > > > b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > index a1e5483dbbbe..299caed5d46e 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > @@ -60,7 +60,7 @@
> > > > >  
> > > > >  		regulators {
> > > > >  			buck1_reg: BUCK1 {
> > > > > -				regulator-name = "BUCK1";
> > > > > +				regulator-name = "buck1";
> > > > 
> > > > I am not against this change but I would expect seeing some
> > > > other
> > > > patches too? I guess this will change the regulator name in
> > > > regulator
> > > > core, right? So maybe I am mistaken but it looks to me this
> > > > change is
> > > > visible in suppliers, sysfs and debugfs too? Thus changing this
> > > > sounds
> > > > a bit like asking for a nose bleed :) Am I right that the
> > > > impact of
> > > > this change has been thoroughly tested? Are there any other
> > > > patches
> > > > (that I have not seen) related to this change?
> > > 
> > > Oh, crap, the names of regulators in the driver are lowercase,
> > > but they
> > > use of_match_ptr for upper case. Seriously, why making a binding
> > > which
> > > is contradictory to the driver implementation on the first day?
> > > 
> > > The driver goes with binding, right? One expects uppercase, other
> > > lowercase...
> > > 
> > > And tell me, what is now the ABI? The binding or the incorrect
> > > implementation?
> > 
> > Wait, my mistake. I got confused by my own change. The node name
> > stays
> > the same, so of_match will be correct.

Yes. I think so too. Match will still work as earler.

> > 
> > The driver internally already uses lowercase names.

Yep. I was simply thinking that if anyone has been specifying the
regulators as suppliers by name - then this change will change things
(as is seen for LDO5). Additionally, if any user-space SW has been
reading the regulator states from sysfs - then these names will also
change the sysfs. Debugfs change is hopefully not such a big deal.

Whether this really breaks anything is beyond my knowledge as I don't
even have this board. Anyways, I think that by minimum the commit
message should point out that this change will be visible outside DTS
and the BD718x7 driver - up to the user-space.

> > 
> > Everything looks good. I will just double check whether the
> > constraints
> > did not change on the board after boot.
> 
> Constraints look good.
> 
> > > > >  				regulator-min-microvolt =
> > > > > <700000>;
> > > > >  				regulator-max-microvolt =
> > > > > <1300000>;
> > > > >  				regulator-boot-on;
> > > > > @@ -69,7 +69,7 @@
> > > > >  			};
> > > > >  
> > > > >  			buck2_reg: BUCK2 {
> > > > > -				regulator-name = "BUCK2";
> > > > > +				regulator-name = "buck2";
> > > > >  				regulator-min-microvolt =
> > > > > <700000>;
> > > > >  				regulator-max-microvolt =
> > > > > <1300000>;
> > > > >  				regulator-boot-on;
> > > > > @@ -79,14 +79,14 @@
> > > > >  
> > > > >  			buck3_reg: BUCK3 {
> > > > >  				// BUCK5 in datasheet
> > > > > -				regulator-name = "BUCK3";
> > > > > +				regulator-name = "buck3";
> > > > >  				regulator-min-microvolt =
> > > > > <700000>;
> > > > >  				regulator-max-microvolt =
> > > > > <1350000>;
> > > > >  			};
> > > > >  
> > > > >  			buck4_reg: BUCK4 {
> > > > >  				// BUCK6 in datasheet
> > > > > -				regulator-name = "BUCK4";
> > > > > +				regulator-name = "buck4";
> > > > >  				regulator-min-microvolt =
> > > > > <3000000>;
> > > > >  				regulator-max-microvolt =
> > > > > <3300000>;
> > > > >  				regulator-boot-on;
> > > > > @@ -95,7 +95,7 @@
> > > > >  
> > > > >  			buck5_reg: BUCK5 {
> > > > >  				// BUCK7 in datasheet
> > > > > -				regulator-name = "BUCK5";
> > > > > +				regulator-name = "buck5";
> > > > 
> > > > What I see in bd718x7-regulator.c for LDO6 desc is:
> > > > 
> > > >                         /* LDO6 is supplied by buck5 */
> > > >                         .supply_name = "buck5",
> > > > 
> > > > So, is this change going to change the supply-chain for the
> > > > board? Is
> > > > this intended? (Or am I mistaken on what is the impact of
> > > > regulator-
> > > > name property?)
> > 
> > Good point, let me check the supplies.
> 
> This patch actually fixes the supplies which before were not working
> because of case mismatch.
> Before:
> 
>  regulator                      use open bypass  opmode voltage
> current     min     max
> -------------------------------------------------------------------
> --------------------
>  regulator-dummy                  4    5      0
> unknown     0mV     0mA     0mV     0mV
>     LDO6                          1    0      0
> unknown  1200mV     0mA   900mV  1800mV
>  BUCK1                            1    0      0
> unknown   850mV     0mA   700mV  1300mV
>  BUCK2                            2    1      0
> unknown  1000mV     0mA   700mV  1300mV
>     cpu0-
> cpu                      1                                 0mA  1000m
> V  1000mV
>  BUCK3                            1    0      0
> unknown   975mV     0mA   700mV  1350mV
>  BUCK4                            1    0      0
> unknown  3300mV     0mA  3000mV  3300mV
>  BUCK5                            1    0      0
> unknown  1800mV     0mA  1605mV  1995mV
>  BUCK6                            1    0      0
> unknown  1200mV     0mA   800mV  1400mV
>  LDO1                             1    0      0
> unknown  1800mV     0mA  1600mV  1900mV
>  LDO2                             1    0      0
> unknown   800mV     0mA   800mV   900mV
>  LDO3                             1    0      0
> unknown  1800mV     0mA  1800mV  3300mV
>  LDO4                             1    0      0
> unknown   900mV     0mA   900mV  1800mV
>  ldo5                             1    4      0
> unknown  1800mV     0mA  1800mV  1800mV
> 
> 
> 
> After:
>  regulator                      use open bypass  opmode voltage
> current     min     max
> -------------------------------------------------------------------
> --------------------
> buck1                            1    0      0
> unknown   850mV     0mA   700mV  1300mV
>  buck2                            2    1      0
> unknown   850mV     0mA   700mV  1300mV
>     cpu0-
> cpu                      1                                 0mA   850m
> V   850mV
>  buck3                            1    0      0
> unknown   975mV     0mA   700mV  1350mV
>  buck4                            1    0      0
> unknown  3300mV     0mA  3000mV  3300mV
>  buck5                            2    1      0
> unknown  1800mV     0mA  1605mV  1995mV
>     ldo6                          1    0      0 

That was my point :) Before this commit the system has acted
differently - either by accident or by purpose. In any case, the DTS
change will change supply logic and this should probably be mentioned
in commit log to help bisecting possible issues :)

But as I said, I am not opposed to this change - I am merely somewhat
cautious with changes like this.

Best regards
	Matti Vaittinen
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
