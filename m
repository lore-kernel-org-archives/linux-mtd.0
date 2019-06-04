Return-Path: <SRS0=Hh3Q=UD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33F32C282CE
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 12:02:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D4A6248A3
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jun 2019 12:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MJ2qzMt/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="FuuesLTC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D4A6248A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08SS+mwLDmymj3MU4JX9jL2wGDKzx5VkoivCQo6L15s=; b=MJ2qzMt/5BNjmI
	XuPECtZBokF8GVfy3NWX6Vk2Evy/rtkaFkEMg1XM5jEHRqyrAHdFE4ODJWcFSSvT6bx2DaeDElhzd
	2AHVc5o4FiERIK6/yOKLQOAO8FVKGNRS3ROK9r1Sda/5mgxiTrjaZUGaemcIt5u0/UqdwscDS3IJz
	zh+7LTyEqDByqHSEcbOko9wSQp5ZlIv38YlyaYq+KOnJKXH9gFSoDXg5IGWuPM3ykbtE/jE8cxcPS
	MhpB+0+A+NsVETJufpQWcqbKv9UNvHeUZ7CciddcMJPTHTM8oGxfO7UaOPuM+uK2vTmv2GbvrEzMm
	gHItxjs2Zx+kLXNO1V6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hY89F-00075L-47; Tue, 04 Jun 2019 12:02:37 +0000
Received: from mail-eopbgr780043.outbound.protection.outlook.com
 ([40.107.78.43] helo=NAM03-BY2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hY89C-000752-N0
 for linux-mtd@lists.infradead.org; Tue, 04 Jun 2019 12:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4lxDkhtF4LyyglRB3pP6XgL08V9XizpAL3H67sSymGY=;
 b=FuuesLTCFHTgH/GxnLll05fDpRXycuJ+3Bu+3Q3yTplFDAiKVRBTO8EwzWDb2W2LvsmgWJ+VV9OgRgI5QgJXHKGKATEOdJNWqibKngSVkatDxjyZrChSs4IK/v2Qrd9krs4aP2/6JZaa39XTcZwCTuLvOK+SdYOlT8RLoeVCbaw=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5741.namprd08.prod.outlook.com (20.179.85.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Tue, 4 Jun 2019 12:02:28 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23%7]) with mapi id 15.20.1943.018; Tue, 4 Jun 2019
 12:02:28 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [EXT] Re: [PATCH v3 04/12] mtd: rawnand: introduce struct
 onfi_helper
Thread-Topic: [EXT] Re: [PATCH v3 04/12] mtd: rawnand: introduce struct
 onfi_helper
