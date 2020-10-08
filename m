Return-Path: <SRS0=8c9b=DP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EC5C4363A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:52:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A2C2064E
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Oct 2020 14:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IG0zmq0i";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="j3Q2Fgxo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A2C2064E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T3dElKJto5hgo9zMN0eT44NeKEYApivybdDp90fNKe0=; b=IG0zmq0i3vbsrYt6GQJRNkdRb
	f7HrEU93DWumJ87qp6ux70hs3ye2vgilQmHHTYvwVYk4PaL3tN4lQK+mZ+Iycf+ZCoYc0jI9VQDNj
	veDaPfZKFhdnOzVXYj8G6mWJK6N7st8rLrQgC+EJh9sjV0KcleqNB/uJtDuA+ao5HXxORpc6fcWPx
	MSXn9flY28pAds42nyv9Nz7JNO76POgGlYeqhtNCvbiBKmAWi3s4l01CDVLaN7wZSXHgpRyGcKytu
	heuCH3BGZzEnLQ0/hfjiAVfRULH42BdVZoiB50Q1gNhbmj4waOu2WtvVO0csOBfBltSoVdwDCZ7VQ
	3AmQqS5tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQXGt-0002Fe-7x; Thu, 08 Oct 2020 14:51:55 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQXGq-0002F7-GK
 for linux-mtd@lists.infradead.org; Thu, 08 Oct 2020 14:51:53 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 5C7871C0D62;
 Thu,  8 Oct 2020 16:51:51 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id eEuX0T29QpiQ; Thu,  8 Oct 2020 16:51:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 2C1411C0DE7;
 Thu,  8 Oct 2020 16:51:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 2C1411C0DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602168711;
 bh=qpHFQohtTtEeYlNtWUsk+9qtyAbtyTeEB02LGuDAqeQ=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=j3Q2FgxoEhT6dAgErdGwviDu1N6VxPN8aKUfdcAqksT7pk4ikCPKQuNwusfWAkQqj
 uMQ6A9mMc7QIU5z3X0kz/iBQKy561GRlMGRx69J0AWNzUsvCj7ytmgf2O/jiubhrYf
 tDzYA11y59J1rlDGYZDsABe/DcNSwYR4RLkVVb8Fv9JvwVMt9vIpoi1OPUOOWd8z6T
 dL6YBTRe/iPZnMr6xjeUIGWPQyjUsoNQZQhOWaSGSoVyzacrjo6rhdCsdvim1es+nQ
 EPAfBfcH0bJUQQybN9E04dAVUi35ATpaHpuyLoJholELjLO/NspyOD2yb3LsQ8Xsve
 HI62kQEql4cxA==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id XY0Y7YiE0F6X; Thu,  8 Oct 2020 16:51:51 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.intern.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 05C961C0DE6;
 Thu,  8 Oct 2020 16:51:51 +0200 (CEST)
Date: Thu, 8 Oct 2020 16:51:50 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <1096989423.982216.1602168710935.JavaMail.zimbra@robart.cc>
In-Reply-To: <2107658632.970740.1602162997119.JavaMail.zimbra@robart.cc>
References: <304519774.774313.1602080709781.JavaMail.zimbra@robart.cc>
 <17724780.774891.1602080826472.JavaMail.zimbra@robart.cc>
 <20201007175321.38826b16@collabora.com>
 <2107658632.970740.1602162997119.JavaMail.zimbra@robart.cc>
Subject: Fwd: [PATCH v4] mtd: sunxi-nand: add mdma support for allwinner h3
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: sunxi-nand: add mdma support for allwinner h3
Thread-Index: PuR4e7Ytqpml1jApywnppe16PRUSpICo2sty
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201008_105152_786397_E1051041 
X-CRM114-Status: GOOD (  41.26  )
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
 Boris Brezillon <boris.brezillon@collabora.com>, maxime@cerno.tech,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


hi Boris,

here are the answers from your review,
will send new patch V5.

With V5 mdma is now set as default dma method for a23

yours,
Manuel

> 
> ----- Original Message -----
> From: "Boris Brezillon" <boris.brezillon@collabora.com>
> To: "Manuel Dipolt" <mdipolt@robart.cc>
> Cc: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>, "maxime" <maxime@cerno.tech>, "miquel raynal" <miquel.raynal@bootlin.com>
> Sent: Wednesday, October 7, 2020 5:53:21 PM
> Subject: 
> 
> On Wed, 7 Oct 2020 16:27:06 +0200 (CEST)
> Manuel Dipolt <mdipolt@robart.cc> wrote:
> 
> > The Allwinner H3 soc supports mdma mode, this patch enable support for it 
> > see old sunxi drivers https://github.com/allwinner-zh/linux-3.4-sunxi/tree/master/modules/nand
> 
> No need to point to the out of tree driver, stating that you add
> support for MDMA should be enough.


