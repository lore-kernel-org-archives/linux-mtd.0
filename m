Return-Path: <SRS0=y7vF=VA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27696C5B578
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 06:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF4842187F
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jul 2019 06:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F7s/Zozn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF4842187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyuYc35K96EZD9O9+zjX7pVpZvzaaF2IrdLVU4za68g=; b=F7s/Zozno4+lXl
	qr9/HrsBb0nqtv20sOxPqG91lHbppCZvj1ZeiXrwEqZbFd0QSEcEEhbbthNOnVwcTAGQGZ4r5TEQK
	c+mQvRkP31nbcqLDaMPBzVmbiIgWBxNgwm+coDrDKbBeOfKB//xotqUjjbbelI4GRY356lB/pXfV4
	eL7TpdwkufcnYRL2Wk+OOhgXJ5txyNHcq/FzRtfyxSuq4hPakJqr7cWa4wleKzpcmibN0nGOOshhi
	HQeyvKbWKxdhXR/mooOTFcOv7A8duJkwo+d5m2xvyDPAbprCwRaK6mXg+eHMNb6D017VjBXdwzo6B
	u8bgrmsRe+Wg/0xDKNQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiYiI-0001CV-Sm; Wed, 03 Jul 2019 06:25:54 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiYiE-0001Bp-DF
 for linux-mtd@lists.infradead.org; Wed, 03 Jul 2019 06:25:52 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 32AE027FD39;
 Wed,  3 Jul 2019 07:25:48 +0100 (BST)
Date: Wed, 3 Jul 2019 08:25:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
Subject: Re: [LINUX PATCH v17 2/2] mtd: rawnand: pl353: Add basic driver for
 arm  pl353 smc nand interface
Message-ID: <20190703082544.5b0ea566@collabora.com>
In-Reply-To: <20190625044630.31717-2-naga.sureshkumar.relli@xilinx.com>
References: <20190625044630.31717-1-naga.sureshkumar.relli@xilinx.com>
 <20190625044630.31717-2-naga.sureshkumar.relli@xilinx.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_232550_709982_A59231C3 
X-CRM114-Status: GOOD (  17.08  )
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
Cc: vigneshr@ti.com, bbrezillon@kernel.org, helmut.grohne@intenta.de,
 richard@nod.at, linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 yamada.masahiro@socionext.com, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 24 Jun 2019 22:46:30 -0600
Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:


