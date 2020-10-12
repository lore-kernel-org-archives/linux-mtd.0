Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607F8C433E7
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 08:51:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F7820773
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 08:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2qXVG45P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=robart.cc header.i=@robart.cc header.b="ArV3yJHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F7820773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robart.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Subject:References:In-Reply-To:
	Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rD5I2g5yW4hMPA3DwyfPvOoXthJx+VqHWGo2x4b/2d4=; b=2qXVG45P/mevY/odS/hucdTD0
	My9bKO28fNtjeza+RSiTnaS8ZrtPfZVeHjXRdRM6S9L5oB6TMz10dLLu9vtUeY+pBp/t86F+nEqpd
	fMdR8GZE3ddhof+ooQodADvDj/4hlSne1NIpLdNXRLDELUhLVjrD/3kCU/7NJqUGgk9js45r+YbHn
	EdPrrbDXYp1WReqAarSVShapCV3g/5/dnpY/FXiWWzgQCQamR+EsoQM9EV94443FplxfYHpWQ+OnO
	Ygv+oD/Yx//Plsb+Aw1Nsi0ALvKyIMDs7ESveteXJTsVFIHtfDRHdV5Xnp1EQUR5GmAqSI1CwXpVP
	I9Z5jYgrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRtWn-0005eX-Gn; Mon, 12 Oct 2020 08:49:57 +0000