Will remove it, wanted to point out where i got the information for the mdma,
cause the information you can get from the allwinner datasheets is not enough.


> > 
> > 
> > Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 196 ++++++++++++++++++++++--------
> >  1 file changed, 147 insertions(+), 49 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> > index 2a7ca3072f35..28ee2f44f179 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -51,6 +51,7 @@
> >  #define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
> >  #define NFC_REG_SPARE_AREA	0x00A0
> >  #define NFC_REG_PAT_ID		0x00A4
> > +#define NFC_REG_MDMA_ADDR	0x00C0
> >  #define NFC_REG_MDMA_CNT	0x00C4
> >  #define NFC_RAM0_BASE		0x0400
> >  #define NFC_RAM1_BASE		0x0800
> > @@ -60,7 +61,7 @@
> >  #define NFC_RESET		BIT(1)
> >  #define NFC_BUS_WIDTH_MSK	BIT(2)
> >  #define NFC_BUS_WIDTH_8		(0 << 2)
> > -#define NFC_BUS_WIDTH_16	(1 << 2)
> > +#define NFC_BUS_WIDTH_16	BIT(2)
> 
> No need to change that line, even if checkpatch complains. BTW, you
> should only run checkpatch on your patch, not the source file. I'm fine
> with this change if you:
> 
> * move it to a separate patch
> * drop the NFC_BUS_WIDTH_8 and NFC_BUS_WIDTH_MSK definitions
> 


Will revert all changes that aren't related to my mdma patch.


> >  #define NFC_RB_SEL_MSK		BIT(3)
> >  #define NFC_RB_SEL(x)		((x) << 3)
> >  #define NFC_CE_SEL_MSK		GENMASK(26, 24)
> > @@ -118,7 +119,7 @@
> >  #define NFC_SEND_CMD4		BIT(29)
> >  #define NFC_CMD_TYPE_MSK	GENMASK(31, 30)
> >  #define NFC_NORMAL_OP		(0 << 30)
> > -#define NFC_ECC_OP		(1 << 30)
> > +#define NFC_ECC_OP		BIT(30)
> 
> No, we should use BIT() in that case, that's an enum. I know checkpatch
> issues a warning for that, but that's fine.
> 


Ok will revert this changes


> >  #define NFC_PAGE_OP		(2U << 30)
> >  
> >  /* define bit use in NFC_RCMD_SET */
> > @@ -207,12 +208,14 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
> >   * NAND Controller capabilities structure: stores NAND controller capabilities
> >   * for distinction between compatible strings.
> >   *
> > + * @has_mdma:			use mbus dma mode, otherwise general dma
> 
> Try to align things properly, and start the description with an
> uppercase.
> 


Aligned and upper case now.


> 
> >   * @extra_mbus_conf:	Contrary to A10, A10s and A13, accessing internal RAM
> >   *			through MBUS on A23/A33 needs extra configuration.
> >   * @reg_io_data:	I/O data register
> >   * @dma_maxburst:	DMA maxburst
> >   */
> >  struct sunxi_nfc_caps {
> > +	bool has_mdma;
> >  	bool extra_mbus_conf;
> >  	unsigned int reg_io_data;
> >  	unsigned int dma_maxburst;
> > @@ -289,7 +292,7 @@ static int sunxi_nfc_wait_events(struct sunxi_nfc *nfc, u32 events,
> >  		writel(events, nfc->regs + NFC_REG_INT);
> >  
> >  		ret = wait_for_completion_timeout(&nfc->complete,
> > -						msecs_to_jiffies(timeout_ms));
> > +						  msecs_to_jiffies(timeout_ms));
> 
> Yet another unrelated coding-style change. Please move that to a
> separate patch if you really care about it.


reverted this change in my patch.


> 
> >  		if (!ret)
> >  			ret = -ETIMEDOUT;
> >  		else
> > @@ -393,6 +396,35 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
> >  	return ret;
> >  }
> >  
> > +static int sunxi_nfc_mdma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
> > +				     int chunksize, int nchunks,
> > +				     enum dma_data_direction ddir,
> > +				     __u32 *mem_addr)
> 
> You mean "dma_addr_t *mem_addr". Anyway, I think you should use the same
> prototype for both sunxi_nfc_dma_op_cleanup() and
> sunxi_nfc_mdma_op_cleanup():


