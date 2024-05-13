Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD43C25B10
	for <linux-mtd@archiver.kernel.org>; Mon, 13 May 2024 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lK367Din6veHQkz0nHBSwkyDuRVKkZ9Nrspt8S9Eqk=; b=q4q/GxECzLm1B/
	vS9UhwRx2m4S4n1TQYC8WEHAK0c0kOnnCtGZn6slBw1fYbz05qthFyQrs6D3Dh2A0cem/Nx/ir+xR
	vX7yguseJwZUL/6jtAoTdfati/l6ZGk1ffVr/wi9rOrbTPFN+iDImoacuA2fYWl6JS4JSIi/xlUqn
	FC23r4IMANzMRDMmj69p5cDfSER9tOvcYkzXvMZGYIxS5scpkLz822AyYCnyQgxHsthWyFOTsPACc
	Nlk08cT8tB6jV8fsAwwoSnBl+lLk0Ue5ZyERqvu7ugAaTdULKek+OzSbHIQTK4znaBSD2Wz9MUXtd
	E1TxtN3I15ljPhuH7Rgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RqQ-0000000CMrL-2v1J;
	Mon, 13 May 2024 09:19:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6RqO-0000000CMqk-0N3g
	for linux-mtd@lists.infradead.org;
	Mon, 13 May 2024 09:19:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6RqL-00069R-KZ; Mon, 13 May 2024 11:19:37 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6RqK-0018sg-M6; Mon, 13 May 2024 11:19:36 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6RqK-009RDT-1v;
	Mon, 13 May 2024 11:19:36 +0200
Date: Mon, 13 May 2024 11:19:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mtd: nand: mxc_nand: support software ECC
Message-ID: <ZkHbKGAuBPN3KOVW@pengutronix.de>
References: <20240508-mtd-nand-mxc-nand-exec-op-v2-0-6b7366b7831f@pengutronix.de>
 <20240508-mtd-nand-mxc-nand-exec-op-v2-3-6b7366b7831f@pengutronix.de>
 <20240513094217.4c1a0fc2@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240513094217.4c1a0fc2@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_021940_229007_CDA57CEB 
X-CRM114-Status: GOOD (  43.89  )
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