Received: from srv-mta-01.robart.cc ([80.123.245.229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRtWk-0005dk-1v
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 08:49:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 5A8CC1C0D65;
 Mon, 12 Oct 2020 10:49:50 +0200 (CEST)
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id W5irYCcuh72h; Mon, 12 Oct 2020 10:49:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 2DC4C1C0D5E;
 Mon, 12 Oct 2020 10:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 srv-mta-01.robart.cc 2DC4C1C0D5E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robart.cc;
 s=B016B336-104E-11EA-8E2D-E36DD02BB770; t=1602492590;
 bh=+PB4yfXZNsylVc/CAQun5lWYnSnAzxdpc1P+41utN7g=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=ArV3yJHkcbmIleSX4CGckI0MU2FYuD5rghU6O3fH3MHbi01/SOMYLREyyEH+h8pbG
 IZaE93PpP9tK0ciKsvOb3uSMWKvksjXRTf4QdeZWgNHWQ8W5BssXtAhDrRU1zRia3L
 4gjiGuAUI7jkcP+C5cTh3TE+q5KJiNAG1ay0pWm3i1xuR6zvzkhivVpvdGXqkKtDlt
 Q1YOPTX/5saSS0HnkW0GSuwminQlNC4lEjtRSPadcyaxrbDv40Lj3pLkxNXEmqxeo6
 wS/fzgsbN/5CHEJ5NccFJEvMGJTCfd4QPQs2RvM6RlgwLKSLmhOATUmOe1bvodD4kt
 9/fsHXxtmwDBQ==
X-Virus-Scanned: amavisd-new at srv-mta-01.robart.cc
Received: from srv-mta-01.robart.cc ([127.0.0.1])
 by localhost (srv-mta-01.robart.cc [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id heG2PFXOKhLV; Mon, 12 Oct 2020 10:49:50 +0200 (CEST)
Received: from srv-mda-01.robart.cc (srv-mda-01.intern.robart.cc [10.0.10.21])
 by srv-mta-01.robart.cc (Postfix) with ESMTP id 09E2B1C0D65;
 Mon, 12 Oct 2020 10:49:50 +0200 (CEST)
Date: Mon, 12 Oct 2020 10:49:49 +0200 (CEST)
From: Manuel Dipolt <mdipolt@robart.cc>
To: linux-mtd <linux-mtd@lists.infradead.org>
Message-ID: <335003428.221703.1602492589948.JavaMail.zimbra@robart.cc>
In-Reply-To: <610636841.983122.1602169127227.JavaMail.zimbra@robart.cc>
References: <610636841.983122.1602169127227.JavaMail.zimbra@robart.cc>
Subject: Re: [PATCH v5] mtd: sunxi-nand: enable mdma support for allwinner a23
MIME-Version: 1.0
X-Originating-IP: [10.0.20.40]
X-Mailer: Zimbra 8.8.15_GA_3959 (ZimbraWebClient - FF78 (Linux)/8.8.15_GA_3953)
Thread-Topic: sunxi-nand: enable mdma support for allwinner a23
Thread-Index: 5JuojLmIwz1diIEeARYqWy8KPlCVR2h4q1Gc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_044954_642987_35E9A067 
X-CRM114-Status: GOOD (  39.08  )
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
 Boris Brezillon <boris.brezillon@collabora.com>, maxime <maxime@cerno.tech>,
 miquel raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

see answers below, new patch will be provided as V6


> The subject prefix should be "mtd: rawnand: sunxi:" not "mtd:
> sunxi-nand:"


corrected


> On Thu, 8 Oct 2020 16:58:47 +0200 (CEST)
> Manuel Dipolt <mdipolt@robart.cc> wrote:
> 
> > This patch enables nand mdma mode for the Allwinner socs A23/A33/H3
> 
>                      ^NAND MDMA (Master DMA)
> 
> And you need a period at the of your sentence.
> 

corrected


> >
> > Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
> > ---
> >  drivers/mtd/nand/raw/sunxi_nand.c | 156 +++++++++++++++++++-----------
> >  1 file changed, 101 insertions(+), 55 deletions(-)
> >
> > diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
> > index 2a7ca3072f35..8403785e85e1 100644
> > --- a/drivers/mtd/nand/raw/sunxi_nand.c
> > +++ b/drivers/mtd/nand/raw/sunxi_nand.c
> > @@ -51,6 +51,7 @@
> >  #define NFC_REG_USER_DATA(x)        (0x0050 + ((x) * 4))
> >  #define NFC_REG_SPARE_AREA        0x00A0
> >  #define NFC_REG_PAT_ID                0x00A4
> > +#define NFC_REG_MDMA_ADDR        0x00C0
> >  #define NFC_REG_MDMA_CNT        0x00C4
> >  #define NFC_RAM0_BASE                0x0400
> >  #define NFC_RAM1_BASE                0x0800
> > @@ -207,13 +208,13 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
> >   * NAND Controller capabilities structure: stores NAND controller capabilities
> >   * for distinction between compatible strings.
> >   *
> > - * @extra_mbus_conf:        Contrary to A10, A10s and A13, accessing internal RAM
> > + * @has_mdma:                Use mbus dma mode, otherwise general dma
> >   *                        through MBUS on A23/A33 needs extra configuration.
> >   * @reg_io_data:        I/O data register
> >   * @dma_maxburst:        DMA maxburst
> >   */
> >  struct sunxi_nfc_caps {
> > -        bool extra_mbus_conf;
> > +        bool has_mdma;
> >          unsigned int reg_io_data;
> >          unsigned int dma_maxburst;
> >  };
> > @@ -346,7 +347,7 @@ static int sunxi_nfc_rst(struct sunxi_nfc *nfc)
> >  static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
> >                                      int chunksize, int nchunks,
> >                                      enum dma_data_direction ddir,
> > -                                    struct scatterlist *sg)
> > +                                    struct scatterlist *sg, dma_addr_t *mem_addr)
> 
> You don't need to pass the mem_addr, it will be extracted from the sg
> list.
> 

wasn't aware of that, good point don't have to change functions params now

> >  {
> >          struct dma_async_tx_descriptor *dmad;
> >          enum dma_transfer_direction tdir;
> > @@ -358,29 +359,46 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
> >          else
> >                  tdir = DMA_MEM_TO_DEV;
> >  
> > -        sg_init_one(sg, buf, nchunks * chunksize);
> > -        ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> > -        if (!ret)
> > -                return -ENOMEM;
> > +        if (nfc->caps->has_mdma) {
> > +                *mem_addr = dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, tdir);
> > +                ret = dma_mapping_error(nfc->dev, *mem_addr);
> 
> You can use sg_init_one() here as well.
>

changed to sg_init_one
 
> > +                if (ret) {
> > +                        dev_err(nfc->dev, "DMA mapping error\n");
> > +                        return ret;
> > +                }
> > +        } else {
> > +                sg_init_one(sg, buf, nchunks * chunksize);
> > +                ret = dma_map_sg(nfc->dev, sg, 1, ddir);
> > +                if (!ret)
> > +                        return -ENOMEM;
> >  
> > -        dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> > -        if (!dmad) {
> > -                ret = -EINVAL;
> > -                goto err_unmap_buf;
> > +                dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
> > +                if (!dmad) {
> > +                        ret = -EINVAL;
> > +                        goto err_unmap_buf;
> > +                }
> >          }
> >  
> >          writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
> >                 nfc->regs + NFC_REG_CTL);
> >          writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
> >          writel(chunksize, nfc->regs + NFC_REG_CNT);
> > -        if (nfc->caps->extra_mbus_conf)
> > +
> > +        if (nfc->caps->has_mdma) {
> > +                writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
> > +                       nfc->regs + NFC_REG_CTL);
> >                  writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
> > +                writel(*mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);
> 
>                         ^ sg_dma_address(sg)
> 
> > +        } else {
> > +                writel(readl(nfc->regs + NFC_REG_CTL) | NFC_DMA_TYPE_NORMAL,
> > +                       nfc->regs + NFC_REG_CTL);
> >  
> > -        dmat = dmaengine_submit(dmad);
> > +                dmat = dmaengine_submit(dmad);
> >  
> > -        ret = dma_submit_error(dmat);
> > -        if (ret)
> > -                goto err_clr_dma_flag;
> > +                ret = dma_submit_error(dmat);
> > +                if (ret)
> > +                        goto err_clr_dma_flag;
> > +        }
> >  
> >          return 0;
> >  
> > @@ -395,11 +413,24 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
> >  
> >  static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
> >                                       enum dma_data_direction ddir,
> > -                                     struct scatterlist *sg)
> > +                                     struct scatterlist *sg, dma_addr_t mem_addr, size_t size)
> >  {
> > -        dma_unmap_sg(nfc->dev, sg, 1, ddir);
> > -        writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> > -               nfc->regs + NFC_REG_CTL);
> > +        enum dma_transfer_direction tdir;
> > +
> > +        if (ddir == DMA_FROM_DEVICE)
> > +                tdir = DMA_DEV_TO_MEM;
> > +        else
> > +                tdir = DMA_MEM_TO_DEV;
> > +
> > +        if (nfc->caps->has_mdma) {
> > +                dma_unmap_single(nfc->dev, mem_addr, size, tdir);
> > +                writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> > +                       nfc->regs + NFC_REG_CTL);
> > +        } else {
> > +                dma_unmap_sg(nfc->dev, sg, 1, ddir);
> > +                writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
> > +                       nfc->regs + NFC_REG_CTL);
> > +        }
> >  }
> 
> As I said in my previous review, if you get rid of the mem_addr
> argument, you shouldn't need any changes to this function. Have you
> tried using sg_dma_address()?
> 


