Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287B9C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  2 May 2022 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5SGZOdtnJy5z5PlDPRRLDqAwkZv5kFlgya1sBLE21Y=; b=4FvzSxzk2Xyiq9
	BM3ktlNIYBFXPJZsMCZ3TC5UuKhwcdtbbiQcoJXY2he6nd2fsCNhS8cjH5MlJtSsXe7BRb+U9m4D7
	9MkLXSMCbu3LGIzr9KLePC6eOqSYuoMvbpIMp/0l9Ob+8IP/hgzQ3hVA/FlpPeW2/7IJ3Xl5k8O0b
	obHR2K3slQXRls2Enbv2DbjdO3/6r3hLvMsH9pMI62Z9Y6/KsPtsSERYSRjhYpX7rNY8bPgX0rIhB
	ma0luvwEwp52adebPEdP0kBcFGzlvwucsB5RCEarpDV4sq3M93jIkbvA2BY0f4hrPdVP80IJzixss
	655o9DF03h/hfdsSsnGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlb5y-002Gfk-G3; Mon, 02 May 2022 18:48:30 +0000
Received: from mail-os0jpn01on20704.outbound.protection.outlook.com
 ([2a01:111:f403:700c::704]
 helo=JPN01-OS0-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlb5u-002GdI-Ix
 for linux-mtd@lists.infradead.org; Mon, 02 May 2022 18:48:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zf0JcvJbrX02zcOlm9Us5i3euUE3J1hhLnW9gmtmQL88zmecV8cDAoEFVDvAVEfX3XW+pCbfqYIWTYcbRxxZ9ckS1NW7jEuLUsNZ9BScPAw4+388+ejoyXi2BdD8xpeTV1a5AsLM5Sjt2MRMl1oIbKjdIPiuxY9uJfg02qDBE5KRIRApPr+ZEcez9O7/Y6h6HvlfaPIth9Z5ZMrOzJu+KTz3SOzJdyBFeTcwt0dwwUTqbP7r3Bu9by31DzIeQiBgG4KXeT9WKIp2bgBNrXUsFb2Xlvrv23yi1zzXtfWZpAkz7Upddz26WhX9Z4WdP7bxVWNMIlO24IzTYJp/3jmBog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXGx8LKtzkIRrXLJLWqDAr6CdtaSsdFDGNleR1VV0bY=;
 b=TPrFz3Cdif+8usG7rQ5CLzH1sd0PQphieilj7Y0fuRU4lAzoOCXEduhLN+DaFWRaLXv+deq3kzP2x2p0LRjw7LoT3QhDg1o3M1VN4Q70CjDlgmw50eCRuO8GVMhV/VJyE9fmqiwxQ8na8ymauKQZef8jZQMLO4ya24aslfDOvc4iuhO3QdDmOIH8p0IvQrMVI/EzUZ2itD/ZuSbR7XaHM7OGMVCg6VboB7oRtJ7Vu9qYyvGYu/EOesnsfmHx5enTInSIq45CUV4p3LmBYXhoBboWcadk083yElTLKvxe0CRFcVeAskiotdXuLMj9QKstDqNdqHBBw8cBt2gf40ur1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXGx8LKtzkIRrXLJLWqDAr6CdtaSsdFDGNleR1VV0bY=;
 b=uIhN+qKFX+eJijX6Zw/ep/gUIuBeR0jbJU55P7WJRjngzCG3d/YkKMBZ7T9xhFdQBbq+7HPlxYs26fkLGFnRgFdoM4fcsBT1DglJpGs2Cb7ha6fB+z3MjSYNoujizsU4HFpqzQ3HP8Y5BkKuYk0cKiDWhGcExDAC6D1TSSDsY0g=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB5765.jpnprd01.prod.outlook.com (2603:1096:604:c2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 18:48:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3e:970b:c238:f57%7]) with mapi id 15.20.5206.014; Mon, 2 May 2022
 18:48:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Chris Paterson <Chris.Paterson2@renesas.com>, "biju.das@bp.renesas.com"
 <biju.das@bp.renesas.com>, "geert+renesas@glider.be"
 <geert+renesas@glider.be>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "p.yadav@ti.com" <p.yadav@ti.com>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, "richard@nod.at"
 <richard@nod.at>, "tudor.ambarus@microchip.com"
 <tudor.ambarus@microchip.com>, "vigneshr@ti.com" <vigneshr@ti.com>
Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Topic: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Index: AQHYXY0CUmqyBNs4DUuPavP17i/aHa0LdLEAgAAXYICAAASW4IAAV19g
Date: Mon, 2 May 2022 18:48:17 +0000
Message-ID: <OS0PR01MB5922953CE1777950ACA2832D86C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220501185512.51158-1-biju.das.jz@bp.renesas.com>
 <20220502112934.2433516-1-michael@walle.cc>
 <OS0PR01MB5922313B200156135FC439A686C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922A6C8B1587BB67A1A484486C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922A6C8B1587BB67A1A484486C19@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4e9713f-322d-4a9e-abc8-08da2c6c522d
