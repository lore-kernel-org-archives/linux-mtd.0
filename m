Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509C2C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLgbq2gLBY3InllBr4zbKG45OEiHbz9tGgR7zt0fmUI=; b=UL/xsXN0oUVomT
	1ot4e09PIFlEDOpLzo23jaBhabDadBeAEbvSPtbLJjEm3jKzAmJc8BKmLb6ric83nyY/OkoWkkJmU
	rnowmLDnI704tahW2j4D/gEIEmWaJRXscpaCmLSlXquepPYr94YqDliHrhkvlnuA0G5TnYQ2THwUp
	hc9HqyYsmAimSStq7Dt6WynHQBK/qUALMeZD1Rc3AVpfX4M9A43wR3UIl032yQ5eR7ihdolRKvrYt
	DLoOG0ua1+v7suFWtAOIBT3JKPiakBmGKyJ/JdpxtqHc/Ab4SD/rGb7TazPuhUb/rn8vN5/Pel1pC
	oUC46Qa2Ht730MTFDriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZHb-00EHMp-20;
	Mon, 13 Nov 2023 15:55:27 +0000
Received: from mail-tycjpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:2019::700] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ZHX-00EHL8-1q
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 15:55:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HoRsJy4MYGiohMJAFF5ctbxOX1iZ0hDCCuAq1pwYFPfAMqDgtMIpEZkUsW+P5MQ3ifEhggzHNoOJQ14odOkLl8Ky70l3q2/mGq45RaNE60tn4NTwBOmbXH4JePaMq8h6m8jfDOlxoGSFufP5hSxxtn0VGwZ6Vwyfw2lWsCe3OsvckCwm5wLcnTmOD1aZE/FI6gRDVgg80n0Le9sHdvIZJmWaaJoUQvdWChwKiWbMc2wqPNphlH7/vXrQmvIPN7ImXqUhllXAcZVtm2J/JGOyH1UayI2zWfBjYl3uPUxOSfFv08fDHmboZ/i8zv7W2ePzQJh8Je/1tK4qMmSTH3dwmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFIamt/02skw88HVwyoXxCUi0cN761+56yZYYE5YGhI=;
 b=MIGbXfm43hpbVAt6cNeTXIVlKrTO3Z9WzH5nfXkSRGkW3fOPn1MkropFoxJGW0Mq2fTQYYHZ8zJh2SN4zHL1JCGXsJUkB8472f+1xPGPliW15AVxnC4QY7+g+8PFrarD+3SzqDxox9njueZ2FD9O2EyAUhX2HaUpx8rZrm7rG1iybGa4w16O595nkym+Y49mbvqQl7kNh38ohAXvVDFXP/Cra+0cqrhj/sF6NuEmzwQi7Q8sGrEaTdX1Yse+6V/gIzaO+B2nspe2BlUf9TO5StYL08kIQaEEDw4L5/LL5jCRRfKfNwJoNJwmngGoYeKjT6/7FfZIJPkWQEXz1JdsRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFIamt/02skw88HVwyoXxCUi0cN761+56yZYYE5YGhI=;
 b=Y2XvtVTBzYkJt56kT7Aboiu3m+kMpXZwzE8V3Ua8NDrR77T/2sjpV++sRuioQVhYY6AsgO6cp9Drux7EoXWa+ZMOqCRWH2Er7V/Gk7LRa1yUS1z3hHHqvgG5SghdDaAPPGR63HiaQkv6MdtkknAXIMTfJB9FVdktAAkloeC56c4=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYCPR01MB11526.jpnprd01.prod.outlook.com
 (2603:1096:400:37d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 15:55:15 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 15:55:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Topic: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfCAAahN4IADQLeAgAADMKCAAAk/gIAAADBwgAAF7QCAAAvaMA==
Date: Mon, 13 Nov 2023 15:55:15 +0000
Message-ID: <TYVPR01MB112799D6CB8A0BCD1A20F406186B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
 <TYCPR01MB11269C639CB7AA480E388360B86AEA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB1126988E1A0741B99DB8DE59C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <3a9184e1e91689757a5b680e699ce02d@walle.cc>
 <TYVPR01MB11279DF8A78E6C15CB0E6209E86B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <c0928bb386aa3d8ad8d1966fa5060efa@walle.cc>
 <TYVPR01MB112794AD059F78FEE41FAE03686B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b3a322973f8969713a732587c73ca215@walle.cc>
In-Reply-To: <b3a322973f8969713a732587c73ca215@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYCPR01MB11526:EE_
x-ms-office365-filtering-correlation-id: a269a496-c8b1-429f-c755-08dbe460ed77
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aipLulpo10y3qUM1U3/OvUMfekrXArUN3FCyRpokh5FcGWFLAxn91MTh+5qkCjKAzArDrZWAvfEkZnY17DflHTmmt+6cJGMul3X60Tl8WitEd3+9b1/V1ob+kD5tuwuO5qvFq/3NeAaz86sFBpjiRvbUA0T3JD9ye1Xa5uGdVRW+z4N9aso6jQtxaUma2phV0semZmixQPalT3szw6ZL8TwZ+VCNQl/Ed2HY5eI8vjTDXhS16GcIITNCJTKcNzgQsmP04tJp4x/JwFl6D9dwlUDfKRtZYAPxbyiZToqfj1Zi2upV6upsMbtoUlRXf8xFBvE0UFNOeHGC3Qoh7Y5sWR0BSumtQBaSuMD2JAoL0Dzj5xch69PdHCKuUofhC65vLII8rQmUA8EpC8cJfN5qh0M93qOPM89ONjNQnxBSSgTOP5Pi3QZegwhoJjWiozRLmRYUMu+3/JuxVxm0HH4uE1ZiB5ZXomvF4pGiqpf8SBBUvZtjuVC5/Mb5H1lOtEahHPJLgAx7osTAc1NVUl2QrXSHY9VkHBnj5nTM6UX2L5rCkgmSNSqV6AVY/LWZNr9akGfvN3EkmN3kQqVi81uKmZ/42I56udnpSr+ZFfHuGf4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(55016003)(54906003)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(6916009)(33656002)(38070700009)(38100700002)(122000001)(86362001)(9686003)(83380400001)(26005)(7696005)(71200400001)(6506007)(41300700001)(2906002)(478600001)(316002)(966005)(8936002)(5660300002)(4326008)(8676002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CHb//hp20OoHJ78bliTuaxcFPsm3kDgPkdB4ysuT4lz8L2xz5yA/fRwQl9/f?=
 =?us-ascii?Q?+DKFEHN8CpvQX/eibPGPfpHkXt2AviZ4JWNkcOr16u0tPTt3ZrpJ8jmplYvI?=
 =?us-ascii?Q?AkIq4b6IapGYuXyN+F9eey0F55nzd5EPkRP2PvFHd+M0cP2MtvLeI77Y8WKT?=
 =?us-ascii?Q?apy2FywkLSre4CCEbpUpj4SmHA4tL2OZMNHqkWPsTOgu/OkexaOJsqyw/XSF?=
 =?us-ascii?Q?g93ccbBrDpvQAqGMZio3uZUB/yxb2G2iJASSiD/YTcai4i8qjK9Sb1nhremp?=
 =?us-ascii?Q?rMBzCaAdYfIi7insWtyOc0x/bEDms9foFyKzqfKdCJf+fIS6iynYXyNb8wqw?=
 =?us-ascii?Q?56AzkRd39Xc1SzUEBWUNYZyv0SrTVaTN+uXXgcIPwXbf80d0yMaBW933vaTW?=
 =?us-ascii?Q?SbwhQM35EmY0s08iqN15TEc9ohJV39D0fobH4xoQ27hma/riBoQ0Kx4vKoYp?=
 =?us-ascii?Q?p4oZX+wa1ckCe5SFikyc+Kgm+7t11e1vRgw2NVH3rZ2VGvRQXcqSGR3xi7Aj?=
 =?us-ascii?Q?vQr0RMIdEGE8qIfsYTkE/lR9DLP29/4arILCL81tPccDqNsD6Eqty/3z78Jo?=
 =?us-ascii?Q?5bSva8vBkf7C+QUy4IhI8ZTNTGeRxu8dEREIO5OePeiFyrp46d0iy3ZlvbSt?=
 =?us-ascii?Q?kXu0uizs30ThT/g9+BjcTDtgbFXi4KHzYenim1zqTDVAz6pqVCKfUChs2zN9?=
 =?us-ascii?Q?Gz4BlQwLZ9wgUxe4HeFlo3QGz23KbWOu6ZD/KrDE43fvYYj6Q2mi13hKTPyb?=
 =?us-ascii?Q?17H3WyLqdlFSZua28jX1dN1MWmGubVGpTUpjI1d3iKP9fcei6+t8FqfuAihE?=
 =?us-ascii?Q?SqjcGFti+JaDW44GB4RxBDyMMC7ZD+gnwW/g4PaF5mMHoBIvObZMITPVIhbA?=
 =?us-ascii?Q?l0iZwIK9+/EhXPTGfmCeEjb9mLLTKHMq9XMXx80QaeRvpmLdKRtUd8c7OkFo?=
 =?us-ascii?Q?SMSzXnAp2b9E9BpEBR6+FdtAs404vOpd7q5Ww7kJIsbOBSmZxiaIbFmZfg5Y?=
 =?us-ascii?Q?RbCCEgMbKRRRB4Do9nqaiXCKO4sN4sHUIXVHulAR0ZDyjoE+YFvjQXLMk89v?=
 =?us-ascii?Q?kUxxpbjeHTCe7zLtE++7gCSTcjPx8MAybN7e311W0q+yHZF7+BrgJ4m4DAe3?=
 =?us-ascii?Q?h2/YJ2GlGcNnosZvippIpVuYV8GVM/88YooStAwmntkaOB0rt/4JIZp7Wpvu?=
 =?us-ascii?Q?ZCrQaNeaGbw5CcP25sJlWq6JkLmjknwxiKSQ0CLWNP470uC9owV05Gf9KYKW?=
 =?us-ascii?Q?7Uqwu04e030SgkoHxi9o/8I6P5MVkWfatGWFjbAL2+R3C40m8fjIwzP4yWfj?=
 =?us-ascii?Q?Azd1dSGOW2TdokauLWhIKq0IGyRbV4ZM/qRJra15wd00U6/BS4PkA/8aFgXy?=
 =?us-ascii?Q?H4nZqN3dTp73G3HvXo5uRIo6HmmEgj253muKDSf+xByIjJQr1sRJiNfbKnhg?=
 =?us-ascii?Q?mjpVnaYFvJK05Ycvw6PMiniGy+erRumINDB6IC3oXOaKfS/loiibx1eUxNxP?=
 =?us-ascii?Q?PFvHDH2CGJWEJMGk3ViNtYTRB8QepbhuLnV28zXotyvvf4bSrHOLjFOon+Py?=
 =?us-ascii?Q?4iehfwh0xeX42XlB5BzdjuDL5RFzSLp6bMnU1K70QQHHu6XwYH1EyxQwtqNJ?=
 =?us-ascii?Q?6A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a269a496-c8b1-429f-c755-08dbe460ed77
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 15:55:15.4906
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +bxvVTq44iIlNoQ/vpoe99siYtljUMTqFSAToEFzJzah83kjarYoLA//tuHktqLxMxJAP6fAHee24tGK3VZSeAbREHhbaoB1mHtAHG1AG2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11526
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_075523_997117_F35EEB07 
X-CRM114-Status: GOOD (  17.99  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Michael Walle,

> Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Biju,
> 
> >> > After that I will send a patch using IOFV {3,3,3,3} for both micron
> >> > and Adesto flash.
> >>
> >> Just to be clear, that will just touch the spi controller as a global
> >> default, right?
> >
> > Yes, it is in SoC specific bus controller
> > driver(driver/memory/renesas-rpc-if.c)
> >
> >> That shouldn't go through spi-nor. Otherwise I'd prefer to use fix
> >> (2) from my previous mail.
> >
> > Agreed. Fix(2) won't work as renesas-rpc-if probe which sets {3,3,3,3}
> > is called before flash detection.
> > and that will make flash detection to fail. So we cannot use fixup.
> > The only way (2) to work is to like patch[1].
> 
> Ohh I see. Makes sense. Can you ask your SoC engineers, why they choose
> the IO3 default to high? I'd guess because it's usually shared with HOLD#
> or RESET#. 

OK will ask and will update you once I get feedback.

>But that really begs the question why the Atmel flash isn't
> working with that setting. I suspect some problems during the turn around
> of the direction of IO3.
> You'd really have to probe with an oscilloscope though.

OK, but as per [1], 8.14, IO3 must be HiZ for Atmel flash.

[1] https://www.renesas.com/eu/en/document/dst/at25ql128a-datasheet?r=1608586

Cheers,
Biju


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