On Mon, May 13, 2024 at 09:42:17AM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> s.hauer@pengutronix.de wrote on Wed, 08 May 2024 13:08:29 +0200:
> 
> > With these changes the driver can be used with software BCH ECC which
> > is useful for NAND chips that require a stronger ECC than the i.MX
> > hardware supports.
> > 
> > The controller normally interleaves user data with OOB data when
> > accessing the NAND chip. With Software BCH ECC we write the data
> > to the NAND in a way that the raw data on the NAND chip matches the
> > way the NAND layer sees it. This way commands like NAND_CMD_RNDOUT
> > work as expected.
> > 
> > This was tested on i.MX27 but should work on the other SoCs supported
> > by this driver as well.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> > ---
> >  drivers/mtd/nand/raw/mxc_nand.c | 84 ++++++++++++++++++++++++++++++++++++-----
> >  1 file changed, 75 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
> > index 1e8b4553e03ba..7004fd57c80f7 100644
> > --- a/drivers/mtd/nand/raw/mxc_nand.c
> > +++ b/drivers/mtd/nand/raw/mxc_nand.c
> > @@ -178,6 +178,7 @@ struct mxc_nand_host {
> >  	int			used_oobsize;
> >  	int			active_cs;
> >  	unsigned int		ecc_stats_v1;
> > +	unsigned int		column;
> >  
> >  	struct completion	op_completion;
> >  
> > @@ -1397,10 +1398,10 @@ static int mxcnd_attach_chip(struct nand_chip *chip)
> >  	chip->ecc.bytes = host->devtype_data->eccbytes;
> >  	host->eccsize = host->devtype_data->eccsize;
> >  	chip->ecc.size = 512;
> > -	mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
> >  
> >  	switch (chip->ecc.engine_type) {
> >  	case NAND_ECC_ENGINE_TYPE_ON_HOST:
> > +		mtd_set_ooblayout(mtd, host->devtype_data->ooblayout);
> >  		chip->ecc.read_page = mxc_nand_read_page;
> >  		chip->ecc.read_page_raw = mxc_nand_read_page_raw;
> >  		chip->ecc.read_oob = mxc_nand_read_oob;
> > @@ -1465,6 +1466,54 @@ static int mxcnd_setup_interface(struct nand_chip *chip, int chipnr,
> >  	return host->devtype_data->setup_interface(chip, chipnr, conf);
> >  }
> >  
> > +static void copy_page_to_sram(struct mtd_info *mtd)
> > +{
> > +	struct nand_chip *this = mtd_to_nand(mtd);
> > +	struct mxc_nand_host *host = nand_get_controller_data(this);
> > +	void *buf = host->data_buf;
> > +	unsigned int n_subpages = mtd->writesize / 512;
> > +	int oob_per_subpage, i;
> > +
> > +	/* mtd->writesize is not set during ident scanning */
> > +	if (!n_subpages)
> > +		n_subpages = 1;
> > +
> > +	oob_per_subpage = (mtd->oobsize / n_subpages) & ~1;
> > +
> > +	for (i = 0; i < n_subpages; i++) {
> > +		memcpy16_toio(host->main_area0 + i * 512, buf, 512);
> > +		buf += 512;
> > +
> > +		memcpy16_toio(host->spare0 + i * host->devtype_data->spare_len, buf,
> > +			      oob_per_subpage);
> > +		buf += oob_per_subpage;
> > +	}
> > +}
> > +
> > +static void copy_page_from_sram(struct mtd_info *mtd)
> > +{
> > +	struct nand_chip *this = mtd_to_nand(mtd);
> > +	struct mxc_nand_host *host = nand_get_controller_data(this);
> > +	void *buf = host->data_buf;
> > +	unsigned int n_subpages = mtd->writesize / 512;
> > +	int oob_per_subpage, i;
> > +
> > +	/* mtd->writesize is not set during ident scanning */
> > +	if (!n_subpages)
> > +		n_subpages = 1;
> > +
> > +	oob_per_subpage = (mtd->oobsize / n_subpages) & ~1;
> > +
> > +	for (i = 0; i < n_subpages; i++) {
> > +		memcpy16_fromio(buf, host->main_area0 + i * 512, 512);
> > +		buf += 512;
> > +
> > +		memcpy16_fromio(buf, host->spare0 + i * host->devtype_data->spare_len,
> > +				oob_per_subpage);
> > +		buf += oob_per_subpage;
> > +	}
> > +}
> > +
> >  static int mxcnd_exec_op(struct nand_chip *chip,
> >  			 const struct nand_operation *op,
> >  			 bool check_only)
> > @@ -1496,8 +1545,11 @@ static int mxcnd_exec_op(struct nand_chip *chip,
> >  			 */
> >  			break;
> >  		case NAND_OP_CMD_INSTR:
> > -			if (instr->ctx.cmd.opcode == NAND_CMD_PAGEPROG)
> > +			if (instr->ctx.cmd.opcode == NAND_CMD_PAGEPROG) {
> > +				if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
> > +					copy_page_to_sram(mtd);
> >  				host->devtype_data->send_page(mtd, NFC_INPUT);
> > +			}
> 
> Same as before: data moves should not happen here.
> 
> >  
> >  			host->devtype_data->send_cmd(host, instr->ctx.cmd.opcode, true);
> >  
> > @@ -1506,6 +1558,8 @@ static int mxcnd_exec_op(struct nand_chip *chip,
> >  			if (instr->ctx.cmd.opcode == NAND_CMD_STATUS)
> >  				statusreq = true;
> >  
> > +			host->column = 0;
> > +
> 
> This is risky but maybe this is the trick to get NAND_CMD_RNDOUT
> working? If yes maybe it is worth separating from this patchset, if
> possible, with a comment explaining what this is all about (the
> controller's SRAM being some kind of 1:1 mapping with the NAND SRAM,
> thus we need to write the data at the correct offset in the controller
> SRAM, I guess?).

I don't think it's possible to separate introducing the host->column
variable to a separate patch, because this variable is only used with
NAND_ECC_ENGINE_TYPE_SOFT and on the other hand NAND_ECC_ENGINE_TYPE_SOFT
only works with this variable.

Anyway, adding a description what this is all about is a good idea and
I'll do this. In fact I already tried to add one when I found out that
it's really hard to put it into words, so I sent without it ;)

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
