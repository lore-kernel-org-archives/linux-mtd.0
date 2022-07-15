Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0AFC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MnkeV8VnNYe6Jpjfy90uPr5vo/62+yD2aKcHji+PXjQ=; b=vF+rmsqs1C8TQ8
	KTAXjq67gyunxJHj0uZbpHrYL374WoONeKrMoquQOUOXUQBhn4bO/ni3D5n3Vluwz9j7eI4N2lyRu
	6hTYgj3kAUWm9jW5IkuK3vEcVmv/oeo/vBg2NpFhYdTMKH5pfIZ6Wtgg4KbrIqh/rrpwURb7Qdneb
	IsvRvyxBoJXDnuShegewGGrhjonONu2DANqP+yuEL7manPd3Aagyyzy005Kxpex8XtWCk8lRdBW7V
	OK5ExlF8DffsLHWZsRMZ6i3K6lKmHMdXnR8flDCNPzt1q5jIaZ62CURQJRq/Un5cPhcs6l6Dp8Jwp
	f64+KhLDmmAl2nuwsjwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIgz-006NuM-Hb; Fri, 15 Jul 2022 10:37:05 +0000
Received: from mail-tycjpn01on2101.outbound.protection.outlook.com ([40.107.114.101] helo=JPN01-TYC-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIgv-006NsF-0y; Fri, 15 Jul 2022 10:37:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bmKc3vOXfse/zaJu/xge5QZ+wC5qMpyh10pzSfwnC5gxEyq2QytScdjcfZ9/OXjJcWTqJbEDJaXrFDiJC5uHLD04WThLgbErDpWZoI8aNsCwIPMXEXRn2TmcfFHCS2RbWB4rESQv2Ep2jCrlVh4r/J6T/hw6Hrex50HMOQSl6j/uLcvJ3PHV6SJGscArXI5Nj5KbG5cGvKRzLfo8+yMMo+NCQdvfOmUC4dx7Dg6pCTjh7tsA4vhHUg0xUR65lfB/CmhbMGJX3887OHPu4yUeOGuXkIiy8JmsofhbZ6OApsJrQBFZCjdPjcjSINqTxuhgINaxkSmYUCbjtvPQMJSHjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3HWN3p4Dja6f9R7iipENE0AmugW8YGJcr0yocg4STY=;
 b=Y1ngeRcy/yGbzP8OfWSpesTQFTiIqtpeD6QPIpi5ppnC411uQ2KzjXBilgTVUOzxlqb0kRzgdgxVNxd4HjiixNvd9qylffs6VzuF3G6LoKAhiSuLycd/ewONHqgVJB/mPu1DCG1rokiQ3Qh2bl+h2NPWYL4mWlTye0a+qzbx85qZ1PWBFftFMOvulVU87EXPmMMbk5HRg89E2g9RUVYAa0PLNSPKxrrphiFKLqHlxn0IadtqV46pmIRt1f4qtD2j1zxNwpR+xHoYG8H5ABiBuXr3IkUKEdYRyzodcItgMnITuBRlcrKXlsYWAlV1rkXDlaRf3q3BUdgMSCMKgD60LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/3HWN3p4Dja6f9R7iipENE0AmugW8YGJcr0yocg4STY=;
 b=KCGvpmkyuDEZj/quRKpQp+21IOpqlffUjcStNNfn5P0dj+3ckaT6AhmTDqhxJYoPG6AQ5+l6MZX4bjqfS6fLGuhayaQITEbYYPosvI207zzEXR5ot+dA9Bd8H932XG7oNx4yMwdpJ58WicbxreOo60uomO7ByvTNZrrO9Ak7gLI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5584.jpnprd01.prod.outlook.com (2603:1096:400:42::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Fri, 15 Jul
 2022 10:36:51 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b046:d8a3:ac9c:75b5%4]) with mapi id 15.20.5438.014; Fri, 15 Jul 2022
 10:36:51 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Michael Walle <michael@walle.cc>
CC: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
	<p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Nicolas
 Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, "linux-mtd@lists.infradead.org"
	<linux-mtd@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju
 Das <biju.das@bp.renesas.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Topic: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor flash
Thread-Index: AQHYXlZQPGYW6VMX8kKW3TrLwGHZ2q0WPooAgGlx2YA=
Date: Fri, 15 Jul 2022 10:36:51 +0000
Message-ID:  <OS0PR01MB59221BE49B412CA2FA053716868B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220502185613.83483-1-biju.das.jz@bp.renesas.com>
 <27018c54344051e409161b7554dfa49f@walle.cc>
