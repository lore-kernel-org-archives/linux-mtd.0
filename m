Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC81C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:25:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E58020775
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKye9wBC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E58020775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwkRWUM5FQ2t2VVeVspr4JlWm9QxaF1kAFWEHNFAp5s=; b=AKye9wBCU28lnp
	qScQN0liznrIkXOWA+tmdtzGHshQLtI2VlVe7I7mo4YptJP24ngyVl5bLaSq1sjgRhl7tYKit9Uia
	JTeqKhbjuR+lz4MyRnKL1I7g2viIWscHziUGqDNSUQAHml9rD5XPa8v1XEnOmv+zecjr586jlv6Vl
	A88Q0JYFi7GaPgFl2q6ha0GUsXoLhr3yXyQnAoxfw1eprb+CAkWmYTHkROEe9KxoXJOxCkAJRp9bg
	FczjzupdPMHSRgZXlTP8cknF/Jb/vuIIsz5+dC3yxXZqcTIA8rnbehQ6JEYrmWKXzAXWpYcafxwIV
	7zVpHKCGwhi98MN11ARw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8Rg-00008d-Ul; Mon, 27 Apr 2020 18:25:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8Rd-00007N-5F
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:25:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 567452A0D02;
 Mon, 27 Apr 2020 19:25:27 +0100 (BST)
Date: Mon, 27 Apr 2020 20:25:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 2/2] mtd: rawnand: atmel: Convert the driver to exec_op()
Message-ID: <20200427202525.43b27bb4@collabora.com>
In-Reply-To: <20200427171719.395b84a7@xps13>
References: <20200418194959.1017197-1-boris.brezillon@collabora.com>
 <20200418194959.1017197-2-boris.brezillon@collabora.com>
 <20200427171719.395b84a7@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_112529_329861_F8C58C96 
X-CRM114-Status: GOOD (  18.92  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 17:17:19 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Thanks for the conversion!
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 18 Apr
> 2020 21:49:59 +0200:
> 
> [...]
> 
> >  
> > -static void atmel_nand_cmd_ctrl(struct nand_chip *chip, int cmd,
> > -				unsigned int ctrl)
> > +static int atmel_hsmc_exec_rw(struct nand_chip *chip,
> > +			      const struct nand_subop *subop)
> >  {
> > +	const struct nand_op_instr *instr = subop->instrs;
> >  	struct atmel_nand *nand = to_atmel_nand(chip);
> > -	struct atmel_nand_controller *nc;
> >  
> > -	nc = to_nand_controller(chip->controller);
> > +	if (WARN_ON_ONCE(subop->ninstrs != 1 ||
> > +			 (instr->type != NAND_OP_DATA_IN_INSTR &&
> > +			  instr->type != NAND_OP_DATA_OUT_INSTR)))
> > +		return -EINVAL;
> >  
> > -	if ((ctrl & NAND_CTRL_CHANGE) && nand->activecs->csgpio) {
> > -		if (ctrl & NAND_NCE)
> > -			gpiod_set_value(nand->activecs->csgpio, 0);
> > -		else
> > -			gpiod_set_value(nand->activecs->csgpio, 1);
> > -	}
> > +	if (instr->type == NAND_OP_DATA_IN_INSTR)
> > +		atmel_nand_read_buf(nand, instr->ctx.data.buf.in,
> > +				    instr->ctx.data.len,
> > +				    instr->ctx.data.force_8bit);
> > +	else
> > +		atmel_nand_write_buf(nand, instr->ctx.data.buf.out,
> > +				     instr->ctx.data.len,
> > +				     instr->ctx.data.force_8bit);
> >  
> > -	if (ctrl & NAND_ALE)
> > -		writeb(cmd, nand->activecs->io.virt + nc->caps->ale_offs);
> > -	else if (ctrl & NAND_CLE)
> > -		writeb(cmd, nand->activecs->io.virt + nc->caps->cle_offs);
> > +	return 0;
> > +}
> > +
> > +static int atmel_hsmc_exec_waitrdy(struct nand_chip *chip,
> > +				   const struct nand_subop *subop)
> > +{
> > +	const struct nand_op_instr *instr = subop->instrs;
> > +	struct atmel_nand *nand = to_atmel_nand(chip);
> > +
> > +	if (WARN_ON_ONCE(subop->ninstrs != 1 ||
> > +			 instr->type != NAND_OP_WAITRDY_INSTR))
> > +		return -EINVAL;  
> 
> How could this happen? I would drop this extra check which IMHO is not
> useful (same for all the occurrences of similar conditions).

Yes, I guess I was overcautious here to detect core bugs, but you're
right, this shouldn't be checked at this level.

> 
> > +
> > +	return atmel_hsmc_nand_waitrdy(nand, instr->ctx.waitrdy.timeout_ms);
> > +}
> > +
> > +static const struct nand_op_parser atmel_hsmc_op_parser = NAND_OP_PARSER(
> > +	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_cmd_addr,
> > +		NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +		NAND_OP_PARSER_PAT_ADDR_ELEM(true, 5),
> > +		NAND_OP_PARSER_PAT_CMD_ELEM(true)),
> > +	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_rw,
> > +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, UINT_MAX)),  
> 
> I find more meaningful to use 0 than UINT_MAX as the core will ignore
> any boundary in this case.

Oh, you're right, I had forgotten that 0 meant 'no-limit'.

> 
> > +	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_rw,
> > +		NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, UINT_MAX)),  
> 
> You probably meant DATA_OUT here?

Absolutely.

> 
> > +	NAND_OP_PARSER_PATTERN(atmel_hsmc_exec_waitrdy,
> > +		NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
> > +);
> > +
> > +static int atmel_hsmc_nand_exec_op(struct atmel_nand *nand,
> > +				   const struct nand_operation *op,
> > +				   bool check_only)
> > +{
> > +	int ret;
> > +
> > +	if (check_only)
> > +		return nand_op_parser_exec_op(&nand->base,
> > +					      &atmel_hsmc_op_parser, op, true);
> > +
> > +	atmel_hsmc_nand_select_die(nand, op->cs);
> > +	ret = nand_op_parser_exec_op(&nand->base, &atmel_hsmc_op_parser, op,
> > +				     false);
> > +	atmel_hsmc_nand_unselect_die(nand);
> > +
> > +	return ret;
> >  }
> >    
> 
> With the above fixed, please add my
> 
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the review.

Boris

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
