Return-Path: <SRS0=F3bs=6M=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0621CC83000
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:24:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1AD206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Apr 2020 06:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CLDgvp/Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1AD206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km/tNzX4SEYQAXyRJqrgUlIFKtHM6vODaZCNmN9c5sQ=; b=CLDgvp/YSlVTDs
	5jVGaCGOSo3j9Ckf4oBre9+iCj8Z/eNRfD7CAYhfNjTcGcBf4vQav+/zBwF4U4WCiLiexbJzkLgjv
	v9eAGwtEzS9hisOeYLuS4mUY8/w8cR+ZNR7Q29JCgpSgPQTwWmYXuQA6u/obfYsgdfmz7ib3Rz+x5
	RM9BCCFDacmRrfvgZObP4Ec3Nr6g7gCUt/h9FzEeaUsXX6t7VRrdAl8HvFK/unZLYBSgBbO11xQTk
	4By+Xh+GJggh722ZSHBCviHXlRczZ1gL9iaiym8aYD0JY73UnV3prLVBdoduKVxR9EFFARf53/7Hv
	yTftpH9sdxnfpbnc8oRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJfK-0006BG-WE; Tue, 28 Apr 2020 06:24:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJfH-0006AM-N3
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2020 06:24:21 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 638442A0BA2;
 Tue, 28 Apr 2020 07:24:18 +0100 (BST)
Date: Tue, 28 Apr 2020 08:24:15 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 13/17] mtd: rawnand: cafe: Add exec_op() support
Message-ID: <20200428082415.3c6e2db1@collabora.com>
In-Reply-To: <20200427215933.13fb1bbc@xps13>
References: <20200427082028.394719-1-boris.brezillon@collabora.com>
 <20200427082028.394719-14-boris.brezillon@collabora.com>
 <20200427215933.13fb1bbc@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_232420_017003_29F73B5A 
X-CRM114-Status: GOOD (  19.17  )
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
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>,
 David Woodhouse <dwmw2@infradead.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 21:59:33 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > +	if (WARN_ON(subop->cs > 1))