x-ms-traffictypediagnostic: OS3PR01MB5765:EE_
x-microsoft-antispam-prvs: <OS3PR01MB576533B7284FD8AA4C62193386C19@OS3PR01MB5765.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e0sLbH3dfXr8fzJ7m3W/wkLMXvmW0eeDkcdJ9WNU5DPts0Q+wxpFuBR7eSI5jwX2b/aymYK0HNZrtF6wBZ/h0jXPVerLreBsXzrE0ve36wMD6zCRsdQZXPO6QIzVf1r9B1cIo+NU/Y8p4sUjkxWvNbrSbeZuy1mIXrmqv4NxRh3isNKfNSQMSWoaHhjXecaexnt1JOt/n9vtL/nCn7/q8XV56TW/NMtGFPCbyE1w8zpzn6bpJpDUoOvFMMgFHW/5gJZNFSi66fpDwMVhIwTb+0IiBPvanrz9FvgUuU/ZQgK5x88/hotDsPFqrGzOn/O4yAS4B9uYXRGDXPNGJemGxETFxhDqO56mQfSIWMvR78Sz0An3ymsh2g0D4YigxDcm+SAOovmLC9p+sP22+J3Zb9kr0iNAO49iDqON68BttVOwPb5bJfXZnPebXuDTKOalgb8fHdxw9/1YeNfrVuEmu4Z3XACVktm1/8cKdr3n/LYjFl7OBKuPCoFCiVrYq+XpiPVI2t5OfAftro2gQ8315rFfEE8gVtNVdin0bupXkYgxTfNoROXchAbyHsTLMn6fEg0DcwSDpVI30jTxpfsovar0xU+M6f10mc6dLqA5ySglvABSJEfnkvPKyp8ZzLodjkwnTx3SDNq84bvgGqs+7ngwh5ywTqLgJFTQtMvNf7QzBWGp3Sjo6TuG0Z4AVOSaU00gqbSRsaaHD30VLrpDVbvOPPYNO9oNz0RkddIQozHRGhb+Hyfl9deJ9Dw2os5Lofq1EQ3cJA/Oz4DS/IaTYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(316002)(54906003)(38070700005)(38100700002)(33656002)(55016003)(122000001)(66476007)(66556008)(64756008)(66446008)(8676002)(4326008)(66946007)(76116006)(83380400001)(2906002)(71200400001)(53546011)(6506007)(7696005)(2940100002)(26005)(9686003)(508600001)(86362001)(5660300002)(186003)(52536014)(8936002)(473944003)(357404004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3d6GYw5pRS9Hh20DeNyJdi7VleCg+m9SH2rHBzTdlMH0ZCa6snQDGn5LHybF?=
 =?us-ascii?Q?JjcGhaHx5+3Sod9UDORLn2jlCSqV4bAjydF2mEt8A3FQgBqVjNAcyibbLAvW?=
 =?us-ascii?Q?rL1hYynyCy69exV8hy/qSxjWT7vw+MQfLUh2btX8YtUoOCmltkPVCaE+QJuN?=
 =?us-ascii?Q?7S9LW323TFouCIOIuBDcLdOzZXQtKnE/CRk0xk6tVXzhLaM60OK9euFA6P7Z?=
 =?us-ascii?Q?YiIx8Kp07RIDAmK8sY84PdyWbdmLOMNCOMBV3I7NGEyD5uezD5fR+IGWhsId?=
 =?us-ascii?Q?Pe6VAQImI3hkp+1LqxPtflKx+764nnAN5w/poTTwpDb8KtLx/Q+NmeP4LRO0?=
 =?us-ascii?Q?hr8ZwXgyMb9VOmTXwzYZXbNK63Nd5d30D7AlZaM6B6jcHrsa6KuPDSS2LdgV?=
 =?us-ascii?Q?h1JefB7R7ixK5hDTyMndt6GDF939FN1rdRd7oNstq0hGHFbArqIjqLcLoT8C?=
 =?us-ascii?Q?LR9SnFHa9XJnIgqLcQsuN3Qr2PmAS8yvXqReNtX8ORtCQ7Pw7GzN03YteiNa?=
 =?us-ascii?Q?wHcNL+oaS8/RT6xkt34S1QgfcdBCH5KO+IMHQULqO6mkP5n2clFo1kgZ4z7b?=
 =?us-ascii?Q?TUV1mza9stbvYq73KrSCizNAr+C4xhP3OJ3T8R+tzYPJ4jWIkQkbPszDNbHf?=
 =?us-ascii?Q?YBXrH/03GLMH19w9tJ39T2I6BcPjDRj6UGz+5El3SyKzu/Ieb4+CscZ1/hlI?=
 =?us-ascii?Q?HD6B6jv5HNDTys+YWGXMqvYrFIoxuptWu0+mssmrWoYKL0thooLH7WLk705O?=
 =?us-ascii?Q?FgbuxK4vl+IVYeNHeSNujrRxRvHliLg+6XOBMJQ42m/jMEJGz4SSmn5JOQtq?=
 =?us-ascii?Q?5Ap8XYp5zqVsFrX7n1Jw5mAGOp1PR+OtntDDEl6d+Y+VDPwOqWENCPUgFDJf?=
 =?us-ascii?Q?/sjCnytXvz1ZCRkIXrMKmQKiuCmPH1j1UNUagVgdTdxucmNHXKSvfIqaYHhb?=
 =?us-ascii?Q?3RjHRI3UDqAb+hn8KCdl2+O4CkD0E5SQZkz0I9GJsA5XPeOInKwGBGGNdFIg?=
 =?us-ascii?Q?ux8YbQOLgd0II544go0ZBflwktGAuvFBUmUG21XEuEluBRpKjGC9G5YlQghM?=
 =?us-ascii?Q?1MDWKvS3AjPWHWVJ94oYEp6WynNjSL2v2dTR1LG92AhmomvAmZjxtV90UXVb?=
 =?us-ascii?Q?aeoh+0uPbj0WEIkrg7wtpnddgD2tMvYbp6GfW7USFnz+z1vGouD2MD3wN84Y?=
 =?us-ascii?Q?m+JN9Eisjt3y8gntjBXIg9dv+pDrlGIe+zmwoYa8pX6caOhnN8EL8pyw2JFi?=
 =?us-ascii?Q?Jjpgo0jmFgR6C45THrOZFSNVvk+i7BnxeBmMqZJPXAKlZdIW6nl1Ss+fCDRN?=
 =?us-ascii?Q?jPRP9oF628Tz7a8LjxqgYYLai7yX9zmuUZS0duMFDNEBIFS/rftWADXsug+q?=
 =?us-ascii?Q?GlFoW+Kd/kU0Dawn8VKrOD2ZfreTd+QcfASOwQnP+Dd/e6fPTl1AWpMbNrpn?=
 =?us-ascii?Q?zMwLqe0vAah16BASk9f/eBMSOQWlRs1wDFm5KJ41mxHD5fhdZ7bORTaO7y5w?=
 =?us-ascii?Q?/pUZGKKAAwuirp7Fd+zDaU7AWqcMnzgZpiKoxCKE9WDeWE7O3s9/QhznK77r?=
 =?us-ascii?Q?Yc+lf2WVhAaUxVoZ+Yl5Y84qcEi7y1z25FekQ75wdaDCug1pFJ4cE1AO4erE?=
 =?us-ascii?Q?83N+mJqAqxhEtC/TYJ9VQAp4By+vbWlVxppDRG7TEa1amZj4QjZJ6LBbqrkv?=
 =?us-ascii?Q?nK1jW/AC9NWj/l2ziKRiATZJGTok+hYiXG4aXK4CCM9NwRHX/tXJAdVmpJGQ?=
 =?us-ascii?Q?zf89rTqobZxP4X1FNeYaJ+sq0CDrlRg=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e9713f-322d-4a9e-abc8-08da2c6c522d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2022 18:48:17.2536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F8CqoUX0sbsZJXuzX0P9vk7ICbBEyCDsGs7kxfdogBMbaaHg/fB331eDIQpf3nV1mi7UO42TkmxcdyU8oaaiXyDlIAVMfsk0MksxCmMEhGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5765
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_114827_212311_E32AEED6 
X-CRM114-Status: GOOD (  23.84  )
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



> -----Original Message-----
> From: Biju Das
> Sent: 02 May 2022 14:10
> To: Biju Das <biju.das.jz@bp.renesas.com>; Michael Walle
> <michael@walle.cc>
> Cc: Chris Paterson <Chris.Paterson2@renesas.com>; biju.das@bp.renesas.com;
> geert+renesas@glider.be; linux-mtd@lists.infradead.org; linux-renesas-
> soc@vger.kernel.org; miquel.raynal@bootlin.com; p.yadav@ti.com; Prabhakar
> Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>; richard@nod.at;
> tudor.ambarus@microchip.com; vigneshr@ti.com
> Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
> 
> > Subject: RE: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > flash
> >
> > Hi Michael Walle,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [RFC] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> > > flash
> > >
> > > >  drivers/mtd/spi-nor/Makefile  |  1 +
> > > >  drivers/mtd/spi-nor/core.c    |  1 +
> > > >  drivers/mtd/spi-nor/core.h    |  1 +
> > > >  drivers/mtd/spi-nor/renesas.c | 57
> > > > +++++++++++++++++++++++++++++++++++
> > >
> > > Please put the flash in atmel.c. There are all the Atmel/Adesto/now
> > > Renesas flashes.
> >
> > OK.
> >
> > >
> > > > +static const struct flash_info renesas_nor_parts[] = {
> > > > +	{ "at25ql128a", INFO(0x1f4218, 0, 64 * 1024, 256)
> > > > +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) }, };
> > >
> > > I suppose this flash supports SFDP. Therefore,
> > > 	{ "at25ql128a", PARSE_SFDP },
> > > should be enough.
> >
> > OK. I see some changes related to this in your next mail.
> >
> > >
> > > I see that the 0x1f42xx IDs are also used for the at25sl series.
> > > Could you shed some light to what the differences are? Are they
> > > compatible, do we have to distiguish between them?

