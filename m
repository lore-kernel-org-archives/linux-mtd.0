Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4E9C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 09:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gcd1FZkIzSsn4cr1j33/KaiXZ5fBK0KMQXuYYB7ZGI8=; b=nMn0uX59yR8z/I
	6yGm4t0pvUdwMUXifRTaX8XTDLUhst6yqCFDKYDZqq8A7RI0DNMlCy10c+V9sYWHwL7WiinjUyuJK
	LIw0/6P6qHn5CFXOzn+VXyS4mSF5C1uDolYiUiq81Ws2pef7xCqIG+aohRjzzL+DPsXHAAvCOqMDy
	lp3xumeYaPYqK/bNucjQJWr5PGWw5Ex6cIiqjiO/9lCjGwnMCHuDqaG+Pu9WH6vgYlg7Ut3Zhkn11
	P2yH6Ho5IJutr2dmSh6M+nksa8wEKX0eTci0WeVfPj2Al4ryvIcT/eGJ7Kj2TC/WE7lw1ZGh2lgV1
	SEG1Ga/0A+Tb8wisuYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Rg7-0000000CKZL-17Lb;
	Mon, 13 May 2024 09:09:03 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6Rg2-0000000CKX5-2QEt
	for linux-mtd@lists.infradead.org;
	Mon, 13 May 2024 09:09:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Rfx-0003kD-GW; Mon, 13 May 2024 11:08:53 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Rfv-0018qs-Hv; Mon, 13 May 2024 11:08:51 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6Rfv-009R8E-1W;
	Mon, 13 May 2024 11:08:51 +0200
Date: Mon, 13 May 2024 11:08:51 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <ZkHYo6-8SC4RMlsG@pengutronix.de>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
 <20240508-mtd-nand-mxc-nand-exec-op-v2-2-6b7366b7831f@pengutronix.de>
 <20240513091902.2c00d30a@xps-13>
 <20240513093256.363861d1@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240513093256.363861d1@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_020858_659509_236ACF66 
X-CRM114-Status: GOOD (  33.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Mon, May 13, 2024 at 09:32:56AM +0200, Miquel Raynal wrote:
> 
> miquel.raynal@bootlin.com wrote on Mon, 13 May 2024 09:19:02 +0200:
> 
> > Hi Sascha,
> > 
> > > @@ -1717,9 +1465,111 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
> > >  	return host->devtype_data->setup_interface(chip, chipnr, conf);
> > >  }
> > >  
> > > +static int mxcnd_exec_op(struct nand_chip *chip,
> > > +			 const struct nand_operation *op,
> > > +			 bool check_only)
> > > +{
> > > +	struct mxc_nand_host *host = nand_get_controller_data(chip);
> > > +	struct mtd_info *mtd = nand_to_mtd(chip);
> > > +	int i, j, buf_len;
> > > +	void *buf_read = NULL;
> > > +	const void *buf_write = NULL;
> > > +	const struct nand_op_instr *instr;
> > > +	bool readid = false;
> > > +	bool statusreq = false;
> > > +
> > > +	dev_dbg(host->dev, "%s: %d instructions\n", __func__, op->ninstrs);  
> > 
> > Maybe you want to get rid of this debug line.
> > 
> > > +
> > > +	if (check_only)
> > > +		return 0;
> > > +
> > > +	for (i = 0; i < op->ninstrs; i++) {
> > > +		instr = &op->instrs[i];
> > > +
> > > +		nand_op_trace("  ", instr);
> > > +
> > > +		switch (instr->type) {
> > > +		case NAND_OP_WAITRDY_INSTR:
> > > +			/*
> > > +			 * NFC handles R/B internally. Therefore, this function
> > > +			 * always returns status as ready.  
> > 
> > This is no longer a standalone function, maybe:
> > 
> > "The controller handles the R/B pin internally, therefore there is
> > nothing to do here."
> 
> And this is actually very wrong.
> 
> You should call wait_op_done() instead.
> 
> > 
> > > +			 */
> > > +			break;
> > > +		case NAND_OP_CMD_INSTR:
> > > +			if (instr->ctx.cmd.opcode == NAND_CMD_PAGEPROG)
> > > +				host->devtype_data->send_page(mtd, NFC_INPUT);
> 
> Actually this is not the right place. You should trigger the transfer
> from controller SRAM to NAND (and the other way around) in the
> NAND_OP_DATA_OUT_INSTR case.
> 
> Here you should just call ->send_cmd.

I tried to get away here with using the standard nand_write_page_raw()
function. This does multiple NAND_OP_DATA_OUT_INSTR ops before finally
sending a NAND_CMD_PAGEPROG command. With software BCH ECC I collect all
data being written in memory and copy it to the controller SRAM en bloc.
I have to do this after the final NAND_OP_DATA_OUT_INSTR op. During a
NAND_OP_DATA_OUT_INSTR I don't know if this is going to be the last one
or if other NAND_OP_DATA_OUT_INSTR ops follow, so I do the copy to SRAM
right before a NAND_CMD_PAGEPROG.

I could move the ->send_page() call to NAND_OP_DATA_OUT_INSTR, but then
I have to overwrite the ecc->write_page_raw() hook. Also it must be
clear that the NAND core will never do multiple NAND_OP_DATA_OUT_INSTR
when programming a page.

Side note: I decided to collect the page data in a memory buffer rather
than in the controller SRAM directly because it seemed too complicated
and error prone to find the correct offset in SRAM for random column
addresses. Also the SRAM can only do word and halfword accesses, so I
additionally would have to emulate byte accesses with read-modify-write
halfword accesses. While certainly doable I'd like to defer this to a
future optimisation exercise.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
