Return-Path: <SRS0=jzn5=YH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAFD7ECE587
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 12:50:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0EA220673
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Oct 2019 12:50:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aKt6Rejm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="SbW1anv2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0EA220673
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FyEC7VBUG4w3w91Ue5Kr2CnDLhHXNFsgYPw3Uv3gdY8=; b=aKt6RejmHSqBWq
	l4TTywdXW1GBmNV3XrMCF2cFKn58/2JMWjVMnYohm8+KWLyIaM4NVxKx2vzOTTNoq9MEQGOOoun2B
	jhF8EsTttiAyutmis797cl1clDhhIVaXOLfK3nSmOqlsWQXvFXg8aheUes2AZfeXB1kZRgw2+NEOV
	dTLz9dMaV+E4ZaWGbrbsrtSxB/R5AdldRlEjwTNG9OFsQ9R3v/rcRyZEXV7YeB2LwsGlCIjlMF08y
	7GE+eiD0D+NZgrtQYfxagdLKhnWljkQGGP/ra/GDM+wskBtuTGG+AEsnb91yR8BhGwJxNiQcsWSqK
	zf1ttukAYpnTNKshDMhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJznU-0006y0-07; Mon, 14 Oct 2019 12:50:00 +0000
Received: from mail-eopbgr800078.outbound.protection.outlook.com
 ([40.107.80.78] helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJznQ-0006wT-J4
 for linux-mtd@lists.infradead.org; Mon, 14 Oct 2019 12:49:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfoQsVaF5d9qmxMryRsO2eApeZfr7VPq4kzrpE75YcqOUPQBKZSq5ytBkYbZojTPMmbXoib5P3czp/gsbwgHkDyGSydUPeI2CGUPkPbuIN4ylRMEOcItjt+B+Hx8z0XkcfgC5IMHOfV1/dJBdFwtSX3hsgMoFsKVxBU+MUa+niyAwnt134/GbkJTTZj7WT9HMe8zresdxYPxAFWGHOAd5J57XfuUAyfmi7IkjzvxssRGPy20/NYKdejxPSkq9qh/TGwfSlIxxAqOVXYs9yZ49YMapxGIopLKEVK0DbuOKkXYTyNC60LUv5OgbRXA+pN13A1apmjb//Y/iEO4EqTe7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIcLvWEzrZ/wzTTIrSDbq/tcMOzaKbNx1xcSftjvWlE=;
 b=KNDXS5waPdBZuUZIl1/kTP9Ah8FiE0ruqHoCS9jrxn/H8bv/KCDWK347ay6r5zDEYCUv7kS6Ngl/q4QFWpAkWcD+69MOFSviWhHyVRuiYHlzRazqNsYu3AB42hlgeQmJzT3TzfD+gj4gmtjcJnCc5NPg8guyR0BrI+b5QTb5ndvnUypG03WJ3ykRccZ97TWFTo6u95MjcE2MZ3sUMOmTnLfsJ9SqM5PI9hv6NQAWlCAwX/OWxtPDlHuDBvn0XmxhkcwIthodJ5q9W1u51Rvry/ZudbSPRnJ9Wn6t9wrk9wICg9NFKtQPsGM555AT/ujU/RY6kKOLRjhscvgoaYlR0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=micron.com; dmarc=pass action=none header.from=micron.com;
 dkim=pass header.d=micron.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIcLvWEzrZ/wzTTIrSDbq/tcMOzaKbNx1xcSftjvWlE=;
 b=SbW1anv244kapXigvY2r8rRTmKbYoKvyf8AQZEXBZ5LNJyh/lm7jbWn8rN/W+QmxQep3sqkZrrxB6jarHf1jY2Jy59oi8BNxVSOdVzeilib5p7pdCQn3FU0gn2/kI/KRNf3NhUadLUzyRnUlrRXgbDelhR7yMBINTzGbvcRuixM=
Received: from MN2PR08MB6397.namprd08.prod.outlook.com (52.132.171.78) by
 MN2PR08MB5949.namprd08.prod.outlook.com (20.179.98.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Mon, 14 Oct 2019 12:49:50 +0000
Received: from MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::2c22:80be:713a:101f]) by MN2PR08MB6397.namprd08.prod.outlook.com
 ([fe80::2c22:80be:713a:101f%6]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 12:49:50 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: 'Boris Brezillon' <boris.brezillon@collabora.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [PATCH 6/8] mtd: spinand: micron: Turn driver
 implementation generic
Thread-Topic: [EXT] Re: [PATCH 6/8] mtd: spinand: micron: Turn driver
 implementation generic
Thread-Index: AQHVTQd5zjmLJBbahk2JUzVOEzo15qcCPhuwgEz2E4CABP4vcA==
Date: Mon, 14 Oct 2019 12:49:50 +0000
Message-ID: <MN2PR08MB6397768C0CDC1B77F8F7AE65B8900@MN2PR08MB6397.namprd08.prod.outlook.com>
References: <20190722055621.23526-1-sshivamurthy@micron.com>
 <20190722055621.23526-7-sshivamurthy@micron.com>
 <20190807120408.031b8d1b@xps13>
 <MN2PR08MB5951F13BC1D1D111681CCB4BB8A80@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20191007101337.647300e2@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <20191007101337.647300e2@dhcp-172-31-174-146.wireless.concordia.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc3NoaXZhbXVydGh5XGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMTlmZDgwMGQtZWU4MS0xMWU5LWFhMzYtOTgzYjhmNzQ1MjUxXGFtZS10ZXN0XDE5ZmQ4MDBmLWVlODEtMTFlOS1hYTM2LTk4M2I4Zjc0NTI1MWJvZHkudHh0IiBzej0iMzE0MiIgdD0iMTMyMTU1MzA5ODc2MDYzMDA2IiBoPSJRMzIrZ0NwMlNxOUdsSkZXbWJLMWloeFNXbkU9IiBpZD0iIiBibD0iMCIgYm89IjEiLz48L21ldGE+
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 694c06fc-20e9-4604-992a-08d750a5008a
x-ms-traffictypediagnostic: MN2PR08MB5949:|MN2PR08MB5949:|MN2PR08MB5949:
x-microsoft-antispam-prvs: <MN2PR08MB59493B72FBC6D82F44667E36B8900@MN2PR08MB5949.namprd08.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(199004)(189003)(6436002)(71200400001)(14444005)(256004)(71190400001)(8936002)(3846002)(186003)(102836004)(86362001)(55236004)(14454004)(9686003)(6116002)(8676002)(66946007)(81156014)(81166006)(478600001)(76116006)(6246003)(66066001)(55016002)(66476007)(66556008)(66446008)(64756008)(229853002)(316002)(7696005)(52536014)(99286004)(76176011)(7736002)(74316002)(4326008)(486006)(305945005)(7416002)(476003)(11346002)(2906002)(33656002)(6506007)(446003)(110136005)(54906003)(25786009)(5660300002)(26005)(41533002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5949;
 H:MN2PR08MB6397.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WpvOu7lmkGi/LQwHwaA2AwK2zCylmloJfgWamzbkrjeTV34vDY5vaIhpZEWpKrqH29usqJiUYZwRorS7aXfZ/raAMFH3PIj9f2tRB/l4HZIM4EXM5zDLLIqntAbbyDN+iNAfmXn3OcPu8isfCFE6UYAADzKO5ZTWY0XyKqdt+OZlVL3FpJ0t/X9/LOYqwtlUlSTHru7FB9BT82brVyLNKY915zPik955K5fvJSqPuQkZLcI9CqeBneZwn+z4CId1YiO29xZT9Bvs26gVMBc482PaJHamUyhA+JW9n3Zp5sr6Q/PMEJuAykxEMyZ7A3FNjkJLKGwMxnJMtHpzrp72Oy4KpObs1xo0tg5GHMjufFpmD6/BtekWb4hnZuGcEFhasKFhMUM73FyXCyovlHRbBN0pZvheQxveUpJHd8FGaHw=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 694c06fc-20e9-4604-992a-08d750a5008a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 12:49:50.4635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pswGM4AtS6ZfTkpSh5M/scCZGFnxE+FVGHkx7PEOYok2d7xzTuK18q+eiWwx/1tkWRb8R8W6aHp5ysnc1kZhNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5949
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_054956_784557_661871D6 
X-CRM114-Status: GOOD (  20.78  )
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
Cc: Brian Norris <computersforpeace@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 liaoweixiong <liaoweixiong@allwinnertech.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jeff Kletsky <git-commits@allycomm.com>, Chuanhong Guo <gch981213@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Thank you for the review.

> 
> On Mon, 19 Aug 2019 09:03:38 +0000
> "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com> wrote:
> 
> > >
> > > >  static int micron_spinand_detect(struct spinand_device *spinand)
> > > >  {
> > > > +	const struct spi_mem_op *op;
> > > >  	u8 *id = spinand->id.data;
> > > > -	int ret;
> > > >
> > > >  	/*
> > > >  	 * Micron SPI NAND read ID need a dummy byte,
> > > > @@ -114,16 +102,55 @@ static int micron_spinand_detect(struct
> > > spinand_device *spinand)
> > > >  	if (id[1] != SPINAND_MFR_MICRON)
> > > >  		return 0;
> > > >
> > > > -	ret = spinand_match_and_init(spinand, micron_spinand_table,
> > > > -				     ARRAY_SIZE(micron_spinand_table),
> > > id[2]);
> > >
> > > I am not sure this is the right solution. I would keep this call and
> > > overwrite what you need to overwrite with the fixup hook.
> > >
> 
> I'm definitely not comfortable with this whole "rely on ONFi
> param-page" thing. Vendors have proven to get it wrong from time to
> time, so before we do that, I'd like to make sure all currently
> supported Micron NANDs (looks like we only support MT29F2G01ABAGD, so
> that shouldn't be hard) expose the right thing there. For instance, are
> we sure the ECC layout is always the same, and if not, do we have a
> reliable way to extract that?
> 
> >
> > Then, I will have dummy structure like below.
> >
> > static const struct spinand_info micron_spinand_table[] = {
> >         SPINAND_INFO(NULL, 0,
> >                      NAND_MEMORG(0, 0, 0, 0, 0, 0, 0, 0, 0),
> >                      NAND_ECCREQ(0, 0),
> >                      SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
> >                                               &write_cache_variants,
> >                                               &update_cache_variants),
> >                      0,
> >                      SPINAND_ECCINFO(&micron_ooblayout_ops,
> >                                      micron_ecc_get_status)),
> > };
> 
> >
> > Let me know if you are thinking for different approach.
> 
> Exposing dummy entries is useless. If you're entirely sure all Micron
> SPI NANDs have a valid ONFi param page, then no need to use the
> ID-based detection. But as I said above, I feel param-page-based
> detection is going to be as messy as SFDP-based detection is for SPI
> NORs. Vendors tend to make mistakes which we have to fix to make
> things work. ID-based detection is much more reliable in this regard,
> as long as we don't have ID collisions :P.
> Plus, it looks like only a few manufacturers decided to use ONFi param
> pages to expose SPI NAND info (AFAICT, only Micron and Macronix do
> that), which is not surprising since the ONFi param page has been
> created to describe parallel NANDs not SPI NANDs (if you look closely
> enough, you'll notice that some fields are meaningless for SPI NANDs).

Okay, I will send new patches with ID-based detection for the new devices.


Thanks,
Shiva

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
