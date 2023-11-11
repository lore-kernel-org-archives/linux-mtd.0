Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3534C4332F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Nov 2023 13:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/LEuIc80fozl3gtp8ScniY5SfHSOIdSK1OxeR5vA2E=; b=hEdnDoQVJuejrl
	FSb1eEt665Ti6B34ta5gtcnv2jAlminkCpUdbCSbtLUq1NgDNBW4hMus59E36Q4dTaIzV4GNxRYDp
	3LgMHt5acZsODMEraSls2QLIc9es5w75Cxhvpyw/i3LT53I9OYX4L+KJSvdvuG8rA1YwAjv8HV2sZ
	/Z6LDYlR7flc73VLkr//N6vPP6DAgMGLNGNDY05oYNTTa1/ob3Ax1ZAFN7Sis0x2aey8pt1MQX1hH
	DjmrPmLbr9Ol47/n2t1YY8+m3nANKMLMBicmc1GhORatDIxLb8I1iSkB1DTiPQ4Nv1+tcXpN5zczn
	gOq8Kn+C0Ngf7KY80+qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1njG-00B2XI-0Y;
	Sat, 11 Nov 2023 13:08:50 +0000
Received: from mail-tycjpn01on20701.outbound.protection.outlook.com ([2a01:111:f403:2019::701] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1njB-00B2WL-0O
	for linux-mtd@lists.infradead.org;
	Sat, 11 Nov 2023 13:08:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOiKESb7b2lrx/T85n9tgEftxmclwYpyKa62bF4t4owf9BhuMiVI/hREeh8BHOzYDm2/LRMDs5jDf/kg1jaESKPdQ83kOOTBsOVcg2/QVG/7RlqDGoU1u2f9qupOiJj31WMvuIka8yj5PxY9Ke87Nx0k9u5iMLQfn5Ut66vgIhs1pPtkOUWdKim5sfOC3SlSrfTkEhzjKeukihbcCaCYE5h7D6zW9nY5acWs7EH5BLk04QHrWb5t85eru5HEvrrtY7XD2STV1iFGCz5v02r0wSGBPPwB28KaGOxuT+wfX1DcCFTZ6FhLbYNGN6oAgzEDJDv4/ZcXVG0WvkUg6bR7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DC44pzkJeQOhXiobyq5ZLVMif+D2dhkWMNkbpjn0hro=;
 b=iTjQBcymcAUmzQAdlCfTeGMgOmJ7zo0fY0qRSB8mB41T5rCtdzDj/4/NvyZEA9lbdxsXiYczi1k63+Oa9T655x0Ne7O90AVEabGCypEXyg7ylhD2ojvoxV9YYCtCuIXxStyVwIDFiGYhFHrajz+taWsXz8DWRdrlrlj1XLpu9/jKjGJGyqlD464pApJss1FZgZ6G86T6GE8XU2gAata1HUsJ9hVFjhhNIf/89Bbgx1wE/CV0xUqQRjylraf6u7RDAKs3Xh75NmSA3s/P7dyxA2VMLHtE6XSrBi9mFcvGvASimEUvqmna+y0+Ot1VIiRD0cB0UcKJrlg7B/rqCfyXhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DC44pzkJeQOhXiobyq5ZLVMif+D2dhkWMNkbpjn0hro=;
 b=Jtuo03VPZlQE762FYZF99GJFBJBv/4nxs/1+0yspkmpjPa9fvibc3sy/YFvq3I6ep07SXSgvrLb5fX1WBOgyvwR5EG42mx9Cwp7eGWYWGV2BY+HpqvV8YyGp6rXW9JlANmLt9oNofHNdfis/pOK2u5hFqBiQjtWCq9sVvMLEGmE=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB9343.jpnprd01.prod.outlook.com
 (2603:1096:400:1a0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.26; Sat, 11 Nov
 2023 13:08:25 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::3a3a:7ecd:de5d:e8b8%7]) with mapi id 15.20.6977.022; Sat, 11 Nov 2023
 13:08:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Mark Brown <broonie@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>, "linux-spi@vger.kernel.org"
	<linux-spi@vger.kernel.org>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Topic: [PATCH RFC 0/4] Add set_iofv() callback
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAAPLfCAAahN4IAACX1w
Date: Sat, 11 Nov 2023 13:08:25 +0000
Message-ID: <TYCPR01MB11269656C87D8556DDC564BAE86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
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
In-Reply-To: <TYCPR01MB1126988E1A0741B99DB8DE59C86ADA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB9343:EE_
x-ms-office365-filtering-correlation-id: f319a50e-fddf-4e2c-464d-08dbe2b749fe
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lZli3wzJI7IoocTwLh6UrSLcdE11VjsRujgXG6c4mgiIONjn5SHb4T1A1iLrKkUxw2B9oFNTJg4zWroEKAvRkGeo8AZCNPDoE3NwqvxiQDA6FEbn+FtPVPhAe5g9TChnrt12VDE/qXIxYnEyt4PW38dfNCtlR4xbZ/BKZOTU6vRnqXyGL+OqP+5WM6PzjwU5ugohj7MAdZfHZ+Lud3MB7BXygpr1oufC9o64TJmcJlObFOuCD+bqFDqFOAZNN+ASHs7BoOcIeTHsXwyHki0pZgceTRfqdd8Xfk3jmjj3FK6bYOOQKuOQPK8jV5U/vOBDgULDL2RQE+URbj7yjhqkGks7XtuoQb9lMyG+Qbunszvh8Q3JkS4QqSXseF/YjcC9RdLgJu4DwWGL5UfZiVGnQS1Ra5qgPWvQFijSz5GmwfUbxwiqJa3A0ctXSIlHEfazTisaT82rPQ5ExulGavEygwl0XNpTC2j1vv+L0ub8yACfvfUq8qD8G+PN828OCyJ8Frynge22wE4nwrpJX0nndPLw++JuiYF4VhuGY+2DACJ2qXb5TTgIUl0IVgAkE5R7746d/XOVFc+NI98MRBJ0UAiHVm7Eh2DccI97Xh83Xwc5UG8yBBmkmE3a7otOOTMR4ovMEZd2yV8a2UiQL23Law==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(2906002)(52536014)(122000001)(8936002)(8676002)(4326008)(5660300002)(83380400001)(33656002)(41300700001)(86362001)(966005)(478600001)(6506007)(7696005)(55016003)(71200400001)(26005)(38070700009)(2940100002)(9686003)(316002)(110136005)(38100700002)(66946007)(66556008)(54906003)(64756008)(66446008)(66476007)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UrTPePhGiEekqCL+rG5LCCE3sJDQIPVbhjhx9kgF/VJtsgPIKBBwxeFLxFd4?=
 =?us-ascii?Q?kQc+cvobPu6Dk+AtRRZZ2wCDVKrIiCojgFJUP1h80uDNaRKJe6Y05rJDlzsR?=
 =?us-ascii?Q?GqYzY6c3ywz3LUgPdn9hudUu4Jw+jg6+ZLh7OIT7CeKem/ztOx9AyjiN0EQD?=
 =?us-ascii?Q?GCawdCnP36Vk2PdE7mHeVEIqnxuzSfoePI9svgOeO/A6gdqCpWDutJUtcsda?=
 =?us-ascii?Q?r/VJd664dDqtJPvgMEySv4Z7UohVLb7y4QfFNgJ/tWMcnxU7WfTo3vPkJo0W?=
 =?us-ascii?Q?7G1yBY8SmhHdZQw/znX+H+qJMkqvq2pSSDEfx3V9eSuIIrWJi/RjHU0fh8mA?=
 =?us-ascii?Q?mV0akjWOpZB57yTT8/IEi6Xh+iVqBo1llUxuJt+wpt1md2Dh8mQKassLP2+L?=
 =?us-ascii?Q?+Tmpmm6htJUp50o6PPhowtkwnHA3jID291w44QfCkAGC2WbCSgqh/uxh3kPH?=
 =?us-ascii?Q?Gf2S+WoWvzAxDCDu+87B4uURKt9YwYUNKxLDHWnZRaLAhvVcvWEB2n89T8DO?=
 =?us-ascii?Q?Bezh77BsKEE3KF/vEQ+/ISaK3jkw9NbjUxoHWWtQszVPVfLuMcDpHaK+fgkK?=
 =?us-ascii?Q?x+1Q5qnyUDo8pY1fyaZiiDwzy1VlpS5Iy7OT3hSldLLOozCqdFhIY8ql1p2o?=
 =?us-ascii?Q?xAt0MmuJ/b/5OpBN4HI28C5f/ZsLSOCvjiBD1InW8/ZFq3Uh+eQN5FmF0U1k?=
 =?us-ascii?Q?cR5SMaNLBhJrJ33emkgWeVC0v57K2zXQ9zleDGoUI3au0YgPvRx3gpjHjnEq?=
 =?us-ascii?Q?SGkz1zP5bj9Z8L5cv1gLABHh9dDSgsSqDFxXUoWbr0+PbMDwA5lcOIjkpMvq?=
 =?us-ascii?Q?kHby4U6pDSGIjgcOE5/xRcU2m0pjfTLj1c0kVRsFXMddP6efbP77uAHnvB79?=
 =?us-ascii?Q?8DwqDivXIkBMxLVpCtn/LB7DJX4D8TpGVEAUH61AFJyJTJj2ZKsC0QQKOEjL?=
 =?us-ascii?Q?3xDS28L+TCh4cfuQxXppmgiN46ekuPbae3nRVnBHd8KjmDoSTwQFj5GwU/T3?=
 =?us-ascii?Q?4Lf54xgewZjtBcgYbxG4L0napRSsNZXvauiXvawb/47TEYhtFGdHFa33KDok?=
 =?us-ascii?Q?IaaNdS21m2xQmPmcFWONFi2r/FkaL4hP38VVkzSpA1eaaNHoKdbzJQMvHUZU?=
 =?us-ascii?Q?b9ioeZlu3EvAeeuHE7F5A9dP+vxnkl114MK9j9fde75LDQhWPIQ/N+iLDphU?=
 =?us-ascii?Q?uELevO6DmDL8LomxzkTiG/Mxz+G2rsmRim5GKVyP1XtzOET9pDa9Un7UMAYp?=
 =?us-ascii?Q?Ilx1iZfVdJQjQydkAuRoI7ePsFysEOR9jqpRVIMbohPEjvefIBv5TEOcLbHI?=
 =?us-ascii?Q?pQ2O5V+XK2IuwE0Ht5yJCoqKi/5JJwBoKTknJFhKxSmZx41XI1RGbH/A3/g2?=
 =?us-ascii?Q?jfuRZ6YcvwlT42pPwiZNaJF/MiwarPHeUmsB+W+NlTlfhOY+fr2XfMvfDmqB?=
 =?us-ascii?Q?3Wwm/dnqDHntsMX7803V7DwFgghAWlASy4jqao/SHJ8xh/K9yNOCKHQUdHqf?=
 =?us-ascii?Q?JgI69ycga55M5el2hseK8q3kEEtpt742D4Do2WFO44QFdnDsTAltp3wVJ/os?=
 =?us-ascii?Q?4k03N9fyUF7RRTlTgTd1GTit8eWfJ9XyQeDiyY4l28g2vKllg5028KfDYKDU?=
 =?us-ascii?Q?0A=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f319a50e-fddf-4e2c-464d-08dbe2b749fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2023 13:08:25.0830
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Evut1Yue6ZtqkmEeuSlzezVL/6ofY2yWTiCnli+HBO9SkG0tZJY9n5WVA+uvUmlx9kBsYmUov7d/116OIZxq7Ps/2H7UBMvRqyTtfQMmELs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9343
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_050845_661448_EAB06D8C 
X-CRM114-Status: GOOD (  41.28  )
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

> Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
> 
> Hi Michael Walle,
> 
> > Subject: RE: [PATCH RFC 0/4] Add set_iofv() callback
> >
> 
> >
> > > Subject: Re: [PATCH RFC 0/4] Add set_iofv() callback
> > >
> > > Hi Biju,
> > >
> > > >> >> Thus I was saying, that we probably wont support that and the
> > > >> >> easiest fix should be to disable this behavior for the atmel
> > > >> >> flash (there was nv setting).
> > > >> >
> > > >> > The fix up is invoked only for quad mode, I believe it is safe
> > > >> > to add fixup for micron flash As it is the one deviating from
> > > >> > normal according to you, rather than adding fixup for generic
> > > >> > flash like ATMEL flash(Now Renesas flash)
> > > >>
> > > >> Could you please try setting bit 4 in the Nonvolatile
> > > >> Configuration Register (Table 7) and see if the problem goes away?
> > > >
> > > > You mean, if it works, we need to disable reset for all the
> > > > boards, maybe at bootloader level??
> > >
> > > Not necessarily. First, just to confirm that it is actually the
> > > reset circuit. You can also compare the part numbers of the flash.
> > > There is a flash with IO3/RESET# and IO3/HOLD# (and a flash with a
> > > dedicated reset pin).
> >
> > Part is MT25QU512ABB8E12-0SIT, As per the schematic, flash has a
> > dedicated RESET# with 10K pullup connected to SoC QSPI_RESET pin.
> >
> > DQ0, DQ1, W#/DQ2 and DQ3 lines on the flash are connected without any
> > pullups to the SoC QSPI0_{0..3} pins.
> >
> > >
> > > If that's the case, it looks like a hardware bug on your board. You
> > > left the reset pin floating. So you'd also not be able to boot from
> > > the NOR flash, right?
> >
> > I am booting from NOR flash. BootRom code reads SPI flash and executes
> > BL2.
> > BL2 loads BL33 and U-boot from NOR flash. If this is the case, do you
> > think it is a Hw bug on the board?
> >
> > >
> > > > OK, I will check that. Currently I have read that register and it
> > > > is showing a value Of 0xffbb. I need to do write operation. Before
> > > > that how do we recover flash, if something goes wrong during
> > > > writing for NV register?
> > >
> > > You should always be able to write that register from the bootloader.
> > > Maybe also through raw commands (like sspi in uboot).
> >
> > Thanks for the pointer, I haven't explored the uboot path.
> 
> I have disabled RESET# bit in the Nonvolatile Configuration Register
> (Table 7) and borad doesn't boot any more.
> 
> By default that bit is set.
> 
> [    2.530291] ###### Before write Read cmd=b5 val=ff
> [    2.530431] ###### write cmd=b1 val=ef
> [    2.535518] ###### Read cmd=b5 val=ef
> 
> 
> NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
> ERROR:   BL2: Failed to load image id 3 (-2)
> NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c
> NOTICE:  BL2: Built : 14:59:28, Nov 10 2023
> ERROR:   BL2: Failed to load image id 3 (-2)
> NOTICE:  BL2: v2.9(release):v2.5/rzg2l-1.00-3883-gc314a391c
> 
> What is your thoughts on this? How do we proceed now?
> 

