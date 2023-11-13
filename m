Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA1EC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Nov 2023 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxlolrm3W5/H41GGYW7yfFaTRpji6JLy0YCtD/rCbR4=; b=HXNfQ4/XTyFtP/
	HXmk+9sJYuB+pFu0iBUPyZEGplRFF0OUWd/nNQGPcrZsRgZ24sndEAMr8Xry92ojBxCOiBx/wXnjj
	LZWup82OwaXN5jemYbmMhOYtWJcCdLx72oTTZ0hEc2D+aXGvyb5tSUkqioWKgT56BkrxLvr3GREdv
	tCugomdY3SmAvhp8hT2jWzojqTzoFKTzgZ4SKYIGgZ711lZdXWmRvWWp2uUd5JcaZxqrt/i7UGyfj
	T0TM9JRT3/AbZZ9BQHw5ig/wGulubNVIb/IoyLQj8ojsR5Rm21BTxujQuy7wW6s7Dups3P/HVAdWS
	1NCMHCswA2kI7jqlLGHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xux-00E8dN-2C;
	Mon, 13 Nov 2023 14:27:59 +0000
Received: from mail-tycjpn01on20701.outbound.protection.outlook.com ([2a01:111:f403:2019::701] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Xuq-00E8WM-2B
	for linux-mtd@lists.infradead.org;
	Mon, 13 Nov 2023 14:27:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XyfNR5c76610gftiLTiGFoENfM4R5DfSlHsn220ftNGib6ydZh3JRNXmSsqF/k1NT1MYv3hx+ZKTzbHZYq7RiS9yOdsWmSwauqqL9t8H5lixWczBvDTIWB6l24iZ1ALlGaTartUl5b1bIBwto3ovg38qkRi7lN8IbzwmIgB9yKo2TdF9p6juKlMmwkpng4l/Ca2xdyOjXG+7hzWNg5NZxRZBuesaGdSCyRNnX9a63XTPx1P12fKCvDGFejfNtbPlXjFX7RFIaDSVSQRZcVRrEZNiRP065M6FLxK1oibLWdHcemG3nsBirZPMQ57z/BXco35Fi/FQrkSqFzRF2GURWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVV5sbjBMspZD5Y2inyivWtLUIaJpYN1FH0DfU/1abY=;
 b=Cn5/ED5lEI2E/OislB3O10h+Y1BzQe6CWKMYqclI2ZlP2gJEt6M+gBrxcokzrXzp4J4641A8BT9/yYpjyzqe0G2DCH9X9DEBygBRQJySacVa6Du6tyKz+oFqOBKUlMr/55GydX/T3x3lQMi24r4LS9GiI9MIoZ127oWEtoW+ghWvXmuZYe7pwgHbT4u5aXFvh3PQofZIEJ5OPXXG/MA/WtL/t+ZS3wcwBjWxucMgvu5ZMod2QKEZbXWOyYto2NNUxAoOCHdUg8Aoqo+qBHiWZXRo3yiZMNHFkheMIILg4jEigONjaceF+g4pqo3QCSVmN2naRCc6ZXyJsebxQU0Ypw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVV5sbjBMspZD5Y2inyivWtLUIaJpYN1FH0DfU/1abY=;
 b=MG8Ua2tEl8XLQ9QjxeS/7l6pE5xfZClZcT3eU2Qs812zKuaXPRO+0Y/q783w/HLbP3RNW+pHSd4UB4wZVVAsIKdoz4mMZTKwX9PQ9qxLj5uNLsZe+OV2mFB+iLLO8KOW4WPuHBNXZiVKQhVrAIvnkpYXr47d0Wm4IiI8j01swKA=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by OS3PR01MB10107.jpnprd01.prod.outlook.com
 (2603:1096:604:1e1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Mon, 13 Nov
 2023 14:27:44 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 14:27:44 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfCAAahN4IADQLeAgAADMKA=
Date: Mon, 13 Nov 2023 14:27:43 +0000
Message-ID: <TYVPR01MB11279DF8A78E6C15CB0E6209E86B3A@TYVPR01MB11279.jpnprd01.prod.outlook.com>
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
In-Reply-To: <3a9184e1e91689757a5b680e699ce02d@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|OS3PR01MB10107:EE_
x-ms-office365-filtering-correlation-id: f7668fef-b45e-4137-b613-08dbe454b35c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kC+xUF1vOaW9I5+u1eK2Pacco75HHogGL5YTYgl6KzQzM9F7Y8xVQM8sQyPfnnsrLXjJfKt9gUqoM+8V7yAJIk/90sZVbPLlLWAK20h1lOPSvqAKx2NKwYHZgUI1j9mzcYgTfwfx5jVjNoSSsu4qww8hVRgZMVALOevPiqzuASAdCZlVV065Og/ZCVjjvid/VQ66u1oRaxZfQ1t2OetIgNF/2/xLKbr6c0rGYFlERTotejgQQn0oZgMau++ZUun6BT2DYwUx9M3Pge7JTFjhnF9peehxoJ7PUw/fQzsGkZnx0DpqczzAvZgFYWFvF/nZJrDcfhAeKlW/J07ZCl97z3dflc3msfx0yE8mz5LXrijK8K623fX3W1wZFWJE4jc2zT2c6NlwbE6TNUiQl6OJOow+NDybuS9ko6bm1rwrgtT8SEugYQx5OMgqwJF4deMn90DN+LSafn4kuyAGXucNo8Lgm6/o6bA8uI5M3A48YgLHgUm//wBWliRW1TqkVnrTxDo0jOGBoWz70kozig+hxx3+IuCIvvNNOyqda1OeOZLyzidDioEy/KLXeE+pSMZN3zF0zqGX/udWBP1LEKx5f0rf2nrv5ACLynIxtE2FnTlZDONex8/tOWSlwNFxj5Cy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(26005)(478600001)(6506007)(7696005)(9686003)(71200400001)(83380400001)(38100700002)(52536014)(4326008)(8676002)(8936002)(64756008)(66446008)(76116006)(66476007)(54906003)(66946007)(66556008)(316002)(6916009)(4001150100001)(41300700001)(5660300002)(2906002)(33656002)(55016003)(38070700009)(86362001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Bgz6/prZU0IIKC+6aAMQd6z/JDScgI4hJ9z5G4XVnlhXMCGYKI4l4oXSXUxp?=
 =?us-ascii?Q?ojjd4EY4MWSIml3XWjRXtcCtW4Qvbd4RsLsrBbMjB+rUIVWOwovs62tw/GnX?=
 =?us-ascii?Q?lZyivozSRXaEio1QlDLI0dI5jiXoZ9twMvQEKAe5QWGazF7v+ViANrZ/dfN+?=
 =?us-ascii?Q?Afl4dKr2VgLLx5ZxHm1EpmBayE7RvM26i00gIEPMFd0TIBeZTfwcMI+llL88?=
 =?us-ascii?Q?/ny9EJkB8vnXu3oQkIoV/ry1wK7FGWmQ6lrjSolmoJqv6UjXg1edAaUu9vpg?=
 =?us-ascii?Q?ThZJvfkxoyoV7HEcMCqL13MMSZQfrqy7s1tpr6zHm6iL9pZUU3VZLIQNIP+u?=
 =?us-ascii?Q?AlW3EJdRIGOSIur43Ec3UR9p/sgXBW6IxZFTT2wgKxHzS7m06/9eNQ8GVEZN?=
 =?us-ascii?Q?D9PPOQXRlhLM3vs86iow0aK6vRF71Y/iyFgcZDSkAHhdym78oMYt4VA9yr80?=
 =?us-ascii?Q?/1B0xoFnwq7uNJMGpNjDpNy4nzaTghyaYaTid1cum82UsNtxmdIO9R8uI4Iu?=
 =?us-ascii?Q?M8TnJpDP3G+bheaGmtm1mnadjnXpF3uKSOO4xCfLJ6QiEh0yFVpdJh81xLtN?=
 =?us-ascii?Q?Zhlc/i0idKer4AoU5iW1dlD069Jt8jjotBgKLHxyVdHQIpETFBw6DfDHCU95?=
 =?us-ascii?Q?6bRhYUpF+IPZPqfLXEO6w+W6PGSJyaN+vOUCnytA9yBkOk7s/hcKLYG7G+Hv?=
 =?us-ascii?Q?lZwsDdUyYhDMPpGWiADshCePVmfJxuWCtSIAL43NqcLC/8PiIMdPFicyPcwc?=
 =?us-ascii?Q?Q0o6lBPc1mjkj8FLJ20jBJNP6QIifg1o1yD00uf88yTDkNNJyJn/QFseLNsw?=
 =?us-ascii?Q?aq2u4m8b09ZEBl7qw+S8phBEbJFWsQU85tCmj9ZsSLLfdzcAo/1u2Jw66TRp?=
 =?us-ascii?Q?aC2VuL7s7SUxP1j9ZLbPXbpLzSrv6py0ZczFfSdteXKvZroOlNyT8UIjf5vf?=
 =?us-ascii?Q?ojjfubYph4s5Kg2XSi5YeIONp74htDMBECU4W2MPVIL65Jhy/l1YL1zBXusk?=
 =?us-ascii?Q?OPPbHFlJNlXUtekxZwSGJkBiBn38WyfFB4vXV87iz/3VF5M3db3tmCKKVswp?=
 =?us-ascii?Q?Mt229qeVArzL/6BDAT0NJnEczO86X3Bg29fX4EmOj8sYUdlNZRPKTYXr4De6?=
 =?us-ascii?Q?8i1pzSTIhxEmnVYnc2LUFFEtTGds6lGK60WHdubRI3YD+rgJjQ+5R6hvJArb?=
 =?us-ascii?Q?pJ+XmBNo1DXp6KlZPoXPG6vLnBjkK+dtXs2eY8kQTT/IaKxW1hLUdjkiXryc?=
 =?us-ascii?Q?vJB8uYiku9CSJ8cqQ7xLr7SnYus+j/QBgLmJUnUhjEuxuexEqqLlabUOIDcx?=
 =?us-ascii?Q?GK6QeLzh2PloJxwzHXXsADzaYf3HPM/DTJSv89AH2d9EArUeVz08ezZp7Kdd?=
 =?us-ascii?Q?aP04XplqAYp4WXSnw8+AzlHKJIDyBaL3LOvhlxvGh7wANm0qc5Y/H2GKDPRa?=
 =?us-ascii?Q?vb5uJFfha3Fwmaz3dLTiFdwgt+iyhzB4KEiVqubbhjFm259GWSRvsXKVr1g7?=
 =?us-ascii?Q?xOPkuoIidEMkDEEMKs2vJk0bd23DTRh2bZSsNAOnfX8Y4vdxGTH11wKdAolk?=
 =?us-ascii?Q?+0wu2fqrg23SEtPK1k0RKdf6eqSd1Jcbogn2FD3vhMGIg0Prmyt5AY2VvcwG?=
 =?us-ascii?Q?BA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7668fef-b45e-4137-b613-08dbe454b35c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2023 14:27:44.0191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HNRzcFefNxVOdUhvCVlkDSMD40sItlrjEP2ZQ+UmFcr+33MRgoPdu5WSVJYwlRy6AIvAshUIG1Q5WZkyWNZ5Ukxna1nEXTJlsY+fyYmRnZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_062753_161585_11BFCC2E 
X-CRM114-Status: GOOD (  39.92  )
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
> Am 2023-11-11 13:26, schrieb Biju Das:
> > Hi Michael Walle,
> >
> >> Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
> >>
> >
> >>
> >> > Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> >> >
> >> > Hi Biju,
> >> >
> >> > >> >> Thus I was saying, that we probably wont support that and the
> >> > >> >> easiest fix should be to disable this behavior for the atmel
> >> > >> >> flash (there was nv setting).
> >> > >> >
> >> > >> > The fix up is invoked only for quad mode, I believe it is safe
> >> > >> > to add fixup for micron flash As it is the one deviating from
> >> > >> > normal according to you, rather than adding fixup for generic
> >> > >> > flash like ATMEL flash(Now Renesas flash)
> >> > >>
> >> > >> Could you please try setting bit 4 in the Nonvolatile
> >> > >> Configuration Register (Table 7) and see if the problem goes away?
> >> > >
> >> > > You mean, if it works, we need to disable reset for all the
> >> > > boards, maybe at bootloader level??
> >> >
> >> > Not necessarily. First, just to confirm that it is actually the
> >> > reset circuit. You can also compare the part numbers of the flash.
> >> > There is a flash with IO3/RESET# and IO3/HOLD# (and a flash with a
> >> > dedicated reset pin).
> >>
> >> Part is MT25QU512ABB8E12-0SIT, As per the schematic, flash has a
> >> dedicated RESET# with 10K pullup connected to SoC QSPI_RESET pin.
> >>
> >> DQ0, DQ1, W#/DQ2 and DQ3 lines on the flash are connected without any
> >> pullups to the SoC QSPI0_{0..3} pins.
> >>
> >> >
> >> > If that's the case, it looks like a hardware bug on your board. You
> >> > left the reset pin floating. So you'd also not be able to boot from
> >> > the NOR flash, right?
> >>
> >> I am booting from NOR flash. BootRom code reads SPI flash and
> >> executes BL2.
> >> BL2 loads BL33 and U-boot from NOR flash. If this is the case, do you
> >> think it is a Hw bug on the board?
> >>
> >> >
> >> > > OK, I will check that. Currently I have read that register and it
> >> > > is showing a value Of 0xffbb. I need to do write operation.
> >> > > Before that how do we recover flash, if something goes wrong
> >> > > during writing for NV register?
> >> >
> >> > You should always be able to write that register from the bootloader.
> >> > Maybe also through raw commands (like sspi in uboot).
> >>
> >> Thanks for the pointer, I haven't explored the uboot path.
> >
> > I have disabled RESET# bit in the Nonvolatile Configuration Register
> > (Table 7) and borad doesn't boot any more.
> >
> > By default that bit is set.
> >
> > [    2.530291] ###### Before write Read cmd=b5 val=ff
> > [    2.530431] ###### write cmd=b1 val=ef
> > [    2.535518] ###### Read cmd=b5 val=ef
> >
> >
> > NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
> > ERROR:   BL2: Failed to load image id 3 (-2)
> > NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c
> > NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
> > ERROR:   BL2: Failed to load image id 3 (-2)
> > NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c
> >
> > What is your thoughts on this? How do we proceed now?
> 
> I guessed you fixed this? Because.. if you boot from NOR the BL2 should
> come from the NOR flash too, correct? And that is actually working.

Yes, it is working.

I updated the NV settings on micron flash on the second RZ/G2L board and 
both boards seems to be working(ie, by disabling RESET# on DQ3) and using IOFV state as hiZ.

I am planning to update NV stings on micron flash for 2 more boards (RZ/G2LC and RZ/V2L).

After that I will send a patch using IOFV {3,3,3,3} for both micron and Adesto flash.

and will request the bootloader team to disable RESET# on DQ3 using NV register.

Cheers,
Biju



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
