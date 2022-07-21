Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84225C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Jul 2022 08:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CD6MkUtyI5gdoh6eEJZ7vBLVwFNAByM2c2gyQYM37Ho=; b=jB3FGR+zwWiGf5
	YuB3FTyDD5/32Sb1tBOK8aZG6uqw+0Qs6U2tzuCkZbHn0MnGVdX4tJnHzUJaWLJkyJPTTm4vjGWPU
	cA404dQj9KkL7b4PoaV6IiGzq0PTVLtDg418UjuD9/PzwEENL0mEeTTRUNw26aNPQLrpbsA1wr2H7
	PcNBvWdKNY/5Cw8k8vtFpNxs9r7Zcjd3YrhT7gzGlMK7ZsKTF4IsEeskLUC4FG9ljXHxqTShWoRr4
	UN1eron2JDoYVPUTYtsBmTyJAPh+JQSu5+GuDZIbldrWpK2scV36wAWEB3BUP8pLbNCiLJk3yPJZo
	npDjKyV0za9EaE/OfBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERrM-002kZ3-QO; Thu, 21 Jul 2022 08:48:40 +0000
Received: from mail-os0jpn01on2111.outbound.protection.outlook.com ([40.107.113.111] helo=JPN01-OS0-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oERrI-002kTM-ID; Thu, 21 Jul 2022 08:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IPV0Shhyf70VhtDZ/Awi7CP1YdFoA0VS6FMAkn5O9boQg3GnXBSPTQ9atORnoC8QMKMs3zGXz6Gs0pBcz+fY/WY6c1eoNunAAfAk36+ybHIrhaDMgf/X44n9Q0oICBScV63o2JJCx3ywMmmYBKdTj1iXxm7F4h7/oTdNCv2TreH8AqJivPAJv3a4txvi3zb9NLYJaI3qGuvjWvcm3Cqe0jNZOw6s9wepcSt6Kma4W1IwaBBMPCGlGR0NvG2Qcrwxiao07ig6CJxxJIkZuOAxIPfgjz0edQRQQQQcRDzAhRzwX0hMlahwwXyjuNS11hdfkkJ9mLappskmsxFsDVHzRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzX0Sj+qNJ6cWmClEN6N3Pw2ajSCunQvdUrZckHj7g4=;
 b=aMAAcOqeeX44ibBhkRnk5/8asatXkNk6D07FxnmaR7AjEHhGDEItjvfcDKvEpvoT2QfugEmmjkWC7znvt8tkwDOO6wTh120YCKuZRjsKLGcj3EJ/d2dIU8OTGckfhWfhWpMEBeR2hn+5rxoO6UWUho4estpiduL8EyGQV9scFN0FZmvO3ahEJys9NmPhoOBnXpnqeYX8IpYD+SbInnHdggyOiUKmHjyriF7zHK/00+o2Fb/IiQm38z3g8V7jMxP5QIrvFr7O5hlgu6jq43DyjurpOhQZggoL9UOd1pmWxrfw3rr7PdZC8neXbMb2HJckKrKdwAGGk0v3S9D6fot6ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzX0Sj+qNJ6cWmClEN6N3Pw2ajSCunQvdUrZckHj7g4=;
 b=oj4WjcdNZ4eJ3iXN2o0CxevaXKOjg6NinKYf64x6ycOYPhYFKRENvxYVXkJP+VWePd7DBc3Cqm5UPTgCAVJSzCVg9Jm0O0oqoya8EytxORf/CdM/hFDOiZnuaOJZVDELBaqfPHwh7TqZCTcOgse903bElMiQInmjr6XuPnWdH8A=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by TYCPR01MB7691.jpnprd01.prod.outlook.com (2603:1096:400:f3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 08:48:27 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::440d:b27b:6bbb:3d27]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::440d:b27b:6bbb:3d27%3]) with mapi id 15.20.5438.023; Thu, 21 Jul 2022
 08:48:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
	"p.yadav@ti.com" <p.yadav@ti.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>
CC: "michael@walle.cc" <michael@walle.cc>, "Nicolas.Ferre@microchip.com"
	<Nicolas.Ferre@microchip.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "Claudiu.Beznea@microchip.com"
	<Claudiu.Beznea@microchip.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>,
	"biju.das@bp.renesas.com" <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Topic: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
 flash
Thread-Index: AQHYmDmxaDGaoLXUcEiJUkRa88raCq2Ih1KAgAAFIRA=
Date: Thu, 21 Jul 2022 08:48:27 +0000
Message-ID:  <TYCPR01MB59333483DDEB9BBB724C69AE86919@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220715105716.2415068-1-biju.das.jz@bp.renesas.com>
 <20220715105716.2415068-3-biju.das.jz@bp.renesas.com>
 <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
