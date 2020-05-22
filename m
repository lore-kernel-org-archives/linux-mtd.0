Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17051C433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 20:30:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A69205CB
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 20:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FKxP03Pt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1A69205CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LrMTJUivB0HasVq+HeimkJDL9HPcR/vlbflNy7jiB8k=; b=FKxP03PtrX+QG0
	xGqR+yV/YETtGKMDQIudqPAu2k0ll8XZuLrM4lEPOQEcvthg2J+imJgdigT+sStmtioLTZem4Q+ae
	IHEDQYwKVw7RvfHS2t+Mh4vHGl0d6KgMo/4y0oW5FYkJ2dmVSEU8x9VI3r5E/LPrKEikNZjvn7VEA
	o7L/0xbGZL2855HQoJDLl0Wpa2plvUv+h1gEKLNLT9KbOik2Ar+PHGfG+BHrfN9UyOeW4hLLLpqQ+
	a7p8jMqt4LSBthQlVtKG1BRlWueO7RfcZAPBBzSQTIoOXSoc/463YV5VIrNdTwqFeU8yPHHpmb34P
	EOkvVWaGHmG3M6111RCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jcEJI-0008Gu-Qf; Fri, 22 May 2020 20:30:28 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jcEJ7-00087C-9Z; Fri, 22 May 2020 20:30:19 +0000
X-Originating-IP: 157.36.98.60
Received: from localhost (unknown [157.36.98.60])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 684321C0009;
 Fri, 22 May 2020 20:30:05 +0000 (UTC)
Date: Sat, 23 May 2020 02:00:02 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v7 02/20] spi: spi-mem: allow specifying a command's
 extension
Message-ID: <20200522203002.3bztaxrz7rxmbzgt@yadavpratyush.com>
References: <20200522101301.26909-1-p.yadav@ti.com>
 <20200522101301.26909-3-p.yadav@ti.com>
 <20200522173254.05316d47@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522173254.05316d47@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_133017_468938_B1F43259 
X-CRM114-Status: GOOD (  15.40  )
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sekhar Nori <nsekhar@ti.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mason Yang <masonccyang@mxic.com.tw>, Pratyush Yadav <p.yadav@ti.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 22/05/20 05:32PM, Boris Brezillon wrote:
> On Fri, 22 May 2020 15:42:43 +0530
> Pratyush Yadav <p.yadav@ti.com> wrote:
> 
> > In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
> > the "command extension". There can be 3 types of extensions in xSPI:
> > repeat, invert, and hex. When the extension type is "repeat", the same
> > opcode is sent twice. When it is "invert", the second byte is the
> > inverse of the opcode. When it is "hex" an additional opcode byte based
> > is sent with the command whose value can be anything.
> > 
> > So, make opcode a 16-bit value and add a 'nbytes', similar to how
> > multiple address widths are handled.
> 
> A slightly different version of patch 5 should go before this patch,
> otherwise your series is not bisectable. By slightly different, I mean
> that you should only write one byte, but put this byte in a temporary
> var. Or maybe you can squash patch 5 in this one and mention why you do
> so in your commit message.

How about the patch below before this patch? The supports_op() will 
reject multi-byte opcodes anyway, so we only care about single-byte 
opcodes for now. Multi-byte opcodes can be patched and tested later. 
This avoids squashing changes in this patch and having the changes split 
over two patches; one before and one after.

-- 8< --
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 69491f3a515d..4e4292f0ee1d 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	int nio = 1, i, ret;
 	u32 ss_ctrl;
 	u8 addr[8];
+	u8 opcode = op->cmd.opcode & 0xff;
 
 	ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
 	if (ret)
@@ -393,7 +394,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
 	       mxic->regs + HC_CFG);
 
-	ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
+	ret = mxic_spi_data_xfer(mxic, &opcode, NULL, 1);
 	if (ret)
 		goto out;
 
-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