> >
> > removed variable cause waiting again only for nfc interrupt
> 
> I think you should wait for both.


ok waiting now for both to be on safe side.

 
> > > Are you sure you don't need the NFC_CMD_INT_FLAG flag in that case? I'm
> > > pretty sure the DMA transfer is done before the PAGEPROG command is
> > > issued, meaning that you might be queuing new operations before the
> > > operation is actually finished.  
> >
> >
> > can never be sure without any proper documentation about this nand controller ):
> > was guessing cause i saw dma int triggered,
> > tested again always both flags were set, so changed it to NFC_CMD_INT_FLAG to be on safe side
> 
> Actually, if you want to be on safe side, you should probably set both
> (and that applies to the read path as well, unless no commands are
> issued in that case).

waiting for both in read and write path now 


Yours,
Manuel





----- Original Message -----
From: "Manuel Dipolt" <mdipolt@robart.cc>
To: "linux-mtd" <linux-mtd@lists.infradead.org>
Cc: "Boris Brezillon" <boris.brezillon@collabora.com>, "maxime" <maxime@cerno.tech>, "miquel raynal" <miquel.raynal@bootlin.com>, "Roland Ruckerbauer" <rruckerbauer@robart.cc>
Sent: Thursday, October 8, 2020 4:58:47 PM
Subject: [PATCH v5] mtd: sunxi-nand: enable mdma support for allwinner a23