> +
> +/**
> + * pl353_nand_exec_op_cmd - Send command to NAND device
> + * @chip:	Pointer to the NAND chip info structure
> + * @subop:	Pointer to array of instructions
> + * Return:	Always return zero
> + */
> +static int pl353_nand_exec_op_cmd(struct nand_chip *chip,
> +				  const struct nand_subop *subop)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	const struct nand_op_instr *instr;
> +	struct pl353_nfc_op nfc_op = {};
> +	struct pl353_nand_controller *xnfc = to_pl353_nand(chip);
> +	unsigned long cmd_phase_data = 0, end_cmd_valid = 0;
> +	unsigned long end_cmd;
> +	unsigned int op_id, len;
> +	bool reading;
> +	u32 cmdphase_addrflags;
> +
> +	pl353_nfc_parse_instructions(chip, subop, &nfc_op);
> +	instr = nfc_op.data_instr;
> +	op_id = nfc_op.data_instr_idx;
> +	pl353_smc_clr_nand_int();
> +
> +	/* Get the command phase address */
> +	if (nfc_op.cmnds[1] != 0) {
> +		if (nfc_op.cmnds[0] == NAND_CMD_SEQIN)
> +			end_cmd_valid = 0;
> +		else
> +			end_cmd_valid = 1;

You're testing the opcode, again. As I said several times, the
->exec_op() implementation should be opcode agnostic, it should just try
to match sequences of <CMD>-<ADDR>-<DATA> cycles.

> +	}
> +
> +	end_cmd = nfc_op.cmnds[1];
> +
> +	/*
> +	 * The SMC defines two phases of commands when transferring data to or
> +	 * from NAND flash.
> +	 * Command phase: Commands and optional address information are written
> +	 * to the NAND flash.The command and address can be associated with
> +	 * either a data phase operation to write to or read from the array,
> +	 * or a status/ID register transfer.
> +	 * Data phase: Data is either written to or read from the NAND flash.
> +	 * This data can be either data transferred to or from the array,
> +	 * or status/ID register information.
> +	 */
> +	cmdphase_addrflags = ((nfc_op.naddrs << ADDR_CYCLES_SHIFT) |
> +			 (end_cmd_valid << END_CMD_VALID_SHIFT) |
> +			 (COMMAND_PHASE) |
> +			 (end_cmd << END_CMD_SHIFT) |
> +			 (nfc_op.cmnds[0] << START_CMD_SHIFT));
> +
> +	/* Get the data phase address */
> +	end_cmd_valid = 0;
> +
> +	xnfc->dataphase_addrflags = ((0x0 << CLEAR_CS_SHIFT) |
> +			  (end_cmd_valid << END_CMD_VALID_SHIFT) |
> +			  (DATA_PHASE) |
> +			  (end_cmd << END_CMD_SHIFT) |
> +			  (0x0 << ECC_LAST_SHIFT));
> +
> +	/* Command phase AXI Read & Write */
> +	if (nfc_op.naddrs >= 5) {
> +		if (mtd->writesize > PL353_NAND_ECC_SIZE) {
> +			cmd_phase_data = nfc_op.addrs;
> +
> +			/* Another address cycle for devices > 128MiB */
> +			if (chip->options & NAND_ROW_ADDR_3) {

Clearly, none of this belongs in the ->exec_op() implementation. Looks
like something related to page read...

> +				writel_relaxed(cmd_phase_data,
> +					       xnfc->regs + cmdphase_addrflags);
> +				cmd_phase_data = nfc_op.addrs_56;
> +			}
> +		}
> +	}  else {
> +		if (nfc_op.addrs != -1) {
> +			int column = nfc_op.addrs;
> +
> +			/*
> +			 * Change read/write column, read id etc
> +			 * Adjust columns for 16 bit bus width
> +			 */
> +			if ((chip->options & NAND_BUSWIDTH_16) &&
> +			    (nfc_op.cmnds[0] == NAND_CMD_READ0 ||
> +				nfc_op.cmnds[0] == NAND_CMD_SEQIN ||
> +				nfc_op.cmnds[0] == NAND_CMD_RNDOUT ||
> +				nfc_op.cmnds[0] == NAND_CMD_RNDIN)) {
> +				column >>= 1;

And you keep testing opcodes here. Note that the address cycles should
have been adjusted by core already when we have 16-bit accesses.


> +			}
> +			cmd_phase_data = column;
> +		}
> +	}
> +
> +	writel_relaxed(cmd_phase_data, xnfc->regs + cmdphase_addrflags);
> +	if (!nfc_op.data_instr) {
> +		if (nfc_op.rdy_timeout_ms) {
> +			if (pl353_wait_for_dev_ready(chip))
> +				return -ETIMEDOUT;
> +		}
> +
> +		return 0;
> +	}
> +
> +	reading = (nfc_op.data_instr->type == NAND_OP_DATA_IN_INSTR);
> +	if (!reading) {
> +		len = nand_subop_get_data_len(subop, op_id);
> +		pl353_nand_write_data_op(chip, instr->ctx.data.buf.out,
> +					 len, instr->ctx.data.force_8bit);
> +		if (nfc_op.rdy_timeout_ms) {
> +			if (pl353_wait_for_dev_ready(chip))
> +				return -ETIMEDOUT;
> +		}
> +
> +		ndelay(nfc_op.rdy_delay_ns);
> +	} else {
> +		len = nand_subop_get_data_len(subop, op_id);
> +		ndelay(nfc_op.rdy_delay_ns);
> +		if (nfc_op.rdy_timeout_ms) {
> +			if (pl353_wait_for_dev_ready(chip))
> +				return -ETIMEDOUT;
> +		}
> +
> +		pl353_nand_read_data_op(chip, instr->ctx.data.buf.in, len,
> +					instr->ctx.data.force_8bit);
> +	}
> +
> +	return 0;
> +}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