changed to dma_addr_t, moved cleanup functions together

> 
> static int sunxi_nfc_mdma_op_prepare(struct sunxi_nfc *nfc,
>                                      const void *buf,
>                                      int chunksize, int nchunks,
>                                      enum dma_data_direction ddir,
>                                      struct scatterlist *sg)
> 
> > +{
> > +	enum dma_transfer_direction tdir;
> > +	int ret;
> > +
> > +	if (ddir == DMA_FROM_DEVICE)
> > +		tdir = DMA_DEV_TO_MEM;
> > +	else
> > +		tdir = DMA_MEM_TO_DEV;
> > +
> > +	*mem_addr = (__u32)dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, tdir);
> 
> 	sg_init_one(sg, buf, nchunks * chunksize);
> 	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> 	if (!ret)
> 		return -ENOMEM;
> 
> > +
> > +	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
> > +	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> > +	writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> > +	writel(*mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);
> 
> 	writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
> 
> > +	writel(chunksize, nfc->regs + NFC_REG_CNT);
> > +
> > +	return 0;
> > +}
> 
> But now that I look at it, I feel like the mdma logic could be merged
> in the existing dma_op_prepare() function.


merged both prepare functions together


> 
> static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc,
>                                     const void *buf,
>                                     int chunksize, int nchunks,
>                                     enum dma_data_direction ddir,
>                                     struct scatterlist *sg)
> {
> 	struct dma_async_tx_descriptor *dmad;
> 	enum dma_transfer_direction tdir;
> 	dma_cookie_t dmat;
> 	int ret;
> 
> 	if (ddir == DMA_FROM_DEVICE)
> 		tdir = DMA_DEV_TO_MEM;
> 	else
> 		tdir = DMA_MEM_TO_DEV;
> 
> 	sg_init_one(sg, buf, nchunks * chunksize);
> 	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> 	if (!ret)
> 		return -ENOMEM;
> 
> 	if (!nfc->caps->has_mdma) {
> 		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> 		if (!dmad) {
> 			ret = -EINVAL;
> 			goto err_unmap_buf;
> 		}
> 	}
> 
> 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
> 	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> 	writel(chunksize, nfc->regs + NFC_REG_CNT);
> 
> 	if (nfc->caps->has_mdma) {
> 		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> 		writel(sg_dma_address(sg), nfc->regs + NFC_REG_MDMA_ADDR);
> 	} else {
> 		dmat = dmaengine_submit(dmad);
> 
> 		ret = dma_submit_error(dmat);
> 		if (ret)
> 			goto err_clr_dma_flag;
> 	}
> 
> 	return 0;
> 
> err_clr_dma_flag:
> 	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD, nfc->regs + NFC_REG_CTL);
> 
> err_unmap_buf:
> 	dma_unmap_sg(nfc->dev, sg, 1, ddir);
> 	return ret;
> }
> 
> 
> > +
> >  static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
> >  				     enum dma_data_direction ddir,
> >  				     struct scatterlist *sg)
> > @@ -402,6 +434,21 @@ static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
> >  	       nfc->regs + NFC_REG_CTL);
> >  }
> >  
> > +static void sunxi_nfc_mdma_op_cleanup(struct sunxi_nfc *nfc,
> > +				      enum dma_data_direction ddir,
> > +				      __u32 *mem_addr, size_t size)
> > +{
> > +	enum dma_transfer_direction tdir;
> > +
> > +	if (ddir == DMA_FROM_DEVICE)
> > +		tdir = DMA_DEV_TO_MEM;
> > +	else
> > +		tdir = DMA_MEM_TO_DEV;
> > +
> > +	dma_unmap_single(nfc->dev, *mem_addr, size, tdir);
> > +	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,  nfc->regs + NFC_REG_CTL);
> > +}
> 
> If you go for the option I suggested above you don't even need this
> sunxi_nfc_mdma_op_cleanup() helper.


merged both dma cleanup functions together


