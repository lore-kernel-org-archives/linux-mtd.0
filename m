Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE140C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:35:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C2BB2082F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DqV6tyqM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="QBE4DGgO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C2BB2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l60mCBNg89GbobRf6yHsLF/Inm8fCdMNBihwzlPApik=; b=DqV6tyqM4a8RW/
	pZXF3/UE4kFVxJyEp2PzUu/uKvSZTyp25Hbjv47T8orMDf+83J4xq0y/v5D85Ioo1E3/Rj6w9pcg+
	Il62g3/RZMfOqMoscd5A4wI2k4I/2gy+TtfGCX6h3GLS6yRpCtT8awZzN8nEsOhQADkjfvxlzVMwo
	WRr+fjZ0WlYR0WOCpK7jfZQE2iDLYDVIq8FM1n7ZtqXcN/IPVW1z9jEYrCcS0uIz2qWkotZbkxiGy
	WetH8/8Tlou+h8aZGiX6VMPZRPPu4eHnourbhHZJ2SS/AoENcicRx98FhuseYXDjteFCak/QJikWL
	vbafACJgCzOAhvFhrrWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i02QG-0006BH-8I; Tue, 20 Aug 2019 11:35:32 +0000
Received: from mail-bl2nam02on0613.outbound.protection.outlook.com
 ([2a01:111:f400:fe46::613]
 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i02Nz-0002vL-Ho
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 11:33:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+/OgwD+AK83zJefGiEBY2e4gefaYPr2W6piELmLgYrF2WcDY7hteEoiyYDUdZwDRnNwj2J03RxOJAdpP6DnxguMWfOTBsKdU7VYSWwLHiEveItR6UTIkOeMwTMV9b+4jZZXDTPkgtQ9Ffse9ZoNQaOsbJYSs26Z9kk96e4rXMeu0CD79V6oxLoY7D8ASWQKEpOUGTUmUaRAXctFqMSIlAJ2lSrIHzRhXChAB6X6rEEPpqtYYQYsncePm1W5izNMvmJQlr5k646YLxLFx6sZ1rwxSqfLx22t7wOkMMDFxeyydAODY7o5lWLqjPLMBRfSnEjYKAVgSMYuWso9GTE+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqUga6gzvx3Ld6riJjQRdeYZv43uFkrzBh6z/XPhxCg=;
 b=nvdI48a1DHc83ZREunhpok87qzF26+jiB5VL3P1AEIvFwSTPkaJLwPEC6u+EF84LDwIpzSmpjFsqYud6s0C2+QFnmqxBMyEaqY4Oe6853+Ri4vi/Ggxlc7qckCoPnL85/bKMtEzTe6uiCdWDDmRuWJbhyUxrV/pKU4xUoiX5vgfFSBM98xWsPGLuwhVYktko0Ti7JcGnpPevmXvlBZdLfozsVStxQHwc2yRmJxw5QYhc93cfVeA/uRJw7q4xn9lybdudeWKvR4qwdKTq0ycLuboK92xX6ePsMKme7eOjVp6nnyZjYBElV2u9lnGUGMwkEjlr8X4lGa9FGs1oOrWrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqUga6gzvx3Ld6riJjQRdeYZv43uFkrzBh6z/XPhxCg=;
 b=QBE4DGgOAP7rhmGUE3TCIqOrIvNayksSJIOmloaChMAhJoJEaQaneVgo4GwD1jgaOsciMb58ZndydNgT2dMRz+Ftar0DAhrjZw5woeZHG9FCNCM1Tucz4UO+f2/LkMsesmMkSsC+7GTpFFrFtJHCYyWjoNhtNtfooBZMSuoqQlc=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5904.namprd08.prod.outlook.com (20.179.98.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Tue, 20 Aug 2019 11:33:09 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::7548:c632:9c57:9252]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::7548:c632:9c57:9252%6]) with mapi id 15.20.2178.016; Tue, 20 Aug 2019
 11:33:09 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: 'Marco Felsch' <m.felsch@pengutronix.de>, 'Miquel Raynal'
 <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [PATCH] mtd: spinand: micron: add support for
 MT29F1G01AAADD
Thread-Topic: [EXT] Re: [PATCH] mtd: spinand: micron: add support for
 MT29F1G01AAADD
Thread-Index: AQHVVmaV63HICPQYmEm11d6StXk5IacCd8sAgAAR6oCAAQ1oAIAAT07wgAACguA=
Date: Tue, 20 Aug 2019 11:33:09 +0000
Message-ID: <MN2PR08MB5951FA28B34407D8614F3E28B8AB0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
 <20190819133042.23jpf3eap2u5teuo@pengutronix.de>
 <20190819163449.6e62e6a5@xps13>
 <20190820063904.xg32xtdt6uf3vl77@pengutronix.de>
 <MN2PR08MB59515F78DFA89350B9A3E6D6B8AB0@MN2PR08MB5951.namprd08.prod.outlook.com>