In-Reply-To: <7aa7de93-23f0-c94a-bfc3-e79321cdc1f9@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0b692977-b3c9-4fb4-69d9-08da6af5c7be
x-ms-traffictypediagnostic: TYCPR01MB7691:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  ay3DrkWnf9rsL8XHpOSTfXDzvYf5pEOr2g1FBSWpD2NawmsOMaZffn1xcdsBPXQRqHiKYurZWS4y08TslZmgZE5vYgVyXApGvR/NsvrfyCiAbBsuEDySMyKodhUlT9/e44jFUBHwx6tyRUyAKqdBArMTkOFe3HrfMu21j3lO4z6BiNUSqQ5cLjtfAVz5uSYurJFKQ5U3RYD1TsdtM31D4boR/6jfPJcYO9sK37wWqPEiOBAC3L3g4WyUNwD6iRLKE3TKte6stcF+p+6piGFp0k0mLgTvds82yU7tJtf4HCE+WmtXekMZUehI28Yboa8Fje1eL/+yAw+yYzkrvxG7Q1918VJGT3nPrBNm8aZ/mXPmPnIo6ZF/4kHpK8zsYcJRzkTJObfmNPZVmeG4RaV/gA1wy0PPhc00nGQjELZJls54CaZUPCk0Y24naDp9o76toU2BTnEoYPf2G2dseyV1ozh+Uaug3FGaxaxFISEw+boSU6wu5h2EO/7ckCgrK/lb72EKgNfNdXkAefigJrknrQ3QCWsPSDtQNqqs4qap/5QAIG5ibn33m5ZWcpUnjHONJD4Tjj+Q2a+1GlUWObGSApVT3f97sKc30DZ74UygpoNqBNlv72twu6Hs6y9yOid32t2/qDoC5ctq49BJbqS2R7/wTDWXDPH/GvKBV2pSSKP9iSIxI1892NcNFxTl7bi33kYgqZOWxUdoex6EuoqOahY3o2l/LMufLvFntCSrGm3KLzDnF8rBTGkgGJ4ap6IiPqUOHm1WBUAl5M7Mh9JuocbKcXaOQvgjvkqWpSQbq7zul+90z5DcWQQjsYsVa6Fv
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(41300700001)(7696005)(6506007)(53546011)(2906002)(186003)(26005)(33656002)(122000001)(38100700002)(54906003)(38070700005)(9686003)(55016003)(83380400001)(86362001)(52536014)(478600001)(316002)(7416002)(71200400001)(66556008)(66476007)(76116006)(8936002)(66946007)(64756008)(66446008)(8676002)(5660300002)(110136005)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?0yecV97mZ9MAdH2Cc7sxXuC6MMh+8bBWaZnXc4zpQDN+it+8kz73BMIBApx1?=
 =?us-ascii?Q?8t64Z3hOkYDNn/RJk3OxfeGCjnxkP/+9E8fDelHm2ou5rT+70JswbSoGaNhp?=
 =?us-ascii?Q?HNDp0JBilb/r9WJqjx4WSWtkHUs28sehInKjk9WGJf2Ae2a9BkSpDsqB3G2C?=
 =?us-ascii?Q?Ib4wmkzgWTOmKvL+PVTLcZPVswRZqVLQxOege0PdyH+RJQWCL2HJCdZ1WIvP?=
 =?us-ascii?Q?6e5cHdbZpfVdLFqfoxCLEBoRdsI9S2e9oqntb7J85wtK0gFWO4J0SDPnDBJS?=
 =?us-ascii?Q?kzyrd3s5SQQgL4d0EwytdgifLq8GwF25agyDnBoiuiTLzySYLuGGlS0SBqxT?=
 =?us-ascii?Q?ds/VqDImwaQnBpOJU4BOSnWZei+79a9yRWh4dPUYIjT+VVpB79O3D59sQKd3?=
 =?us-ascii?Q?IAE1AGGw/DkgKBcqxbNJ7mnfHY/8rpeMDLfGQOtlq5O4nmeQAed3Vkt0huTe?=
 =?us-ascii?Q?7jNxUop5G823SUIoA5j5Q2Vu3StnAGvC+8n1wOCOKEhG+dIS7PWq/SXYArfM?=
 =?us-ascii?Q?mDN6UR9mQwTDWwYXiYj/1fKtvv3yAmG+OYiNt9Oy15pXqoD+cVvPZ2ekgpTK?=
 =?us-ascii?Q?aJQZIGoddu9apquTnekTcFWTB5sLGSi4l55f2BEJt8fKyOqyoSTL6YL8yFr/?=
 =?us-ascii?Q?YbxAADPSdIzmaMRyr4Z1+SaN/88WgXC0INDA2BtFODh2dgmJhOBUW6e7mvbf?=
 =?us-ascii?Q?Da/c2fYjsk95+AhDMqIRhyyup/Gk0W3BaSy+9QdW2aCLgA/kCB7e1EbnyrBz?=
 =?us-ascii?Q?4uj478/QCYjqhTXj43XEvzIp7lU5TGGVrin3Btc2LrOrD82R0YMAflOp+YLp?=
 =?us-ascii?Q?9vQgi/TT4rDniHu6jARe7fauWf+n/0KFcdf1QUqSS4ASolAlVw14yCqR9QwM?=
 =?us-ascii?Q?C+szDGxFdzORDPVpquNj41AUK0UvARGG//Nj3Du9Rq6fTH3PttAZwz1PnYS3?=
 =?us-ascii?Q?coxKaMkrU09VQPuTV8evB8cjglB085KZVL+X/T0t/YMOoFQATmldV5gqTDyJ?=
 =?us-ascii?Q?i3mL5TbKWnTltggv5zUCvepTxksR8NHjug73gNLJMfRvB3/AogiIdYuPgt1r?=
 =?us-ascii?Q?Q2XJHOSZ6Irt0a0AQQrdHr7COQgDFdmKlTirGjynEZDf6msQabNYUj0lplnS?=
 =?us-ascii?Q?ahzup6Ba7TgiXlvR/zc5oxkJZV/YrVdtzrL4XBq9mhs42mDSt5Jfj9BqXfDx?=
 =?us-ascii?Q?k85fNyYodLoFHMNnbbNoXPg80DuxCU/w95ijFK0Dz5EJ/mSC/A7sVOFxUEEe?=
 =?us-ascii?Q?ae4kqfuXT9RnhFjz9QMMvmM6KXmi1XKF088SO2brZfQv2Nf/5sIGYEWfcaTF?=
 =?us-ascii?Q?xiuTtUUWhVKZ6J0kzkJVR2FUKifcg3zK217ZFwULGJUWPQ/u8GpBFvC9dZKd?=
 =?us-ascii?Q?SdTTm5GngX6aw5Bsmw5Ry5rtwLc9XQwdq6nj7BZCEVRwpN0A7YUxWPTl0qz7?=
 =?us-ascii?Q?LBUWjm3TDAVv4ugenUtbMQYbly1w8tQC+017/JMwCG3ZLfDrBb2wo4F4QQGA?=
 =?us-ascii?Q?bTbJRYy72TN8bnX/+MJPDOBybVOX9N6zTBZ3M/LAqR7Rt5SxBEo72XfUj4cs?=
 =?us-ascii?Q?0W4JqYZzaEBfRXsKM3spoFAe0HiODT/+EIiDy8pzWIz4yZY4IIlB4yw419ty?=
 =?us-ascii?Q?Tw=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b692977-b3c9-4fb4-69d9-08da6af5c7be
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 08:48:27.6867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oXiX+StVGU63dPsMXHqMIB907mRgQH+3reTSoI1JH23ir9IznZFil61kZlpN5L2blnMUTbc5gMTcY8+xDbYpjVssRSd3j8/yTCJZqY9ceU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7691
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_014837_112777_AF72145E 
X-CRM114-Status: GOOD (  24.48  )
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

