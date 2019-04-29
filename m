Return-Path: <SRS0=nQMH=S7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2885C04AA6
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 12:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A153720673
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Apr 2019 12:35:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0WH4QjF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="MANvbtlx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A153720673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GOH0LqVLDdx2cvNQUWaQaM03zUANctohYhMFL47Fc7c=; b=h0WH4QjFPXSYj+
	xuFRlmTz0B1n7G0F0m/h0SAxKULuCFOnMwJnqi00AefjJMu6DTike8Lqgv5QArWEN44LAJnRfKSfN
	68SSLACictfX6cYVLrRUshSTAUPaXvaKWYkovHV7IzQcnPu19NKjLLVNb6zC3vtXNUQXcjBZddHDd
	gGk6Ok7YJnow5hc3wdoZKvAA+r8S3DuTRZuXeqGSKII+g7Pbp12m2YzmMxsfRzQtlsL/GbPJGUcjC
	BPvIgrvVgs59iYv/zW/eq+cVTf0W7QaVW2im6e8EAjEhGGk6hL0oHAWfBaqc4prRIpShMERUOKIU3
	kAA9/bBJP4HoIojvXKGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hL5Vc-0007WN-Vo; Mon, 29 Apr 2019 12:35:48 +0000
Received: from mail-eopbgr680064.outbound.protection.outlook.com
 ([40.107.68.64] helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hL5VW-0007Vy-EQ
 for linux-mtd@lists.infradead.org; Mon, 29 Apr 2019 12:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z7LIszsahXGJqBQq30YFKnqD/z+GBo07ofBC4KAj4s=;
 b=MANvbtlxt7Arhir02vvZA8Q2M0MCoKyhkFIMam2S3qDf12HGp6O/I0roSM5yO3ENlJVBmnR5RlOavyORITGJTIf3s95aeocfOBJh/D3Tn3OKv+N7c8PZCv4WLoDpW1b9ATlLC5RNlqWAoy78GbQYsgPMn5FkA1IfXuR20M02Ko0=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB4236.namprd02.prod.outlook.com (20.176.76.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Mon, 29 Apr 2019 12:35:38 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::1970:28ec:3bfa:2305]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::1970:28ec:3bfa:2305%7]) with mapi id 15.20.1835.018; Mon, 29 Apr 2019
 12:35:38 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Subject: RE: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Thread-Topic: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Thread-Index: AQHU83vggkxmg2rBCEyEcIHuXS/Vp6ZMy7GAgAFFM5CABRNXAIAAA45Q
Date: Mon, 29 Apr 2019 12:35:38 +0000
Message-ID: <DM6PR02MB477988A7F04027F41834AC72AF390@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <1555326613-26739-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190425112338.dipgmqqfuj45gx6s@laureti-dev>
 <DM6PR02MB4779EE37978EC0E6475C55D7AF390@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190429121804.4jzspv4goehwdpez@laureti-dev>