This patch enables nand mdma mode for the Allwinner socs A23/A33/H3 

Signed-off-by: Manuel Dipolt <manuel.dipolt@robart.cc>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 156 +++++++++++++++++++-----------
 1 file changed, 101 insertions(+), 55 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 2a7ca3072f35..8403785e85e1 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -51,6 +51,7 @@
 #define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
 #define NFC_REG_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID		0x00A4
+#define NFC_REG_MDMA_ADDR	0x00C0
 #define NFC_REG_MDMA_CNT	0x00C4
 #define NFC_RAM0_BASE		0x0400
 #define NFC_RAM1_BASE		0x0800
@@ -207,13 +208,13 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * NAND Controller capabilities structure: stores NAND controller capabilities
  * for distinction between compatible strings.
  *
- * @extra_mbus_conf:	Contrary to A10, A10s and A13, accessing internal RAM
+ * @has_mdma:		Use mbus dma mode, otherwise general dma
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @dma_maxburst:	DMA maxburst
  */
 struct sunxi_nfc_caps {
-	bool extra_mbus_conf;
+	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int dma_maxburst;
 };
@@ -346,7 +347,7 @@ static int sunxi_nfc_rst(struct sunxi_nfc *nfc)
 static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 				    int chunksize, int nchunks,
 				    enum dma_data_direction ddir,
-				    struct scatterlist *sg)
+				    struct scatterlist *sg, dma_addr_t *mem_addr)
 {
 	struct dma_async_tx_descriptor *dmad;
 	enum dma_transfer_direction tdir;
@@ -358,29 +359,46 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 	else
 		tdir = DMA_MEM_TO_DEV;
 
-	sg_init_one(sg, buf, nchunks * chunksize);
-	ret = dma_map_sg(nfc->dev, sg, 1, ddir);
-	if (!ret)
-		return -ENOMEM;
+	if (nfc->caps->has_mdma) {
+		*mem_addr = dma_map_single(nfc->dev, (void *)buf, nchunks * chunksize, tdir);
+		ret = dma_mapping_error(nfc->dev, *mem_addr);
+		if (ret) {
+			dev_err(nfc->dev, "DMA mapping error\n");
+			return ret;
+		}
+	} else {
+		sg_init_one(sg, buf, nchunks * chunksize);
+		ret = dma_map_sg(nfc->dev, sg, 1, ddir);
+		if (!ret)
+			return -ENOMEM;
 
-	dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
-	if (!dmad) {
-		ret = -EINVAL;
-		goto err_unmap_buf;
+		dmad = dmaengine_prep_slave_sg(nfc->dmac, sg, 1, tdir, DMA_CTRL_ACK);
+		if (!dmad) {
+			ret = -EINVAL;
+			goto err_unmap_buf;
+		}
 	}
 
 	writel(readl(nfc->regs + NFC_REG_CTL) | NFC_RAM_METHOD,
 	       nfc->regs + NFC_REG_CTL);
 	writel(nchunks, nfc->regs + NFC_REG_SECTOR_NUM);
 	writel(chunksize, nfc->regs + NFC_REG_CNT);
-	if (nfc->caps->extra_mbus_conf)
+
+	if (nfc->caps->has_mdma) {
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_DMA_TYPE_NORMAL,
+		       nfc->regs + NFC_REG_CTL);
 		writel(chunksize * nchunks, nfc->regs + NFC_REG_MDMA_CNT);
+		writel(*mem_addr, nfc->regs + NFC_REG_MDMA_ADDR);
+	} else {
+		writel(readl(nfc->regs + NFC_REG_CTL) | NFC_DMA_TYPE_NORMAL,
+		       nfc->regs + NFC_REG_CTL);
 
-	dmat = dmaengine_submit(dmad);
+		dmat = dmaengine_submit(dmad);
 
-	ret = dma_submit_error(dmat);
-	if (ret)
-		goto err_clr_dma_flag;
+		ret = dma_submit_error(dmat);
+		if (ret)
+			goto err_clr_dma_flag;
+	}
 
 	return 0;
 
@@ -395,11 +413,24 @@ static int sunxi_nfc_dma_op_prepare(struct sunxi_nfc *nfc, const void *buf,
 
 static void sunxi_nfc_dma_op_cleanup(struct sunxi_nfc *nfc,
 				     enum dma_data_direction ddir,
-				     struct scatterlist *sg)
+				     struct scatterlist *sg, dma_addr_t mem_addr, size_t size)
 {
-	dma_unmap_sg(nfc->dev, sg, 1, ddir);
-	writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
-	       nfc->regs + NFC_REG_CTL);
+	enum dma_transfer_direction tdir;
+
+	if (ddir == DMA_FROM_DEVICE)
+		tdir = DMA_DEV_TO_MEM;
+	else
+		tdir = DMA_MEM_TO_DEV;
+
+	if (nfc->caps->has_mdma) {
+		dma_unmap_single(nfc->dev, mem_addr, size, tdir);
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+	} else {
+		dma_unmap_sg(nfc->dev, sg, 1, ddir);
+		writel(readl(nfc->regs + NFC_REG_CTL) & ~NFC_RAM_METHOD,
+		       nfc->regs + NFC_REG_CTL);
+	}
 }
 
 static void sunxi_nfc_select_chip(struct nand_chip *nand, unsigned int cs)