In-Reply-To: <27018c54344051e409161b7554dfa49f@walle.cc>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 115fb595-64df-4f33-7faa-08da664dee08
x-ms-traffictypediagnostic: TYCPR01MB5584:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wF/5ORH0vqLgtzPIE9qYX1EbvgL05s/rt/HhAGLVFnC6VxACf1VD+8woWvxG4jZWLDn6eP8z0UPsnQ3gi9Wmz6RXcsNl6Y938aB+dAdYZj5MTCyyiTTrS/6L9PjfH0XoBULparHbYv+qq1Qhe+EupBQTm2Gbnrqkc0tz/ySzxRuh0C70d1K06cPayfAsdYHqGLI+rZQorVkg3bRuyjfjalvVllgfB9SAGc1PeXcu4lpjlve/Ohzt5MbseGEtzRYoTcFDdGKRc8FvI8YQZX5NkUIU5SCxVVcHOh+eYynjsy2qrVsj4GKGnLojwfodrbI8ofbwvjARecIOY2Zdvvmx7lBKc6vY6ENPQCMwNSGSKTWxe0cRhbUbSRkBDhM3u5zAuB6dL/EstzQpRLAu+CjNEZVXjt88pDTmRQn/zOVFECYwYp/t3mYAoSwrFoMOruaimcuEsirlIlmE+QBa5hqU7ponr2+k6hw0fS2MQtbHUBxo7lA3MTby2JTP7OXYkiz+0K1OSymEhLQov0TO9Bl5bvyy3DZaDtMzRZFs7MYObvi6pzjigTQ7KiWJYvJQ+zzsOpjDLNLW/XzeL3/VvQpR8PAIIjOKKUHDiJSFNduKV2DPTG/s37cAgkGWtQl4WD6z7zilpOOktt7BWuJ8caxubdBdwJpycKzqDUpYE4jO6xtBGnDT1Yj5bVr+kwC/Hpo4b8d2d71Eo4UHwRQgwHg8ouRW3P1CVVFKPrXpFILB1x8GX8hbyOce93RVgh6VeIjpilOmYvbt05TAPZtG0hWRNpIrAA4AS83EkkuvUJ4Chv+O5kiyR+0Tng1N+uVErIWW
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(71200400001)(478600001)(38100700002)(64756008)(66946007)(6916009)(6506007)(76116006)(33656002)(316002)(26005)(66476007)(9686003)(54906003)(186003)(66556008)(7416002)(4326008)(41300700001)(2906002)(52536014)(8676002)(8936002)(55016003)(7696005)(5660300002)(38070700005)(83380400001)(66446008)(122000001)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?pZftCKzLODDDCQ9Jma2iSOTyKR0Dk/4WOP5aLUBsd53avRtkbqhEzmxVvzHt?=
 =?us-ascii?Q?WJMJiI9qrY7Vtb480cXkD1ZOH4UEJ40Wro/hjiQ+hfKg/itMBz2y1Zkj7kNd?=
 =?us-ascii?Q?bq3DCSTPFcFa91oPpY2KnlUtHbPS6vgpPcY1D3F9QtKA3TUsatfPZsgcfKtS?=
 =?us-ascii?Q?lbm3nPkjsZOIdHoK7psDgiTL3jN5PLXyrBU+twtbS44ZilJ6aV4QLgWW0rlH?=
 =?us-ascii?Q?x6IeQoQ277AnSccP3e+mO0GA2o2snlVZSQceDoz5Ui1PwHlfmy5OT7pm1Q25?=
 =?us-ascii?Q?s7pX6MgD7E8zAnWazYng+Q7ygmHvcQiyJky5HTuVO8z/rovPqDLIGCM4lQM/?=
 =?us-ascii?Q?qlj75UG9c2kpP9gPDd17v3xu3r/qDfytHY61xDc28aSMIOvkiLN9FbGsfZxt?=
 =?us-ascii?Q?wblSbdfRIG2E1aDNYm9l4RytgPLQErkYkyTEKk7aUqr+N8rV1dKzPQsvhpum?=
 =?us-ascii?Q?orSfEWU52O5D/xaQxBMFNtle28Sv7jHjg9Sjp4g2WjlIinnvXtdGo1lWztfO?=
 =?us-ascii?Q?DpvKAkM/rCLda3f+BgPdsW6wlUPlhUocoWqefLdmuQ419hoBIkJmo1G6w18R?=
 =?us-ascii?Q?ktQvVYMvQyT5oApdbf7aMMYAqGi3a6dPsTbUukm3CauKc24Mp1wkLuXtlRLs?=
 =?us-ascii?Q?dJXN8L8fjJXdRqYAUyQKVe2WSsik4fOptACqIdhyUROwcyvHUEPbVkMHdLrb?=
 =?us-ascii?Q?iX3E+oIUil8KUoYegcptuw1Bxw/gtaUwg2qZj0QEzQFlQEgta2r35UX1Il6s?=
 =?us-ascii?Q?smQTVr+z++vxtcpSBCAH+7ux/+087BOVsdbWlW+eQei1BEAU0sdtrWyYsNTc?=
 =?us-ascii?Q?OQNdNnMFAbg5ek1Jqs/l+okeXp3SQ85u316d32I8RwkMKgPeIn2IfqatdVAd?=
 =?us-ascii?Q?YZUYamYSjMQwr2agH3jkSgC//sU6EAFJ9RRUtCxW+K5+1SONHv2IaLSWE6zb?=
 =?us-ascii?Q?PUWpUKnNPd5vS1MBSK82i5ddYIoEQZOgDMM/U9vLwtC9/cT6ixm0I+QAvnvl?=
 =?us-ascii?Q?I0yUsqKSxG1qp47eimKD55g8Lu4gZFPZEdFXzl0S1Z5E7loOpcyXPAoweUI/?=
 =?us-ascii?Q?6nVi5IlYDTeVU/OqL9Vf79qi0qEf35MBEidMoCjGf41htDhQIiww1i8t8U3S?=
 =?us-ascii?Q?tY447jP0zfRbM6EmgmJPwNTHK/g5GcwQU/Nv8NEbdpyT9C7B9nbQPQmm/V1W?=
 =?us-ascii?Q?HbtrffZ9lvW1alS9wbPZOxv+5K3lW1/wSDGWtw+0IykhqWCf1VdI1VdcnG+M?=
 =?us-ascii?Q?WTiQmBKn6F/asOhEHIkZQHokyqUmvMokHVuSnUPo8NIb3WG6vU7IX3K9Prjl?=
 =?us-ascii?Q?4nxdYJnzHnwEInhWaI6EkFOJAoLbjieGMn9cB6yLGqRfV5+uZSG15vMn6Mru?=
 =?us-ascii?Q?NML99lM1NfxmwnQYz9UQX0i9lr8dKILrsGWeZH7EiqGTXNh5QTrtUBH7BZXu?=
 =?us-ascii?Q?0tVD5Q55bQiaqFL9Cz35c1GGZahYz8DF/kj4FqXgLeKFVUXAkxwDjUr6wD8W?=
 =?us-ascii?Q?FR4Dbg8M2gRC0Xf4K9ssHxuOVMNIOF0VGBW9847oQ3coAnNz1UGTaB2Tjo32?=
 =?us-ascii?Q?ALrJbHAgErMbDlhGUPI65u1xVNnJXmU6fr/zNbkB1PXYJzuasOfLIjxPStA6?=
 =?us-ascii?Q?UQ=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 115fb595-64df-4f33-7faa-08da664dee08
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 10:36:51.7770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PUz2ugMbEtyMtlQEN1iZjqXZLVbOXotWnWCER0j5kppvKiaDHBrBgv0AWo0HRCRntr2J+EdI/6/tInQ7BsWOuwderpPxJ05bvU75bwBwocw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5584
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_033701_443265_014B90C5 
X-CRM114-Status: GOOD (  27.27  )
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