In-Reply-To: <20190429121804.4jzspv4goehwdpez@laureti-dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cdabeda-79c1-419a-59f5-08d6cc9f2f35
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB4236; 
x-ms-traffictypediagnostic: DM6PR02MB4236:
x-microsoft-antispam-prvs: <DM6PR02MB4236097251E98B2612B12571AF390@DM6PR02MB4236.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0022134A87
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(39860400002)(376002)(346002)(366004)(136003)(13464003)(199004)(189003)(129404003)(76176011)(7696005)(3846002)(478600001)(14454004)(6436002)(6116002)(86362001)(66066001)(76116006)(71190400001)(71200400001)(55016002)(33656002)(446003)(9686003)(229853002)(68736007)(2906002)(4326008)(66946007)(66476007)(81156014)(81166006)(97736004)(8676002)(7416002)(6916009)(316002)(74316002)(99286004)(73956011)(11346002)(52536014)(93886005)(5660300002)(54906003)(6246003)(26005)(7736002)(561944003)(25786009)(102836004)(486006)(53546011)(6506007)(53936002)(186003)(8936002)(305945005)(14444005)(256004)(66446008)(476003)(66556008)(64756008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4236;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5nWZIZeKQfhHrCQQCGfpFU7x8dyojgvrKhwFH1Nmluak05shS59lf6VFE6285Zp4CI+2E8+5kJEKMpbo0QCRKrd8ta75ta4akk3Xdz+NYNIWSGsaPVd/8VCi1prxWW7PqlN/lFiGIJkymEI+7EzwSXRjXXKrCIbLWfExEWKJey2OJSqtOhfLaKPX68bHvfh8vaND+DQTHB05A/+G9lVB/0ZDMJo5+sGMmV2md0tGKNcPemuX/aNuYYABp9XEO0n2jc7fjfb+Tu6SrylPXa70oZqp+ORSXUXyAqEgia4HhS2nykDy++LNDWffJ8lXkiQozQvtEcO5UonF1tyOQGmaYrBUiRynQhIodW+e7Rtqdh6uymLALt2ogz+7PgPg523m+LQ9iOA7fq7CwgDI3Jiwm2jOFw7KHfp/9sVoXX6/lKo=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cdabeda-79c1-419a-59f5-08d6cc9f2f35
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2019 12:35:38.2114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190429_053545_587735_FCE3DD2C 
X-CRM114-Status: GOOD (  20.16  )
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
> Sent: Monday, April 29, 2019 5:48 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: bbrezillon@kernel.org; miquel.raynal@bootlin.com; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>;
> nagasureshkumarrelli@gmail.com
> Subject: Re: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm pl353 smc
> nand interface
> 
> On Mon, Apr 29, 2019 at 11:31:14AM +0000, Naga Sureshkumar Relli wrote:
> > But just wanted to know, do you see issues with these __force and __iomem castings?
> 
> I only see a minor issue: They're (deliberately) lengthy. Using many of them diverts attention
> of the reader. Therefore, my proposal attempted to reduce their frequency. The only issue I see
> here is readability.
Ok then, I will update it.
> 
> > >
> > > > +	u8 addr_cycles;
> > > > +	struct clk *mclk;
> > >
> > > All you need here is the memory clock frequency. Wouldn't it be
> > > easier to extract that frequency once during probe and store it
> > > here? That assumes a constant frequency, but if the frequency isn't constant, you have a
> race condition.
> > That is what we are doing in the probe.
> > In the probe, we are getting mclk using of_clk_get() and then we are
> > getting the actual frequency Using clk_get_rate().
> > And this is constant frequency only(getting from dts)
> 
> Not quite. You're getting a clock reference in probe and then repeatedly access the frequency
> elswhere. I am suggesting that you get the clock frequency during probe and never save the
> clock reference to a struct.
Ok. got it. Will update.
> 
> > > > +		case NAND_OP_ADDR_INSTR:
> > > > +			offset = nand_subop_get_addr_start_off(subop, op_id);
> > > > +			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
> > > > +			addrs = &instr->ctx.addr.addrs[offset];
> > > > +			nfc_op->addrs = instr->ctx.addr.addrs[offset];
> > > > +			for (i = 0; i < min_t(unsigned int, 4, naddrs); i++) {
> > > > +				nfc_op->addrs |= instr->ctx.addr.addrs[i] <<
> > >
> > > I don't quite understand what this code does, but it looks strange
> > > to me. I compared it to other drivers. The code here is quite
> > > similar to marvell_nand.c. It seems like we are copying a varying
> > > number (0 to 6) of addresses from the buffer instr->ctx.addr.addrs.
> > > However their indices are special: 0, 1, 2, 3, offset + 4, offset + 5. This is non-consecutive
> and different from marvell_nand.c in this regard. Could it be that you really meant index
> offset+i here?
> > I didn't get, what you are saying here.
> > It is about updating page and column addresses.
> > Are you asking me to remove nfc_op->addrs = instr->ctx.addr.addrs[offset]; before for
> loop?
> 
> I compared this code to marvell_nand.c and noticed a subtle difference.
> Both snippets read 6 address bytes and consume them in a driver-specific way. Now which
> address bytes are consumed differs.
> 
> marvell_nand.c consumes instr->ctx.addr.addrs at indices offset,
> offset+1, offset+2, offset+3, offset+4, offset+5. pl353_nand.c consumes
> instr->ctx.addr.addrs at indices 0, 1, 2, 3, offset, offset+4, offset+5.
> (In my previous mail, I didn't notice that it was also consuming the offset index.)
> 
> I would have expected this behaviour to be consistent between different drivers. If I assume
> marvell_nand.c to do the right thing and pl353_nand.c to be wrong (which is not necessarily a
> correct assumption), then the code woule likely becom:
> 
> 	addrs = &instr->ctx.addr.addrs[offset];
> 	for (i = 0; i < min_t(unsigned int, 4, naddrs); i++) {
> 		nfc_op->addrs |= addrs[i] << (8 * i);
> 		              // ^^^^^
> 	}
> 
> Hope this helps.
Ok. let me re check this and I will update this accordingly.

Thanks,
Naga Sureshkumar Relli
> 
> Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
