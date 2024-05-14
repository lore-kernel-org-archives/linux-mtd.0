Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C996EC04FFE
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 09:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTE6SqG1oyamLe3NAB125VCyckdKTS5r039f7OZvabo=; b=Ni0rDqKDXmo20o
	kAaojwVUpr6j+t/jluZ0y31ULZvVC6wYWx1Fsayl5hSUMzuKUoi8hp82/n7pHoPgYQ4XtImQ2kS0n
	s8FKLU27QUZsKk8uO6ZtfBvZu2vPKkT8XgsrPCGPBiOT5jVytFSSlsoI4YwPbtodnUGyZ2jLhXyCP
	6YULc0fwz1vLNlFj5WoVXEwHYDIWh8cSoAi+2Umv8lkENjMCdEgQhKKmSgXg1co1VyK8UxWL8PKTr
	hOpUUcTHh7HQRDcLR0tJURBsO7u9B8qPy+Uzz5GVAarAJed7Pxy1/yblMAwebAsr2MbGUpW6PcHay
	posxJfFCUOmj2jy6E5Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6oId-0000000FSSH-28kE;
	Tue, 14 May 2024 09:18:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6oIW-0000000FSQi-2BB5
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 09:18:14 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6oIP-0000zQ-Fl; Tue, 14 May 2024 11:18:05 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6oIN-001KT6-6G; Tue, 14 May 2024 11:18:03 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6oIN-00BEFM-0K;
	Tue, 14 May 2024 11:18:03 +0200
Date: Tue, 14 May 2024 11:18:03 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <ZkMsS1jj-ZTpZyE1@pengutronix.de>
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
X-CRM114-CacheID: sfid-20240514_021812_580663_3AF9027B 
X-CRM114-Status: GOOD (  28.96  )
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

Ok.

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

Ok.

> 
> And this is actually very wrong.
> 
> You should call wait_op_done() instead.

No, I don't think so. wait_op_done() is called to wait for the interrupt
of the controller indicating a basic operation is done. A basic operation
can be that a command is being sent or an address byte has been sent to
the chip during an address cycle.

With this arbitrary example:

	struct nand_op_instr instrs[] = {
		NAND_OP_CMD(NAND_CMD_READ0, 0),
		NAND_OP_ADDR(4, addrs, 0),
		NAND_OP_CMD(NAND_CMD_READSTART, NAND_COMMON_TIMING_NS(conf, tWB_max)),
		NAND_OP_WAIT_RDY(NAND_COMMON_TIMING_MS(conf, tR_max),
				 NAND_COMMON_TIMING_NS(conf, tRR_min)),
		NAND_OP_DATA_IN(len, buf, 0),
	};

I'll call wait_op_done() once for NAND_CMD_READ0, four times for the NAND_OP_ADDR,
then once again for the NAND_CMD_READSTART command and four times (on i.MX27, once
per subpage) for the NAND_OP_DATA_IN operation. Calling wait_op_done() for the
NAND_OP_WAIT_RDY operation woul only timeout because there is no operation in flight
currently.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