Thanks for the feedback.

> Subject: Re: [PATCH] mtd: spi-nor: Add Renesas AT25QL128A serial nor
> flash
> 
> Hi,
> 
> Am 2022-05-02 20:56, schrieb Biju Das:
> > Add support for Renesas AT25QL128A serial nor flash.
> > Details of flash chip can be found here [1]
> >
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > $  xxd -p sfdp
> > 53464450060101ff00060110300000ff1f00010280000001ffffffffffff
> > ffffffffffffffffffffffffffffffffffffe520f1ffffffff0744eb086b
> > 083b80bbfeffffffffff00ffffff42eb0c200f5210d800ff3362d5008429
> > 01ceeca1073d7a757a75f7a2d55c19f61cffe810c080ffffffffffffffff
> > ffffffffffffffff501650190000ffff
> 
> Thanks!
> 
> > :~# md5sum
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/sfdp
> > 23e3ec56b5b8f986d0488ba4727239dd
> >
> > ~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/jedec_id
> > 1f4218
> >
> > ~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/partname
> > at25ql128a
> >
> > ~# cat
> > /sys/devices/platform/soc/10060000.spi/rpc-if-spi/spi_master/spi1/spi1
> > .0/spi-nor/manufacturer
> > renesas
> >
> > RFC->v1:
> >  * Moved the flash definitions to atmel.c
> >  * Remove macro related to locking as it is untested.
> >  * Replaced INFO macro with SNOR_ID3
> >
> > RFC:
> >  *
> > ---
> >  drivers/mtd/spi-nor/atmel.c | 55
> > +++++++++++++++++++++++++++++++++++++
> >  drivers/mtd/spi-nor/core.c  |  1 +
> >  drivers/mtd/spi-nor/core.h  |  1 +
> >  3 files changed, 57 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> > index 656dd80a0be7..61cff6de7db2 100644
> > --- a/drivers/mtd/spi-nor/atmel.c
> > +++ b/drivers/mtd/spi-nor/atmel.c
> > @@ -10,6 +10,15 @@
> >
> >  #define ATMEL_SR_GLOBAL_PROTECT_MASK GENMASK(5, 2)
> >
> > +#define SNOR_ID3(_jedec_id) \
> > +	.id = { \
> > +		((_jedec_id) >> 16) & 0xff, \
> > +		((_jedec_id) >> 8) & 0xff, \
> > +		(_jedec_id) & 0xff, \
> > +	}, \
> > +	.id_len = 3, \
> > +	.parse_sfdp = true
> 
> Put that into core.h below the INFO macros.

