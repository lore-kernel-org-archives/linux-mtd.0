Return-Path: <SRS0=8c9b=DP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58094C4363A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 15:35:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3FD20657
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 15:35:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3An2OOxW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3FD20657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zjLqmh2jP41jpt02xmabK2b6UjSzLTAVXEhz2uVyZ0Y=; b=3An2OOxWpIaCqVwGrI17IudU2
	2lAfKplYjem6eAspqrnzE1UY5utLLJfCYdHN22cbH7mgFGA2Y6HRQ+jpQ8uP8pFgl9rmnzDKsAgNg
	qSf76xjg6oa3KyNJMmEbR7hFhn7E146p8vXrZUjdyE57uNivhmdI8EjyuwZkQ6AjyhquM8dBacKN9
	4MlT/5DqkS/M82LeGCbnSBRTaKpp8BrHnAGI7gaCjeEBT1Ru/JBAC9r2oINn5+qNOcOCdafker/xZ
	Mhodvpy3Z7nfQyq2fvna5jMG+bLcQapFn7TaikEMeCOfZeNL2JlxQoy5gGVhPD+NDQwFCmHzBpnQm
	jVMWv8W0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQXve-0007yy-SN; Thu, 08 Oct 2020 15:34:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQXvX-0007xN-Uf
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2020 15:34:01 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 97C0628DB21;
 Thu,  8 Oct 2020 16:33:53 +0100 (BST)
Date: Thu, 8 Oct 2020 17:33:50 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manuel Dipolt <mdipolt@robart.cc>
Subject: Re: [PATCH v4] mtd: sunxi-nand: add mdma support for allwinner h3
Message-ID: <20201008173350.6fba74be@collabora.com>
In-Reply-To: <1096989423.982216.1602168710935.JavaMail.zimbra@robart.cc>
References: <304519774.774313.1602080709781.JavaMail.zimbra@robart.cc>
 <17724780.774891.1602080826472.JavaMail.zimbra@robart.cc>
 <20201007175321.38826b16@collabora.com>
 <2107658632.970740.1602162997119.JavaMail.zimbra@robart.cc>
 <1096989423.982216.1602168710935.JavaMail.zimbra@robart.cc>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_113356_101773_EDCF4C54 
X-CRM114-Status: GOOD (  20.09  )
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
Cc: Roland Ruckerbauer <rruckerbauer@robart.cc>,
 linux-mtd <linux-mtd@lists.infradead.org>, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 8 Oct 2020 16:51:50 +0200 (CEST)
Manuel Dipolt <mdipolt@robart.cc> wrote:

> > >  				       int page)
> > >  {
> > >  	struct mtd_info *mtd = nand_to_mtd(nand);
> > > @@ -1277,6 +1338,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> > >  	struct nand_ecc_ctrl *ecc = &nand->ecc;
> > >  	struct scatterlist sg;
> > >  	int ret, i;
> > > +	u32 wait_event_flags;  
> > 
> > Or just "wait".
> >   
> 
> 
> removed variable cause waiting again only for nfc interrupt

I think you should wait for both.

> 
> 
> > > +	__u32 mem_addr;
> > >  
> > >  	sunxi_nfc_select_chip(nand, nand->cur_cs);
> > >  
> > > @@ -1284,10 +1347,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > -	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> > > -				       DMA_TO_DEVICE, &sg);
> > > +	if (nfc->caps->has_mdma)
> > > +		ret = sunxi_nfc_mdma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> > > +						DMA_TO_DEVICE, &mem_addr);
> > > +	else
> > > +		ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps, DMA_TO_DEVICE, &sg);
> > > +
> > >  	if (ret)
> > > -		goto pio_fallback;
> > > +		return ret;
> > >  
> > >  	for (i = 0; i < ecc->steps; i++) {
> > >  		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4));
> > > @@ -1304,20 +1371,28 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> > >  	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
> > >  	       nfc->regs + NFC_REG_WCMD_SET);
> > >  
> > > -	dma_async_issue_pending(nfc->dmac);
> > > +	wait_event_flags = NFC_CMD_INT_FLAG;
> > > +
> > > +	if (nfc->caps->has_mdma)
> > > +		wait_event_flags = NFC_DMA_INT_FLAG;  
> > 
> > Are you sure you don't need the NFC_CMD_INT_FLAG flag in that case? I'm
> > pretty sure the DMA transfer is done before the PAGEPROG command is
> > issued, meaning that you might be queuing new operations before the
> > operation is actually finished.  
> 
> 
> can never be sure without any proper documentation about this nand controller ):
> was guessing cause i saw dma int triggered,
> tested again always both flags were set, so changed it to NFC_CMD_INT_FLAG to be on safe side

Actually, if you want to be on safe side, you should probably set both
(and that applies to the read path as well, unless no commands are
issued in that case).


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
