Return-Path: <SRS0=Yojm=UM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7476C31E45
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 10:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E1BE2084D
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jun 2019 10:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JIw/YEe4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="WJahQ7oS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E1BE2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jiyQWDvcQS7Vpo4CA6h8a6WELWOYEJEzpdbBBpiL+k=; b=JIw/YEe4KPXUAV
	TVV4m2KpGIpUpbJba3QJjaATLh2exRPAji2FZsQkB8dIu1shZiBG5LDquhzfnePILX4//3DSS8hQ4
	2JhhlMudjjL+vbZoTzouL49CAx2m9R8NbGEBJWDD7kk9GEx6an4sqrg7+GE2/buHny4UBxUHI08PX
	EgKFn3v6F1tnGZEHqNP3oZPQkyjdLrTKxLg4EkOe6anJ+hzU6RDVipW5jlJd/fpPPy4g0GV2v3jim
	oi0hqyCtrcRiDzyH81K4TvGbzWYkdq91v8Fdyl1ZLxJB1oDKhuaQIejB+qbrymdacuSPYHd8muTAO
	VSzAHGlUn9qd2uWfKZqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hbMoO-0003jB-Pc; Thu, 13 Jun 2019 10:18:28 +0000
Received: from mail-cys01nam02on0631.outbound.protection.outlook.com
 ([2a01:111:f400:fe45::631]
 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMo0-0003M1-Km
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2019 10:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrIeVn+nUkqIe3O0L9yJM3lkBCAlzxedB/cahtwPIZc=;
 b=WJahQ7oSJsn4HkkLlNpsmBqcaaCSVwqcz06e9cu/omOt8s9+QhbRreNutiNaSKx8lMQaV2rSYWEsEywNSxhLPNegGLtFjKFMviUgG8Bhx0SKBUBU2pSIbhgxH8lvhYAtAOKmcLdegFCAvT3R1w60uUFLSFkIBIVDj2OYRXlK624=
Received: from BYAPR02MB4776.namprd02.prod.outlook.com (52.135.232.145) by
 BYAPR02MB4533.namprd02.prod.outlook.com (52.135.239.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Thu, 13 Jun 2019 10:18:00 +0000
Received: from BYAPR02MB4776.namprd02.prod.outlook.com
 ([fe80::3184:2890:c7e6:744a]) by BYAPR02MB4776.namprd02.prod.outlook.com
 ([fe80::3184:2890:c7e6:744a%6]) with mapi id 15.20.1987.010; Thu, 13 Jun 2019
 10:18:00 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Helmut Grohne <helmut.grohne@intenta.de>
Subject: RE: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Thread-Topic: [LINUX PATCH v14] mtd: rawnand: pl353: Add basic driver for arm
 pl353 smc nand interface
Thread-Index: AQHU83vggkxmg2rBCEyEcIHuXS/Vp6ZMy7GAgAFFM5CABRNXAIBGkizg
Date: Thu, 13 Jun 2019 10:18:00 +0000
Message-ID: <BYAPR02MB4776C0226F9A9F55C9A6DE44AFEF0@BYAPR02MB4776.namprd02.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: e5ac365a-def6-4ea5-cd45-08d6efe869ca
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR02MB4533; 
x-ms-traffictypediagnostic: BYAPR02MB4533:
x-microsoft-antispam-prvs: <BYAPR02MB453318B1CC8864D43AE5446BAFEF0@BYAPR02MB4533.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0067A8BA2A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(366004)(39860400002)(376002)(199004)(189003)(129404003)(13464003)(478600001)(26005)(7696005)(476003)(76176011)(446003)(6506007)(102836004)(186003)(53546011)(53936002)(9686003)(25786009)(55016002)(6436002)(6246003)(6916009)(4326008)(561944003)(71190400001)(71200400001)(229853002)(14444005)(33656002)(256004)(486006)(99286004)(2906002)(11346002)(54906003)(8676002)(52536014)(7736002)(305945005)(74316002)(5660300002)(81156014)(81166006)(14454004)(8936002)(66476007)(66556008)(64756008)(66446008)(7416002)(76116006)(66946007)(73956011)(6116002)(3846002)(316002)(66066001)(68736007)(86362001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4533;
 H:BYAPR02MB4776.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BkcVO+CnUpPMLVK7ILgX1UZDnqnDhZ0juHUJ6SWOigk5Ebe2iE/CrrqpgwjEBtEHDLijAf9OSMwPuuFaDWh+ubLKwGb+WWEvp87BxEFybRMv+83qV2VVySARHC4urQMDxutPQ7rqDW8DIzhObIoBE+ZvodoGS6TTyju7PDUjXcVLPT4NKvc1onHial2Zf7mx3hXvNBKD3/0lfUwUo4ATkbNvuWHhexgtKBh7sM75VI+VxmurOLYvZj6QapOfFRFTtDj7zvCMl2bjqdmS5HOii5i0YNDmu7zBTyvdwf4SOz+UbFLLPBxJaVPb/r7nPzWO2C9mS0GhTgPLxZYvB1pbD1Civ3VNLGmRRXi7kWkiJmMeL0e9vk/M7FusyT6HDmOQb67PB/3/r7ZT4u16ohCSoGtDwkj9gnIvGb/gL4IWezo=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ac365a-def6-4ea5-cd45-08d6efe869ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2019 10:18:00.3734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4533
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190613_031804_714126_E3DB9B16 
X-CRM114-Status: GOOD (  21.53  )
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
I spent much of time to address all your comments.
All are addressed and tested. except the above one(address offset calculation)
I didn't see any issue with the address calculation.
for (i = 0; i < min_t(unsigned int, 4, naddrs); i++) {
	nfc_op->addrs |= instr->ctx.addr.addrs[i] <<
			 (8 * i);
}
If you go through the nand_base.c, there nand_fill_column_cycles() API, fills the first two or one address cycle
Based on bus width and page size.
That means, addrs[0]/[1] will be updated here.
And the page is updated to the next offsets.
In the similar way we have to extract the offsets in driver.
So the first four address bytes are stored using the above for() loop and if the
Address cycles are more than 4, then store the remaining offsets as well.

I just compared the offsets that are updated in driver with the offsets(page and column) that the frame work(nand_base.c) is sending, and the offsets are same.
I have also checked these offsets with older driver(not exec_op() implemented) and both are matching.

So I didn't see any issue with this addrs calculation.
As per the statement mentioned by you, this driver consumes addr[0], addr[1], addr[2], addr[3] and
If more address cycles needed, then addr[4] and addr[5]. This is correct.

Please let me know, what exactly I am missing.

Thank you for your inputs and sorry for the delay, as I am on leave for some days.

Regards,
Naga Sureshkumar Relli
> 
> Helmut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
