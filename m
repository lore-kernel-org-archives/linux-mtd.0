Return-Path: <SRS0=bYPC=UZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 423FBC48BD3
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:34:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13910208CB
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2019 12:34:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLBsSmJc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="iI9qcS6N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13910208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM8a38y5csMuq6WQkOpLftqeqEktyN5l7OSZYjus6tA=; b=hLBsSmJcWj7mKT
	zcwJ9170Wf7OR2Vn4+3Rg7DnI9Z1+DXlztWQojSZ4Q9TeHRVFqVswJOcEHf27CNFYx4YHmH6fMbds
	ouyIBWiYoFuPOZy0THvy3q2GNJoygg2B7qIl6Xv1BcAiPHgMcOFklXQdcbvANwsUrLEYuFOa/v7bW
	RFDRoYec+YpBTSIiX3duptneN3C1VCZ9xHF8hNynh2mQN62Tol8EVUZ1unxmqVhIja1Cyz+CLV9U3
	uv7o77tH9aLFTLwa1W0Y8M6uunxW1ZAuQvRmu/rgLTC6VWYkZuPK6sxaeOgvxfmRZbWcOCewvdQh+
	cRW+b5vsXWnLiGJfYX3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hg77g-000423-Sp; Wed, 26 Jun 2019 12:34:00 +0000
