Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E098AC43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 05:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A9E20700
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 05:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CkIGK8I7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="Hbg058hj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9A9E20700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4f9NbG7QSVGnpvRr50yB6ITmG/w+vFUkrAgfdnYwTV8=; b=CkIGK8I7YF/ire
	+O37tHTwJVyQjBx8rqh4QUb2TUNGc+lSgmCoAwwpy6m2lf+lJav53X3oaE/08iRs7ObALR02yyfJ8
	M0k0AvEO65UkfKobH6fvVc6djhbAAGNO5prZCY/dpmhKHoYsXgRsKomB074MDGNiI9sdDqfEKEMAO
	iX3YpOyy77yh7uSzvGmmr2bSSHFKQdkatoWEyDty1fbhcyiHT7Jj4L8mfEp3ymkuKnXGYX5y24bXc
	qy5KTuybnl4BrviJkn7ZA20YzvvW0jmjfxU14pfBuw0grqcJS1MQFVqSjWWMo1EVMFHFdfoic+Gxw
	Fa/hyqPOmwvPzJCEhcmw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9jxZ-0007Wv-BN; Fri, 29 Mar 2019 05:21:45 +0000
Received: from mail-eopbgr700054.outbound.protection.outlook.com
 ([40.107.70.54] helo=NAM04-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9jxQ-0007WE-CS
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 05:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvtgkPTDWzEw01GN19ybLJOvA3AegP3XKepr6yVM1es=;
 b=Hbg058hj7qRgDnNCsMRdG3xff8dCzvnR9grhKKgFG4ZVrFaOXx0p0FjcnhbEuFBIcqzFjQqChblSSgmBVCyrclpF2PNyP8Qdgc0eaXiqu4aOejcEHxnODWJ+c20u2uiGP4Ii7QyqPlpZiYx3NPhZcNGoD0Ro1wqCwozU35AAfTY=
Received: from MWHPR02MB2623.namprd02.prod.outlook.com (10.168.206.9) by
 MWHPR02MB2782.namprd02.prod.outlook.com (10.175.49.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1750.16; Fri, 29 Mar 2019 05:21:29 +0000
Received: from MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf]) by MWHPR02MB2623.namprd02.prod.outlook.com
 ([fe80::c89d:e485:cb5e:89cf%5]) with mapi id 15.20.1730.019; Fri, 29 Mar 2019
 05:21:29 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Subject: RE: [LINUX PATCH v13] rawnand: pl353: Add basic driver for arm pl353
 smc nand interface
Thread-Topic: [LINUX PATCH v13] rawnand: pl353: Add basic driver for arm pl353
 smc nand interface
Thread-Index: AQHUwEH1zZQS3QRob0y10ZaiOKtLVqYeLsaAgAFJyICAAb/7AIABJDSg
Date: Fri, 29 Mar 2019 05:21:29 +0000
Message-ID: <MWHPR02MB2623540BA389042E7795E071AF5A0@MWHPR02MB2623.namprd02.prod.outlook.com>
References: <1549694247-24625-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190326132721.52e7ktnptgwvzeor@laureti-dev>
 <MWHPR02MB26235ED95B0F0AE89B2A0972AF580@MWHPR02MB2623.namprd02.prod.outlook.com>
 <20190328115106.i7ytk2uqno7i4h4u@laureti-dev>
In-Reply-To: <20190328115106.i7ytk2uqno7i4h4u@laureti-dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 576a48b8-07ff-4e44-872c-08d6b4066637
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600127)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
 SRVR:MWHPR02MB2782; 
