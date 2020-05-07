Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6FAC38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D54072063A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 12:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QgpiD7dT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D54072063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKHSmLh8AcRLavy6uH6LU83A5Sv8l1FatFcaAMDWsdQ=; b=QgpiD7dTtS0WqD
	lao+nxbrUxPWimt2BTeGxNt5HaUZPiFDxkJAq+KgXn71NKC7D4lUdCPiZNokTXxiyQF0Wy8En6sex
	SS6Jk3gm0s3Ihd3j9geDfZQX2YDAELWZ0F+PRBZ8zJxMgswGfxgNkS5Gv2rQQlqfHjRByE1uEf46O
	d3w9gCPLtwNO1maaBDhmbix79RQzNfESFdydpKLbC5dohCFxbalDKXE4nVyPhRgbQJvXG07Nn6AgI
	jZXSA8HMVK+68ncIZP9rtoMQyyNU/N4XWt01LB5HVvFdisk4hZK1n85rmz7m8h+/34oIGhNv0yXpe
	B0EPv0eKJkKMZhvB8tLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWg03-0008LB-BB; Thu, 07 May 2020 12:51:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWfzz-0008K3-2i
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 12:51:37 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 23EAF2A29FB;
 Thu,  7 May 2020 13:51:30 +0100 (BST)
Date: Thu, 7 May 2020 14:51:27 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200507145127.71615ed8@collabora.com>
In-Reply-To: <20200507110034.14736-8-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
 <20200507110034.14736-8-miquel.raynal@bootlin.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_055135_389971_52B3033D 