Received: from mail-cys01nam02on0614.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::614]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hg77d-00041d-M3
 for linux-mtd@lists.infradead.org; Wed, 26 Jun 2019 12:33:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eH1Gjz/SwiOnqPv7o/dbajUXmfLWHUqFdqJQ2e6SEf0=;
 b=iI9qcS6NjUdkzQgWwnqiFOD+Vqi2zZHjg6+tsRF1bbCiwRD3QpVctOynYmjh286nk5yYNkk/nSs3lqkvELFYzma3ux7rVxca63ju766Jt9zKHM3Cdm/H6xjGpWKyU9FxlZx73f3lKjqG2t6jpvX8EFKyV6pK2qNjjZqTNxhvnRc=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB4090.namprd02.prod.outlook.com (20.176.75.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.18; Wed, 26 Jun 2019 12:33:54 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2008.017; Wed, 26 Jun 2019
 12:33:54 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Topic: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over
 write driver's read_page()/write_page()
Thread-Index: AQHVKxEOKM99KajnN0G2IiFegkrxG6atgBaAgABKdoCAAAOHgIAABNvwgAAFfoCAAAE2wIAAA0eAgAABfeA=
Date: Wed, 26 Jun 2019 12:33:54 +0000
Message-ID: <DM6PR02MB477919D28FDC063894C3CF50AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190626084807.3f06e718@collabora.com>
 <DM6PR02MB47796E3306C166A91E0BAE91AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626132715.6128d8b1@collabora.com>
 <DM6PR02MB4779D347620E88BDB943DEB4AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626140417.440cf762@collabora.com>
 <DM6PR02MB4779B5C815FB4DAF33EF4996AFE20@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190626142021.484c4fd8@collabora.com>
In-Reply-To: <20190626142021.484c4fd8@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3229a60-a164-475a-3395-08d6fa328d2d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB4090; 
x-ms-traffictypediagnostic: DM6PR02MB4090:
x-microsoft-antispam-prvs: <DM6PR02MB409062D03A1F0D686B1F5D4EAFE20@DM6PR02MB4090.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00808B16F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(366004)(396003)(346002)(376002)(136003)(13464003)(189003)(199004)(14444005)(9686003)(102836004)(256004)(25786009)(6436002)(7416002)(81166006)(4326008)(81156014)(229853002)(305945005)(55016002)(53936002)(74316002)(33656002)(8936002)(52536014)(7736002)(8676002)(2906002)(476003)(11346002)(76176011)(14454004)(5660300002)(71190400001)(6506007)(53546011)(99286004)(66066001)(446003)(68736007)(486006)(7696005)(54906003)(71200400001)(316002)(478600001)(6246003)(3846002)(6116002)(186003)(26005)(6916009)(76116006)(66446008)(73956011)(86362001)(66476007)(66556008)(66946007)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4090;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HckuFpK08hU5rbLwAujp9Y8G8e2qKvDd/fZm3Vymryp47zvq6xlzVZzk2LJX4tmm8m9FWy1FjELEUutp2KtzKPEIvwsrFoe6QNjIoy5e4Zqd5q6kb3B8Cmad++sJ8G3RuJDxMxmIp8XzpsKPWNAY6Lo0qPGzAWj6wwTLeXRRGjwvQtboUqfiLxmRNc8Nayi2fR08SiFw/lLW5UIASw5dU6fdV7xFqUYks18Az7xfq8aKhD1b5BdHsch6pH6d9RuSWtZ6ONhyjxwb1OS10PPJxTaGZflwxOAzXoBKljPqPsSZQmvdKHcj1J9nQy/wWAuNqXWGPoMX927gTtKEIMSi1c4JE+pqK/dijnWRz+X9fzFW5sTcPLquaTjdrPxv7JHeCr9vRLa2fddQr9u+yBq/qgEQRFkP43mOXzbXgJUbvTw=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3229a60-a164-475a-3395-08d6fa328d2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2019 12:33:54.2592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190626_053357_728279_E121BCC3 
X-CRM114-Status: GOOD (  26.09  )
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
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Sent: Wednesday, June 26, 2019 5:50 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com;
> vigneshr@ti.com; bbrezillon@kernel.org; yamada.masahiro@socionext.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not over write
> driver's read_page()/write_page()
> 
> On Wed, 26 Jun 2019 12:12:47 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> 
> > Hi Boris,
> >
> > > -----Original Message-----
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Sent: Wednesday, June 26, 2019 5:34 PM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > > marek.vasut@gmail.com; vigneshr@ti.com; bbrezillon@kernel.org;
> > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do not
> > > over write driver's read_page()/write_page()
> > >
> > > On Wed, 26 Jun 2019 11:51:12 +0000
> > > Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> > >
> > > > Hi Boris,
> > > >
> > > > > -----Original Message-----
> > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > Sent: Wednesday, June 26, 2019 4:57 PM
> > > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > > richard@nod.at; dwmw2@infradead.org;
> > > > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > > > vigneshr@ti.com; bbrezillon@kernel.org;
> > > > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > > > linux-kernel@vger.kernel.org
> > > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand: nand_micron: Do
> > > > > not over write driver's read_page()/write_page()
> > > > >
> > > > > On Wed, 26 Jun 2019 11:22:33 +0000 Naga Sureshkumar Relli
> > > > > <nagasure@xilinx.com> wrote:
> > > > >
> > > > > > Hi Boris,
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > > > > Sent: Wednesday, June 26, 2019 12:18 PM
> > > > > > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > > > > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > > > > > richard@nod.at; dwmw2@infradead.org;
> > > > > > > computersforpeace@gmail.com; marek.vasut@gmail.com;
> > > > > > > vigneshr@ti.com; bbrezillon@kernel.org;
> > > > > > > yamada.masahiro@socionext.com; linux-
> > > > > > > mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> > > > > > > Subject: Re: [LINUX PATCH v17 1/2] mtd: rawnand:
> > > > > > > nand_micron: Do not over write driver's
> > > > > > > read_page()/write_page()
> > > > > > >
> > > > > > > On Mon, 24 Jun 2019 22:46:29 -0600 Naga Sureshkumar Relli
> > > > > > > <naga.sureshkumar.relli@xilinx.com> wrote:
> > > > > > >
> > > > > > > > Add check before assigning chip->ecc.read_page() and
> > > > > > > > chip->ecc.write_page()
> > > > > > > >
> > > > > > > > Signed-off-by: Naga Sureshkumar Relli
> > > > > > > > <naga.sureshkumar.relli@xilinx.com>
> > > > > > > > ---
> > > > > > > >  drivers/mtd/nand/raw/nand_micron.c | 7 +++++--
> > > > > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > b/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > index cbd4f09ac178..565f2696c747 100644
> > > > > > > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > > > > > > @@ -500,8 +500,11 @@ static int micron_nand_init(struct nand_chip *chip)
> > > > > > > >  		chip->ecc.size = 512;
> > > > > > > >  		chip->ecc.strength = chip->base.eccreq.strength;
> > > > > > > >  		chip->ecc.algo = NAND_ECC_BCH;
> > > > > > > > -		chip->ecc.read_page = micron_nand_read_page_on_die_ecc;
> > > > > > > > -		chip->ecc.write_page = micron_nand_write_page_on_die_ecc;
> > > > > > > > +		if (!chip->ecc.read_page)
> > > > > > > > +			chip->ecc.read_page =
> > > > > > > > +micron_nand_read_page_on_die_ecc;
> > > > > > > > +
> > > > > > > > +		if (!chip->ecc.write_page)
> > > > > > > > +			chip->ecc.write_page =
> > > > > > > > +micron_nand_write_page_on_die_ecc;
> > > > > > >
> > > > > > > That's wrong, if you don't want on-die ECC to be used,
> > > > > > > simply don't set nand-ecc-mode to "on- die".
> > > > > > Ok. But if we want to use on-die ECC then you mean to say it
> > > > > > is mandatory to use
> > > > > micron_nand_read/write_page_on_die_ecc()?
> > > > >
> > > > > Absolutely, and if it doesn't work that means you driver does
> > > > > not implement raw accesses correctly, which means it's still buggy...
> > > > I agree. But let's say, if there is a limitation with the
> > > > controller. Then it is must to have this
> > > check right?
> > > > I mean, for pl353 controller, we must clear the CS during the data
> > > > phase, hence we are splitting the Transfer in the pl353_read/write_page_raw().
> > > > +	pl353_nand_read_data_op(chip, buf, mtd->writesize, false);
> > > > +	p = chip->oob_poi;
> > > > +	pl353_nand_read_data_op(chip, p,
> > > > +				(mtd->oobsize -
> > > > +				PL353_NAND_LAST_TRANSFER_LENGTH),
> false);
> > > > +	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> > > > +	xnfc->dataphase_addrflags |= PL353_NAND_CLEAR_CS;
> > > > +	pl353_nand_read_data_op(chip, p,
> PL353_NAND_LAST_TRANSFER_LENGTH,
> > > > +				false);
> > > > As the above sequence is needed even for raw access, PL353 is
> > > > unable to use the on_die_page
> > > reads.
> > >
> > > This "de-assert CS on last access" logic should be done in the
> > > exec_op() implementation. I also wonder how that works for
> > > operations that don't have data cycles. Oh, BTW, most chips are
> > > CE-don't-care, which means you can assert/de-assert CS on each read_data_op() without
> any issues.
> > Yes, we can assert/de-assert CS on each read/write_data_op().
> > But what about transfer length splitting?
> > +	p = chip->oob_poi;
> > +	pl353_nand_read_data_op(chip, p,
> > +				(mtd->oobsize -
> > +				PL353_NAND_LAST_TRANSFER_LENGTH), false);
> > +	p += (mtd->oobsize - PL353_NAND_LAST_TRANSFER_LENGTH);
> > This should be done as a part of pl353_raw_read/write() right?
> 
> Are you sure you need to do that, and if that's the case, do you have an idea why this is needed?
> Is this "read last 4 bytes separately"
> thing is needed, I suspect it's needed for any kind of input-data cycles, not just page reads.
Yes. It is needed. This is Limitation in the HW, need to handle last 4 bytes separately for both page read/writes

Regards,
Naga Sureshkumar Relli

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