@@ -911,6 +942,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	unsigned int max_bitflips = 0;
 	int ret, i, raw_mode = 0;
 	struct scatterlist sg;
+	dma_addr_t mem_addr;
 	u32 status;
 
 	ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
@@ -918,7 +950,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 		return ret;
 
 	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, nchunks,
-				       DMA_FROM_DEVICE, &sg);
+				       DMA_FROM_DEVICE, &sg, &mem_addr);
+
 	if (ret)
 		return ret;
 
@@ -929,19 +962,20 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, uint8_t *buf
 	writel((NAND_CMD_RNDOUTSTART << 16) | (NAND_CMD_RNDOUT << 8) |
 	       NAND_CMD_READSTART, nfc->regs + NFC_REG_RCMD_SET);
 
-	dma_async_issue_pending(nfc->dmac);
+	if (!nfc->caps->has_mdma)
+		dma_async_issue_pending(nfc->dmac);
 
 	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD | NFC_DATA_TRANS,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	if (ret)
+	if (ret && !nfc->caps->has_mdma)
 		dmaengine_terminate_all(nfc->dmac);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg);
+	sunxi_nfc_dma_op_cleanup(nfc, DMA_FROM_DEVICE, &sg, mem_addr, nchunks * ecc->size);
 
 	if (ret)
 		return ret;
@@ -1276,6 +1310,7 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct scatterlist sg;
+	dma_addr_t mem_addr;
 	int ret, i;
 
 	sunxi_nfc_select_chip(nand, nand->cur_cs);
@@ -1285,7 +1320,8 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 		return ret;
 
 	ret = sunxi_nfc_dma_op_prepare(nfc, buf, ecc->size, ecc->steps,
-				       DMA_TO_DEVICE, &sg);
+				       DMA_TO_DEVICE, &sg, &mem_addr);
+
 	if (ret)
 		goto pio_fallback;
 
@@ -1304,20 +1340,22 @@ static int sunxi_nfc_hw_ecc_write_page_dma(struct nand_chip *nand,
 	writel((NAND_CMD_RNDIN << 8) | NAND_CMD_PAGEPROG,
 	       nfc->regs + NFC_REG_WCMD_SET);
 
-	dma_async_issue_pending(nfc->dmac);
+	if (!nfc->caps->has_mdma)
+		dma_async_issue_pending(nfc->dmac);
 
 	writel(NFC_PAGE_OP | NFC_DATA_SWAP_METHOD |
 	       NFC_DATA_TRANS | NFC_ACCESS_DIR,
 	       nfc->regs + NFC_REG_CMD);
 
 	ret = sunxi_nfc_wait_events(nfc, NFC_CMD_INT_FLAG, false, 0);
-	if (ret)
+	if (ret && !nfc->caps->has_mdma)
 		dmaengine_terminate_all(nfc->dmac);
 
 	sunxi_nfc_randomizer_disable(nand);
 	sunxi_nfc_hw_ecc_disable(nand);
 
-	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg);
+	sunxi_nfc_dma_op_cleanup(nfc, DMA_TO_DEVICE, &sg, mem_addr,
+				 ecc->size * ecc->steps);
 
 	if (ret)
 		return ret;
