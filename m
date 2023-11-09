Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5908BC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24dM9525vWV5rqbUeH2UvdzNXFzbwV8VdEk36mXyG80=; b=zG3JTHU1PXZWmv
	7fcxL2NMvksETdhx5tw1g2Z0LPnkYzx3pZ6vd0DkrNkKvLqQ6/chLM5qQRMKiUUU1jOYSuIYJ/50G
	3DcrOAXHbgFEs1O2LlHY4s8LFqCQsKuFF68BM+POZveyIyAlw+Ai6qyLcw6GqrgC04ss22KrGRp/E
	TikoAVd9OZ/w0TtzKjOOAN5eNDdrE5nZU468+8hOAEIq5PFYi6DE73bFaHnNjBBZzkILm0s6akev8
	vcBjyktY6IO9qblIvvUZNwxx6jCCLdoOWc7maZRkK9H3vwQ6jy+epJzz7kXXm6tu14J93UEN4jI+V
	SxAFLV5wRCUXWaMmnQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Wh-006A0I-1w;
	Thu, 09 Nov 2023 11:48:47 +0000
Received: from mail-os0jpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:201a::700] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13Wc-0069tr-2F
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwHjiDgaOWrk4Nqnx8fVeM0WKe0v966XoFdVHdXBsOu2tK6ZrXAI8peeVQe9ufCv7F4fp7w4rPvT+ws95aeb1t1XQBzRmWlqHX/e/xAhHbtAnoobqxQQ8bJu6K7GtTHHjkvF65ASYPbXUOvBu6YgmfFbm3EtG8A7+jPmL9dvJE8r5tuzw/TdRPgfOvfdyqIzOXkgvu5pd6kMrtSSyOWoKCFg4Ui2NM1T8tx3tu1Vgr5yM3pAXrHFLHiJdFQD1+awyg8OdjlD7g6bMnrR05AbgcOKs7Btc3VB+8acR4KnL0e8xb3EX4S+pzbnKtbstzuPWfW9lPOa/iicr73XCv+jNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NnetQjXMQH6hB29lFkyG4ZrS7pKvrHNmtMZPSvCZN9g=;
 b=CDu80kfbHCxQFYhcTRStGNyA8xSFbjIZJM4ReVrpWCu3/T65rdxv9yyHclOmKUcx/COxk5oKYFnHq080oke7RXTDfQq4iefeLHTJhLp0M9pxCCXh73Sso/27F7OLvRAX79b08N2pq1I0Pc/0oCtiANmOPCzLxqdnvZOUnG1/bNHHYWYIqErvGJdnpHfT8S5v4YY55/ZVSDKUVGvsYt10NEE3uXGDe2e5/ZpEgfT/r0Uf4fLql3s2W3c0o5vOuuUongYZ5es9jn4dt4XaYeNGmEunsIYXDi7DAP0kA6PHPgbCSgxGsHRhJDto8pDFFL9e+ADFqChYgixsSol6UYrT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NnetQjXMQH6hB29lFkyG4ZrS7pKvrHNmtMZPSvCZN9g=;
 b=jwBNlCy3LKpdB2jzS8oUxzPZHGubPpp1NV2IxOG+rZfpEB7icRKfDc75xlkaotc1NfJgnns4yHBdjyu56U+kcSGtfuxQhTljlda4/1/wqTmdi0uvA2ZwHky+svt/JsX7SHrg+ntbO6zT4nNTc82qWvkWJIznCStUjIscwYivxj4=
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 (2603:1096:400:366::13) by TYWPR01MB10307.jpnprd01.prod.outlook.com
 (2603:1096:400:1d5::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 11:48:26 +0000
Received: from TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310]) by TYVPR01MB11279.jpnprd01.prod.outlook.com
 ([fe80::a19:f001:8736:9310%7]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 11:48:25 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZg
Date: Thu, 9 Nov 2023 11:48:25 +0000
Message-ID: <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
In-Reply-To: <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYVPR01MB11279:EE_|TYWPR01MB10307:EE_
x-ms-office365-filtering-correlation-id: 7cf5c1af-f3fd-4e62-3d4b-08dbe119c897
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GuXA70BaX8qCMCgIQDveASZcD6SDtho4hoqdU6Bi6f5yjMGMFpXYrzjdEXXDZ6LdKJuRCET2h75Gbkx8CB2w+szDRxI9ZZwW6XznjygaYtOuC5s6yzGNjhoUj9br57JvzaSOq5z9WuI0qSF5n4yXWahQ8BKPg+DjCPdjc1yJw9n7PZ/kAXzofltMrqdjlpgfKnXLMWMWAoAIqfimeuNCoYlstlNXwaR/kUuHm0BoyoQU401Dg7PE+Z52BGv2+eoiGqA97PYrWQS8baX0vvoIZ6M8PAixSD8sK8TmoqCO6Pk9XWS9sjULp2i5ItbA29Fp2jUtFsK42CjkDFY69KkRJdz4kR1QsM012H9zHB9IZ2U+8bX6BGEzrY8tkIkF36ObIOxy6S7nmUSoEnU9YyXDRtz6ziKceaK6Pt1VEm3Nn81VXRWvpBDhc2TmnUl/nFK+4ctffFH+eQUxtIM/o3FJnc+jZfxDkNSbUDq8u0Q5AtSWcI3AT8PFOnMx2dhTSSbMFo7wiF6X4UPnls/2CZ8bk5i0J9MnKLtdkWckcsIGs9St3xMHxOcs2orJafYxiu93tMY2qYutDAd0bHszpu3B8xCHuqHaiKfEFPgCJEvEUUs=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYVPR01MB11279.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39860400002)(136003)(366004)(230922051799003)(1800799009)(64100799003)(451199024)(186009)(316002)(122000001)(38070700009)(76116006)(83380400001)(66946007)(26005)(478600001)(6506007)(7696005)(71200400001)(966005)(66556008)(9686003)(38100700002)(66476007)(8936002)(41300700001)(55016003)(8676002)(4326008)(5660300002)(2906002)(86362001)(52536014)(66446008)(64756008)(33656002)(6916009)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NwShYPOBoKQe3NHUOcLtoMTEUCjfVE5u8EbtqdLCOq6p4RGnYm0XeOeRN4X0?=
 =?us-ascii?Q?+zMC26PuVNN3BhhtqClH2aKVllE2LiT6kabhJYw1V7+aOHAWzBp20nGXLZtq?=
 =?us-ascii?Q?lF/M3KRL/JnP8yjA99qKg7y+gUohGxhyQhO0TV8MyGtpv+W9sdSu+HjDaD3Y?=
 =?us-ascii?Q?GV9ferNHn8aXbgV18hqagk9Q/zRf/UuDhXnKI9S6P+26Sv2zYVTgF4DulUTI?=
 =?us-ascii?Q?njaRszEdjZjCeikKpHvdW5EPykHr2ZuBD27tJ1qd5+mMqsW80gcVwjCCVVBj?=
 =?us-ascii?Q?HIHU01wijl/vYZvricBjlEQqGHHvTR+S8v1kXvjbCnPy1PQExLQZhSbqsNrB?=
 =?us-ascii?Q?2HCkpZz6ZG2ZW2xw8hXJ1nHCdbHsBmu+hghpxEiG9HuEMSfr3Zv0wPUEl1vB?=
 =?us-ascii?Q?gmT1mHkwTdhL0iwRKUqvHTuvobSkpAHYXTgIASdQJWpY63Xh6m7xiP3wEwYq?=
 =?us-ascii?Q?/GJQY9Xqf0Y6JEPzM5awxDMcWqcYyhsSPR9mUaVcT6/EJODm0sdJbc0IdeEs?=
 =?us-ascii?Q?XirZnYdMED1VD2A4aWWkVwF2PEuAAnb87EPTYA4Z2LRxb3/jl1pHyH9VTXvV?=
 =?us-ascii?Q?j2sjz0Vu0Qwt3dpW4Pcp4+PanN3OJOB8pfYn10bM1uTAjXwI0k4t2Gb18OBo?=
 =?us-ascii?Q?ciqJX1mDlgJ6hlfxc+PWAvJDp1SWVxH6keKttDRa3CII3jevDzENavHxKCkD?=
 =?us-ascii?Q?03wpC/xbDZsYPq7boBgb2x3IY277n++e69h+bl8s6W14d1W3v9r80sLODq4k?=
 =?us-ascii?Q?2q05HKLy8Szh7rfYO0n8y3vbCt3sywM8Ar91uiWQwKd9aNxGbGwd/WJPwby/?=
 =?us-ascii?Q?00DB2cQPMb30lyDa8t9qZx6oFHMVQWuVjbgXkv1oeHeSCXERA7KqW58fkDE/?=
 =?us-ascii?Q?st6gr3U1h/xG0J8WWzkbPFuRRFyVKSJNjmeer50VJVrIh9SjMOR4felHOeaE?=
 =?us-ascii?Q?d9x1TU6br69TiXGM5dsBQfUua08vpziv53e5S85klLmRbSs4f/uKMn9cKHNb?=
 =?us-ascii?Q?vQf5IQE+jvJ/xu/KEhH7fOR914PSkEAOOZriiqoySC01ygui0Fm1Wg07asgP?=
 =?us-ascii?Q?Q7bDTquTt+SlMCvkKNkUcJHXHZXI+Ws4Zif0/Uo97WtSvv1+KHTxtn5cUexX?=
 =?us-ascii?Q?M0fRWr8hfkJR+LNpE4DolYT6XCzImViWVQv2doigdveoYLcdabIKQLSHYds8?=
 =?us-ascii?Q?AgkUgAI35VAleJq0VtKkL2540DUInS6ZG/0SPXb7svhgEK/AgOCl5XT4lG2m?=
 =?us-ascii?Q?TTnTQRCWt55GSF87KCZSL/e9jylj/qmiYmqPMzpmFb9apdl4dYTdt0hjZdui?=
 =?us-ascii?Q?5laGoI7ORCHeDhvi3wV8YUv8y+Mp/piJpadSDM+mB2zQFvuRgahpFU0uu9i+?=
 =?us-ascii?Q?o2qKgOHBFO+TsuP5v2P37cAHvhaMVwvmWWD1Sn/0NAW5taEsOZWc9hqnAIfg?=
 =?us-ascii?Q?eEzr76hg2qK5G0zC/o/T03IwOEsERJEklldtCTOknoBc5EzwiiH2Ec6VtLNW?=
 =?us-ascii?Q?ErhWbuZjeZbVzcN35AEv3KnJ1pluw5QlrA0rNTOtPSbf3raNGXRh2mHloE3L?=
 =?us-ascii?Q?G9OGJE0IcDKhojvAvMV7vjdz7r4giAcyBxtX5Ur+1sp/HXPkPjkHoQXD+zvj?=
 =?us-ascii?Q?nw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB11279.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf5c1af-f3fd-4e62-3d4b-08dbe119c897
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 11:48:25.8681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4aZWIYJJ7qXDa1hoarSyhZPXdPcN7LRYFaZv8HmzwAxaNeYxPoC9s8+wZDD2CGJlkg4/K9rxNoqnhXKq3m4BFnEQhlJ1XuDLGyt6iCsaTLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10307
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_034843_558856_BA40539B 
X-CRM114-Status: GOOD (  39.16  )
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
> >> > As per section 8.14 on the AT25QL128A hardware manual[1],
> >> > IO0..IO3 must be set to Hi-Z state for this flash for fast read
> >> > quad IO.
> >> > Snippet from HW manual section 8.14:
> >> > The upper nibble of the Mode(M7-4) controls the length of the next
> >> > FAST Read Quad IO instruction through the inclusion or exclusion of
> >> > the first byte instruction code. The lower nibble bits of the
> >> > Mode(M3-0) are don't care. However, the IO pins must be
> >> > high-impedance before the falling edge of the first data out clock.
> >>
> >> I'm still not sure what you are trying to fix here. For any quad I/O
> >> mode, the pins of the controller must be in hiZ during the data phase
> >> on a read operation. Otherwise the flash couldn't send any data,
> >> there would be two drivers for one signal. So being in hiZ state
> >> should be the default and shouldn't depend on any connected flash.
> >
> > OK, I will make hiZ state as the default.
> 
> I still think this iofv setting is the wrong approach, though. Do you have
> a link to the spi controller datasheet where I can look up what the
> controller is doing.