Hi Tudor.Ambarus,

> Subject: Re: [PATCH v2 2/2] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> flash
> 
> On 7/15/22 13:57, Biju Das wrote:
> 
> Hi, Biju!
> 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
> > the content is safe
> >
> > Add support for Renesas AT25QL128A serial nor flash.
> > Details of flash chip can be found here [1]
> >
> > [1]
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > $ xxd -p sfdp
> > 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> > 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> > ffffffffffffffff501650190000ffff
> >
> > $ md5sum
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/sfdp 23e3ec56b5b8f986d0488ba4727239dd
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/sfdp $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/jedec_id
> > 1f4218
> > $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/partname
> > at25ql128a
> > $ cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer
> > atmel
> > v2->v1:
> >  * Added flash definitions into Atmel table.
> > RFC->v1:
> >  * Moved the flash definitions to atmel.c
> >  * Remove macro related to locking as it is untested.
> >  * Replaced INFO macro with SNOR_ID3
> >
> > RFC:
> >  *
> > ---
> >  drivers/mtd/spi-nor/atmel.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> > index 656dd80a0be7..80c24d138b27 100644
> > --- a/drivers/mtd/spi-nor/atmel.c
> > +++ b/drivers/mtd/spi-nor/atmel.c
> > @@ -186,6 +186,7 @@ static const struct flash_info atmel_nor_parts[] = {
> >                 .fixups = &atmel_nor_global_protection_fixups },
> >         { "at25sl321",  INFO(0x1f4216, 0, 64 * 1024, 64)
> >                 NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
> > SPI_NOR_QUAD_READ) },
> > +       { "at25ql128a", SNOR_ID3(0x1f4218) },
> 
> As the flash is defined now, all its characteristics can be discovered by
> parsing SFDP. So instead of adding a new flash_info entry in the already big
> array that we have, I would like us to focus more on a generic flash driver
> which acts as a backup when the flash is not found in the flash_info array.
> We can discover the flash particularities by parsing SFDP and we can probe
> the flash based on that. Michael has already suggested this, would you
> please help review it?
> 

Sure, will review and test this patch series.

Cheers,
Biju

> 
> >         { "at26f004",   INFO(0x1f0400, 0, 64 * 1024,  8)
> >                 NO_SFDP_FLAGS(SECT_4K) },
> >         { "at26df081a", INFO(0x1f4501, 0, 64 * 1024, 16)
> > --
> > 2.25.1
> >


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