Thread-Index: AdUaBIJVYblkvvsDT0y1heXJZCvR1gACIb2AACiX1UA=
Date: Tue, 4 Jun 2019 12:02:28 +0000
Message-ID: <MN2PR08MB595131826D34BFD773DF1251B8150@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB5951E35FED92DD502F57B590B8140@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190603150537.3ca5ca8a@collabora.com>
In-Reply-To: <20190603150537.3ca5ca8a@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.42]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0bed46e-1543-4f8a-97e8-08d6e8e4843a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR08MB5741; 
x-ms-traffictypediagnostic: MN2PR08MB5741:|MN2PR08MB5741:
x-microsoft-antispam-prvs: <MN2PR08MB5741D8364103E08DA83A1A35B8150@MN2PR08MB5741.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0058ABBBC7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(136003)(376002)(396003)(366004)(39860400002)(199004)(189003)(76116006)(86362001)(66446008)(99286004)(54906003)(73956011)(76176011)(3846002)(66476007)(66556008)(6506007)(7696005)(102836004)(8676002)(26005)(8936002)(6116002)(74316002)(6916009)(81166006)(7416002)(2906002)(55236004)(81156014)(14454004)(68736007)(7736002)(305945005)(316002)(478600001)(6436002)(55016002)(64756008)(66946007)(256004)(14444005)(5024004)(11346002)(486006)(476003)(446003)(5660300002)(186003)(52536014)(4326008)(71200400001)(9686003)(53936002)(6246003)(25786009)(33656002)(229853002)(71190400001)(66066001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5741;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: i1kPqUAAUatNCi65YQwTDwyMwDLz+aLt2ZTY8dqH5Apiku5hIc1Xtr6QHs02PmOrDBYyXeZrA29x32x8n90mY56yCA7iLblFhoAWX5kyi6WNQGeHDyuUQjczUUMwd43gcNAU3a16XMNMyVqazgFD2hX4epuUUseJWzYG4UdYnP5wuBK1S74SYHGNIAzA1yh4pG/dYAXlhWhk/ebHA+/dA5XQ0ieLq/RIfRvSHUhOvasTVHy6lVhfEBO5UvJpLPaZ6fHMncHkm1wjcg4TYnLTEUWQ5AK6sHCh5vZnxnJXfyGQeFPzcJYbWpfRNsQRyXjWajW7AkvufVPytjYDEAZpRb0d5mI+Wphioqk1UKvhQVDytzSXuoUttHeMZrIDYynYvvfTKWiwBhUi3KO7etiZNVisA0owTnFi90zlqcKPcIM=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bed46e-1543-4f8a-97e8-08d6e8e4843a
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2019 12:02:28.5965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshivamurthy@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5741
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190604_050234_817792_DB4B5670 
X-CRM114-Status: GOOD (  18.30  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Lucas Stach <dev@lynxeye.de>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Richard Weinberger <richard@nod.at>, Yixun Lan <yixun.lan@amlogic.com>,
 Chuanhong Guo <gch981213@gmail.com>, Stefan Agner <stefan@agner.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Bean Huo \(beanhuo\)" <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

> > Create onfi_helper object. This is base to turn ONFI code to generic.
> >
> > Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> > ---
> >  include/linux/mtd/nand.h | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> >
> > diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> > index 3cdf06cae8b6..645dde4c5797 100644
> > --- a/include/linux/mtd/nand.h
> > +++ b/include/linux/mtd/nand.h
> > @@ -11,6 +11,7 @@
> >  #define __LINUX_MTD_NAND_H
> >
> >  #include <linux/mtd/mtd.h>
> > +#include <linux/mtd/onfi.h>
> >
> >  /**
> >   * struct nand_memory_organization - Memory organization structure
> > @@ -157,6 +158,24 @@ struct nand_ops {
> >  	bool (*isbad)(struct nand_device *nand, const struct nand_pos
> *pos);
> >  };
> >
> > +/**
> > + * struct onfi_helper - ONFI helper functions that should be implemented
> by
> > + * specialized layers (raw NAND, SPI NAND, etc.)
> > + * @page: Page number for ONFI parameter table
> > + * @check_revision: Check ONFI revision number
> > + * @parameter_page_read: Function to read parameter pages
> > + * @init_intf_data: Initialize interface specific data or fixups
> > + */
> > +struct onfi_helper {
> > +	u8 page;
> > +	int (*check_revision)(struct nand_device *base,
> > +			      struct nand_onfi_params *p, int *onfi_version);
> > +	int (*parameter_page_read)(struct nand_device *base, u8 page,
> > +				   void *buf, unsigned int len);
> > +	int (*init_intf_data)(struct nand_device *base,
> > +			      struct nand_onfi_params *p);
> > +};
> > +
> >  /**
> >   * struct nand_device - NAND device
> >   * @mtd: MTD instance attached to the NAND device
> > @@ -165,6 +184,7 @@ struct nand_ops {
> >   * @rowconv: position to row address converter
> >   * @bbt: bad block table info
> >   * @ops: NAND operations attached to the NAND device
> > + * @helper: Helper functions to detect and initialize ONFI NAND
> >   *
> >   * Generic NAND object. Specialized NAND layers (raw NAND, SPI NAND,
> OneNAND)
> >   * should declare their own NAND object embedding a nand_device struct
> (that's
> > @@ -183,6 +203,7 @@ struct nand_device {
> >  	struct nand_row_converter rowconv;
> >  	struct nand_bbt bbt;
> >  	const struct nand_ops *ops;
> > +	struct onfi_helper helper;
> 
> Sorry, but I don't think that's the right solution. When I said we
> should have ONFI code shared I was thinking about the code that parses
> the ONFI struct/data to extract nand_memory_organization bits or other
> generic info, not something that would abstract how to retrieve the
> ONFI param page. Clearly, the generic NAND layer is not supposed to
> handle such protocol/low-level details.
> 

In that case, I am thinking to design as follows, which splits into generic independent code.
Let me know, if you have any concerns or inputs.

I will parsing code from nand_onfi_detect function and move it to mtd/nand/onfi.c.
Also, I will move functions like sanitize_string, nand_bit_wise_majority, onfi_crc16, and 
any other generic info to mtd/nand/onfi.c.

Thanks,
Shiva

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
