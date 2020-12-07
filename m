Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1523C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 16:15:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32B7423750
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 16:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32B7423750
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ScjVSM/J6KWAZUoZCfZl22keuxNNbiLXe/oZZjZKfxI=; b=xDmtjFChMVRhmFeeGWpXyGXrG
	/wzIxLhXEfv373aKo5LVHkA2VOk9zgJmt3pLakLEDHuzM0lcqSelLFupXzk/T78vCf6abxpnuYxL+
	dn6I2RgC4s36mX0b5iorgPQQqqfwdQRe9/6NqMbMxi+rwzL0gUGNXaM+l/EmEVBX5BBUbE1Zjdbld
	HLoKrVbppzvE7JiNZfYe8CytLJHgfiHf7OGGGekpRH00xe1/NZeZ3lVOiVr+oaHhj6MDQoDyzHvPH
	yedmybjTswM4KsNiEF1Sy5Vlj2lWQcLwtqLYRWI9/szbYzuzsDRAUmyv+7WRzKaMNb4M40kM7WJ36
	gooZ4H5HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmJ9N-0001II-4Z; Mon, 07 Dec 2020 16:14:09 +0000
Received: from mail-eopbgr60069.outbound.protection.outlook.com ([40.107.6.69]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmJ9J-0001Hr-Nv
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 16:14:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsOQswKepC+UE2rbqXN7w7QFSeOMLORzIw8IPAYxVH9AHKMwLO7ZCHdGTFJgY/xyZ5eMAbI0bY7I0ksfCS+Kj8f4t9NzxXHm+zQYkO246fOIOMWHIZXUQ6BactD5aM6TzedLxkNHn90ju+aqxGt6MZ54DHSjeCxUz8ExlzY4yj5JNZNcY/NB+P2Y6EEcStJDRKL6unYPS6ue/zvnZlRtwzLW4qCKfRPGn9pTS3F5vpnCkltuAca2dW8QMPHTu9maGacc2PwtPz3klR5m1Jk2uc+px15iP/LbhwNLX3nV6CSicdHU4RDeNYOJA12JcNxamu2beYO0084VMCfWFsecRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPy1F1fJ6EVtV7/v623n6KKsv2wm0rzVKyZbjew2MP0=;
 b=h1/2ItQwYe5YU3t1pMROYd1nKJQDGy3IfGIfLHuKvQcLTzfQX6teTT2gKLgShB3wGmeyQR3OP7qFsnlXmHaY8ldz3hnn74zgboa/M2x9d8OXjbuVmU3fAlTabsYRd1sTRV5FkGrf6yWzkKYNAhdAh3vP1bc5N/IRD8dIEy/cWpvy7w0aBz5QRqmemwufY9R5cgBuO5Gn8lQOBsN3jjj50hNBGgceBNIx4YUQjkJgSaL1zfIpBuGDtoBMV1dCB3/oweQWgamhC7EBYDHl+aBfaCrvEdrva9In3iu0uQT4Jhg22huvteRI+NT1SkaI1zGisGV7Y4o1391IU4YUUH6uOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPy1F1fJ6EVtV7/v623n6KKsv2wm0rzVKyZbjew2MP0=;
 b=auQ1teS9GMs3CKQUW8c19Fet9E4oajiVTIla188D2/EFh8aBHDPvwVUzdroVQRxN61VURzKfPvHqdGuaQPcy+ukVCvycs0l8NcOLVGpG+FW+Bw+g5zRRk3jI+VWk0a+oTrj6AZlIbz4kAbb3kvjxHfvObskHWUaJ/UxTtBlNgp8=
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 (2603:10a6:209:1a::16) by AM6PR04MB4613.eurprd04.prod.outlook.com
 (2603:10a6:20b:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Mon, 7 Dec
 2020 16:14:00 +0000
Received: from AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637]) by AM6PR0402MB3701.eurprd04.prod.outlook.com
 ([fe80::e094:5ce6:8b18:3637%5]) with mapi id 15.20.3632.023; Mon, 7 Dec 2020
 16:14:00 +0000
From: Han Xu <han.xu@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: RE: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only
 sense CS0 R/B issue