OK. Agreed.

> 
> > +
> >  /*
> >   * The Atmel AT25FS010/AT25FS040 parts have some weird configuration
> > for the
> >   * block protection bits. We don't support them. But legacy behavior
> > in linux @@ -204,6 +213,52 @@ static const struct flash_info
> > atmel_nor_parts[] = {
> >  		NO_SFDP_FLAGS(SECT_4K) },
> >  };
> >
> > +static const struct flash_info renesas_nor_parts[] = {
> > +	{ "at25ql128a", SNOR_ID3(0x1f4218) },
> 
> Put that into the atmel list, no need for an own list.

OK.

> 
> > +};
> > +
> > +/**
> > + * renesas_nor_set_4byte_addr_mode() - Set 4-byte address mode for
> > Renesas
> > + * flashes.
> > + * @nor:	pointer to 'struct spi_nor'.
> > + * @enable:	true to enter the 4-byte address mode, false to exit
> the
> > 4-byte
> > + *		address mode.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +static int renesas_nor_set_4byte_addr_mode(struct spi_nor *nor, bool
> > enable)
> 
> Please expand the SFDP parser. This should be contained in 16th dword,
> there.

OK, Got it.

> 
> > +{
> > +	int ret;
> > +
> > +	ret = spi_nor_write_enable(nor);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = spi_nor_set_4byte_addr_mode(nor, enable);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return spi_nor_write_disable(nor);
> > +}
> > +
> > +static void renesas_nor_default_init(struct spi_nor *nor)
> > +{
> > +	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
> 
> Why is that?
> 
> > +	nor->params->quad_enable = NULL;
> > +	nor->params->set_4byte_addr_mode = renesas_nor_set_4byte_addr_mode;
> > +}
> > +
> > +static const struct spi_nor_fixups renesas_nor_fixups = {
> > +	.default_init = renesas_nor_default_init,
> > +};
> > +
> > +const struct spi_nor_manufacturer spi_nor_renesas = {
> > +	.name = "renesas",
> > +	.parts = renesas_nor_parts,
> > +	.nparts = ARRAY_SIZE(renesas_nor_parts),
> > +	.fixups = &renesas_nor_fixups,
> > +};
> 
> Not needed.

OK, will remove this and send V2.

Cheers,
Biju
> 
> > +
> >  const struct spi_nor_manufacturer spi_nor_atmel = {
> >  	.name = "atmel",
> >  	.parts = atmel_nor_parts,
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index b4f141ad9c9c..ba9f222da00b 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -1621,6 +1621,7 @@ static const struct spi_nor_manufacturer
> > *manufacturers[] = {
> >  	&spi_nor_issi,
> >  	&spi_nor_macronix,
> >  	&spi_nor_micron,
> > +	&spi_nor_renesas,
> >  	&spi_nor_st,
> >  	&spi_nor_spansion,
> >  	&spi_nor_sst,
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index b7fd760e3b47..3d2e39329079 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -511,6 +511,7 @@ extern const struct spi_nor_manufacturer
> > spi_nor_intel;
> >  extern const struct spi_nor_manufacturer spi_nor_issi;
> >  extern const struct spi_nor_manufacturer spi_nor_macronix;
> >  extern const struct spi_nor_manufacturer spi_nor_micron;
> > +extern const struct spi_nor_manufacturer spi_nor_renesas;
> >  extern const struct spi_nor_manufacturer spi_nor_st;
> >  extern const struct spi_nor_manufacturer spi_nor_spansion;
> >  extern const struct spi_nor_manufacturer spi_nor_sst;

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
