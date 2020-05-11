Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7627EC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:49:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09940206D7
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 16:49:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iPUNTMr/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09940206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvCC7hWhIn1XkgiJVLLlKyv6dFP3BWLdkySrAiBlZdQ=; b=iPUNTMr/aSkst3
	tRyvUNN/yzSPgVksKlmBEuGQBOIzHz2B2PwYqvcRYSDvSSYKxuD2U0ge8BfEqW9D/0H4b/hKT+fmb
	RLjKFltefnXVj217MORpzTv3wiUgE9r4kkbmolLowzFXwY30N1y11CYuN+0JmqRfZsMPl/SWJDezc
	HrrtUKk4bMin0vA8Ju9rsJW2W/AK7VhFMBOZQiU6qpj/ZMFjw6+kQhR6PIIC9bc1EW9HsWvMwwnfA
	YIA4I71qDm98u0q21YGpqo1B5wzhsNbWSIuoOvc862sqmqxATF+wr/5wRqo+1dP43yGlYtDA7M9jH
	7jlVYFCYHyel08sYh0pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYBcV-0008L2-Kn; Mon, 11 May 2020 16:49:35 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYBcQ-0008DN-Oi; Mon, 11 May 2020 16:49:33 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 15B56FF80F;
 Mon, 11 May 2020 16:49:25 +0000 (UTC)
Date: Mon, 11 May 2020 18:49:24 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: Add the concept of destructive operation
Message-ID: <20200511184924.0bb1358c@xps13>
In-Reply-To: <20200503100018.308be142@collabora.com>
References: <20200502163432.1543243-1-boris.brezillon@collabora.com>
 <20200502163432.1543243-2-boris.brezillon@collabora.com>
 <20200503100018.308be142@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_094931_074220_1EC7AD0F 
X-CRM114-Status: GOOD (  23.45  )
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
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Scott Branden <sbranden@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Lee Jones <lee@kernel.org>,
 Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 3 May
2020 10:00:18 +0200:

> On Sat,  2 May 2020 18:34:30 +0200
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > Erase and program operations need the WP (Write Protect) pin to be
> > de-asserted to take effect. Let's add the concept of destructive
> > operation and pass the information to exec_op() so controllers know
> > when they should de-assert this pin without having to guess it from
> > the command opcode.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  include/linux/mtd/rawnand.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index c47cbcb86b71..6014e7389507 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -854,6 +854,8 @@ struct nand_op_parser {
> >  /**
> >   * struct nand_operation - NAND operation descriptor
> >   * @cs: the CS line to select for this NAND operation
> > + * @deassert_wp: set to true when the operation requires the WP pin to be
> > + *		 de-asserted (ERASE, PROG, ...)
> >   * @instrs: array of instructions to execute
> >   * @ninstrs: length of the @instrs array
> >   *
> > @@ -861,6 +863,7 @@ struct nand_op_parser {
> >   */
> >  struct nand_operation {
> >  	unsigned int cs;
> > +	bool deassert_wp;
> >  	const struct nand_op_instr *instrs;
> >  	unsigned int ninstrs;
> >  };
> > @@ -872,6 +875,14 @@ struct nand_operation {
> >  		.ninstrs = ARRAY_SIZE(_instrs),			\
> >  	}
> >  
> > +#define NAND_DESTRUCTIVE_OPERATION(_cs, _instrs)		\
> > +	{							\
> > +		.cs = _cs,					\
> > +		.deassert_wp = true,				\
> > +		.instrs = _instrs,				\
> > +		.ninstrs = ARRAY_SIZE(_instrs),			\
> > +	}
> > +
> >  int nand_op_parser_exec_op(struct nand_chip *chip,
> >  			   const struct nand_op_parser *parser,
> >  			   const struct nand_operation *op, bool check_only);  
> 
> The following diff should be part of this patch, otherwise none of the
> operations are flagged as destructive. I'll fix that in v2, but I'd still
> like to get feedback before sending a new version.
> 
> --->8---  
> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
> index fb8addf7637e..4111e7ac0834 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -1308,7 +1308,8 @@ static int nand_exec_prog_page_op(struct nand_chip *chip, unsigned int page,
>                 NAND_OP_CMD(NAND_CMD_PAGEPROG, PSEC_TO_NSEC(sdr->tWB_max)),
>                 NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tPROG_max), 0),
>         };
> -       struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
> +       struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
> +                                                             instrs);
>         int naddrs = nand_fill_column_cycles(chip, addrs, offset_in_page);
>         int ret;
>         u8 status;
> @@ -1695,7 +1696,8 @@ int nand_erase_op(struct nand_chip *chip, unsigned int eraseblock)
>                                     PSEC_TO_MSEC(sdr->tWB_max)),
>                         NAND_OP_WAIT_RDY(PSEC_TO_MSEC(sdr->tBERS_max), 0),
>                 };
> -               struct nand_operation op = NAND_OPERATION(chip->cur_cs, instrs);
> +               struct nand_operation op = NAND_DESTRUCTIVE_OPERATION(chip->cur_cs,
> +                                                                     instrs);
>  
>                 if (chip->options & NAND_ROW_ADDR_3)
>                         instrs[1].ctx.addr.naddrs++;

What about nand_prog_page_end_op() or even
nand_write_change_column_op()?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