Thread-Topic: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only
 sense CS0 R/B issue
Thread-Index: AQHWytAbaAXo4AGLcU6xm3dz2ABoiqnrZw4AgABo7nA=
Date: Mon, 7 Dec 2020 16:14:00 +0000
Message-ID: <AM6PR0402MB37012F0C151E42C690EF935E97CE0@AM6PR0402MB3701.eurprd04.prod.outlook.com>
References: <20201205063004.3099-1-han.xu@nxp.com>
 <20201207095006.GK3977@pengutronix.de>
In-Reply-To: <20201207095006.GK3977@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [70.112.23.252]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 692f72df-6e1e-4324-4add-08d89acb1baa
x-ms-traffictypediagnostic: AM6PR04MB4613:
x-microsoft-antispam-prvs: <AM6PR04MB4613FF22168F6C06EA0EE55A97CE0@AM6PR04MB4613.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XDGXY3uFe0Q4+mNs3aGWU6rFjyi8vqUWvsX/LbkeZQOp7WBncwU78ZrViocrjO3TcX1KTpfTG3GqzaxTwMIDBXmvtoG8DcqKGvWsQpvXOv/XwI4RHI2baUMLmnX7plCtw1T8Hu5KnYlA3NzfrKRboPqpBYKoJxcPWBLwG+iefh7bp43QhRuUXnM/7ZRTqnXpfohUs09Q1V3DcsFmp9cnf0AuuVMXXClBlbe8+1dqlw4tKw08buzLtDFlSp/tsR413M/orrVLGR3Zo9Owjcef48r/p+B5/vToBqGZYvGYBWqo87DzPesGb011j+KnKBa6DlwMrkbGHzDTkyjZLooq0WU2TzO1rxUuhOJ35RNF90P/MDzhre6jTfo/FmxQuqAkEhO5H9iftrhyi6XHYrxwDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR0402MB3701.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(45080400002)(54906003)(44832011)(66556008)(5660300002)(7696005)(186003)(83380400001)(2906002)(966005)(26005)(71200400001)(52536014)(9686003)(66446008)(86362001)(478600001)(4326008)(8676002)(6916009)(64756008)(8936002)(76116006)(316002)(53546011)(33656002)(6506007)(66476007)(55016002)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Ibvn1zN/S63f/UQQEfcglR+V3Q6rJlKyLoHvNdBQcCjpoMcCHEBLxDeO3zm0?=
 =?us-ascii?Q?YA9XVdhORLkIB+cf1CQUK+1VeOuGE0m0PWwduy6gnxBc6CU5Q1+/At5LwXVe?=
 =?us-ascii?Q?Ku+QC/nCpMTEXfIFbJ2rf3nuYtAQ+JklxT799js0xqdpd3CdG+Meh78zx5kt?=
 =?us-ascii?Q?0lF5awWkOWVZJyOTj2u+vkbhYVpmaIlP4OLvEdJ1EaqnKYA9eJ+S1dFWH0ZJ?=
 =?us-ascii?Q?PmMt8uriHtsg9eJqBeLAvoDJJthw1j7agbYP/KP5tqcUkbnNt46/Rqb+QpKY?=
 =?us-ascii?Q?6yhAwtoLVIvvXp5KyFq7XJceA/Yi9Yy1wvzhAJ5lyKvjCttPGGxtTLmxZCpV?=
 =?us-ascii?Q?r4XjSDh8/thfZauIpCZG3ZQ9Bo/j+RxgEr7pd/a2O3IYMpdZrcf5f58IEAVO?=
 =?us-ascii?Q?9e5tAy8Tnc8XDx7tGDVWc0+ODSX2mQzUEG2e6291AGCp/Rqh+jj9o74pXA40?=
 =?us-ascii?Q?trnfRFqbmnIoGs1yKyMFIh76ztbnOpzTy95bmlhxaFjumzFNuO+AV6BBBWkl?=
 =?us-ascii?Q?yb7dpYwS0Q/wjJUUHAb3NeTmPCVRIqB1Cy8KrqjJbNcjYavrvLMLpYksfezO?=
 =?us-ascii?Q?ILygWCe0oLBV9sHX/8/yjodaS3qr9seJPrqnMNxYr56wrY6nlsxfmFcS11/b?=
 =?us-ascii?Q?oiNKxuA+LM1NsJq6sz2JcynywZYxOYpXohQ9W2eux4mQoOy6YhAYJHqETGTS?=
 =?us-ascii?Q?n5PlOKos7u0qjphgIX05c0mEys/IOrrh22tmf+NNoNem5KSv+JAOwO8MF+ly?=
 =?us-ascii?Q?Pp0v0iDSibrH8EE6enJ2lLBsq0oiyHuWQeNyWMzuLQSvqodH3h+l/Avy5WBM?=
 =?us-ascii?Q?FJ8AuSfFBV1M3gq3/SRzv9K10C6qBv/LKldrKclaPA7GFkDcAluOL/HQPvFO?=
 =?us-ascii?Q?5OzJGE5F26f9Gr7F+EchSpAGzM6H0uTBhmdhebqaKZ0ew/fEKZ9wn30fggTS?=
 =?us-ascii?Q?ULh2mi4P3kyMaXdoswngNLAvgMlIKunorFl8Y6xJ1SY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3701.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 692f72df-6e1e-4324-4add-08d89acb1baa
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2020 16:14:00.5149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sCAY94Q8avdtvBM9CjfrVx1Yy21wmOk/AU+vCzEHsryOGRnO1idjgUrYTiCAoNe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4613
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_111406_007502_C6777A31 
X-CRM114-Status: GOOD (  16.09  )
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
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