x-ms-traffictypediagnostic: MWHPR02MB2782:
x-microsoft-antispam-prvs: <MWHPR02MB2782D31D21A472F93BCFC046AF5A0@MWHPR02MB2782.namprd02.prod.outlook.com>
x-forefront-prvs: 0991CAB7B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(136003)(366004)(396003)(53234004)(13464003)(199004)(189003)(3846002)(106356001)(7696005)(71190400001)(71200400001)(99286004)(105586002)(66066001)(93886005)(7736002)(55016002)(52536014)(14454004)(5660300002)(86362001)(7416002)(74316002)(53936002)(305945005)(229853002)(186003)(33656002)(6436002)(102836004)(9686003)(6506007)(53546011)(68736007)(6916009)(26005)(25786009)(256004)(4326008)(478600001)(76176011)(8936002)(8676002)(6246003)(54906003)(81166006)(81156014)(486006)(97736004)(6116002)(446003)(11346002)(476003)(316002)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2782;
 H:MWHPR02MB2623.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: a//2DyhcBYG8zB5dHG0Na3m1h6C0iwRujhwuZIwjt2nE2aywqp6fA21NQVg8WZxr1/cHbBRLjDevYC6kjohA+h+uXQaOa8/aARoXGzQ4C5QPR1AKXUMZGvQzSw7BMYMJVO/+6oeliJRMEJ0rVN8ZECJCAMANKeYN61qUZytSxQLZQtJAcIS6pg8dTucKf7sP1ayi4xW7k+/zY5XcoQrORDQRpjWoQl3nXiaqwcAecZpnNsAa3tNqrC9gQMshjH/YjWJe1ogfIIC0/mQgWkvkSuotci7h+y61U5kUj4rqRy0HU+A1PMoK37s/U3rQcbesXg/wkl94hsreHRTG9RCFsOJO0GKnYelX2yfoiEpxVFov1sp8sG+h8/gMWQcc52yG8ELNj8kkyEZDeS13JTiXiRs4XwPibtLpGLgHWg/qxV8=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 576a48b8-07ff-4e44-872c-08d6b4066637
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2019 05:21:29.6311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2782
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_222136_488534_B0033625 
X-CRM114-Status: GOOD (  18.70  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "nagasureshkumarrelli@gmail.com" <nagasureshkumarrelli@gmail.com>,
 Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Helmut,

> -----Original Message-----
> From: Helmut Grohne <helmut.grohne@intenta.de>
> Sent: Thursday, March 28, 2019 5:21 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: bbrezillon@kernel.org; miquel.raynal@bootlin.com; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> nagasureshkumarrelli@gmail.com
> Subject: Re: [LINUX PATCH v13] rawnand: pl353: Add basic driver for arm pl353 smc nand
> interface
> 
> Hi Naga,
> 
> On Wed, Mar 27, 2019 at 09:13:59AM +0000, Naga Sureshkumar Relli wrote:
> > It's a on-die ECC capable device. Did u mentioned nand-ecc-mode = "on-die" in dts.
> > The same part I tested by mentioning "on-die" property in dts and it worked for me.
> > Please share the dts entries for NAND.
> > Also if it is x8 bus then please mention nand-bus-width = <8>; If it
> > is x16 mention nand-bus-width = <16>;
> 
> Thank you for pointing at the relevant properties. Indeed, these were missing in my previous
> tests. I am now using the following dt (generated from multiple fragments, giving the
> decompiled dt here):
> 
> | memory-controller@e000e000 {
> | 	#address-cells = <0x2>;
> | 	#size-cells = <0x1>;
> | 	status = "okay";
> | 	clock-names = "memclk", "apb_pclk";
> | 	clocks = <0x1 0xb 0x1 0x2c>;
> | 	compatible = "arm,pl353-smc-r2p1", "arm,primecell";
> | 	interrupt-parent = <0x4>;
> | 	interrupts = <0x0 0x12 0x4>;
> | 	ranges = <0x0 0x0 0xe1000000 0x1000000>;
> | 	reg = <0xe000e000 0x1000>;
> |
> | 	flash@e1000000 {
> | 		status = "okay";
> | 		compatible = "arm,pl353-nand-r2p1";
> | 		reg = <0x0 0x0 0x1000000>;
> | 		#address-cells = <0x1>;
> | 		#size-cells = <0x1>;
> | 		nand-ecc-mode = "on-die";
> | 		nand-ecc-algo = "hamming";
> | 		nand-bus-width = <0x8>;
> | 	};
> | };
> 
> With this dt, the device is successfully initialized and the data read is mostly intact. When
> using it with jffs2, I get loads of ECC errors though (offsets and lengths vary):
> 
> | jffs2: mtd->read(0x800 bytes from 0xb60000) returned ECC error
> 
> Reverting back to the out-of-tree driver (4.14), it works normally, so a hardware defect seems
> unlikely. I compared a register dump of the smc between those drivers and the only difference I
> could find was NAND timings (at 0xE000E180), which are much lower with the new drivers
> as it does not consume the arm,nand-cycle-* properties that the old driver consumed. I tried
> hard coding the previous timings, but the ECC errors persist. This leads me to conclude that
> timings are not the cause for what I am seeing.
> 
> Is there anything else I can try to diagnose it?
Thanks for trying with new dts.
Previously we will pass the nand-cycle-* through dts.
But now framework is giving all the timing information of SDR. So we will just configure those
Timings. I will recheck the driver about the timings.

Till now I tried mtd-utils(mtd-debug) and ubifs.
I haven't tried jffs2. Let me give a try and will let you know.

Thanks,
Naga Sureshkumar Relli.
> 
> Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