Just to add I have recovered the spi flash by booting with eMMC boot and
Setting bit4 in Table 7. Now I can boot with SPI flash.

[    2.521879] ###### Before write Read cmd=b5 val=ef
[    2.522163] ###### write cmd=b1 val=ff
[    2.527350] ###### Read cmd=b5 val=ff

How do we proceed now? Krysztof/Geert, what is your thoughts?

Shall we set default values as Hi-Z for IO FV in bus driver and

As Micron flash is behaving differently shall we use SoC register(IOFV) to fix the
4-bit tx mode like patch [1] or you prefer [2]? 

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20230830145835.296690-1-biju.das.jz@bp.renesas.com/


[2]
https://lore.kernel.org/linux-renesas-soc/dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc/T/#t


Please find the sample code for setting NV Config register for micron flash

+#define MICRON_ST_RD_NV_OP(buf)                                                \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDNV, 0),                   \
+                  SPI_MEM_OP_NO_ADDR,                                  \
+                  SPI_MEM_OP_NO_DUMMY,                                 \
+                  SPI_MEM_OP_DATA_IN(2, buf, 0))
+
+#define MICRON_ST_WR_NV_OP(naddr, addr, ndata, buf)            \
+       SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRNV, 0),           \
+                  SPI_MEM_OP_NO_ADDR,                  \
+                  SPI_MEM_OP_NO_DUMMY,                                 \
+                  SPI_MEM_OP_DATA_OUT(2, buf, 0))
+
+#define SPINOR_OP_RDNV         0xb5    /* Read flag status register */
+#define SPINOR_OP_WRNV         0xb1    /* Write flag status register */


