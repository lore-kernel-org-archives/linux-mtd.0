Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 916D8C4332F
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Nov 2023 20:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQwnOoi0lOrN93RiXx5Ha+JJ71kfIfPb4H9a5oveL0w=; b=dBiDmZqD39Njh9
	CeoCapv+YBxtMfwQ3/VSOBYcZ0TjK2fM+lee/BPhtwURfEigJOQDGunOG/nLjWh/Hv7nZP84VOomv
	iFsq8tpSG5zZ1Tme17Lfj8MlWXnIrMnmdmuZEzBXbb7GKP2ETXdaug0Q0qw3eIaz2K5PcdGHUtEJr
	l7j00MeljXZRl10BbDFd5WlsCvrm3Ld7HeSexrvwcnYzrDWiGnDx+9WaTblXbpN9r5tN2e0XOOv55
	BhmUTe6UvIH/x/lZqwTQotDp11sOEWX3ZMnd/1xRYEJiDEVsBP1UTguP5Yz7KwgLaGzns+rewJr3i
	luMgIs8R4Ws0JtxcED9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2H0W-00Ckxz-2E;
	Sun, 12 Nov 2023 20:24:36 +0000
Received: from mail-tycjpn01on20700.outbound.protection.outlook.com ([2a01:111:f403:2019::700] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2H0S-00Ckxa-1q
	for linux-mtd@lists.infradead.org;
	Sun, 12 Nov 2023 20:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZQTRo7PlKbdEjySgKR4P5UbDAEzhPhIHLk6nNwuezwVDx/LvXOj7MkhYcH+FkncANQD/s6fR4pYQnRQwoQfjaMM7qGxVqAykoiWGv4l6k6Ig/tmCfiXpF8KfWcpSFd1CaCRkjb1qFC1G287n3Vihx9OLI7zsHhrQJh6n3ttpijC5DX+GfRC5AB8FC/tFXdaXJRWhlp/2Y79qvYo53eaXN7qRGCHnypI+OEWX4h7HYfCp3ksO54Gn00nqgZrPxwXS0F/8grthDdIgj+QmMYks+Z8K/B3RPcHqco5VcWECQBlEzkS1ZUL67ZNuItYVKgNjBTm4xBbdU/Awb02uBc7Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHo+uBk9wtKWMvJ0XEUc7K89nXNeI1zgPlLLDCdDbtM=;
 b=Njq2ZAkGeNSyvc6Fl5MEjLrVfMJl1YYgIZDzhbnFVTv5j7GdIIXM2Un3Ktksp5gFglJNZnmv3jMtQsqPRmltyGMZcYdbL6XIKr5t13bSkaVDMvjrEPyzB3t4GL4NKoxo/CyI8tFIYTKu0+J4uiAhw3cxPqHfxFg44t8caTs3ZEqCkLPUM04BM4MG5Iw7+1VlpuNEBkU1JScNx2/xi1ugXGC3key68tfagfiJq/Sb5xUaj7R7oaqlvJYbd+t2/DWP5uLMFdgbJLF54SOecYE4dS0EohpvUwV73AnNK6/PdL29dkf/qBpbRNuNi//rpdsVwim7FA5WbIjUtKlj9FmlxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHo+uBk9wtKWMvJ0XEUc7K89nXNeI1zgPlLLDCdDbtM=;
 b=e1b0Ur71da4fF3nudnCHYpkzxZePvi7SHr9HtEZoJeMAWMfuuMQlPKHx0xLr9KACLNtq7lyUnQJwuRpDD+yB3rRAnYAORp0y/Zx7cUOauCaqVy/sbpZ2aIJo6IkA4px995gc4aXuTJtgr0kKtGIuhm4FVSVbW6lhhg/6KU0FDHA=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB11127.jpnprd01.prod.outlook.com
 (2603:1096:400:362::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Sun, 12 Nov
 2023 20:24:18 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::eca:f2fa:fbbc:fa2f]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::eca:f2fa:fbbc:fa2f%4]) with mapi id 15.20.6977.029; Sun, 12 Nov 2023
 20:24:16 +0000
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
Thread-Index: AQHaEmauppBiBpT9j0G5TfZv3VEsALBxsd6AgAAQEACAAA2/AIAAClZggAAVHICAAACZ0IABZ+IAgAPEISA=
Date: Sun, 12 Nov 2023 20:24:16 +0000
Message-ID: <TYCPR01MB1126990A40D40D8786CABFAAA86ACA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231108171149.258656-1-biju.das.jz@bp.renesas.com>
 <877590a5e3f8c32ec0a032385049a563@walle.cc>
 <TYVPR01MB11279E535835F2998335F770A86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <b9831be88008b9f9960d1d79cd0e5a3a@walle.cc>
 <TYVPR01MB11279575676708170F3B3270D86AFA@TYVPR01MB11279.jpnprd01.prod.outlook.com>
 <f88759f98e865e68da5481fcbb969c47@walle.cc>
 <TYCPR01MB112699263B2EC0EC229746D3786AFA@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
