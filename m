Return-Path: <SRS0=y7vF=VA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD369C0650E
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 08:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822772080C
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 08:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dgXS9H81";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xilinx.onmicrosoft.com header.i=@xilinx.onmicrosoft.com header.b="GCut95/f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822772080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xilinx.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfFJPeJPzNNPv/KFTBgQSJFclyc873mhrj9rpB9Tmmw=; b=dgXS9H81YXzovi
	qM8qVFLIfYRmxXA/KvcdHqSAilcD/bZRn9J6/CpAI74duYymkrZE6U3e6W4tdmf+m47pN++UtkpYR
	hOksw8/O09eEmybZM1bFm0kz7QgK7k+kPhh3xwD8j+trnCM+DZoy/xMVT8kAmppNzLCcxqor3ntjJ
	XV/x6zoEf69QpXANoWLi5B+4dttfUpo5eItW+Ph3xIN1STjd6KgL0nNC/6ijuye4rHsKDQfWqEwwE
	OgzaLbk4SALAC0wE+JmetLPxp8irbB4SfinEjdh3bljE1YD57YYgpI+ll+ZD4b8Ow8b7cBntwcQLS
	rZCJfaKqWYARo5E810cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hib5Z-0004ef-OZ; Wed, 03 Jul 2019 08:58:05 +0000
Received: from mail-eopbgr740051.outbound.protection.outlook.com
 ([40.107.74.51] helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hib5V-0004dx-Dh
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2019 08:58:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymBgE0vSWmJ4nERebEfcKSvITd/tlQS5EjrmEaOrO6Y=;
 b=GCut95/fghoyAJYt7dYeVwkojhleO0ZIHcqheFuzjrh5/EWM/FITts7cLTbc451PnEd5sCo94W6gaNxWBhZ8IowPwelYIIi2vr1QRDzT9SwxEw3ceBJopnvkqah74eXzL+PdX5FkURO8sC9rJPPKuTZWZZGun05vzjYEFEnQ5YA=
Received: from DM6PR02MB4779.namprd02.prod.outlook.com (20.176.109.16) by
 DM6PR02MB5580.namprd02.prod.outlook.com (20.177.222.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 08:57:57 +0000
Received: from DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513]) by DM6PR02MB4779.namprd02.prod.outlook.com
 ([fe80::936:90c8:a385:1513%4]) with mapi id 15.20.2032.019; Wed, 3 Jul 2019
 08:57:57 +0000
From: Naga Sureshkumar Relli <nagasure@xilinx.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm  pl353 smc nand interface
Thread-Topic: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm  pl353 smc nand interface
Thread-Index: AQHVMWgp7D0lLmG2J0Kjwyg8UEvB4Ka4i+BA
Date: Wed, 3 Jul 2019 08:57:57 +0000
Message-ID: <DM6PR02MB47792A7E700248348DAD9F78AFFB0@DM6PR02MB4779.namprd02.prod.outlook.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190625044630.31717-2-naga.sureshkumar.relli@xilinx.com>
 <20190703082544.5b0ea566@collabora.com>
