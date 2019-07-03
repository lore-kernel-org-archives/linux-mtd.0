Return-Path: <SRS0=y7vF=VA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00198C0650E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 11:30:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7509218A0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 11:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="goV0hgXf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="UolObZ4b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7509218A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVgTtNODjQze+M7Al5fq2Oit9f/hFzdTHfTbWwswv3Y=; b=goV0hgXfI2BI0f
	MrMSnd2TE6jbA+V0A9jV3jVjVDH7VYlhUSK1diNcNcsqkdMEM1+l7Ac30q0SdkXq9BDmqL6bwB7/v
	pnkOZQAgw8PRN5DV0marX1i3a2L8SjUyonBX1u9nIrQDyppGYQsSvCMlXqIiH6b8l4xwXz/SHtKdZ
	tu74mfsx+xau4OepO9De2Dgj/HSBY1Ql35+aoMrhDVDBmXOYpEbI8nNR5SLjvnoHRA8kKDYqT6H1X
	ac6o+g7RFuKEIPmYKGRATRXOtdPZ7W58Me8IR5zNiw1Oy33qcrl9v9gJuekPxQzb9nSLtulOQM/gz
	AjmoCR0/0PGwkmDRW/Ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hidSa-0003fu-3f; Wed, 03 Jul 2019 11:30:00 +0000
