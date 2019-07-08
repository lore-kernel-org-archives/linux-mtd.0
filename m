Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EBB7C606AF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33B7C2064A
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 12:19:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LzDs4eWt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Kk9AMk7U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33B7C2064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5U1uzDE6FEyxjUOWTaiXyhYaiDgH5M/Bn7Ik+teA1s=; b=LzDs4eWt40VqWe
	KBfDleHOVGvZljVpCVQtDQVdE2VuGmEcdMxj/92TwkFAwGGZqKYkTlEV7kH/odrZJovncQLGUDmff
	4YP6dkosQIkfQCM8c5STZQLrU7NeV4j1j1hrP5cdnoqO/GpX1NdWCmm7bhtnAu8czmt1yxsSn7Cgr
	enl3bFpdElSpaIl2bcuPs+in6I9U9VQAaV3psMiSiSwvdcz+78wRaz70CZQlK7MdOd66ZGbMbRADE
	M3fmXB9AYTywKypd29qrnajTRKy6AzpAMs+n0gATy3nw0DYVJWkSI2kCdAET5o5Lln6pWFR8kRfIF
	stDtK1SDLKcQ0EAni0Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkSbn-0006GM-DY; Mon, 08 Jul 2019 12:19:03 +0000
Received: from mail-eopbgr680067.outbound.protection.outlook.com
 ([40.107.68.67] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkSbf-0006Fw-NL
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6RqTV19T+ba/HSxncKC7fuW0LWisj0ZPdvgu9p0rYP8=;
 b=Kk9AMk7USxOA6VYmhRpQsSw9N4dOa//zI6RwKwn4V+gYwd+Akfs/k0zeXmCKw3XZgyleITIV1mPWijhYGykUHpvCboMWBRRxcZMsbI4EFgn3MivKLOB8ZXeLKtlgTJxHN4Welfd9eg516rPbyoeidyhLtUOf/aoqoo7U5lLzN4o=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB5884.namprd02.prod.outlook.com (20.179.68.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 12:18:50 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2052.020; Mon, 8 Jul 2019
 12:18:50 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Naga Sureshkumar Relli <nagasure@xilinx.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Topic: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Index: AQHVKxEOKM99KajnN0G2IiFegkrxG6atgBaAgABKdoCAAAOHgIAABNvwgAAFfoCAAAE2wIAAA0eAgAABfeCAEtCbgA==
Date: Mon, 8 Jul 2019 12:18:50 +0000
Message-ID: <DM6PR02MB4779F9AA8C6E4391CBF7906EAFF60@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190626084807.3f06e718@collabora.com>
 <DM6PR02MB47796E3306C166A91E0BAE91AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626132715.6128d8b1@collabora.com>
 <DM6PR02MB4779D347620E88BDB943DEB4AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626140417.440cf762@collabora.com>
 <DM6PR02MB4779B5C815FB4DAF33EF4996AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626142021.484c4fd8@collabora.com>
 <DM6PR02MB477919D28FDC063894C3CF50AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
In-Reply-To: <DM6PR02MB477919D28FDC063894C3CF50AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58b37a04-19ea-4f6f-3d39-08d7039e6f97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB5884; 
x-ms-traffictypediagnostic: DM6PR02MB5884:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR02MB5884D5A4917FBD28611EC8CFAFF60@DM6PR02MB5884.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(13464003)(199004)(189003)(76116006)(5660300002)(73956011)(52536014)(81166006)(66446008)(186003)(14454004)(64756008)(6246003)(86362001)(66946007)(476003)(81156014)(66476007)(478600001)(8676002)(966005)(66556008)(26005)(76176011)(2906002)(71200400001)(8936002)(4326008)(25786009)(7696005)(9686003)(55016002)(71190400001)(66066001)(6506007)(486006)(53546011)(3846002)(316002)(6306002)(7416002)(6116002)(33656002)(99286004)(229853002)(68736007)(54906003)(305945005)(446003)(53936002)(74316002)(102836004)(110136005)(7736002)(256004)(14444005)(11346002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5884;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nsb6i9Tfj7EeJaxoyBTLGbhG6soLOTI4G+fEfeFXZDh9DFb93U+K4M3l7keE4Re8O+KR+1Rzfu9/o7OVUGgwDkI7RX/NxuWI7PNJouGX42UktZY+rLMl2VHVy/aRlIv/Kt6db14hlq/V+8JQmvXZQNS28cdDku18cw9WfrJjrdaZ9h8lyomg2wO5LLwyL3RsQUlhgtrjpOg4pDRA4ufQRUr8PLVEKI9docnqEjStga6x5+EjEBN1JQl6hXbqIns0YChabH8tBF2EiWelQl13AHQj6vxvBz9X9PiBNSXCexjfdU/JFdv1UjSCbmwi3fiS3d2Mkx9pOaFWnc3gnYmDHc0T9KVRs+qy2kLR/K77ekSX4QkQhk+xIk/4wupm2WGATdGtbNcfH/h973vgaUGSmAWbiw4ExtbrNGrOzuzVRX4=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b37a04-19ea-4f6f-3d39-08d7039e6f97
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 12:18:50.2836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5884
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_051855_767979_B879D52C 
X-CRM114-Status: GOOD (  28.20  )
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
Cc: "vigneshr@ti.com" <vigneshr@ti.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "helmut.grohne@intenta.de" <helmut.grohne@intenta.de>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

> -----Original Message-----
> From: linux-mtd <linux-mtd-bounces@lists.infradead.org> On Behalf Of Naga Sureshkumar
> Relli
> Sent: Wednesday, June 26, 2019 6:04 PM
> To: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: vigneshr@ti.com; bbrezillon@kernel.org; helmut.grohne@intenta.de; richard@nod.at;
> linux-kernel@vger.kernel.org; marek.vasut@gmail.com; yamada.masahiro@socionext.com;
> linux-mtd@lists.infradead.org; miquel.raynal@bootlin.com; computersforpeace@gmail.com;
> dwmw2@infradead.org
> Subject: RE: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over write
> driver's read_page()/write_page()
> 
> Hi Boris,
> 
> > -----Original Message-----
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Sent: Wednesday, June 26, 2019 5:50 PM
> > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > marek.vasut@gmail.com; vigneshr@ti.com; bbrezillon@kernel.org;
> > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not
> > over write driver's read_page()/write_page()
> >
> > On Wed, 26 Jun 2019 12:12:47 +0000
> > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> >
> > > Hi Boris,
> > >
> > > > -----Original Message-----
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Sent: Wednesday, June 26, 2019 5:34 PM
> > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > > > marek.vasut@gmail.com; vigneshr@ti.com; bbrezillon@kernel.org;
> > > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > > linux-kernel@vger.kernel.org
> > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do
> > > > not over write driver's read_page()/write_page()
> > > >
> > > > On Wed, 26 Jun 2019 11:51:12 +0000 Naga Sureshkumar Relli
> > > > <nagasure@xilinx.com> wrote:
> > > >
> > > > > Hi Boris,
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > Sent: Wednesday, June 26, 2019 4:57 PM
> > > > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > > > richard@nod.at; dwmw2@infradead.org;
> > > > > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > > > > vigneshr@ti.com; bbrezillon@kernel.org;
> > > > > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > > > > linux-kernel@vger.kernel.org
> > > > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron:
> > > > > > Do not over write driver's read_page()/write_page()
> > > > > >
> > > > > > On Wed, 26 Jun 2019 11:22:33 +0000 Naga Sureshkumar Relli
> > > > > > <nagasure@xilinx.com> wrote:
> > > > > >
> > > > > > > Hi Boris,
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > > > Sent: Wednesday, June 26, 2019 12:18 PM
> > > > > > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > > > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > > > > > richard@nod.at; dwmw2@infradead.org;
> > > > > > > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > > > > > > vigneshr@ti.com; bbrezillon@kernel.org;
> > > > > > > > yamada.masahiro@socionext.com; linux-
> > > > > > > > mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > > > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand:
> > > > > > > > nand_micron: Do not over write driver's
> > > > > > > > read_page()/write_page()
> > > > > > > >
> > > > > > > > On Mon, 24 Jun 2019 22:46:29 -0600 Naga Sureshkumar Relli
> > > > > > > > <naga.sureshkumar.relli@xilinx.com> wrote:
> > > > > > > >
> > > > > > > > > Add check before assigning chip->ecc.read_page() and
> > > > > > > > > chip->ecc.write_page()
> > > > > > > > >
> > > > > > > > > Signed-off-by: Naga Sureshkumar Relli
> > > > > > > > > <naga.sureshkumar.relli@xilinx.com>
> > > > > > > > > ---
> > > > > > > > >  drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
> > > > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > > b/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > > index cbd4f09ac178..565f2696c747 100644
> > > > > > > > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > > @@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip
> *chip)
> > > > > > > > >  		chip->ecc.size = 512;
> > > > > > > > >  		chip->ecc.strength = chip->base.eccreq.strength;
> > > > > > > > >  		chip->ecc.algo = NAND_ECC_BCH;
> > > > > > > > > -		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > > > > > -		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> > > > > > > > > +		if (!chip->ecc.read_page)
> > > > > > > > > +			chip->ecc.read_page =
> > > > > > > > > +micron_nand_read_page_on_die_ecc;
> > > > > > > > > +
> > > > > > > > > +		if (!chip->ecc.write_page)
> > > > > > > > > +			chip->ecc.write_page =
> > > > > > > > > +micron_nand_write_page_on_die_ecc;
> > > > > > > >
> > > > > > > > That's wrong, if you don't want on-die ECC to be used,
> > > > > > > > simply don't set nand-ecc-mode to "on- die".
> > > > > > > Ok. But if we want to use on-die ECC then you mean to say it
> > > > > > > is mandatory to use
> > > > > > micron_nand_read/write_page_on_die_ecc()?
> > > > > >
> > > > > > Absolutely, and if it doesn't work that means you driver does
> > > > > > not implement raw accesses correctly, which means it's still buggy...
> > > > > I agree. But let's say, if there is a limitation with the
> > > > > controller. Then it is must to have this
> > > > check right?
> > > > > I mean, for pl353 controller, we must clear the CS during the
> > > > > data phase, hence we are splitting the Transfer in the pl353_read/write_page_raw().
> > > > > +	pl353_nand_read_data_op(chip, buf, mtd->writesize, false);
> > > > > +	p = chip->oob_poi;
> > > > > +	pl353_nand_read_data_op(chip, p,
> > > > > +				(mtd->oobsize -
> > > > > +				PL353_NAND_LAST_TRANSFER_LENGTH),
> > false);
> > > > > +	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> > > > > +	xnfc->dataphase_addrflags |= PL353_NAND_CLEAR_CS;
> > > > > +	pl353_nand_read_data_op(chip, p,
> > PL353_NAND_LAST_TRANSFER_LENGTH,
> > > > > +				false);
> > > > > As the above sequence is needed even for raw access, PL353 is
> > > > > unable to use the on_die_page
> > > > reads.
> > > >
> > > > This "de-assert CS on last access" logic should be done in the
> > > > exec_op() implementation. I also wonder how that works for
> > > > operations that don't have data cycles. Oh, BTW, most chips are
> > > > CE-don't-care, which means you can assert/de-assert CS on each
> > > > read_data_op() without
> > any issues.
> > > Yes, we can assert/de-assert CS on each read/write_data_op().
> > > But what about transfer length splitting?
> > > +	p = chip->oob_poi;
> > > +	pl353_nand_read_data_op(chip, p,
> > > +				(mtd->oobsize -
> > > +				PL353_NAND_LAST_TRANSFER_LENGTH), false);
> > > +	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> > > This should be done as a part of pl353_raw_read/write() right?
> >
> > Are you sure you need to do that, and if that's the case, do you have an idea why this is
> needed?
> > Is this "read last 4 bytes separately"
> > thing is needed, I suspect it's needed for any kind of input-data cycles, not just page reads.
> Yes. It is needed. This is Limitation in the HW, need to handle last 4 bytes separately for both
> page read/writes
Just wanted to know, is this fix OK?

Regards,
Naga Sureshkumar Relli
> 
> Regards,
> Naga Sureshkumar Relli
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