> 
> 
> > @@ -1199,7 +1260,7 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
> >  }
> >  
> >  static int sunxi_nfc_hw_ecc_write_page(struct nand_chip *nand,
> > -				       const uint8_t *buf, int oob_required,
> > +				       const u8 *buf, int oob_required,
> 
> Unrelated coding-style update.


reverted this change


> 
> >  				       int page)
> >  {
> >  	struct mtd_info *mtd = nand_to_mtd(nand);
> > @@ -1277,6 +1338,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> >  	struct nand_ecc_ctrl *ecc = &nand->ecc;
> >  	struct scatterlist sg;
> >  	int ret, i;
> > +	u32 wait_event_flags;
> 
> Or just "wait".
> 


removed variable cause waiting again only for nfc interrupt


> > +	__u32 mem_addr;
> >  
> >  	sunxi_nfc_select_chip(nand, nand->cur_cs);
> >  
> > @@ -1284,10 +1347,14 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> > -				       DMA_TO_DEVICE, &sg);
> > +	if (nfc->caps->has_mdma)
> > +		ret = sunxi_nfc_mdma_op_prepare(nfc, buf, ecc->size, ecc->steps,
> > +						DMA_TO_DEVICE, &mem_addr);
> > +	else
> > +		ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps, DMA_TO_DEVICE, &sg);
> > +
> >  	if (ret)
> > -		goto pio_fallback;
> > +		return ret;
> >  
> >  	for (i = 0; i < ecc->steps; i++) {
> >  		const u8 *oob = nand->oob_poi + (i * (ecc->bytes + 4));
> > @@ -1304,20 +1371,28 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
> >  	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
> >  	       nfc->regs + NFC_REG_WCMD_SET);
> >  
> > -	dma_async_issue_pending(nfc->dmac);
> > +	wait_event_flags = NFC_CMD_INT_FLAG;
> > +
> > +	if (nfc->caps->has_mdma)
> > +		wait_event_flags = NFC_DMA_INT_FLAG;
> 
> Are you sure you don't need the NFC_CMD_INT_FLAG flag in that case? I'm
> pretty sure the DMA transfer is done before the PAGEPROG command is
> issued, meaning that you might be queuing new operations before the
> operation is actually finished.


can never be sure without any proper documentation about this nand controller ):
was guessing cause i saw dma int triggered,
tested again always both flags were set, so changed it to NFC_CMD_INT_FLAG to be on safe side

> 
> > +	else
> > +		dma_async_issue_pending(nfc->dmac);
> >  
> >  	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
> > -	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
> > -	       nfc->regs + NFC_REG_CMD);
> > +		NFC_DATA_TRANS | NFC_ACCESS_DIR,
> > +		nfc->regs + NFC_REG_CMD);
> 
> Why? AFAICS those were already properly aligned.


assume the check script complained cause of the space at line begining, changed it back.