For AT25QL128A flash,

0x1F:- Manufaturer
0x42:- Memory Type
0x18:- Capacity

I guess, if there is any at25sl128 flash chip, then the Capacity will be same for both the flash.

Cheers,
Biju


> > >
> > > Last, for a new flash submission we require a SFDP dump. See [1].
> > >
> > > [1]
> >
> 
> Please find xxd output.
> 
> biju@biju-VirtualBox:/tftpboot/RZ-G2UL$  xxd -p sfdp
> 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> ffffffffffffffff501650190000ffff
> 
> > Please find the output, I did n't have xxd installed on my rootFS, so
> > used hexdump.
> >
> > root@smarc-rzg2ul:~# hexdump
> > /sys/devices/platform/soc/10060000.spi/rpc-
> > if-spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > 0000000 4653 5044 0106 ff01 0600 1001 0030 ff00
> > 0000010 001f 0201 0080 0100 ffff ffff ffff ffff
> > 0000020 ffff ffff ffff ffff ffff ffff ffff ffff
> > 0000030 20e5 fff1 ffff 07ff eb44 6b08 3b08 bb80
> > 0000040 fffe ffff ffff ff00 ffff eb42 200c 520f
> > 0000050 d810 ff00 6233 00d5 2984 ce01 a1ec 3d07
> > 0000060 757a 757a a2f7 5cd5 f619 ff1c 10e8 80c0
> > 0000070 ffff ffff ffff ffff ffff ffff ffff ffff
> > 0000080 1650 1950 0000 ffff
> > 0000088
> > root@smarc-rzg2ul:~# md5sum
> > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> > 23e3ec56b5b8f986d0488ba4727239dd
> > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > spi/spi_master/spi1/spi1.0/spi-nor/sfdp
> >
> > root@smarc-rzg2ul:~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > spi/spi_master/spi1/spi1.0/spi-nor/jedec_id
> > 1f4218
> > root@smarc-rzg2ul:~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > spi/spi_master/spi1/spi1.0/spi-nor/partname
> > at25ql128a
> > root@smarc-rzg2ul:~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-
> > spi/spi_master/spi1/spi1.0/spi-nor/manufacturer
> > renesas
> > root@smarc-rzg2ul:~#
> >
> >
> > >
> > > > +static void renesas_nor_default_init(struct spi_nor *nor) {
> > > > +	nor->flags |= SNOR_F_HAS_LOCK;
> > >
> > > Did you test locking?
> >
> > No, I haven't tested locking. Will remove it.
> >
> > Cheers,
> > Biju

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