In-Reply-To: <dcfa2cab21fc85bb9b2b0c1ceb754a1a@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB11127:EE_
x-ms-office365-filtering-correlation-id: 677f2c04-2ca1-44df-e403-08dbe3bd5808
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: edvDeQ8nqbN2WzuXgY1kWGEm/TemtraQbkdpqBZpbKYdXOJ0Jj5ICfFuDvvrOTdTsqlY/VjUARXEnQBD+TJmLIHE5HmBK2E5HsBZvf3zBvkF2VoJL6IM4vK1tHeN6aJC5qEdLOucKb4k1pqdyVlCdFxIQlN1tnYH/u0z68Lkooltq2t9WP1kNoqTiqeKpfvJI72mrp2Y9KpGFA97Tf7FH04s59alvWpNZ6SHPlFpnFCQdtn6JBr8vBRJmfA4iGS6r6J+G9SWmI1BR4yWStHe3Pj3cJeaJ7+M0U+4wMzrRl34PPtWFbysKMkAq81QvPDPiAIyFv7gFWFHcP6essrwHpo5ksACZHpjkTEotYVXtE3Rirv1B1g9McQPnn+8nPdcxMbUhSghKJigmA7X9RMIQewoV0kMjZ9zdC3aPxNWZgi2PTZM2E22GoQa/QQrioEPECZZJRFXsbpST3EA7iTeoTc8AIvp7muzpnN+cz2fJMo4rox0MKyp8feUNwC36Xgpjyd1WGYkNqiBceJbr8MKFauKiHKnW9mM6eIOQWeWKrO5qKkVKf7wGyOsv3xglk2sTJc4ZTJc1yIHvtpkVw1ZNlUr3FJLl721tmswbqQjHwZj3C32SZJYTanacU+6M7Ui
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(396003)(136003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(4326008)(8936002)(8676002)(122000001)(52536014)(38100700002)(66946007)(71200400001)(76116006)(6506007)(7696005)(66556008)(66476007)(66446008)(64756008)(54906003)(478600001)(83380400001)(9686003)(6916009)(316002)(33656002)(41300700001)(5660300002)(86362001)(2906002)(38070700009)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o112tn6lqhqWfX5Y4WvQ70ioYkYayuzVo99fnAxN604FQ90oGMPD3TiAUG8x?=
 =?us-ascii?Q?WpDlCWfCqflL5+uZcT9upBpm/5MV09DekMZgfgKNkmjiod7/ooi41gtN606I?=
 =?us-ascii?Q?MmF6TtdUJwVV+WH4YN9Mvk87OdiqpaNZCNLihq9LDMt3xDxRMOluTXR6+Vco?=
 =?us-ascii?Q?RtHKvKoWhiLkiM1oyWX40TTVOivYTyTy29zwoQ7AvE3DP4Qbrd80gBQZDURN?=
 =?us-ascii?Q?rGfE6hqvNQWtXgr+XAAv/6LBnbN547wRGivzqaIqtqxwvWpsbYB8S1S8VYLJ?=
 =?us-ascii?Q?QycoLPrlGPkKYqzmD8ebnhocjgsQlSof12yBDq2Szavn8HAzeDW68dmWb1FO?=
 =?us-ascii?Q?EFjJZHL810fzx3QTGME5I99ntlyA5+sWsOgkRkZJIrckI3k8y47+fJ3RC2Zx?=
 =?us-ascii?Q?LTSs5V1imNDq8y3JYN6/LtacJoI2Gtgf67tYzC+XeoX92AFOiWHHsojxXTjG?=
 =?us-ascii?Q?OnbNE8bWze3E4HWupCj11U3p9Bpd0f9wehs0h+QHqxWahaxLGqvJw5OMn38c?=
 =?us-ascii?Q?0DgO+1IArO2XNkhsr21r/lcmd+b9wv3UI++LgEjPBGI55F/d+PmV8kjsE2ef?=
 =?us-ascii?Q?PhZFp2qZ7Bb1jNUezD59c4y2O835uMB/w8pLStSDWSdh0NCrSlQVhk9/JpZj?=
 =?us-ascii?Q?Hm5cm65Wl83pok07b1Bk0k9hnDAUWxPX+26CaRkPiq6lOTkxgpO9j/LlUJl6?=
 =?us-ascii?Q?qL1rWwZDQUVGAJhnrsH2bo9vluhgyDAGCImBccPlMt/fV8bn0LZ2LQuWvOlk?=
 =?us-ascii?Q?AzEZURjQnMrrYX/nZVvTgRmRGMz/NyTGOnDu0t/XRjXQgiwEy3FmDjcsoFzJ?=
 =?us-ascii?Q?sT2se2hvmcBG9kOh8o7fOUMqfEGztQCBwGauBwczlkIdw3jxfDc69BVV9/kp?=
 =?us-ascii?Q?3XTuFYpkMXjlb5BG5HTxExQoRS6GgvKwAHHaXS6ItGK4zSsqQWAQ9mpGVIrA?=
 =?us-ascii?Q?4XnZiHlfm4Hg6vIYfhf1ABmw7AkkUHnE7B3oS+IUHDlw+yUoa9Lhk/sVJcPH?=
 =?us-ascii?Q?1ysCV6ro2zMdvFzrhFiE8CaYBNClZLWOsKuGhcEkF7qWbkR8TkMcVCs61Qtf?=
 =?us-ascii?Q?T0gJjX+BEVHGt/7E8lGXtWd27jilEW9YqbIoavQeSLm6oCeeDwLZp5CTEVOE?=
 =?us-ascii?Q?q6FXIQQy5CxCI/Jf+q+PSrFzAjV9QxGkNax5dIfUQEE171lNtD/uZG2v/3b7?=
 =?us-ascii?Q?Ss3n4FS0wKT3YIKuPLnsttK3wGqX9tduvQ3W7wi50BWb9q/h2GLCIO5QVqK5?=
 =?us-ascii?Q?qrG/PGJRcciF8zxCfGAwh4PFVp8xvqv9JCKrjFPL7DJRdgZ/xBocFOd7yyNG?=
 =?us-ascii?Q?8ZA9xAmmpcTuWVFW4JtwUuffy8mBI8k+iupVwJsGj8SaX7BiMBLbhpxZrMwc?=
 =?us-ascii?Q?FIp9TJdGrl5cDkIK6By3j7VJUYX6cHr8x0WfNd/IG5szVDgXvMD91nV0BxmW?=
 =?us-ascii?Q?TTPI5kQWHkO3KnByTztsi2d7Dxt9VMytFa/txu67PveLgtcL/iURXOen0/YH?=
 =?us-ascii?Q?KrJpbdMObOG8YUd8L3dQAOjosR01X8CGv+1RSYPFgD8AoAyHk2eEdiTYY42q?=
 =?us-ascii?Q?4dF9LbfcJULZst6w8uo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 677f2c04-2ca1-44df-e403-08dbe3bd5808
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2023 20:24:16.8191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xav8Xv2h7XLcNs8ADmY7kASZchtSjHpGwxyDqMYGFqBShJBDV3lDI7jsid8lYpwrcDLbNAm2gc5yaC89R1QbwDW5xPLJH18Nkr+tOllDPv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_122433_088723_14F7DA9B 
X-CRM114-Status: GOOD (  28.49  )
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
> >> >> Thus I was saying, that we probably wont support that and the
> >> >> easiest fix should be to disable this behavior for the atmel flash
> >> >> (there was nv setting).
> >> >
> >> > The fix up is invoked only for quad mode, I believe it is safe to
> >> > add fixup for micron flash As it is the one deviating from normal
> >> > according to you, rather than adding fixup for generic flash like
> >> > ATMEL flash(Now Renesas flash)
> >>
> >> Could you please try setting bit 4 in the Nonvolatile Configuration
> >> Register (Table 7) and see if the problem goes away?
> >
> > You mean, if it works, we need to disable reset for all the boards,
> > maybe at bootloader level??
> 
> Not necessarily. First, just to confirm that it is actually the reset
> circuit. You can also compare the part numbers of the flash. There is a
> flash with IO3/RESET# and IO3/HOLD# (and a flash with a dedicated reset
> pin).
> 
> If that's the case, it looks like a hardware bug on your board. You left
> the reset pin floating. So you'd also not be able to boot from the NOR
> flash, right?
> 
> > OK, I will check that. Currently I have read that register and it is
> > showing a value Of 0xffbb. I need to do write operation. Before that
> > how do we recover flash, if something goes wrong during writing for NV
> > register?
> 
> You should always be able to write that register from the bootloader.
> Maybe also through raw commands (like sspi in uboot).

Just an update, now clearing bit4 on Micron flash, I am able to test erase/read/write
Micron flash with IOFV state {3,3,3,3}. Not sure what went wrong previously.
only thing I changed is related to enabling the QUAD spi mode by disabling bit 2 and 3 on NV register.
This again result in boot failure as boot ROM expects extended SPI mode.
Then restored the extended SPI mode by sending the command FFh (Power Loss and Interface Rescue)
by booting from eMMC.

At least one board with micron flash is now working with IOFV state {3,3,3,3}.
I need to test more boards to confirm the behaviour.

Cheers,
Biju


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