Please find the below link.

https://www.renesas.com/eu/en/products/microcontrollers-microprocessors/rz-mpus/rzg2l-general-purpose-microprocessors-dual-core-arm-cortex-a55-12-ghz-cpus-and-single-core-arm-cortex-m33#overview

> 
> This seem to be a general problem with what we are sending during the
> command phase and I'm curious why there wasn't more reports on non working
> micron flashes for now.

1-bit mode, we don't have any issue. Once we switch to 4-bit mode we have this
issue with micron MT25QU512A flash and we need to set the correct IO fixed values.

Maybe others are testing with 1-bit mode and not testing the full capability of the flash.

> 
> >> You've mentioned the micron flash which needs a '1' on its hold/reset
> >> pin.
> >> I would have expected a fixup for this flash, not for the flash which
> >> behaves normal.
> >
> > I will drop fixup for Renesas AT25QL128A  and will add fixup for
> > micron flash.
> 
> btw, what will happen if you always use the {3,3,3,1} setting? I guess the
> atmel flash will also work? because HiZ should mean "don't care"
> from
> the point of view of the flash.

With atmel flash if use {3,3,3,1} setting, I get below error.

root@smarc-rzg2ul:/cip-test-scripts# ./rpcif_t_001.sh
[  144.078854] spi-nor spi1.0: spi-nor-generic (16384 Kbytes)
[  144.120468] 2 fixed-partitions partitions found on MTD device spi1.0
[  144.126982] Creating 2 MTD partitions on "spi1.0":
[  144.133004] 0x000000000000-0x000000200000 : "boot"
[  144.141879] 0x000000200000-0x000001000000 : "user"
[  358.476963] jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdfe084: read 0x336ebbbc, calculated 0x961503c7
[  358.488509] jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdfd118: read 0xff6a5df6, calculated 0x786a5df6
[  358.502963] jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdfa2d4: read 0x1fc99948, calculated 0xbab22133
[  358.515357] jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdf9368: read 0xffd184a7, calculated 0x3d184a7
[  358.528175] jffs2: notice: (230) read_dnode: node CRC failed on dnode at 0xdf6524: read 0x5deb2462, calculated 0xf8909c19


