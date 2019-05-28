Return-Path: <SRS0=NG3o=T4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2501C04AB6
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 15:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A614B2075C
	for <linux-mtd@archiver.kernel.org>; Tue, 28 May 2019 15:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3G4iwLB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=micron.com header.i=@micron.com header.b="LvNJVCVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A614B2075C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=micron.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rYBGtEEgCYAOFgqDe3/Uha4C7dNuN+vUv/MwqF0oXTg=; b=n3G4iwLBBFrghL
	Lp0IPwvZHAU1blwWXE8n5pLwn4j0wQkO5gnDYfTGSacs7E4lPY2QoDP2crMTHFEni11E31OO3ezMY
	ePOAClzdNvKE5sTOEal7+XF/hiF3SJZKT2l6tHC9hSBy1nhZlN68YP2c57IlVCkCCV4h3OhHrtkd5
	garmc9w0CI7xZpOa+6HG5v8SEQqQwk7vGhajmh0jTNma1lTvCsl/nHlT8Ltfm+PwG8rEfVhIT3KC7
	jutbX3sScAMzxXoFhCUfDpfQtbfi6O8L8tS23uU6I1w/ShVz0yT4a/RyqBEiV9Ld0eXCFV+PEHWQy
	R0Qj4/z0DMl+5sUp1zVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVeJE-0006Ea-HA; Tue, 28 May 2019 15:46:40 +0000
