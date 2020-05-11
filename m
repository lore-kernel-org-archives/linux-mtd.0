Return-Path: <SRS0=5+/X=6Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7069DC47255
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:07:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4212D20736
	for <linux-mtd@archiver.kernel.org>; Mon, 11 May 2020 15:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uRzeQA+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4212D20736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KZEWzkNn8/qodZuxD5IkabzmCcuqf4qfCtBsVk3/hI=; b=uRzeQA+P51d1Js
	WI1sHuURHENqO6aIFEEH5bpeNWiTWtOMnk4QOh41vAAdzWB2zFLmlxZlEk7BYSujurjZ7/tOlGWrL
	+fGt90fcgH7XWVLMbm3fDICHh1B+Qdtb4MJwFf/odpYsXZWEhfswa9Rm+Mg3KadcgdBfF3/gYy3ay
	CFFgPY980EuLjmLaKWuut0qCxNvxUJfyi6Ojicr+k5BY/FYor7ewPFq3srDly0Mph4vuN7Fi2fUA7
	ZVjQNWwRL3AEfpz5lJkPvbvKkEm0JgZCPi9eZuZolNr1MYjTMW8edb7uNIEfN9j+WR8a0C38X89n4
	UgIGmVRlHSox1WkT5LzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYA1t-00021d-Eu; Mon, 11 May 2020 15:07:41 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYA1q-000211-Fz
 for linux-mtd@lists.infradead.org; Mon, 11 May 2020 15:07:40 +0000
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0EA6E200014;
 Mon, 11 May 2020 15:07:31 +0000 (UTC)
Date: Mon, 11 May 2020 17:07:29 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v4 7/8] mtd: rawnand: arasan: Add new Arasan NAND
 controller
Message-ID: <20200511170729.4766eeaa@xps13>
In-Reply-To: <20200510090314.10426b6e@collabora.com>
References: <20200508171339.8052-1-miquel.raynal@bootlin.com>
 <20200508171339.8052-8-miquel.raynal@bootlin.com>
 <20200510090314.10426b6e@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200511_080738_803599_349C79F6 
X-CRM114-Status: GOOD (  13.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 10 May
2020 09:03:14 +0200:

> On Fri,  8 May 2020 19:13:38 +0200
> Miquel Raynal <miquel.raynal@bootlin.com> wrote:
> 
> > +static int anfc_exec_op(struct nand_chip *chip,
> > +			const struct nand_operation *op,
> > +			bool check_only)
> > +{
> > +	int ret;
> > +
> > +	if (check_only)
> > +		return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
> > +					      check_only);  
> 
> You should also check the DATA_IN/OUT size here ^.

Here is my proposal:

---8<---

+static int anfc_check_op(struct nand_chip *chip,
+                        const struct nand_operation *op)
+{
+       int op_id;
+
+       /*
+        * The controller abstracts all the NAND operations and do not support
+        * data only operations.
+        */
+       for (op_id = 0; op_id < op->ninstrs; op_id++) {
+               instr = &op->instrs[op_id];
+
+               switch (instr->type) {
+               case NAND_OP_ADDR_INSTR:
+                       if (instr->ctx.addr.naddrs > ANFC_MAX_ADDR_CYC)
+                               return -ENOTSUPP;
+                       break;
+               case NAND_OP_DATA_IN_INSTR:
+               case NAND_OP_DATA_OUT_INSTR:
+                       if (instr->ctx.data.len > ANFC_MAX_CHUNK_SIZE)
+                               return -ENOTSUPP;
+                       break;
+               default:
+               }
+       }
+
+       /*
+        * The controller does not allow to proceed with a CMD+DATA_IN cycle
+        * manually on the bus by reading data from the data register. Instead,
+        * the controller abstract a status read operation with its own status
+        * register after ordering a read status operation. Hence, we cannot
+        * support any CMD+DATA_IN operation other than a READ STATUS.
+        */
+       if (op->ninstrs == 2 &&
+           op->instrs[0].type == NAND_OP_CMD_INSTR &&
+           op->instrs[0].ctx.cmd.opcode != NAND_CMD_STATUS &&
+           op->instrs[1].type == NAND_OP_DATA_IN_INSTR)
+               return -ENOTSUPP;
+
+       return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
+                                     check_only);
+}
+
 static int anfc_exec_op(struct nand_chip *chip,
                        const struct nand_operation *op,
                        bool check_only)
@@ -774,8 +813,7 @@ static int anfc_exec_op(struct nand_chip *chip,
        int ret;
 
        if (check_only)
-               return nand_op_parser_exec_op(chip, &anfc_op_parser, op,
-                                             check_only);
+               return anfc_check_op(chip, op);
 
        ret = anfc_select_target(chip, op->cs);
        if (ret)

--->8---

What do you think?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