In-Reply-To: <20190703082544.5b0ea566@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=nagasure@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d0b758b-f286-4a27-ada5-08d6ff948b4d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR02MB5580; 
x-ms-traffictypediagnostic: DM6PR02MB5580:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR02MB5580D063E8B65BA069425516AFFB0@DM6PR02MB5580.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(51914003)(13464003)(189003)(199004)(107886003)(2906002)(6916009)(6306002)(71190400001)(6436002)(86362001)(4326008)(71200400001)(9686003)(8936002)(68736007)(81156014)(55016002)(486006)(53936002)(6246003)(11346002)(7416002)(229853002)(81166006)(316002)(8676002)(256004)(54906003)(5660300002)(446003)(186003)(476003)(66066001)(99286004)(6506007)(53546011)(25786009)(66556008)(64756008)(66446008)(6116002)(73956011)(76176011)(26005)(52536014)(76116006)(14444005)(7696005)(102836004)(66476007)(14454004)(66946007)(3846002)(33656002)(74316002)(478600001)(966005)(305945005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR02MB5580;
 H:DM6PR02MB4779.namprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: I0cy3knEJsivOJZR5DSrrmCnMYPcC0NfDAk183qSEahP6N49l+1AdEX3bX9R2A/S4qNLtFWZsJNjqdQQSTR1UuqxZoBi8oeQX9LcbkZRFp1aHxmixOSMOR0EZT+TqXthHYE4eI2C8UrC2mcMLZLAuOivantipk1+H+HHRw1Tg9LxfVD4G6PyB51ZXyy96CRsPHw09Zx6ieBSdvNOBfwdL+pTbEZRbIG3VDBsyrAFItXgRMHyUwutsYPeHqUwKcaesiqvVMgZyAn+BUjrRNfFc43fn1Ai1OhMGUFuR6R6RJ+jswtTYpUOOc19WWnTmy/3vYUzJ6bgPu+5Jfzh4jXKFcmb1aICFBv361bCkveSiXkei0JKoUO7dceLmKy4jV/UqEpS6X2PmrxoKAUBxddJnGTsnFNZz0uF4OJELmjxK8o=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0b758b-f286-4a27-ada5-08d6ff948b4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 08:57:57.4741 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nagasure@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190703_015801_463026_D1E9BD40 
X-CRM114-Status: GOOD (  20.21  )
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

Thanks for the review.

> -----Original Message-----
> From: Boris Brezillon <boris.brezillon@collabora.com>
> Sent: Wednesday, July 3, 2019 11:56 AM
> To: Naga Sureshkumar Relli <nagasure@xilinx.com>
> Cc: miquel.raynal@bootlin.com; helmut.grohne@intenta.de; richard@nod.at;
> dwmw2@infradead.org; computersforpeace@gmail.com; marek.vasut@gmail.com;
> vigneshr@ti.com; bbrezillon@kernel.org; yamada.masahiro@socionext.com; linux-
> mtd@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for arm pl353
> smc nand interface
> 
> On Mon, 24 Jun 2019 22:46:30 -0600
> Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> 
> 
> > +
> > +/**
> > + * pl353_nand_exec_op_cmd - Send command to NAND device
> > + * @chip:	Pointer to the NAND chip info structure
> > + * @subop:	Pointer to array of instructions
> > + * Return:	Always return zero
> > + */
> > +static int pl353_nand_exec_op_cmd(struct nand_chip *chip,
> > +				  const struct nand_subop *subop) {
> > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > +	const struct nand_op_instr *instr;
> > +	struct pl353_nfc_op nfc_op = {};
> > +	struct pl353_nand_controller *xnfc = to_pl353_nand(chip);
> > +	unsigned long cmd_phase_data = 0, end_cmd_valid = 0;
> > +	unsigned long end_cmd;
> > +	unsigned int op_id, len;
> > +	bool reading;
> > +	u32 cmdphase_addrflags;
> > +
> > +	pl353_nfc_parse_instructions(chip, subop, &nfc_op);
> > +	instr = nfc_op.data_instr;
> > +	op_id = nfc_op.data_instr_idx;
> > +	pl353_smc_clr_nand_int();
> > +
> > +	/* Get the command phase address */
> > +	if (nfc_op.cmnds[1] != 0) {
> > +		if (nfc_op.cmnds[0] == NAND_CMD_SEQIN)
> > +			end_cmd_valid = 0;
> > +		else
> > +			end_cmd_valid = 1;
> 
> You're testing the opcode, again. As I said several times, the
> ->exec_op() implementation should be opcode agnostic, it should just try
> to match sequences of <CMD>-<ADDR>-<DATA> cycles.
> 
This driver uses common function for all patterns.
There was some discussion happened on v8 series 
https://lore.kernel.org/patchwork/patch/933639/
There the comments from Miquel was to use an optional property In the pattern
Matching, so with this approach, based on the command need to update the 
end_cmd_valid bit in command phase cycle.
So in order to follow that approach, we defined a common pattern matching function
And there we are checking the commands.
It significantly reduces the code repetition.

I understand your concern about not to check any NAND command in the drivers
under ->exec_op() implementation.
But do you see any issues/impact with this?
Functionality wise Helmut tested each series and we addressed all the comments in v17 series.

Could you please let me know what do you say?

> > +	}
> > +
> > +	end_cmd = nfc_op.cmnds[1];
> > +
> > +	/*
> > +	 * The SMC defines two phases of commands when transferring data to or
> > +	 * from NAND flash.
> > +	 * Command phase: Commands and optional address information are written
> > +	 * to the NAND flash.The command and address can be associated with
> > +	 * either a data phase operation to write to or read from the array,
> > +	 * or a status/ID register transfer.
> > +	 * Data phase: Data is either written to or read from the NAND flash.
> > +	 * This data can be either data transferred to or from the array,
> > +	 * or status/ID register information.
> > +	 */
> > +	cmdphase_addrflags = ((nfc_op.naddrs << ADDR_CYCLES_SHIFT) |
> > +			 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> > +			 (COMMAND_PHASE) |
> > +			 (end_cmd << END_CMD_SHIFT) |
> > +			 (nfc_op.cmnds[0] << START_CMD_SHIFT));
> > +
> > +	/* Get the data phase address */
> > +	end_cmd_valid = 0;
> > +
> > +	xnfc->dataphase_addrflags = ((0x0 << CLEAR_CS_SHIFT) |
> > +			  (end_cmd_valid << END_CMD_VALID_SHIFT) |
> > +			  (DATA_PHASE) |
> > +			  (end_cmd << END_CMD_SHIFT) |
> > +			  (0x0 << ECC_LAST_SHIFT));
> > +
> > +	/* Command phase AXI Read & Write */
> > +	if (nfc_op.naddrs >= 5) {
> > +		if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> > +			cmd_phase_data = nfc_op.addrs;
> > +
> > +			/* Another address cycle for devices > 128MiB */
> > +			if (chip->options & NAND_ROW_ADDR_3) {
> 
> Clearly, none of this belongs in the ->exec_op() implementation. Looks like something related
> to page read...
As I mentioned above in comments of pl353_exec_op(), the PL353 SMC
Controller uses command phase and data phase.
And in the Command phase, command and optional addresses are written to NAND flash.
And it is correct as you said, it looks like page reads but it is actually a command phase address
update.
> 
> > +				writel_relaxed(cmd_phase_data,
> > +					       xnfc->regs + cmdphase_addrflags);
> > +				cmd_phase_data = nfc_op.addrs_56;
> > +			}
> > +		}
> > +	}  else {
> > +		if (nfc_op.addrs != -1) {
> > +			int column = nfc_op.addrs;
> > +
> > +			/*
> > +			 * Change read/write column, read id etc
> > +			 * Adjust columns for 16 bit bus width
> > +			 */
> > +			if ((chip->options & NAND_BUSWIDTH_16) &&
> > +			    (nfc_op.cmnds[0] == NAND_CMD_READ0 ||
> > +				nfc_op.cmnds[0] == NAND_CMD_SEQIN ||
> > +				nfc_op.cmnds[0] == NAND_CMD_RNDOUT ||
> > +				nfc_op.cmnds[0] == NAND_CMD_RNDIN)) {
> > +				column >>= 1;
> 
> And you keep testing opcodes here. Note that the address cycles should have been adjusted by
> core already when we have 16-bit accesses.
> 
> 
> > +			}
> > +			cmd_phase_data = column;
> > +		}
> > +	}
> > +
> > +	writel_relaxed(cmd_phase_data, xnfc->regs + cmdphase_addrflags);
> > +	if (!nfc_op.data_instr) {
> > +		if (nfc_op.rdy_timeout_ms) {
> > +			if (pl353_wait_for_dev_ready(chip))
> > +				return -ETIMEDOUT;
> > +		}
> > +
> > +		return 0;
> > +	}
> > +
> > +	reading = (nfc_op.data_instr->type == NAND_OP_DATA_IN_INSTR);
> > +	if (!reading) {
> > +		len = nand_subop_get_data_len(subop, op_id);
> > +		pl353_nand_write_data_op(chip, instr->ctx.data.buf.out,
> > +					 len, instr->ctx.data.force_8bit);
> > +		if (nfc_op.rdy_timeout_ms) {
> > +			if (pl353_wait_for_dev_ready(chip))
> > +				return -ETIMEDOUT;
> > +		}
> > +
> > +		ndelay(nfc_op.rdy_delay_ns);
> > +	} else {
> > +		len = nand_subop_get_data_len(subop, op_id);
> > +		ndelay(nfc_op.rdy_delay_ns);
> > +		if (nfc_op.rdy_timeout_ms) {
> > +			if (pl353_wait_for_dev_ready(chip))
> > +				return -ETIMEDOUT;
> > +		}
> > +
> > +		pl353_nand_read_data_op(chip, instr->ctx.data.buf.in, len,
> > +					instr->ctx.data.force_8bit);
> > +	}
> > +
> > +	return 0;
> > +}

Thanks,
Naga Sureshkumar Relli

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