Received: from mail-sn1nam01on0600.outbound.protection.outlook.com
 ([2a01:111:f400:fe40::600]
 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hidSW-0003fB-W3
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2019 11:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCmna1gLdmddByfrsz4FLGld7c8CeqMYTN8cSuD1ylY=;
 b=UolObZ4b7huN+CoYDb5tvzEIykivwWl5tV8bK12Mb6KFaZ9T8wfQFhcRbCb8thjDgREy417Q4KQBvigv/oCR2WGHCIXU9gqJ4B+IvMX8leJ9ZjRvNBnNHZHhRRqt/MIlucuzVd2jwiXLHY32mCDvMP/U/Gsx14MEeLtcyG9HUVQ=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB4667.namprd02.prod.outlook.com (20.176.108.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 11:29:49 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 11:29:49 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm  pl353 smc nand interface
Thread-Topic: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm  pl353 smc nand interface
Thread-Index: AQHVMWgp7D0lLmG2J0Kjwyg8UEvB4Ka4i+BAgAAwLACAAAUvoA==
Date: Wed, 3 Jul 2019 11:29:49 +0000
Message-ID: <DM6PR02MB47793413E233EE8ECB54BC66AFFB0@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190625044630.31717-2-naga.sureshkumar.relli@xilinx.com>
 <20190703082544.5b0ea566@collabora.com>
 <DM6PR02MB47792A7E700248348DAD9F78AFFB0@DM6PR02MB4779.namprd02.prod.outlook.com>
 <20190703130658.2abe5096@collabora.com>
In-Reply-To: <20190703130658.2abe5096@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3293d6d-4bf2-4d4f-3a8a-08d6ffa9c230
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB4667; 
x-ms-traffictypediagnostic: DM6PR02MB4667:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR02MB466761C1D9B7290E2C54AE03AFFB0@DM6PR02MB4667.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(189003)(199004)(13464003)(51914003)(486006)(68736007)(14454004)(6916009)(6436002)(8936002)(966005)(71190400001)(71200400001)(86362001)(6246003)(2906002)(316002)(7696005)(99286004)(53546011)(6506007)(102836004)(478600001)(9686003)(6306002)(55016002)(76176011)(256004)(14444005)(53936002)(305945005)(26005)(74316002)(7736002)(8676002)(81166006)(81156014)(107886003)(7416002)(25786009)(4326008)(5660300002)(73956011)(76116006)(66946007)(66446008)(66476007)(66556008)(64756008)(52536014)(54906003)(186003)(66066001)(446003)(3846002)(229853002)(33656002)(6116002)(476003)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB4667;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jcBYH97tG1xXxtccmAVgb9rzOV9IDhuJw7oyqcF+zcDdQtx7sOmrG3yL4mi4Y0YQZV7UHRj9AKX7vK5gc5togl/KqmUF8tlnQzFGsy6VoTj6knWk0kX3w5kjzIUWFTuoF+iMOeljAUPOmNxn5lETQBLRJQPMcU5ZrM6MWpIbm8HPJv5G2AOj0lnAANFvB3OwGaGqqJ/EvHFR0cPZVgJ+slpU3Wb4B5M/Bh+OKmsJXW8xpqPmeWCWUp/RQxQ6LODa2flxq8wgG7fmE2+c9PPCQJVuGZmdygja91Z14nhXdKV575bEQEz6x+f8hh+xlZQ+NKdB2vRIZS1bGVxJhrDbGqHLs3+LPo8XZoQxpmiM33uBO1Ld2cu0c367rpNYEh/wW4xVFdTgl0QPJ8QrLnv+5Cw0QX/EPtjcvT9A0XDrYG4=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3293d6d-4bf2-4d4f-3a8a-08d6ffa9c230
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:29:49.1310 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4667
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_042957_035091_62DF43C4 
X-CRM114-Status: GOOD (  30.91  )
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
 "helmut.grohne@intenta.de" <helmut.grohne@intenta.de>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 Michal Simek <michals@xilinx.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

> -----Original Message-----
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Sent: Wednesday, July 3, 2019 4:37 PM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com;
> bbrezillon@kernel.org; yamada.masahiro@socionext.com; linux-mtd@lists.infradead.org; linux-
> kernel@vger.kernel.org; Michal Simek <michals@xilinx.com>
> Subject: Re: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for arm pl353
> smc nand interface
> 
> On Wed, 3 Jul 2019 08:57:57 +0000
> Naga Sureshkumar Relli <nagasure@xilinx.com> wrote:
> 
> > Hi Boris,
> >
> > Thanks for the review.
> >
> > > -----Original Message-----
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Sent: Wednesday, July 3, 2019 11:56 AM
> > > To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> > > Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de;
> > > richard@nod.at; dwmw2@infradead.org; computersforpeace@gmail.com;
> > > marek.vasut@gmail.com; vigneshr@ti.com; bbrezillon@kernel.org;
> > > yamada.masahiro@socionext.com; linux- mtd@lists.infradead.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic
> > > driver for arm pl353 smc nand interface
> > >
> > > On Mon, 24 Jun 2019 22:46:30 -0600
> > > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> > >
> > >
> > > > +
> > > > +/**
> > > > + * pl353_nand_exec_op_cmd - Send command to NAND device
> > > > + * @chip:	Pointer to the NAND chip info structure
> > > > + * @subop:	Pointer to array of instructions
> > > > + * Return:	Always return zero
> > > > + */
> > > > +static int pl353_nand_exec_op_cmd(struct nand_chip *chip,
> > > > +				  const struct nand_subop *subop) {
> > > > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > > > +	const struct nand_op_instr *instr;
> > > > +	struct pl353_nfc_op nfc_op = {};
> > > > +	struct pl353_nand_controller *xnfc = to_pl353_nand(chip);
> > > > +	unsigned long cmd_phase_data = 0, end_cmd_valid = 0;
> > > > +	unsigned long end_cmd;
> > > > +	unsigned int op_id, len;
> > > > +	bool reading;
> > > > +	u32 cmdphase_addrflags;
> > > > +
> > > > +	pl353_nfc_parse_instructions(chip, subop, &nfc_op);
> > > > +	instr = nfc_op.data_instr;
> > > > +	op_id = nfc_op.data_instr_idx;
> > > > +	pl353_smc_clr_nand_int();
> > > > +
> > > > +	/* Get the command phase address */
> > > > +	if (nfc_op.cmnds[1] != 0) {
> > > > +		if (nfc_op.cmnds[0] == NAND_CMD_SEQIN)
> > > > +			end_cmd_valid = 0;
> > > > +		else
> > > > +			end_cmd_valid = 1;
> > >
> > > You're testing the opcode, again. As I said several times, the
> > > ->exec_op() implementation should be opcode agnostic, it should just
> > > ->try
> > > to match sequences of <CMD>-<ADDR>-<DATA> cycles.
> > >
> > This driver uses common function for all patterns.
> > There was some discussion happened on v8 series
> > https://lore.kernel.org/patchwork/patch/933639/
> > There the comments from Miquel was to use an optional property In the
> > pattern Matching, so with this approach, based on the command need to
> > update the end_cmd_valid bit in command phase cycle.
> > So in order to follow that approach, we defined a common pattern
> > matching function And there we are checking the commands.
> > It significantly reduces the code repetition.
> 
> That's not what I'm talking about. I'm talking about the explicit 'nfc_op.cmnds[0] ==
> NAND_CMD_SEQIN' check, which AFAICT, is wrong, or at the very least, not future-proof
> at all.
Ok.
> 
> Let me see if I understand what end_cmd_valid means: it's supposed to be set when the ADDR
> cycles are followed by a CMD cycle. You don't need to check if the first CMD cycle is !SEQIN
> (AKA start programming a page) to know that: just go through the flow of instructions in the
> subop, and check what's coming just after the ADDR instruction.
Ok. then let me update as per the flow of instructions.
> 
> >
> > I understand your concern about not to check any NAND command in the
> > drivers under ->exec_op() implementation.
> > But do you see any issues/impact with this?
> 
> Yes, I do. Sorry to say that, but the whole driver is coded with specific use-cases (read/write
> page, read param page, etc) in mind, which is exactly what we were trying to avoid when
> designing exec_op(). The goal was to have something that's easily maintainable and does not
> break every time one tests a previously untested chip <-> controller combination.
> 
Ok. I understand.

> > Functionality wise Helmut tested each series and we addressed all the comments in v17
> series.
> 
> Just because it's been tested does not mean it's ready to be merged, sorry.
> 
Ok. I will submit next version with the above changes.
> >
> > Could you please let me know what do you say?
> >
> > > > +	}
> > > > +
> > > > +	end_cmd = nfc_op.cmnds[1];
> > > > +
> > > > +	/*
> > > > +	 * The SMC defines two phases of commands when transferring data to or
> > > > +	 * from NAND flash.
> > > > +	 * Command phase: Commands and optional address information are written
> > > > +	 * to the NAND flash.The command and address can be associated with
> > > > +	 * either a data phase operation to write to or read from the array,
> > > > +	 * or a status/ID register transfer.
> > > > +	 * Data phase: Data is either written to or read from the NAND flash.
> > > > +	 * This data can be either data transferred to or from the array,
> > > > +	 * or status/ID register information.
> > > > +	 */
> > > > +	cmdphase_addrflags = ((nfc_op.naddrs << ADDR_CYCLES_SHIFT) |
> > > > +			 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> > > > +			 (COMMAND_PHASE) |
> > > > +			 (end_cmd << END_CMD_SHIFT) |
> > > > +			 (nfc_op.cmnds[0] << START_CMD_SHIFT));
> > > > +
> > > > +	/* Get the data phase address */
> > > > +	end_cmd_valid = 0;
> > > > +
> > > > +	xnfc->dataphase_addrflags = ((0x0 << CLEAR_CS_SHIFT) |
> > > > +			  (end_cmd_valid << END_CMD_VALID_SHIFT) |
> > > > +			  (DATA_PHASE) |
> > > > +			  (end_cmd << END_CMD_SHIFT) |
> > > > +			  (0x0 << ECC_LAST_SHIFT));
> > > > +
> > > > +	/* Command phase AXI Read & Write */
> > > > +	if (nfc_op.naddrs >= 5) {
> > > > +		if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> > > > +			cmd_phase_data = nfc_op.addrs;
> > > > +
> > > > +			/* Another address cycle for devices > 128MiB */
> > > > +			if (chip->options & NAND_ROW_ADDR_3) {
> > >
> > > Clearly, none of this belongs in the ->exec_op() implementation.
> > > Looks like something related to page read...
> > As I mentioned above in comments of pl353_exec_op(), the PL353 SMC
> > Controller uses command phase and data phase.
> > And in the Command phase, command and optional addresses are written to NAND flash.
> > And it is correct as you said, it looks like page reads but it is
> > actually a command phase address update.
> 
> You have the exact number of ADDR cycles to issue in the ADDR instruction, why do you
> need to check NAND_ROW_ADDR_3 at all?
Ok. nand_base.c is already doing that. Got it.
I will update.
Thanks for the review and suggestions.

Thanks,
Naga Sureshkumar Relli

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
