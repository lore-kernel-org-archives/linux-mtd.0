Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B3CC4CECD
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:36:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC22205C9
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hu6JtGo7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC22205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsia2sKN1yMSY7LyEZ9PJPSyXTbNPQ4BQyjHdGTGswU=; b=Hu6JtGo7qEcS3P
	WSldrla0fZTY4AOYRGPcwpXniBqsWeKmuK0FIQdbASsWBI58O9tX37KZYOWbeY7UDML4Unz/tGFS0
	mFa6c5cf8av9Trlk+E6bfZrhuzNj728zk6BuBdAanROPCidI1om2gEYuNLWjZmwy+8tLKd4rKqW7d
	dJ38O9pRPcsPeYjao0K8EPBu2Qo4VEE9MfK3DLa5WQOEOPq6X/spSV6r/8OZCTwRTBjhkHj/kCqfC
	Ugs7YS6FCiToyAzeFRQ6Kibq0t7TUhzl4heCyBcsbF70Wwq4/rNhSnRT/3q0XyLM4XdeSBLS2jLgq
	XI6kjWtEQdOV4dlJCPew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8bZ-00008b-G1; Mon, 27 Apr 2020 18:35:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8bL-0008NY-Ha
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:35:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 34A022A0DF3;
 Mon, 27 Apr 2020 19:35:30 +0100 (BST)
Date: Mon, 27 Apr 2020 20:35:25 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 5/9] mtd: rawnand: bcm47xx: Implement the exec_op()
 interface
Message-ID: <20200427203525.5fd1deca@collabora.com>
In-Reply-To: <20200427191811.3f32cebc@xps13>
References: <20200419125140.1307309-1-boris.brezillon@collabora.com>
 <20200419125140.1307309-6-boris.brezillon@collabora.com>
 <20200427191811.3f32cebc@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_113531_850883_1CCB88EF 
X-CRM114-Status: GOOD (  29.20  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, openwrt-devel@lists.openwrt.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 19:18:11 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sun, 19 Apr
> 2020 14:51:36 +0200:
> 
> > Implement the exec_op() interface so we can get rid of the convoluted
> > cmdfunc() implementation.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > This is based on my understanding of how this controller works, and I
> > think it covers all the use cases covered by the custom cmdfunc()
> > implementation. I might be wrong of course, so it'd be great to have
> > someone test on real HW.
> > ---
> >  .../nand/raw/bcm47xxnflash/bcm47xxnflash.h    |   1 +
> >  .../mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c  | 150 ++++++++++++++++++
> >  2 files changed, 151 insertions(+)
> > 
> > diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
> > index 201b9baa52a0..00d0974b73cb 100644
> > --- a/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
> > +++ b/drivers/mtd/nand/raw/bcm47xxnflash/bcm47xxnflash.h
> > @@ -10,6 +10,7 @@
> >  #include <linux/mtd/rawnand.h>
> >  
> >  struct bcm47xxnflash {
> > +	struct nand_controller base;
> >  	struct bcma_drv_cc *cc;
> >  
> >  	struct nand_chip nand_chip;
> > diff --git a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> > index fbb7acebc8f7..184f78b3d45a 100644
> > --- a/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> > +++ b/drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c
> > @@ -382,6 +382,153 @@ static void bcm47xxnflash_ops_bcm4706_write_buf(struct nand_chip *nand_chip,
> >  	pr_err("Invalid command for buf write: 0x%X\n", b47n->curr_command);
> >  }
> >  
> > +static int
> > +bcm47xxnflash_ops_bcm4706_exec_cmd_addr(struct nand_chip *chip,
> > +					const struct nand_subop *subop)
> > +{
> > +	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
> > +	u32 nctl = 0, col = 0, row = 0, ncols = 0, nrows = 0;
> > +	unsigned int i, j;
> > +
> > +	for (i = 0; i < subop->ninstrs; i++) {
> > +		const struct nand_op_instr *instr = &subop->instrs[i];
> > +
> > +		switch (instr->type) {
> > +		case NAND_OP_CMD_INSTR:
> > +			if (WARN_ON_ONCE((nctl & NCTL_CMD0) &&
> > +					 (nctl & NCTL_CMD1W)))
> > +				return -EINVAL;
> > +			else if (nctl & NCTL_CMD0)
> > +				nctl |= NCTL_CMD1W |
> > +					((u32)instr->ctx.cmd.opcode << 8);
> > +			else
> > +				nctl |= NCTL_CMD0 | instr->ctx.cmd.opcode;
> > +			break;
> > +		case NAND_OP_ADDR_INSTR:
> > +			for (j = 0; j < instr->ctx.addr.naddrs; j++) {
> > +				u32 addr = instr->ctx.addr.addrs[j];
> > +
> > +				if (i < 2) {  
> 
> Don't you mean j here?              ^
> 

Nice catch! Indeed, it should be j.

> > +					col |= addr << i * 8;  
> 
> I'm not sure this will work, addr is 32-bit and col as well, I bet you
> won't end up with what you expect.

Well, assuming I use j that's really what I want. addr is an u32 to
allow for a shift greater than 8, but the value has be extracted
from the instr->ctx.addr.addrs array which is an u8 array, thus
making addr <= 0xff.

> 
> > +					nctl |= NCTL_COL;
> > +					ncols++;
> > +				} else {
> > +					row |= addr << (i - 2) * 8;

And it's j here as well.

> > +					nctl |= NCTL_ROW;
> > +					nrows++;
> > +				}
> > +			}
> > +			break;
> > +		default:
> > +			WARN_ON_ONCE(1);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	/* Keep the CS line asserted if there's something else to execute. */
> > +	if (!subop->is_last)
> > +		nctl |= NCTL_CSA;
> > +
> > +	bcma_cc_write32(b47n->cc, BCMA_CC_NFLASH_CONF,
> > +			CONF_MAGIC_BIT |
> > +			CONF_COL_BYTES(ncols) |
> > +			CONF_ROW_BYTES(nrows));
> > +	return bcm47xxnflash_ops_bcm4706_ctl_cmd(b47n->cc, nctl);
> > +}
> > +
> > +static int
> > +bcm47xxnflash_ops_bcm4706_exec_waitrdy(struct nand_chip *chip,
> > +				       const struct nand_subop *subop)
> > +{
> > +	struct bcm47xxnflash *b47n = nand_get_controller_data(chip);
> > +	const struct nand_op_instr *instr = &subop->instrs[0];
> > +	unsigned long timeout_jiffies = jiffies;
> > +
> > +	if (WARN_ON(subop->ninstrs != 1 ||
> > +		    instr->type != NAND_OP_DATA_IN_INSTR))
> > +		return -EINVAL;  
> 
> Same remark as for the atmel migration, I doubt all these checks are
> useful as long as we use the "official" parser to call these helpers. I
> would rather prefer to drop them all.

Agreed.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