> 
> >  
> > -	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
> > -	if (ret)
> > +	ret = sunxi_nfc_wait_events(nfc, wait_event_flags, false, 0);
> > +	if (ret && !nfc->caps->has_mdma)
> >  		dmaengine_terminate_all(nfc->dmac);
> >  
> >  	sunxi_nfc_randomizer_disable(nand);
> >  	sunxi_nfc_hw_ecc_disable(nand);
> >  
> > -	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
> > +	if (nfc->caps->has_mdma)
> > +		sunxi_nfc_mdma_op_cleanup(nfc, DMA_TO_DEVICE, &mem_addr, ecc->size * ecc->steps);
> > +	else
> > +		sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
> >  
> >  	if (ret)
> >  		return ret;
> > @@ -1359,7 +1434,7 @@ static const s32 tWB_lut[] = {6, 12, 16, 20};
> >  static const s32 tRHW_lut[] = {4, 8, 12, 20};
> >  
> >  static int _sunxi_nand_lookup_timing(const s32 *lut, int lut_size, u32 duration,
> > -		u32 clk_period)
> > +				     u32 clk_period)
> >  {
> >  	u32 clk_cycles = DIV_ROUND_UP(duration, clk_period);
> >  	int i;
> > @@ -1695,7 +1770,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
> >  	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
> >  	ecc->priv = data;
> >  
> > -	if (nfc->dmac) {
> > +	if (nfc->dmac || nfc->caps->has_mdma) {
> >  		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
> >  		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
> >  		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
> > @@ -1949,10 +2024,8 @@ static int sunxi_nand_chip_init(struct device *dev, struct sunxi_nfc *nfc,
> >  
> >  	sunxi_nand = devm_kzalloc(dev, struct_size(sunxi_nand, sels, nsels),
> >  				  GFP_KERNEL);
> > -	if (!sunxi_nand) {
> > -		dev_err(dev, "could not allocate chip\n");
> > +	if (!sunxi_nand)
> >  		return -ENOMEM;
> > -	}
> >  
> >  	sunxi_nand->nsels = nsels;
> >  
> > @@ -2058,6 +2131,41 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
> >  	}
> >  }
> >  
> > +static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
> > +{
> > +	int ret;
> > +
> > +	if (nfc->caps->has_mdma) {
> > +		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
> > +		       nfc->regs + NFC_REG_CTL);
> 
> Don't you have to program the CTL reg any time you issue a command anyway?
> I'm pretty sure this write is useless, and if it's not, it probably papers
> over a real bug.


makes sense, will move it to prepare function


> 
> > +	} else {
> 
> You can drop one level of indentation if you do:


changed


> 
> 	if (nfc->caps->has_mdma)
> 		return;
> 
> > +		nfc->dmac = dma_request_chan(nfc->dev, "rxtx");
> > +		if (IS_ERR(nfc->dmac)) {
> > +			ret = PTR_ERR(nfc->dmac);
> > +			if (ret)
> > +				return ret;
> > +
> > +			/* Ignore errors to fall back to PIO mode */
> > +			dev_warn(nfc->dev, "failed to request rxtx DMA channel: %d\n", ret);
> > +		} else {
> > +			struct dma_slave_config dmac_cfg = { };
> > +
> > +			dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
> > +			dmac_cfg.dst_addr = dmac_cfg.src_addr;
> > +			dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> > +			dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> > +			dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
> > +			dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
> > +			dmaengine_slave_config(nfc->dmac, &dmac_cfg);
> > +
> > +			if (nfc->caps->extra_mbus_conf)
> > +				writel(readl(nfc->regs + NFC_REG_CTL) |
> > +					NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +
> >  static int sunxi_nfc_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -2132,30 +2240,10 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		goto out_ahb_reset_reassert;
> >  
> > -	nfc->dmac = dma_request_chan(dev, "rxtx");
> > -	if (IS_ERR(nfc->dmac)) {
> > -		ret = PTR_ERR(nfc->dmac);
> > -		if (ret == -EPROBE_DEFER)
> > -			goto out_ahb_reset_reassert;
> > +	ret = sunxi_nfc_dma_init(nfc, r);
> >  
> > -		/* Ignore errors to fall back to PIO mode */
> > -		dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret);
> > -		nfc->dmac = NULL;
> > -	} else {
> > -		struct dma_slave_config dmac_cfg = { };
> > -
> > -		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
> > -		dmac_cfg.dst_addr = dmac_cfg.src_addr;
> > -		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> > -		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
> > -		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
> > -		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
> > -		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
> > -
> > -		if (nfc->caps->extra_mbus_conf)
> > -			writel(readl(nfc->regs + NFC_REG_CTL) |
> > -			       NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
> > -	}
> > +	if (ret)
> > +		goto out_ahb_reset_reassert;
> >  
> >  	platform_set_drvdata(pdev, nfc);
> >  
> > @@ -2197,16 +2285,22 @@ static int sunxi_nfc_remove(struct platform_device *pdev)
> >  }
> >  
> >  static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
> > +	.has_mdma = false,
> 
> It's already false by default, you can drop that line.

dropped

> 
> >  	.reg_io_data = NFC_REG_A10_IO_DATA,
> >  	.dma_maxburst = 4,
> >  };
> >  
> >  static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
> > +	.has_mdma = false,
> 
> I'd set that one to true (I'm pretty sure the A23 has an MDMA).


ok, removed h3 caps and compatible, changed the a23 caps to mdma


> 
> >  	.extra_mbus_conf = true,
> 
> If you set has_mdma to true, you can probably drop the extra_mbus_conf
> field...


dropped extra_mbus_conf option 


> 
> >  	.reg_io_data = NFC_REG_A23_IO_DATA,
> >  	.dma_maxburst = 8,
> 
> ... and leave that one to 0.


removed it, set only has_mdma to true now


> 
> >  };
> >  
> > +static const struct sunxi_nfc_caps sunxi_nfc_h3_caps = {
> > +	.has_mdma = true,
> > +};
> > +
> >  static const struct of_device_id sunxi_nfc_ids[] = {
> >  	{
> >  		.compatible = "allwinner,sun4i-a10-nand",
> > @@ -2216,6 +2310,10 @@ static const struct of_device_id sunxi_nfc_ids[] = {
> >  		.compatible = "allwinner,sun8i-a23-nand-controller",
> >  		.data = &sunxi_nfc_a23_caps,
> >  	},
> > +	{
> > +		.compatible = "allwinner,sun8i-h3-nand-controller",
> > +		.data = &sunxi_nfc_h3_caps,
> > +	},
> 
> I'm pretty sure you can re-use the a23 compat string for h3, no need to
> add a new one if it's the same HW block.


Ok, will remove the h3 compat string


> 
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, sunxi_nfc_ids);
> 
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