> 
> >
> > With iofv settings {3,3,3,3} (all pins on Hi-Z state) with Micron
> > flash
> > ----------------------------------------------------------------------
> > -
> >
> > ./rpcif_t_001.sh
> > [   37.950986] spi-nor spi1.0: unrecognized JEDEC id bytes: ff ff ff ff
> > ff ff
> 
> As mentioned earlier, I suspect that HiZ on IO3 means low and the flash
> will be in reset. Could you perhaps verify that by probing IO3?
> I know that other flashes will *either* support RESET#/HOLD# or quad mode.
> Thus I was saying, that we probably wont support that and the easiest fix
> should be to disable this behavior for the atmel flash (there was nv
> setting).

The fix up is invoked only for quad mode, I believe it is safe to add fixup for micron flash
As it is the one deviating from normal according to you, rather than adding fixup
for generic flash like ATMEL flash(Now Renesas flash)

Cheers,
Biju


> 
> I guess, the correct fix would be to somehow add support to control
> IO1-IO3 during the (single bit) command phase.



> 
> 
> >
> > EXIT|FAIL|rpcif_t_001.sh|[00:00:01] Failed to detect mt25qu512a
> > flash!||
> >
> >
> > With iofv settings {3,3,3,1} with Micron falsh
> > ---------------------------------------------
> > root@smarc-rzg2l:/cip-test-scripts# ./rpcif_t_001.sh
> > [   26.500035] spi-nor spi1.0: mt25qu512a (65536 Kbytes)
> > [   26.533995] 2 fixed-partitions partitions found on MTD device spi1.0
> > [   26.540410] Creating 2 MTD partitions on "spi1.0":
> > [   26.545239] 0x000000000000-0x000002000000 : "boot"
> > [   26.554381] 0x000002000000-0x000004000000 : "user"
> >
> > EXIT|PASS|rpcif_t_001.sh|[00:03:01] ||
> >
> > Cheers,
> > Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