Received: from mail-eopbgr790054.outbound.protection.outlook.com
 ([40.107.79.54] helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVeJ5-0006D4-Tt
 for linux-mtd@lists.infradead.org; Tue, 28 May 2019 15:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=micron.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y55626EY4VhwAGnHDDZmHBkeD1vpwcDjDoncxn8sEA=;
 b=LvNJVCVS8sbkg7iNdvmRkEc364DdFiSfOge0izGshwLdj1BVanoGJZJcwrHDc8+TQ452YsUX93Ij0crjq3Wr8LCRDNeRTFNi6zPZ7C/jjCnIla7S0U+UjmDGGUumjxXg3pY7t+FbnhAI38ilI0QnCjupxipnbM3WCGaDeicAVuE=
Received: from MN2PR08MB5951.namprd08.prod.outlook.com (20.179.85.220) by
 MN2PR08MB5791.namprd08.prod.outlook.com (20.179.87.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 15:46:10 +0000
Received: from MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23]) by MN2PR08MB5951.namprd08.prod.outlook.com
 ([fe80::f0f7:f262:a3c6:ce23%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 15:46:10 +0000
From: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: RE: [EXT] Re: [PATCH 3/4] mtd: spinand: Enabled support to detect
 parameter page
Thread-Topic: [EXT] Re: [PATCH 3/4] mtd: spinand: Enabled support to detect
 parameter page
Thread-Index: AdTjwSAFDW7WB7gARZuMWrsA2XWYYgbaOd4AAGX3qdAAByiXgAUe47Xg
Date: Tue, 28 May 2019 15:46:10 +0000
Message-ID: <MN2PR08MB59517D405930FAEF5C09D766B81E0@MN2PR08MB5951.namprd08.prod.outlook.com>
References: <MN2PR08MB5951E8D99AA1FBD972131388B85F0@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190430095508.706fa125@xps13>
 <MN2PR08MB5951A622B36705BC26CE36E2B8340@MN2PR08MB5951.namprd08.prod.outlook.com>
 <20190502135945.61bd6ceb@xps13>
In-Reply-To: <20190502135945.61bd6ceb@xps13>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sshivamurthy@micron.com; 
x-originating-ip: [165.225.81.56]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1337b9b5-a67c-47ab-f9cb-08d6e3839b61
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR08MB5791; 
x-ms-traffictypediagnostic: MN2PR08MB5791:|MN2PR08MB5791:
x-microsoft-antispam-prvs: <MN2PR08MB579105FE3ED03686CAD4CE30B81E0@MN2PR08MB5791.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(396003)(39860400002)(136003)(346002)(189003)(199004)(52536014)(8936002)(476003)(446003)(6506007)(74316002)(14454004)(6246003)(11346002)(53936002)(66946007)(76116006)(102836004)(316002)(486006)(99286004)(66446008)(64756008)(66556008)(66476007)(55236004)(6916009)(73956011)(86362001)(508600001)(68736007)(6116002)(81166006)(26005)(256004)(6436002)(4326008)(14444005)(71190400001)(71200400001)(229853002)(25786009)(3846002)(5660300002)(2906002)(7696005)(8676002)(66066001)(76176011)(9686003)(7736002)(186003)(55016002)(81156014)(305945005)(33656002)(54906003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR08MB5791;
 H:MN2PR08MB5951.namprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: micron.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 0
x-microsoft-antispam-message-info: xCdZ+D4J/lKmMLrcnOU+FxOiSMoKAIPkP6kXaSzhElfvqUUzEMUVA4Z5lu/5nBMTOA0Sm46rA7mwJP/YlkL1Zjs+gnfSI22iVbFXM4nNIQRGfy6D9ax/IhZ5D0izKpKv6Na3bOj879/VVY93g/q320mNb20NRw8CkoPzjTVaqlRBTdYvXuqSDk0eh45TQfYdI4lyO8JSD407+yN5k31+J2Ih4OmTArnNQH4iUay3Ub/OsFpiJChe0irl4OC5IrAcFHgAB9Du86oWgHqY0bpw/bHDuZpOk2gIEpt1l5QbE3nRBdP0DGcYjGuzX8WKezhO1+WJ5q5Y9OqQUM2Km81bmgh7CCbs7HjW12CrmtZYTbX3Ghk5IEliLAZHK7DK281ZKMZckl9vZpwJMM60riRIJG2V8zcILWeZjN4x8MZc5cI=
MIME-Version: 1.0
X-OriginatorOrg: micron.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1337b9b5-a67c-47ab-f9cb-08d6e3839b61
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 15:46:10.4985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f38a5ecd-2813-4862-b11b-ac1d563c806f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sshivamurthy@micron.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB5791
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190528_084634_195249_F43CC27D 
X-CRM114-Status: GOOD (  22.49  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Frieder Schrempf <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

> > >
> > > > Some of the SPI NAND devices has parameter page which is similar to
> ONFI
> > > > table.
> > > >
> > > > But, it may not be self sufficient to propagate all the required
> > > > parameters. Fixup function has been added in struct manufacturer to
> > > > accommodate this.
> > > >
> > > > Signed-off-by: Shivamurthy Shastri <sshivamurthy@micron.com>
> > > > ---
> > > >  drivers/mtd/nand/spi/core.c | 113
> > > +++++++++++++++++++++++++++++++++++-
> > > >  include/linux/mtd/spinand.h |   5 ++
> > > >  2 files changed, 117 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
> > > > index 985ad52cdaa7..40882a1d2bc1 100644
> > > > --- a/drivers/mtd/nand/spi/core.c
> > > > +++ b/drivers/mtd/nand/spi/core.c
> > > > @@ -574,6 +574,108 @@ static int spinand_lock_block(struct
> > > spinand_device *spinand, u8 lock)
> > > >  	return spinand_write_reg_op(spinand, REG_BLOCK_LOCK, lock);
> > > >  }
> > > >
> > > > +/**
> > > > + * spinand_read_param_page_op - Read parameter page operation
> > > > + * @spinand: the spinand device
> > > > + * @page: page number where parameter page tables can be found
> > > > + * @parameters: buffer used to store the parameter page
> > >
> > > Does not match the prototype
> >
> > I will fix this in next version.
> >
> > >
> > > > + * @len: length of the buffer
> > > > + *
> > > > + * Read parameter page
> > > > + *
> > > > + * Returns 0 on success, a negative error code otherwise.
> > > > + */
> > > > +static int spinand_parameter_page_read(struct nand_device *base,
> > >
> > > Please use a spinand structure as parameter, you don't need a
> > > nand_device here (same for other spinand functions).
> >
> > This function is helper function for generic ONFI layer.
> > From generic ONFI layer, I can get only nand_device.
> 
> How do you handle if the SPI NAND core is not compiled-in?
> 

Both raw NAND and SPI NAND define parameter_page_read function,
which will be called in nand_onfi_detect.

Rightly you pointed, I will add the following lines in nand_onfi_detect
to tackle if those functions are not compiled-in.

        /* return 0, if ONFI helper functions are not defined */                 
        if (!base->helper.parameter_page_read &&                                 
            !base->helper.check_revision &&                                      
            !base->helper.init_intf_data)                                        
                return 0;

I hope this answers your point.

Thanks,
Shiva
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
