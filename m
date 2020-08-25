Return-Path: <SRS0=rH0u=CD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFE8EC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 09:36:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F3D620706
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2020 09:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rqrjG2NK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rohmsemiconductoreurope.onmicrosoft.com header.i=@rohmsemiconductoreurope.onmicrosoft.com header.b="WqxvrIMO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F3D620706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GE2D+pubu6oJsKsPVxkApZTl9DEuO6CU4OmuuUAmnu0=; b=rqrjG2NKWVK9a3C8CrrjJ6EF89
	vZe+s3XGXKp1GDyc6gtGyRJsE0O7+NFrkroEsJwCEMMXVe7vAikUCkIx0ZdDuTamHRI8DL5SbGN+7
	ewZNNmlJSvZ+qolVwlsBlhNtR+4/t9mIhTm9tTRLouBpEVo4Ncu2SV6vqj5SZvnzXF+YV4xfy6G/9
	lGTtSLFbzzGw4B/DDO3cDnxrQ3zVnqONM9Df1bLVFJgTw5TcSGC5BFp23aGgBpfIEMoszRdjKmDUz
	oWI1asgJVPJZ34V8cRT571TbFjWvs0MX7htQ0RufEBr60Xr5kn9b3oTNOCrxUhu0wBJvmqfi03jC9
	jmU4lSWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAVMe-000848-Co; Tue, 25 Aug 2020 09:35:36 +0000
Received: from mail-eopbgr130077.outbound.protection.outlook.com
 ([40.107.13.77] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAVMb-00082X-9e; Tue, 25 Aug 2020 09:35:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIaMlYBCfs6yY78pYCHGeT/EqD+Gee8p4EwC9wsn4ny2XOHdc6F0ozo6mXFy5mHKGqfYSvUXoiX7rqBtHGAgNACaVPzLrtMpJQIKrb5MX2g9YgdZ8OZGhUBRWkNENTex00qLDDwBnbHwbEgPXyMcrHkN5w8jrrjsYBb9jd6CBYAdRv/yMEQ9+j2jVogtboH6we8ecE7W7tMBVu4EwWvXIQBZ6NMUB8Jm3jXZLblqyCijy2O9GM+gSlmK7wrfWlSQGyefsFzVNFR0RU5o1SsNK3n7zftFzl8KfgByNbxWN+WqPWy9uGV558b9v/Ti8Av4O1W1waA1cFdJWckymP5olw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfezyYbntFdmllu6vuYO5+9W6NXi8LM8nvI2QCgjKMU=;
 b=VcW+Rm9Ep0OqWJqO4cYiDpgw4inui2Uvgm3aOGdvf0UhExqRF8Ej0IkVMSVF+Z5nM85K0ZgZjfGuoOLgBD83xYBghj+SoUiLgC6OC/qoscG5MLub5HQK0IBPoIeC751d0KcZLPa9aEhnQpohsXQhSG17t1P6XazdBcbIR2uz3TEa34ZBSqjB3iLedyBIgpPUOfoq4emBNx0Dvqmm8Ldh3ccmou4F9ax7J7Q5oXJ4AceidXIWV+KsQfRv5bxmWlcHD9AYhJtHfJ+7XWw5AN0Uywu0wXD1Ya9cgr9fbRXz6QKIHnFzqCjG4SDKRtvEfbYgF2xR5vbTKDEvLtqxYiHKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfezyYbntFdmllu6vuYO5+9W6NXi8LM8nvI2QCgjKMU=;
 b=WqxvrIMO/+opW+xGJsVjEJmRubGGIkS0gMBZxAThmKf5amA/DzlFj1ot9Mlv/N53avFYwPqjr5lVLavFb55su+ZEQ0A7Zwf/Tklf0u0TjU74E+09qg0nkaJtZ2hNFGwv5VnpHm+u1TYe9pL35WBdehal7vVRzoV4g26BcyELJa4=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2395.eurprd03.prod.outlook.com (2603:10a6:3:6d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Tue, 25 Aug 2020 09:35:29 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::3d81:df5c:63de:a527%6]) with mapi id 15.20.3305.031; Tue, 25 Aug 2020
 09:35:29 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "krzk@kernel.org" <krzk@kernel.org>
Subject: Re: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align regulator
 names with schema
Thread-Topic: [PATCH 03/16] arm64: dts: imx8mm-beacon-som.dtsi: Align
 regulator names with schema
Thread-Index: AQHWeknSKDZwJ6TG4kKPN+CgQ8rFoqlIY7aAgAAJkYCAAAVqAIAAAZMAgAAIzwCAAAGGgIAAEu2A
Date: Tue, 25 Aug 2020 09:35:28 +0000
Message-ID: <8c4751a58c89ac10d3b551c74814cf3dd413080e.camel@fi.rohmeurope.com>
References: <20200824190701.8447-1-krzk@kernel.org>
 <20200824190701.8447-3-krzk@kernel.org>
 <fa042a4f670775f340e88fca8f363252112fd538.camel@fi.rohmeurope.com>
 <20200825072537.GA5914@kozik-lap> <20200825074500.GA19323@kozik-lap>
 <20200825075038.GA10148@kozik-lap>
 <3018d638b5753e629ebdb6a25973aeff7e446720.camel@fi.rohmeurope.com>
 <20200825082737.GA12902@kozik-lap>
