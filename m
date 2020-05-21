Return-Path: <SRS0=CeWw=7D=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF61BC433E1
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 20:17:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92C74207D3
	for <linux-mtd@archiver.kernel.org>; Thu, 21 May 2020 20:17:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PesgkfUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 92C74207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYStVTEAIzz/PVaWJskRkklVSOR/oYct+i2yzlAdIM8=; b=PesgkfUdEBe3cE
	gLceRTuuGr6yqHCniJ6HZgi/SErwG1k20WHixbhaX7WwhVEjvnlk7YutSikml5Fr//EwKgxbHHrNz
	ubEqL2ndrCxBHLI7tPPb0fjXJ5nBgk17Kl2W8vlOF+B1LjjYTjNd2pPYmDnQWXiToxI44EUQRIH+F
	Fy5U7s7K/g8dBw43jv6Z+G6cKmpJUJ8c7AeuSNkTbBxmS3Yrp7oiVcD6TKsO7ObhDYHamfgdyWZap
	RdcFDwnkSJp9PvMlSgKL6XKgv5JRSu4DYzfRWO8QN6zQeaVke8jVizO6ptQLhHis8t0NbTKTP2C0e
	g8Ez53fQprB480c9whqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbrcz-0000BO-Sy; Thu, 21 May 2020 20:17:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbrcm-0008Ra-Dp; Thu, 21 May 2020 20:17:06 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D0AD82A0667;
 Thu, 21 May 2020 21:17:01 +0100 (BST)
Date: Thu, 21 May 2020 22:16:58 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH v6 04/19] spi: spi-mem: allow specifying a command's
 extension
Message-ID: <20200521221658.037b802b@collabora.com>
In-Reply-To: <20200521200313.bnil6a4u3dhiizr4@ti.com>
References: <20200520163053.24357-1-p.yadav@ti.com>
 <20200520163053.24357-5-p.yadav@ti.com>
 <20200521202256.5816eb32@collabora.com>
 <20200521194129.3lqdormmcs4zadh2@ti.com>
 <20200521200313.bnil6a4u3dhiizr4@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_131704_601700_2B3FF85A 
X-CRM114-Status: GOOD (  25.32  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mason Yang <masonccyang@mxic.com.tw>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 22 May 2020 01:33:15 +0530
Pratyush Yadav <p.yadav@ti.com> wrote:

> On 22/05/20 01:11AM, Pratyush Yadav wrote:
> > On 21/05/20 08:22PM, Boris Brezillon wrote:  
> > > On Wed, 20 May 2020 22:00:38 +0530
> > > Pratyush Yadav <p.yadav@ti.com> wrote:
> > >   
> > > > In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> > > > the "command extension". There can be 3 types of extensions in xSPI:
> > > > repeat, invert, and hex. When the extension type is "repeat", the same
> > > > opcode is sent twice. When it is "invert", the second byte is the
> > > > inverse of the opcode. When it is "hex" an additional opcode byte based
> > > > is sent with the command whose value can be anything.
> > > > 
> > > > So, make opcode a 16-bit value and add a 'nbytes', similar to how
> > > > multiple address widths are handled.
> > > > 
> > > > Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> > > > ---
> > > >  include/linux/spi/spi-mem.h | 5 ++++-
> > > >  1 file changed, 4 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
> > > > index e3dcb956bf61..731bb64c6ba6 100644
> > > > --- a/include/linux/spi/spi-mem.h
> > > > +++ b/include/linux/spi/spi-mem.h
> > > > @@ -69,6 +69,8 @@ enum spi_mem_data_dir {
> > > >  
> > > >  /**
> > > >   * struct spi_mem_op - describes a SPI memory operation
> > > > + * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
> > > > + *		sent MSB-first.
> > > >   * @cmd.buswidth: number of IO lines used to transmit the command
> > > >   * @cmd.opcode: operation opcode
> > > >   * @cmd.dtr: whether the command opcode should be sent in DTR mode or not
> > > > @@ -94,9 +96,10 @@ enum spi_mem_data_dir {
> > > >   */
> > > >  struct spi_mem_op {
> > > >  	struct {
> > > > +		u8 nbytes;
> > > >  		u8 buswidth;
> > > >  		u8 dtr : 1;
> > > > -		u8 opcode;
> > > > +		u16 opcode;
> > > >  	} cmd;
> > > >  
> > > >  	struct {  
> > > 
> > > As mentioned in one of my previous review, you should patch the mxic
> > > driver before extending the opcode field:  
> > 
> > IIUC, this patchset doesn't break original functionality of the driver. 
> > It will work like before with 1-byte opcodes. So I don't think it is the 
> > responsibility of this patchset to enhance the driver. It didn't work 
> > before with 2-byte opcodes, it won't work now. IMO this should be a 
> > separate, independent change.  
> 
> Scratch that. Big/little endian issue. If you'd drop your Signed-off-by, 
> I'll write the commit message and patch it in.

Just add a Suggested-by, that should be fine.

>   
> > > --->8---  
> > > diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
> > > index 69491f3a515d..c3f4136a7c1d 100644
> > > --- a/drivers/spi/spi-mxic.c
> > > +++ b/drivers/spi/spi-mxic.c
> > > @@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> > >         int nio = 1, i, ret;
> > >         u32 ss_ctrl;
> > >         u8 addr[8];
> > > +       u8 cmd[2];
> > >  
> > >         ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
> > >         if (ret)
> > > @@ -393,7 +394,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
> > >         writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
> > >                mxic->regs + HC_CFG);
> > >  
> > > -       ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
> > > +       for (i = 0; i < op->cmd.nbytes; i++)
> > > +               cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
> > > +
> > > +       ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
> > >         if (ret)
> > >                 goto out;
> > >    
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