@@ -1695,7 +1733,7 @@ static int sunxi_nand_hw_ecc_ctrl_init(struct nand_chip *nand,
 	mtd_set_ooblayout(mtd, &sunxi_nand_ooblayout_ops);
 	ecc->priv = data;
 
-	if (nfc->dmac) {
+	if (nfc->dmac || nfc->caps->has_mdma) {
 		ecc->read_page = sunxi_nfc_hw_ecc_read_page_dma;
 		ecc->read_subpage = sunxi_nfc_hw_ecc_read_subpage_dma;
 		ecc->write_page = sunxi_nfc_hw_ecc_write_page_dma;
@@ -2058,6 +2096,36 @@ static void sunxi_nand_chips_cleanup(struct sunxi_nfc *nfc)
 	}
 }
 
+static int sunxi_nfc_dma_init(struct sunxi_nfc *nfc, struct resource *r)
+{
+	int ret;
+
+	if (nfc->caps->has_mdma)
+		return 0;
+
+	nfc->dmac = dma_request_chan(nfc->dev, "rxtx");
+	if (IS_ERR(nfc->dmac)) {
+		ret = PTR_ERR(nfc->dmac);
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		/* Ignore errors to fall back to PIO mode */
+		dev_warn(nfc->dev, "failed to request rxtx DMA channel: %d\n", ret);
+		nfc->dmac = NULL;
+	} else {
+		struct dma_slave_config dmac_cfg = { };
+
+		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
+		dmac_cfg.dst_addr = dmac_cfg.src_addr;
+		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
+		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
+		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
+		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
+	}
+	return 0;
+}
+
 static int sunxi_nfc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -2132,30 +2200,10 @@ static int sunxi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_ahb_reset_reassert;
 
-	nfc->dmac = dma_request_chan(dev, "rxtx");
-	if (IS_ERR(nfc->dmac)) {
-		ret = PTR_ERR(nfc->dmac);
-		if (ret == -EPROBE_DEFER)
-			goto out_ahb_reset_reassert;
-
-		/* Ignore errors to fall back to PIO mode */
-		dev_warn(dev, "failed to request rxtx DMA channel: %d\n", ret);
-		nfc->dmac = NULL;
-	} else {
-		struct dma_slave_config dmac_cfg = { };
-
-		dmac_cfg.src_addr = r->start + nfc->caps->reg_io_data;
-		dmac_cfg.dst_addr = dmac_cfg.src_addr;
-		dmac_cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-		dmac_cfg.dst_addr_width = dmac_cfg.src_addr_width;
-		dmac_cfg.src_maxburst = nfc->caps->dma_maxburst;
-		dmac_cfg.dst_maxburst = nfc->caps->dma_maxburst;
-		dmaengine_slave_config(nfc->dmac, &dmac_cfg);
+	ret = sunxi_nfc_dma_init(nfc, r);
 
-		if (nfc->caps->extra_mbus_conf)
-			writel(readl(nfc->regs + NFC_REG_CTL) |
-			       NFC_DMA_TYPE_NORMAL, nfc->regs + NFC_REG_CTL);
-	}
+	if (ret)
+		goto out_ahb_reset_reassert;
 
 	platform_set_drvdata(pdev, nfc);
 
@@ -2202,9 +2250,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
-	.extra_mbus_conf = true,
-	.reg_io_data = NFC_REG_A23_IO_DATA,
-	.dma_maxburst = 8,
+	.has_mdma = true,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.20.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