In-Reply-To: <20200825082737.GA12902@kozik-lap>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [62.78.225.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ba00f68-b4fd-4dd4-0ced-08d848da346d
x-ms-traffictypediagnostic: HE1PR0301MB2395:
x-microsoft-antispam-prvs: <HE1PR0301MB239567832445930C71263B3CAD570@HE1PR0301MB2395.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: T/cFLBccNlkRUAE9bV7KNny9K/vDdJiG2BRn0pw1uC1YZ7x7cjk4p5YbknoNZLlkdHWOUfy+mxX0YBxdUtYyan+ezjW0K5xctLqQ5UkDrogxjpg3sdwiQJvdLSAnxLnprWFnsjQnZrbyqgOSUppb6hrIsEPD0gKAKCdI/BOxnz3p1z0meDZ1dlRqjwGHvKJjG2QfH2RE7ne8TjI7gOOL7ONMROW99Hxsdhij5fzifKftEnJY9GaRvIcaMG0NNa40t3ut5lRUErBU+QThDFM0HbaJPUNPVPeZ97Z1rsSWO7tnw+wJew9M7pwQBBAjXUXXFrJHapHj4DJszl90zvXGAmc9+co//BcV9p38uM+VC80YntxMgoniGT20H117tLfD
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR03MB3162.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(346002)(396003)(366004)(376002)(136003)(4326008)(3450700001)(86362001)(6486002)(6916009)(64756008)(66476007)(76116006)(2616005)(66556008)(316002)(66446008)(54906003)(66946007)(71200400001)(26005)(8936002)(478600001)(186003)(7416002)(6512007)(8676002)(83380400001)(6506007)(5660300002)(2906002)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: lsWuB6tsFSz6KPXsq2eMJwKZ34xHGHpc0iws7uaMa5D8YbhmjNa2OkNJWMdl/OKkLiNHmFm7dHdBw8UuXuNHbqg44QZ5H7UoL/JP9FBYgZuzZS9FTwOpwKgUx9i3KmesHofRcqGZlabc59ADLGugSPHH7WxgIGL7jFF8PsyDAhZ4BmqpwNSmbKMR4y2kFDMVuJpB0q2mSFbzRdYnbzBCYCcQ7AyPYktaq+b+3+okUKpvK2h2SwrN2ok7wDDfC/D8+CUsFPoVZwJeyvRcWeQq/fkPmsQXfr6pMX2m6AwWNS6hSEfYP6Lh1WCX9J0OFEPR3R1em0omZ2HcQyRqQJ2WNPqV6yN/0LDAcQutBik0RqsB4LryE0xS605WzaG9gPy5Lse3k41nE6BU2LyP9YCLLRcTY5B2l3+t5+r/lWcZTWpA7/DYdLh9VefJbM/o6l6mWIjAv4igRLZqGgXvO5v4lkvyeAvzEUXUWcZBFjeQiit2pnB1QLChnoIprVOjA675t2ANiBZBSjXT7OeThA5DWxErUw6MKiHe9vRyp92rUB0TpBKgZ9BBBd9cHvc9Vc0WvBx7bGvsfKJqOM7QmPJ8sd9c4hD91HtvP4EgDCj6C2nWeDcjy50Je6SY3vf5yuvqG5gMCwPx428PqwnVg7alZA==
x-ms-exchange-transport-forked: True
Content-ID: <37DDAC07B6C64143B7F40A28E9503940@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ba00f68-b4fd-4dd4-0ced-08d848da346d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2020 09:35:28.9609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVVs6ropl63vNB5IBuq4JXiq/VwhHIeqSsla1a4SpoxKJownNQqA3Rzhrs2kDLEodeXgqAbkWzevMzyyi4Tn1TLyyklgFhmDPNrmxPMSdeNoaRFPrDnW4XYHeGzicd1C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2395
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_053533_489494_FBE09967 
X-CRM114-Status: GOOD (  42.23  )
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
 "richard@nod.at" <richard@nod.at>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
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


On Tue, 2020-08-25 at 10:27 +0200, krzk@kernel.org wrote:
> On Tue, Aug 25, 2020 at 08:22:18AM +0000, Vaittinen, Matti wrote:
> > Hello Krzysztof,
> > 
> > On Tue, 2020-08-25 at 09:50 +0200, krzk@kernel.org wrote:
> > > On Tue, Aug 25, 2020 at 09:45:00AM +0200, krzk@kernel.org wrote:
> > > > On Tue, Aug 25, 2020 at 09:25:37AM +0200, krzk@kernel.org
> > > > wrote:
> > > > > On Tue, Aug 25, 2020 at 06:51:33AM +0000, Vaittinen, Matti
> > > > > wrote:
> > > > > > Hello Krzysztof,
> > > > > > 
> > > > > > Just some questions - please ignore if I misunderstood the
> > > > > > impact of
> > > > > > the change.
> > > > > > 
> > > > > > On Mon, 2020-08-24 at 21:06 +0200, Krzysztof Kozlowski
> > > > > > wrote:
> > > > > > > Device tree schema expects regulator names to be
> > > > > > > lowercase.  This
> > > > > > > fixes
> > > > > > > dtbs_check warnings like:
> > > > > > > 
> > > > > > >     arch/arm64/boot/dts/freescale/imx8mn-ddr4-
> > > > > > > evk.dt.yaml: 
> > > > > > > pmic@4b:
> > > > > > > regulators:LDO1:regulator-name:0: 'LDO1' does not match
> > > > > > > '^ldo[1-6]$'
> > > > > > > 
> > > > > > > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > > > > > ---
> > > > > > >  .../boot/dts/freescale/imx8mn-ddr4-evk.dts    | 22
> > > > > > > +++++++++------
> > > > > > > ----
> > > > > > >  1 file changed, 11 insertions(+), 11 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-
> > > > > > > evk.dts
> > > > > > > b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > > > index a1e5483dbbbe..299caed5d46e 100644
> > > > > > > --- a/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > > > +++ b/arch/arm64/boot/dts/freescale/imx8mn-ddr4-evk.dts
> > > > > > > @@ -60,7 +60,7 @@
> > > > > > >  
> > > > > > >  		regulators {
> > > > > > >  			buck1_reg: BUCK1 {
> > > > > > > -				regulator-name = "BUCK1";
> > > > > > > +				regulator-name = "buck1";
> > > > > > 
> > > > > > I am not against this change but I would expect seeing some
> > > > > > other
> > > > > > patches too? I guess this will change the regulator name in
> > > > > > regulator
> > > > > > core, right? So maybe I am mistaken but it looks to me this
> > > > > > change is
> > > > > > visible in suppliers, sysfs and debugfs too? Thus changing
> > > > > > this
> > > > > > sounds
> > > > > > a bit like asking for a nose bleed :) Am I right that the
> > > > > > impact of
> > > > > > this change has been thoroughly tested? Are there any other
> > > > > > patches
> > > > > > (that I have not seen) related to this change?
> > > > > 
> > > > > Oh, crap, the names of regulators in the driver are
> > > > > lowercase,
> > > > > but they
> > > > > use of_match_ptr for upper case. Seriously, why making a
> > > > > binding
> > > > > which
> > > > > is contradictory to the driver implementation on the first
> > > > > day?
> > > > > 
> > > > > The driver goes with binding, right? One expects uppercase,
> > > > > other
> > > > > lowercase...
> > > > > 
> > > > > And tell me, what is now the ABI? The binding or the
> > > > > incorrect
> > > > > implementation?
> > > > 
> > > > Wait, my mistake. I got confused by my own change. The node
> > > > name
> > > > stays
> > > > the same, so of_match will be correct.
> > 
> > Yes. I think so too. Match will still work as earler.
> > 
> > > > The driver internally already uses lowercase names.
> > 
> > Yep. I was simply thinking that if anyone has been specifying the
> > regulators as suppliers by name - then this change will change
> > things
> > (as is seen for LDO5). Additionally, if any user-space SW has been
> > reading the regulator states from sysfs - then these names will
> > also
> > change the sysfs. Debugfs change is hopefully not such a big deal.
> 
> About user-space, I think the embedded DT is not part of kernel ABI,
> so
> there is no such requirement about keeping it stable. I agree though
> it
> might be annoying surprise.

Just to ensure we are talking about same thing:
I see you are talking about embedded DT not being an ABI. I agree with
you - DT itself is not ABI. But in case you missed this we have:

static ssize_t name_show(struct device *dev, struct device_attribute
*attr,
			 char *buf)
{
	struct regulator_dev *rdev = dev_get_drvdata(dev);

	return sprintf(buf, "%s\n", rdev_get_name(rdev));
}
static DEVICE_ATTR_RO(name);

in regulator core. I believe the rdev_get_name(rdev) shall change
according to regulator-name. (But as I said, I have no idea if this is
used by user-space on your board - I'll leave this for you & others to
judge).

> 
> > Whether this really breaks anything is beyond my knowledge as I
> > don't
> > even have this board. Anyways, I think that by minimum the commit
> > message should point out that this change will be visible outside
> > DTS
> > and the BD718x7 driver - up to the user-space.
> 
> Good point, I will extend the commit msg about possible impact and
> fixing supplies.
> 

Thanks :)

--Matti

--
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland
SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