int spi_nor_scan(struct spi_nor *nor, const char *name,
                 const struct spi_nor_hwcaps *hwcaps)
 {
@@ -3455,6 +3470,8 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
        struct mtd_info *mtd = &nor->mtd;
        int ret;
        int i;
+       struct spi_mem_op op;
+
 
        ret = spi_nor_check(nor);
        if (ret)
@@ -3479,6 +3496,23 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
        if (!nor->bouncebuf)
                return -ENOMEM;
 
+       nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+       op = (struct spi_mem_op) MICRON_ST_RD_NV_OP(nor->bouncebuf);
+       spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+       pr_err("###### Before write Read cmd=%x val=%x",SPINOR_OP_RDNV, nor->bouncebuf[0]);
+
+       nor->bouncebuf[0] = 0xff;
+       nor->bouncebuf[1] = 0xff;
+       op = (struct spi_mem_op)
+               MICRON_ST_WR_NV_OP(0, SPINOR_OP_WRNV, 2, nor->bouncebuf);
+       ret = spi_nor_write_any_volatile_reg(nor, &op, nor->reg_proto);
+
+       pr_err("###### write cmd=%x val=%x", SPINOR_OP_WRNV, nor->bouncebuf[0]);
+
+       op = (struct spi_mem_op) MICRON_ST_RD_NV_OP(nor->bouncebuf);
+       spi_nor_read_any_reg(nor, &op, nor->reg_proto);
+       pr_err("###### Read cmd=%x val=%x",SPINOR_OP_RDNV, nor->bouncebuf[0]);
+
        ret = spi_nor_hw_reset(nor);
        if (ret)
                return ret;

Cheers,
Biju


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