> > +		return -EINVAL;
> > +
> > +	cafe->datalen = 0;
> > +	ctrl1 |= CAFE_FIELD_PREP(NAND_CTRL1, CE, subop->cs);
> > +
> > +	for (i = 0; i < subop->ninstrs; i++) {
> > +		const struct nand_op_instr *instr = &subop->instrs[i];
> > +
> > +		switch (instr->type) {
> > +		case NAND_OP_CMD_INSTR:
> > +			if (WARN_ON((ctrl1 & CAFE_NAND_CTRL1_HAS_CMD) &&
> > +				    (ctrl2 & CAFE_NAND_CTRL2_HAS_CMD2)))
> > +				return -EINVAL;  
> 
> Same comment as in the previous drivers, just showing it to do not
> foget.

Will remove those WARN_ON()s.

> 
> > +
> > +			if (!(ctrl1 & CAFE_NAND_CTRL1_HAS_CMD))
> > +				ctrl1 |= CAFE_NAND_CTRL1_HAS_CMD |
> > +					 CAFE_FIELD_PREP(NAND_CTRL1, CMD,
> > +							 instr->ctx.cmd.opcode);
> > +			else
> > +				ctrl2 |= CAFE_NAND_CTRL2_HAS_CMD2 |
> > +					 CAFE_FIELD_PREP(NAND_CTRL2, CMD2,
> > +							 instr->ctx.cmd.opcode);
> > +			break;
> > +
> > +		case NAND_OP_ADDR_INSTR:
> > +			if (WARN_ON(instr->ctx.addr.naddrs > 5 ||
> > +				    !instr->ctx.addr.naddrs))
> > +				return -EINVAL;
> > +
> > +			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
> > +				u32 addr = instr->ctx.addr.addrs[j];
> > +
> > +				if (j < 2)
> > +					addr1 |= addr << (8 * j);
> > +				else
> > +					addr2 |= addr << (8 * (j - 2));
> > +			}
> > +
> > +			ctrl1 |= CAFE_NAND_CTRL1_HAS_ADDR |
> > +				 CAFE_FIELD_PREP(NAND_CTRL1, NUM_ADDR_CYC,
> > +						 instr->ctx.addr.naddrs - 1);
> > +			cafe_writel(cafe, addr1, NAND_ADDR1);
> > +			if (instr->ctx.addr.naddrs > 2)
> > +				cafe_writel(cafe, addr2, NAND_ADDR2);  
> 
> Maybe it is safer to always write this register, no? I don't know if
> the IP clears registers between operations. If it does not, you might
> end up sending extra command cycles.

The number of cycles is controller by NUM_ADDR_CYC so that shouldn't be
a problem, but you're right, writing ADDR2 unconditionally shouldn't
hurt.

> 
> > +			break;
> > +
> > +		case NAND_OP_DATA_IN_INSTR:
> > +			data_instr = instr;
> > +			ctrl1 |= CAFE_NAND_CTRL1_HAS_DATA_IN;
> > +			break;
> > +
> > +		case NAND_OP_DATA_OUT_INSTR:
> > +			data_instr = instr;
> > +			ctrl1 |= CAFE_NAND_CTRL1_HAS_DATA_OUT;
> > +			cafe_write_buf(chip, instr->ctx.data.buf.out,
> > +				       instr->ctx.data.len);
> > +			break;
> > +
> > +		case NAND_OP_WAITRDY_INSTR:
> > +			wait |= CAFE_NAND_IRQ_FLASH_RDY;
> > +			waitrdy = true;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (data_instr)
> > +		cafe_writel(cafe, data_instr->ctx.data.len, NAND_DATA_LEN);
> > +
> > +	if (cafe->usedma && data_instr) {
> > +		u32 dmactrl = CAFE_NAND_DMA_CTRL_ENABLE |
> > +			      CAFE_NAND_DMA_CTRL_RESERVED;
> > +
> > +		wait |= CAFE_NAND_IRQ_DMA_DONE;
> > +		dmactrl |= CAFE_FIELD_PREP(NAND_DMA_CTRL, DATA_LEN,
> > +					   data_instr->ctx.data.len);
> > +		if (ctrl1 & CAFE_NAND_CTRL1_HAS_DATA_IN)
> > +			dmactrl |= CAFE_NAND_DMA_CTRL_DATA_IN;
> > +
> > +		cafe_writel(cafe, dmactrl, NAND_DMA_CTRL);
> > +	}
> > +
> > +	/* Clear the pending interrupts before starting the operation. */
> > +	cafe_writel(cafe, wait, NAND_IRQ);
> > +
> > +	cafe_writel(cafe, ctrl2, NAND_CTRL2);
> > +	cafe_writel(cafe, ctrl1, NAND_CTRL1);
> > +
> > +	ret = readl_poll_timeout(cafe->mmio + CAFE_NAND_IRQ, status,
> > +				 (status & wait) == wait, 1, USEC_PER_SEC);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (ctrl1 & CAFE_NAND_DMA_CTRL_DATA_IN)
> > +		cafe_read_buf(chip, data_instr->ctx.data.buf.in,
> > +			      data_instr->ctx.data.len);  
> 
> As you are limiting the amount of data to 2112B and the number of
> address cycles to 5, you should probably use the core's helper
> nand_subop_data_len, nand_subob_data_buf and nand_subop_addr_len in
> this function.

Indeed. I'll fix that.

> 
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct nand_op_parser cafe_nand_op_parser = NAND_OP_PARSER(
> > +	NAND_OP_PARSER_PATTERN(cafe_nand_exec_subop,
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 2112)),
> > +	NAND_OP_PARSER_PATTERN(cafe_nand_exec_subop,
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, 2112),
> > +			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true))
> > +);
> > +
> > +static int cafe_nand_exec_op(struct nand_chip *chip,
> > +			     const struct nand_operation *op,
> > +			     bool check_only)
> > +{  
> 
> I didn't check but are you sure there is no chip-select/timings
> handling to do here?

Apparently no. Having the CS propagated to subops is enough here (CS
selection is done in the subop handler).



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