X-CRM114-Status: GOOD (  23.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Simek <monstr@monstr.eu>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  7 May 2020 13:00:33 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:


> +/**
> + * struct arasan_nfc - Defines the Arasan NAND flash controller driver instance
> + * @dev:		Pointer to the device structure
> + * @base:		Remapped register area
> + * @controller_clk:		Pointer to the system clock
> + * @bus_clk:		Pointer to the flash clock
> + * @controller:		Base controller structure
> + * @chips:		List of all NAND chips attached to the controller
> + * @assigned_cs:	Bitmask describing already assigned CS lines
> + * @cur_clk:		Current clock rate
> + * @bf:			Array of bitflips read in each ECC step
> + */
> +struct arasan_nfc {
> +	struct device *dev;
> +	void __iomem *base;
> +	struct clk *controller_clk;
> +	struct clk *bus_clk;
> +	struct nand_controller controller;
> +	struct list_head chips;
> +	unsigned long assigned_cs;
> +	unsigned int cur_clk;
> +	u8 *bf;

Looks like this field is never used.

> +};
> +
> +static struct anand *to_anand(struct nand_chip *nand)
> +{
> +	return container_of(nand, struct anand, chip);
> +}
> +
> +static struct arasan_nfc *to_anfc(struct nand_controller *ctrl)
> +{
> +	return container_of(ctrl, struct arasan_nfc, controller);
> +}
> +
> +static void anfc_disable_int(struct arasan_nfc *nfc, u32 mask)
> +{
> +	mask &= ~EVENT_MASK;
> +	mask &= EVENT_MASK;
> +	writel_relaxed(mask, nfc->base + INTR_SIG_EN_REG);
> +}
> +
> +static int anfc_wait_for_event(struct arasan_nfc *nfc, unsigned int event)
> +{
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_relaxed_poll_timeout(nfc->base + INTR_STS_REG, val,
> +					 val & event, 0,
> +					 ANFC_DFLT_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(nfc->dev, "Timeout waiting for event 0x%x\n", event);
> +		return -ETIMEDOUT;
> +	}
> +
> +	writel_relaxed(event, nfc->base + INTR_STS_REG);
> +
> +	return 0;
> +}
> +
> +static int anfc_wait_for_rb(struct arasan_nfc *nfc, struct nand_chip *chip,
> +			    unsigned int timeout_ms)
> +{
> +	struct anand *anand = to_anand(chip);
> +	u32 val;
> +	int ret;
> +
> +	ret = readl_relaxed_poll_timeout(nfc->base + READY_STS_REG, val,
> +					 val & BIT(anand->rb),
> +					 0, timeout_ms * 1000);

You don't have an interrupt on R/B transition? If can, that would
probably be better to use interrupts than polling the status reg.

> +	if (ret) {
> +		dev_err(nfc->dev, "Timeout waiting for R/B 0x%x\n",
> +			readl_relaxed(nfc->base + READY_STS_REG));
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static void anfc_trigger_op(struct arasan_nfc *nfc, struct anfc_op *nfc_op)
> +{
> +	writel_relaxed(nfc_op->pkt_reg, nfc->base + PKT_REG);
> +	writel_relaxed(nfc_op->addr1_reg, nfc->base + MEM_ADDR1_REG);
> +	writel_relaxed(nfc_op->addr2_reg, nfc->base + MEM_ADDR2_REG);
> +	writel_relaxed(nfc_op->cmd_reg, nfc->base + CMD_REG);
> +	writel_relaxed(nfc_op->prog_reg, nfc->base + PROG_REG);
> +}
> +
> +static int anfc_len_to_steps(struct nand_chip *chip, unsigned int len)
> +{
> +	unsigned int steps = 1, pktsize = len;
> +
> +	while (pktsize > ANFC_MAX_PKT_SIZE) {
> +		steps *= 2;
> +		pktsize = DIV_ROUND_UP(len, steps);

Hm, I'm not sure that's right. What happens if steps * pksize is bigger
than the requested number of DATA cycles? Not all operations accept to
have more data read/written than requested.

I'd rather have something that does:

static void anfc_len_to_steps(struct nand_chip *chip, unsigned int len,
			      unsigned int *pktsize,
			      unsigned int *npkts)
{
	if (len <= ANFC_MAX_PKT_SIZE) {
		*pktsize = len;
		*npkts = 1;
		return;
	}

	for (*npkts = 2; *npkts < ANFC_MAX_NUM_PKTS; *npkts *= 2) {
		*pktsize = len / *npkts;
		if (*pktsize <= ANFC_MAX_PKT_SIZE)
			break;
	}
}

And then, from the call size, you trigger new DATA_OUT/IN operation if
len > pktsize * npkts.

> +	}
> +
> +	return steps;

I guess you have a limit on steps. It's probably worth checking
that steps is in bounds.

> +}
> +
> +/* NAND framework ->exec_op() hooks and related helpers */
> +static void anfc_parse_instructions(struct nand_chip *chip,
> +				    const struct nand_subop *subop,
> +				    struct anfc_op *nfc_op)
> +{
> +	struct anand *anand = to_anand(chip);
> +	const struct nand_op_instr *instr = NULL;
> +	bool first_cmd = true;
> +	unsigned int op_id;
> +	int i;
> +
> +	memset(nfc_op, 0, sizeof(*nfc_op));
> +	nfc_op->addr2_reg = ADDR2_CS(anand->cs);
> +	nfc_op->cmd_reg = CMD_PAGE_SIZE(anand->page_sz);
> +
> +	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
> +		unsigned int offset, naddrs, pktsize;
> +		const u8 *addrs;
> +		u8 *buf;
> +
> +		instr = &subop->instrs[op_id];
> +
> +		switch (instr->type) {
> +		case NAND_OP_CMD_INSTR:
> +			if (first_cmd)
> +				nfc_op->cmd_reg |= CMD_1(instr->ctx.cmd.opcode);
> +			else
> +				nfc_op->cmd_reg |= CMD_2(instr->ctx.cmd.opcode);
> +
> +			first_cmd = false;
> +			break;
> +
> +		case NAND_OP_ADDR_INSTR:
> +			offset = nand_subop_get_addr_start_off(subop, op_id);
> +			naddrs = nand_subop_get_num_addr_cyc(subop, op_id);
> +			addrs = &instr->ctx.addr.addrs[offset];
> +			nfc_op->cmd_reg |= CMD_NADDRS(naddrs);
> +
> +			for (i = 0; i < min(ANFC_MAX_ADDR_CYC, naddrs); i++) {
> +				if (i < 4)
> +					nfc_op->addr1_reg |= (u32)addrs[i] << i * 8;
> +				else
> +					nfc_op->addr2_reg |= addrs[i];
> +			}
> +
> +			break;
> +		case NAND_OP_DATA_IN_INSTR:
> +			nfc_op->read = true;
> +			fallthrough;
> +		case NAND_OP_DATA_OUT_INSTR:
> +			offset = nand_subop_get_data_start_off(subop, op_id);
> +			buf = instr->ctx.data.buf.in;
> +			nfc_op->buf = &buf[offset];
> +			nfc_op->len = nand_subop_get_data_len(subop, op_id);
> +			nfc_op->steps = anfc_len_to_steps(chip, nfc_op->len);
> +			pktsize = DIV_ROUND_UP(nfc_op->len, nfc_op->steps);
> +			nfc_op->pkt_reg |= PKT_SIZE(round_up(pktsize, 4)) |

Hm, pktsize has to be aligned on 4? Again, that's not great since you
adjust the size without letting the core know you did that.

> +					   PKT_STEPS(nfc_op->steps);
> +			break;
> +		case NAND_OP_WAITRDY_INSTR:
> +			nfc_op->rdy_timeout_ms = instr->ctx.waitrdy.timeout_ms;
> +			break;
> +		}
> +	}
> +}
> +
> +static int anfc_rw_pio_op(struct arasan_nfc *nfc, struct anfc_op *nfc_op)
> +{
> +	unsigned int dwords = (nfc_op->len / 4) / nfc_op->steps;
> +	unsigned int last_len = nfc_op->len % 4;
> +	unsigned int offset, dir;
> +	u8 *buf = nfc_op->buf;
> +	int ret, i;
> +
> +	for (i = 0; i < nfc_op->steps; i++) {
> +		dir = nfc_op->read ? READ_READY : WRITE_READY;
> +		ret = anfc_wait_for_event(nfc, dir);
> +		if (ret) {
> +			dev_err(nfc->dev, "PIO %s ready signal not received\n",
> +				nfc_op->read ? "Read" : "Write");
> +			return ret;
> +		}
> +
> +		offset = i * (dwords * 4);
> +		if (nfc_op->read)
> +			ioread32_rep(nfc->base + DATA_PORT_REG, &buf[offset],
> +				     dwords);
> +		else
> +			iowrite32_rep(nfc->base + DATA_PORT_REG, &buf[offset],
> +				      dwords);
> +	}
> +
> +	if (last_len) {
> +		u32 remainder;
> +
> +		offset = nfc_op->len - last_len;
> +
> +		if (nfc_op->read) {
> +			remainder = readl_relaxed(nfc->base + DATA_PORT_REG);
> +			memcpy(&buf[offset], &remainder, last_len);
> +		} else {
> +			memcpy(&remainder, &buf[offset], last_len);
> +			writel_relaxed(remainder, nfc->base + DATA_PORT_REG);
> +		}
> +	}
> +
> +	return anfc_wait_for_event(nfc, XFER_COMPLETE);
> +}
> +
> +static int anfc_misc_data_type_exec(struct nand_chip *chip,
> +				    const struct nand_subop *subop,
> +				    u32 prog_reg)
> +{
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct anfc_op nfc_op = {};
> +	int ret;
> +
> +	anfc_parse_instructions(chip, subop, &nfc_op);
> +	nfc_op.prog_reg = prog_reg;
> +	anfc_trigger_op(nfc, &nfc_op);
> +
> +	if (nfc_op.rdy_timeout_ms) {
> +		ret = anfc_wait_for_rb(nfc, chip, nfc_op.rdy_timeout_ms);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return anfc_rw_pio_op(nfc, &nfc_op);
> +}
> +
> +static int anfc_param_read_type_exec(struct nand_chip *chip,
> +				     const struct nand_subop *subop)
> +{
> +	return anfc_misc_data_type_exec(chip, subop, PROG_RDPARAM);
> +}
> +
> +static int anfc_data_read_type_exec(struct nand_chip *chip,
> +				    const struct nand_subop *subop)
> +{
> +	return anfc_misc_data_type_exec(chip, subop, PROG_PGRD);
> +}
> +
> +static int anfc_param_write_type_exec(struct nand_chip *chip,
> +				      const struct nand_subop *subop)
> +{
> +	return anfc_misc_data_type_exec(chip, subop, PROG_SET_FEATURE);
> +}
> +
> +static int anfc_data_write_type_exec(struct nand_chip *chip,
> +				     const struct nand_subop *subop)
> +{
> +	return anfc_misc_data_type_exec(chip, subop, PROG_PGPROG);
> +}
> +
> +static int anfc_misc_zerolen_type_exec(struct nand_chip *chip,
> +				       const struct nand_subop *subop,
> +				       u32 prog_reg)
> +{
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct anfc_op nfc_op = {};
> +	int ret;
> +
> +	anfc_parse_instructions(chip, subop, &nfc_op);
> +	nfc_op.prog_reg = prog_reg;
> +	anfc_trigger_op(nfc, &nfc_op);
> +
> +	ret = anfc_wait_for_event(nfc, XFER_COMPLETE);
> +	if (ret)
> +		return ret;
> +
> +	if (nfc_op.rdy_timeout_ms)
> +		ret = anfc_wait_for_rb(nfc, chip, nfc_op.rdy_timeout_ms);
> +
> +	return ret;
> +}
> +
> +static int anfc_status_type_exec(struct nand_chip *chip,
> +				 const struct nand_subop *subop)
> +{
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	u32 tmp;
> +	int ret;
> +
> +	/*
> +	 * This controller does not allow to proceed with a CMD+DATA_IN cycle
> +	 * manually on the bus by reading data from the data register. Instead,
> +	 * the controller abstract the status read operation with its own status
> +	 * register after ordering a read status operation. Hence, the following
> +	 * hack.
> +	 */
> +	if (subop->instrs[0].ctx.cmd.opcode != NAND_CMD_STATUS)
> +		return -ENOTSUPP;
> +
> +	ret = anfc_misc_zerolen_type_exec(chip, subop, PROG_STATUS);
> +	if (ret)
> +		return ret;
> +
> +	tmp = readl_relaxed(nfc->base + FLASH_STS_REG);
> +	memcpy(subop->instrs[1].ctx.data.buf.in, &tmp, 1);
> +
> +	return 0;
> +}
> +
> +static int anfc_reset_type_exec(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	return anfc_misc_zerolen_type_exec(chip, subop, PROG_RST);
> +}
> +
> +static int anfc_erase_type_exec(struct nand_chip *chip,
> +				const struct nand_subop *subop)
> +{
> +	return anfc_misc_zerolen_type_exec(chip, subop, PROG_ERASE);
> +}
> +
> +static int anfc_wait_type_exec(struct nand_chip *chip,
> +			       const struct nand_subop *subop)
> +{
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct anfc_op nfc_op = {};
> +
> +	anfc_parse_instructions(chip, subop, &nfc_op);
> +
> +	return anfc_wait_for_rb(nfc, chip, nfc_op.rdy_timeout_ms);
> +}
> +
> +static const struct nand_op_parser anfc_op_parser = NAND_OP_PARSER(
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_param_read_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_param_write_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, ANFC_MAX_PARAM_SIZE)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_data_read_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_data_write_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_DATA_OUT_ELEM(false, ANFC_MAX_CHUNK_SIZE),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_reset_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_erase_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_ADDR_ELEM(false, ANFC_MAX_ADDR_CYC),
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_status_type_exec,
> +		NAND_OP_PARSER_PAT_CMD_ELEM(false),
> +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, ANFC_MAX_CHUNK_SIZE)),
> +	NAND_OP_PARSER_PATTERN(
> +		anfc_wait_type_exec,
> +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> +	);
> +

Okay, no DATA-only patterns, so my suggestion to split non-aligned data
reads doesn't work. I'd suggest to describe data-lengths
constraints rather than automatically adjusting the data length to
something bigger when we can't do exactly the number of requested DATA
cycles. I started doing something similar here [1], except you'd need
much more fined-grained constraints, so maybe we should add an optional
check hook to data patterns.

> +static int anfc_select_target(struct nand_chip *chip, int target)
> +{
> +	struct anand *anand = to_anand(chip);
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	int ret;
> +
> +	/* Update the controller timings and the potential ECC configuration */
> +	writel_relaxed(anand->timings, nfc->base + DATA_INTERFACE_REG);
> +
> +	/* Update clock frequency */
> +	if (nfc->cur_clk != anand->clk) {
> +		clk_disable_unprepare(nfc->controller_clk);
> +		ret = clk_set_rate(nfc->controller_clk, anand->clk);
> +		if (ret) {
> +			dev_err(nfc->dev, "Failed to change clock rate\n");
> +			return ret;
> +		}
> +
> +		ret = clk_prepare_enable(nfc->controller_clk);
> +		if (ret) {
> +			dev_err(nfc->dev,
> +				"Failed to re-enable the controller clock\n");
> +			return ret;
> +		}
> +
> +		nfc->cur_clk = anand->clk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int anfc_exec_op(struct nand_chip *chip,
> +			const struct nand_operation *op,
> +			bool check_only)
> +{
> +	int ret;
> +
> +	if (!check_only) {
> +		ret = anfc_select_target(chip, op->cs);
> +		if (ret)
> +			return ret;
> +	}

Given you do only one thing in the check_only case, I'd do:

	if (check_only)
		nand_op_parser_exec_op(chip, &anfc_op_parser, op, true);

	ret = anfc_select_target(chip, op->cs);
	if (ret)
		return ret;

	...
> +
> +	return nand_op_parser_exec_op(chip, &anfc_op_parser, op, check_only);
> +}
> +
> +static int anfc_setup_data_interface(struct nand_chip *chip, int target,
> +				     const struct nand_data_interface *conf)
> +{
> +	struct anand *anand = to_anand(chip);
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct device_node *np = nfc->dev->of_node;
> +
> +	if (target < 0)
> +		return 0;
> +
> +	anand->timings = DIFACE_SDR | DIFACE_SDR_MODE(conf->timings.mode);
> +	anand->clk = ANFC_XLNX_SDR_DFLT_CORE_CLK;
> +
> +	/*
> +	 * Due to a hardware bug in the ZynqMP SoC, SDR timing modes 0-1 work
> +	 * with f > 90MHz (default clock is 100MHz) but signals are unstable
> +	 * with higher modes. Hence we decrease a little bit the clock rate to
> +	 * 80MHz when using modes 2-5 with this SoC.
> +	 */
> +	if (of_device_is_compatible(np, "xlnx,zynqmp-nand-controller") &&
> +	    conf->timings.mode >= 2)
> +		anand->clk = ANFC_XLNX_SDR_HS_CORE_CLK;
> +
> +	return 0;
> +}
> +
> +static int anfc_attach_chip(struct nand_chip *chip)
> +{
> +	struct anand *anand = to_anand(chip);
> +	struct arasan_nfc *nfc = to_anfc(chip->controller);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int ret = 0;
> +
> +	if (mtd->writesize <= SZ_512)
> +		anand->caddr_cycles = 1;
> +	else
> +		anand->caddr_cycles = 2;
> +
> +	if (chip->options & NAND_ROW_ADDR_3)
> +		anand->raddr_cycles = 3;
> +	else
> +		anand->raddr_cycles = 2;
> +
> +	switch (mtd->writesize) {
> +	case 512:
> +		anand->page_sz = 0;
> +		break;
> +	case 1024:
> +		anand->page_sz = 5;
> +		break;
> +	case 2048:
> +		anand->page_sz = 1;
> +		break;
> +	case 4096:
> +		anand->page_sz = 2;
> +		break;
> +	case 8192:
> +		anand->page_sz = 3;
> +		break;
> +	case 16384:
> +		anand->page_sz = 4;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/* These hooks are valid for all ECC providers */
> +	chip->ecc.read_page_raw = nand_monolithic_read_page_raw;
> +	chip->ecc.write_page_raw = nand_monolithic_write_page_raw;
> +
> +	switch (chip->ecc.mode) {
> +	case NAND_ECC_NONE:
> +	case NAND_ECC_SOFT:
> +	case NAND_ECC_ON_DIE:
> +		break;
> +	case NAND_ECC_HW:
> +	default:
> +		dev_err(nfc->dev, "Unsupported ECC mode: %d\n",
> +			chip->ecc.mode);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct nand_controller_ops anfc_ops = {
> +	.exec_op = anfc_exec_op,
> +	.setup_data_interface = anfc_setup_data_interface,
> +	.attach_chip = anfc_attach_chip,
> +};
> +
> +static int anfc_chip_init(struct arasan_nfc *nfc, struct device_node *np)
> +{
> +	struct anand *anand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int cs, rb, ret;
> +
> +	anand = devm_kzalloc(nfc->dev, sizeof(*anand), GFP_KERNEL);
> +	if (!anand)
> +		return -ENOMEM;
> +
> +	/* Only one CS can be asserted at a time */

You mean the controller only has one CS? Cause that comment doesn't
make much sense.

> +	if (of_property_count_elems_of_size(np, "reg", sizeof(u32)) != 1) {
> +		dev_err(nfc->dev, "Invalid reg property\n");
> +		return -EINVAL;
> +	}

It's only a SW limitation. If your controller has several CS pins
(which seems to be the case since you have a list of chips), it can
handle multi-CS chips too. I'm perfectly fine with the limitation
itself, but the comment should reflect the reality. And if you want to
support multi-CS chips, you just have to define an array of CS/RB in
anand.

> +
> +	ret = of_property_read_u32(np, "reg", &cs);
> +	if (ret)
> +		return ret;
> +
> +	ret = of_property_read_u32(np, "nand-rb", &rb);
> +	if (ret)
> +		return ret;
> +
> +	if (cs >= ANFC_MAX_CS || rb >= ANFC_MAX_CS) {
> +		dev_err(nfc->dev, "Wrong CS %d or RB %d\n", cs, rb);
> +		return -EINVAL;
> +	}
> +
> +	if (test_and_set_bit(cs, &nfc->assigned_cs)) {
> +		dev_err(nfc->dev, "Already assigned CS %d\n", cs);
> +		return -EINVAL;
> +	}
> +
> +	anand->cs = cs;
> +	anand->rb = rb;
> +
> +	chip = &anand->chip;
> +	mtd = nand_to_mtd(chip);
> +	mtd->dev.parent = nfc->dev;
> +	chip->controller = &nfc->controller;
> +	chip->options = NAND_BUSWIDTH_AUTO | NAND_NO_SUBPAGE_WRITE |
> +			NAND_USES_DMA;
> +
> +	nand_set_flash_node(chip, np);
> +	if (!mtd->name) {
> +		dev_err(nfc->dev, "NAND label property is mandatory\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = nand_scan(chip, 1);
> +	if (ret) {
> +		dev_err(nfc->dev, "Scan operation failed\n");
> +		return ret;
> +	}
> +
> +	ret = mtd_device_register(mtd, NULL, 0);
> +	if (ret) {
> +		nand_release(chip);

		nand_cleanup(chip);

> +		return ret;
> +	}
> +
> +	list_add_tail(&anand->node, &nfc->chips);
> +
> +	return 0;
> +}
> +
> +static void anfc_chips_cleanup(struct arasan_nfc *nfc)
> +{
> +	struct anand *anand, *tmp;
> +
> +	list_for_each_entry_safe(anand, tmp, &nfc->chips, node) {
> +		nand_release(&anand->chip);
> +		list_del(&anand->node);
> +	}
> +}
> +
> +static int anfc_chips_init(struct arasan_nfc *nfc)
> +{
> +	struct device_node *np = nfc->dev->of_node, *nand_np;
> +	int nchips = of_get_child_count(np);
> +	int ret;
> +
> +	if (!nchips || nchips > ANFC_MAX_CS) {
> +		dev_err(nfc->dev, "Incorrect number of NAND chips (%d)\n",
> +			nchips);
> +		return -EINVAL;
> +	}
> +
> +	for_each_child_of_node(np, nand_np) {
> +		ret = anfc_chip_init(nfc, nand_np);
> +		if (ret) {
> +			of_node_put(nand_np);
> +			anfc_chips_cleanup(nfc);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static void anfc_reset(struct arasan_nfc *nfc)
> +{
> +	anfc_disable_int(nfc, EVENT_MASK);
> +
> +	/* Enable all interrupt status */
> +	writel_relaxed(EVENT_MASK, nfc->base + INTR_STS_EN_REG);

That doesn't sounds like a good idea. Interrupts should be enabled only
when you need to wait on specific events.

> +}
> +


[1]https://github.com/bbrezillon/linux/commit/02c0ce63be2d43f207bdecafd555c42efdacece2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