In-Reply-To: <MN2PR08MB59515F78DFA89350B9A3E6D6B8AB0@MN2PR08MB5951.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.80.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e34dcc06-3670-4648-2806-08d725622d4e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR08MB5904; 
x-ms-traffictypediagnostic: MN2PR08MB5904:|MN2PR08MB5904:|MN2PR08MB5904:|MN2PR08MB5904:
x-ms-exchange-transport-forked: True
x-ms-exchange-purlcount: 5
x-microsoft-antispam-prvs: <MN2PR08MB590468DAD1D7F3C0C7DA653FB8AB0@MN2PR08MB5904.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 013568035E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(189003)(199004)(99286004)(66946007)(64756008)(66066001)(229853002)(6306002)(6436002)(53546011)(8676002)(6506007)(53936002)(2906002)(256004)(14444005)(76116006)(6116002)(3846002)(316002)(7696005)(66446008)(54906003)(186003)(478600001)(45080400002)(86362001)(110136005)(81166006)(8936002)(71190400001)(66574012)(71200400001)(76176011)(52536014)(2940100002)(81156014)(5660300002)(66476007)(66556008)(33656002)(966005)(107886003)(4326008)(486006)(74316002)(25786009)(55236004)(102836004)(55016002)(446003)(305945005)(9686003)(11346002)(476003)(6246003)(26005)(7736002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5904;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: j5jw/X8+GimgejqyiRJ5zsJxn0OFjiIDsEG9q0rIIkIh0ByEFYbKWDoMqfYFziuxJx1QRpAL/HWDug4wu+ry6kHC9aCc5+kp3bQL8ShvoPHmlD+on0cGXAZBSkxJh1/GmYPxIJHwS52FtifB7hCYFP2SAeH/qjNdh52Weq1x2yfe2ULySCnR+A6Qp81acqkoRIFT3JGLwnNWZXSEBA96/8P35n4OMsmfffetGt+19hyUDSuMJqcGrWIoHB8CqNl2etXg861NKI5fKmeey1OjmNzz3CCRPthhAFVvS0V+NeTfnE+psxAg0YuGUbNG6PYUwgw8SoKsZAnF6s0shm/x8Lp3WcwoRkRi4AE+a4Gns8o+ffHnz/HHgP1PtgRGwMxuX66Z/A2oM1bmsCT0aD7z+F04npaXuOSERJT1fVYEmcM=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e34dcc06-3670-4648-2806-08d725622d4e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2019 11:33:09.1914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HTUj3UUX7Fn1E9jnFhRhtUnzMCLU3Zy+CdPzeSoKbF2ulmS9p8JHHtvbXCh+Yd01Rc6qA5alSDwBD5gPYTdd6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5904
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_043311_715565_39C2B915 
X-CRM114-Status: GOOD (  26.98  )
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
Cc: "'bbrezillon@kernel.org'" <bbrezillon@kernel.org>,
 "'richard@nod.at'" <richard@nod.at>,
 "'frieder.schrempf@kontron.de'" <frieder.schrempf@kontron.de>,
 "'marek.vasut@gmail.com'" <marek.vasut@gmail.com>,
 "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>,
 "'kernel@pengutronix.de'" <kernel@pengutronix.de>,
 'Peter Pan' <peterpandong@micron.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Marco,

> =

> >
> > Hi Miquel,
> >
> > On 19-08-19 16:34, Miquel Raynal wrote:
> > > Hi Marco,
> > >
> > > Marco Felsch <m.felsch@pengutronix.de> wrote on Mon, 19 Aug 2019
> > > 15:30:42 +0200:
> > >
> > > > Hi Miquel,
> > > >
> > > > On 19-08-19 10:17, Miquel Raynal wrote:
> > > > > Hi Marco,
> > > > >
> > > > > Marco Felsch <m.felsch@pengutronix.de> wrote on Wed, 14 Aug
> 2019
> > > > > 10:22:32 +0200:
> > > > >
> > > > > > The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
> > > > > > capacity of 1Gb and supports 4-bit ECC. The datasheet can be fo=
und
> > [1].
> > > > > >
> > > > > > Unfortunatly the linked device is marked as EoL, but I will exp=
ect
> that
> > > > > > the MT29F1G01AAADDH4-ITX behaves the same way.
> > > > > >
> > > > > > [1]
> >
> https://nam01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdata
> >
> sheet.octopart.com%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.co
> >
> m%7C420c4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d5
> >
> 63c806f%7C0%7C1%7C637018799689823280&amp;sdata=3DwZHbyU68pOT%2Bs
> > 3lrcuEk2FqG0DDggzLVpKpMDcYink0%3D&amp;reserved=3D0 \
> > > > > >       MT29F1G01AAADDH4-IT:D-Micron-datasheet-11572380.pdf
> > > > > >
> > > > > > Cc: Peter Pan <peterpandong@micron.com>
> > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > ---
> > > > > >  drivers/mtd/nand/spi/micron.c | 68
> > +++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 68 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/mtd/nand/spi/micron.c
> > b/drivers/mtd/nand/spi/micron.c
> > > > > > index 7d7b1f7fcf71..9d63450afc69 100644
> > > > > > --- a/drivers/mtd/nand/spi/micron.c
> > > > > > +++ b/drivers/mtd/nand/spi/micron.c
> > > > > > @@ -34,6 +34,18 @@ static
> > SPINAND_OP_VARIANTS(update_cache_variants,
> > > > > >  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> > > > > >  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > > > >
> > > > > > +static
> > SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0,
> > 1, NULL, 0));
> > > > > > +
> > > > > > +static
> > SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> > > > > > +
> > > > > > +static
> > SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > > > > +
> > > > > >  static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, =
int
> > section,
> > > > > >  					struct mtd_oob_region
> > *region)
> > > > > >  {
> > > > > > @@ -90,6 +102,52 @@ static int
> > mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
> > > > > >  	return -EINVAL;
> > > > > >  }
> > > > > >
> > > > > > +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd,
> int
> > section,
> > > > > > +					struct mtd_oob_region
> > *region)
> > > > > > +{
> > > > > > +	if (section > 3)
> > > > > > +		return -ERANGE;
> > > > > > +
> > > > > > +	region->offset =3D (section * 0x10) + 8;
> > > > >
> > > > > Any reason to use hex here?         ^
> > > > >
> > > > > If not I would prefer decimal numbers.
> > > >
> > > > Since the datasheet describe it in hex to.
> > > >
> > > > Can you have a look on [1] table 11? May we do something like:
> > > >
> > > > 	region->offset =3D (section * 0x10) + 0x8;
> > > >
> > > > [1]
> >
> https://nam01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdata
> > sheet.octopart.com%2FMT29F1G01AAADDH4-IT%3AD-Micron-datasheet-
> >
> 11572380.pdf&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%7C420c
> >
> 4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c806f%7
> >
> C0%7C1%7C637018799689823280&amp;sdata=3DXaTab%2BxmXRmz7jxwINT2B
> > BqAV0aRlyR1EGDz%2BktS%2BQs%3D&amp;reserved=3D0
> > > >
> > > > >
> > > > > Otherwise looks fine.
> > > >
> > > > Anyway I can change the above code to use only decimal values if you
> > > > like it more.
> > >
> > > I think it is better to reserve hexadecimal values to register
> > > operations. Please translate into decimal.
> >
> > Okay. Just one last question. What is the common way to go to specify
> > the free area? By this I mean that the NAND has two areas to store the
> > user metadata calling it 'user metadata I' and 'user metadata II'. 'user
> > metadata II' isn't ecc protected so I skip them. But the current
> > supported chip does not skip the user metadata area which isn't
> > protected [1] table 10.
> >
> > [1] https://www.micron.com/~/media/documents/products/data-
> > sheet/nand-flash/70-series/m79a_2gb_3v_nand_spi.pdf
> >
> =

> I have written patch to make helpers to be more generic.
> They work for Micron's M78A, M79A and M70A series SPI NANDs.
> =


I missed link in last email, here it is.

http://patchwork.ozlabs.org/patch/1134724/


> =

> Regards,
> Shiva
> =

> > Regards,
> >   Marco
> >
> > >
> > > Thanks,
> > > Miqu=E8l
> > >
> > >
> >
> > --
> > Pengutronix e.K.                           |                           =
  |
> > Industrial Linux Solutions                 |
> >
> https://nam01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww
> >
> .pengutronix.de%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%
> >
> 7C420c4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c
> >
> 806f%7C0%7C1%7C637018799689823280&amp;sdata=3Dk%2BwLO84bN9Dt02%
> > 2FJ%2BLLboEx8t29T8my7oKrchrV6bMw%3D&amp;reserved=3D0  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
> >
> > ______________________________________________________
> > Linux MTD discussion mailing list
> >
> https://nam01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists.i
> > nfradead.org%2Fmailman%2Flistinfo%2Flinux-
> >
> mtd%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%7C420c4296
> >
> ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c806f%7C0%
> >
> 7C1%7C637018799689823280&amp;sdata=3D03Qz9zc098PqOiGOIALy1PkgVNGB
> > NYqDPuctarAddGg%3D&amp;reserved=3D0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
