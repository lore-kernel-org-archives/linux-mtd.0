Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1FEFC25B74
	for <linux-mtd@archiver.kernel.org>; Thu, 16 May 2024 10:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXKBnC1i5FjJ1uDRh6458P1BNSmy3hIrSMJ2SflaFaM=; b=esFVhiudYb30gp
	TcpgaYOmjaATQgq9i/RDB6t9fecAlXq2Nv57k8x40sK2D6fNR5nxv9DyeaVF43x33FRzQaXOhDefA
	85XdXq6K3tQP/nGH8vin7HKJHI2y4u22x+pvjj7ScyJxlp/oRROyWiwjQQYNFgDfqCXi0Uz4crihe
	eCw3Qg4mjDOF5+pJH9HISqhy6Mix/LLVrx4W54omHI2+csNk+SKv8/kWZJFVe4vTjd0Xo0WgE5YRc
	RtTIRzV62Naay9R62f7wyOtw8wN+6Z5wVPtzOOx57cInx/MDrYc7UGY3GizBp6s2zIW8hHPc7sw4h
	ozQjYiepZO2Vld99dnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YJ7-00000004TNM-395I;
	Thu, 16 May 2024 10:25:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7YJ4-00000004TMj-29Hi
	for linux-mtd@lists.infradead.org;
	Thu, 16 May 2024 10:25:52 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s7YIz-0003ji-7V; Thu, 16 May 2024 12:25:45 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s7YIx-001h9K-52; Thu, 16 May 2024 12:25:43 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s7YIx-00Epwj-0D;
	Thu, 16 May 2024 12:25:43 +0200
Date: Thu, 16 May 2024 12:25:43 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] mtd: nand: mxc_nand: implement exec_op
Message-ID: <ZkXfJ6n-06YqOr39@pengutronix.de>
References: <20240514-mtd-nand-mxc-nand-exec-op-v3-0-3e6f45fd3d82@pengutronix.de>
 <20240514-mtd-nand-mxc-nand-exec-op-v3-2-3e6f45fd3d82@pengutronix.de>
 <20240516103214.57a8ce33@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240516103214.57a8ce33@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_032550_573137_157EE561 
X-CRM114-Status: GOOD (  15.55  )
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

On Thu, May 16, 2024 at 10:32:14AM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> > +static const struct nand_op_parser mxcnd_op_parser = NAND_OP_PARSER(
> > +	NAND_OP_PARSER_PATTERN(mxcnd_do_exec_op,
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(false),
> > +			       NAND_OP_PARSER_PAT_ADDR_ELEM(true, 7),
> > +			       NAND_OP_PARSER_PAT_CMD_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
> > +			       NAND_OP_PARSER_PAT_DATA_IN_ELEM(true, MAX_DATA_SIZE)),
> 
> CMD, ADDR, CMD, DATA is the RNDOUT pattern. So it is now working fine?

Yes, RNDOUT is working now.

> Or did you forget to adapt the patterns to your use case?

Although it looks like the patterns from the pl35x-nand-controller.c,
there is one slight difference. The 'false' in the NAND_OP_PARSER_PAT_CMD_ELEM
above has the effect that a plain NAND_OP_PARSER_PAT_DATA_IN_ELEM is
disallowed.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