> -----Original Message-----
> From: Sascha Hauer <s.hauer@pengutronix.de>
> Sent: Monday, December 7, 2020 3:50 AM
> To: Han Xu <han.xu@nxp.com>
> Cc: miquel.raynal@bootlin.com; linux-mtd@lists.infradead.org
> Subject: [EXT] Re: [PATCH 1/2] mtd: rawnand: gpmi: Fix the driver only sense
> CS0 R/B issue
> 
> Caution: EXT Email
> 
> On Sat, Dec 05, 2020 at 12:30:03AM -0600, Han Xu wrote:
> > set the GPMI CTRL1 GANGED_RDYBUSY bit so dirver can sense the R/B
> > signal from all CS.
> >
> > For the NAND chip MT29F64G08AFAAAWP, only the first chip detected
> > without the patch.
> >
> > [    3.764118] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> > [    3.770613] nand: Micron MT29F64G08AFAAAWP
> > [    3.774752] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB
> size: 448
> > [    3.786421] Bad block table found at page 524160, version 0x01
> > [    3.792730] Bad block table found at page 524032, version 0x01
> >
> > After applying the patch
> >
> > [    3.764445] nand: device found, Manufacturer ID: 0x2c, Chip ID: 0x68
> > [    3.770941] nand: Micron MT29F64G08AFAAAWP
> > [    3.775080] nand: 4096 MiB, SLC, erase size: 1024 KiB, page size: 8192, OOB
> size: 448
> > [    3.784390] nand: 2 chips detected
> > [    3.790900] Bad block table found at page 524160, version 0x01
> > [    3.796776] Bad block table found at page 1048448, version 0x01
> >
> > Fixes: 3045f8e36963 ("mtd: rawnand: gpmi: move all driver code into
> > single file")
> 
> I don't see how 3045f8e36963 changes his behaviour. Are you sure it worked
> without this patch?

After several rounds files merge and code move, it's hard to find when this issue first involved, the driver still works for single CS NAND but CTRL1 GANGED_RDYBUSY must be set for multi-CS NAND chips.

> 
> Sascha
> 
> 
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       |
> https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.peng
> utronix.de%2F&amp;data=04%7C01%7Chan.xu%40nxp.com%7Cfeed58dd05004a
> 8f81f208d89a957af4%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 429314087020152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ
> QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ZyW3svz
> HvL1soAA%2BUi6FCe%2B8ZUm2gubwEK6P%2BO9T2%2FI%3D&amp;reserved=0
> |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
