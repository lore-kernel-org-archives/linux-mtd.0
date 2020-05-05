Return-Path: <SRS0=lVZn=6T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A01C47247
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D9C206CC
	for <linux-mtd@archiver.kernel.org>; Tue,  5 May 2020 10:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="htrwxl5C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D9C206CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fBrPPKitkTNCBFOx2pqJvq/JNxEF2b5Y4FmXOB4wHU=; b=htrwxl5CHv91Vj
	R4j2+zmCiWAF5iV2x0qrcn3ui3Zpa9gH1r19NJskDld5rQs2QYGcLXrmyu4uKXrlKu1+1I7zaLnwl
	jpcT+QLDCO3KNg5qTRRLi7w7yGwt/chzZHWHsXAwL3L2Ik0OlLvukerp9w1lznU9Blt5ZaYARoFXF
	EDezsUgUaKt8WaEf4XymCHnZSrXNwTHc5KIdBTQJ8n6QFD7busZyUP/sCz8bL/fUPnp0cg7YbGvfK
	m+K+/izFvIp1Ju4rJuiDHhjb490CpnGAMIOK9v8ybMJ/R5YWFGIgQ4V45gGYZKsw+5iyTh89th4jw
	I5s0oArtpxfkznNiIVnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVuOL-0006AO-23; Tue, 05 May 2020 10:01:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVuOH-00065S-8O
 for linux-mtd@lists.infradead.org; Tue, 05 May 2020 10:01:30 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:d3ea:1c7:41fd:3038])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id B203B2A0982;
 Tue,  5 May 2020 11:01:26 +0100 (BST)
Date: Tue, 5 May 2020 12:01:23 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200505120123.24962338@collabora.com>
In-Reply-To: <20200505114443.6ebd5d3c@collabora.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
 <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
 <OF18214CA5.6A9B2B30-ON48258558.001D894C-48258558.002249E0@mxic.com.tw>
 <20200428085401.574wmo6qddmumd7q@yadavpratyush.com>
 <OF04289CE2.B346916F-ON48258559.002280BD-48258559.00295800@mxic.com.tw>
 <20200429181856.kkavelcczylg4yxf@yadavpratyush.com>
 <OF28AE0642.4F34D6BB-ON4825855F.002D6E58-4825855F.003458C9@mxic.com.tw>
 <20200505114443.6ebd5d3c@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_030129_568354_ACC66185 
X-CRM114-Status: GOOD (  27.86  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, Pratyush Yadav <me@yadavpratyush.com>,
 linux-kernel@vger.kernel.org, broonie@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 5 May 2020 11:44:43 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Tue, 5 May 2020 17:31:45 +0800
> masonccyang@mxic.com.tw wrote:
> 
> 
> > > > > > I quickly went through your patches but can't reply them in each     
> > your   
> > > > > > patches.
> > > > > > 
> > > > > > i.e,.
> > > > > > 1) [v4,03/16] spi: spi-mem: allow specifying a command's extension
> > > > > > 
> > > > > > -                                u8 opcode;
> > > > > > +                                u16 opcode;
> > > > > > 
> > > > > > big/little Endian issue, right? 
> > > > > > why not just u8 ext_opcode;
> > > > > > No any impact for exist code and actually only xSPI device use     
> > > > extension     
> > > > > > command.    
> > > > > 
> > > > > Boris already explained the reasoning behind it.    
> > > > 
> > > > yup, I got his point and please make sure CPU data access.
> > > > 
> > > > i.e,.
> > > > Fix endianness of the BFPT DWORDs and xSPI in sfdp.c
> > > > 
> > > > and your patch,
> > > > +                                ext = spi_nor_get_cmd_ext(nor, op);
> > > > +                                op->cmd.opcode = (op->cmd.opcode <<     
> > 8) |   
> > > > ext;
> > > > +                                op->cmd.nbytes = 2;
> > > > 
> > > > I think maybe using u8 opcode[2] could avoid endianness.    
> > > 
> > > Again, thanks Boris for answering this. FWIW, I don't see anything wrong     
> >   
> > > with his suggestion.
> > > 
> > > To clarify a bit more, the idea is that we transmit the opcode MSB 
> > > first, just we do for the address. Assume we want to issue the command 
> > > 0x05. In 1S mode, we set cmd.opcode to 0x05. Here cmd.nbytes == 1. Treat     
> >   
> > > is as a 1-byte value, so the MSB is the same as the LSB. We directly 
> > > send 0x5 on the bus.    
> > 
> > There are many SPI controllers driver use "op->cmd.opcode" directly,
> > so is spi-mxic.c.
> > 
> > i.e,.
> > ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, op->cmd.nbytes);  
> 
> Just because you do it doesn't mean it's right. And most controllers use
> the opcode value, they don't dereference the pointer as you do here.
> 
> >   
> > > 
> > > If cmd.nbytes == 2, then the opcode would be 0x05FA (assuming extension 
> > > is invert of command). So we send the MSB (0x05) first, and LSB (0xFA) 
> > > next.    
> > 
> > My platform is Xilinx Zynq platform which CPU is ARMv7 processor.
> > 
> > In 1-1-1 mode, it's OK to send 1 byte command by u16 opcode but
> > in 8D-8D-8D mode, I need to patch
> > 
> > i.e.,
> > op->cmd.opcode = op->cmd.opcode | (ext << 8);
> > 
> > rather than your patch.  
> 
> Seriously, how hard is it to extract each byte from the u16 if your
> controller needs to pass things in a different order? I mean, that's
> already how it's done for the address cycle, so why is it a problem
> here? This sounds like bikeshedding to me. If the order is properly
> documented in the kernel doc, I see no problem having it grouped in one
> u16, with the first cmd cycle placed in the MSB and the second one in
> the LSB.

So, I gave it a try, and we're talking about something as simple as the
below diff. And yes, the mxic controller needs to be patched before
extending the cmd.opcode field, but we're talking about one driver here
(all other drivers should be fine). Oh, and if you look a few lines below
the changed lines, you'll notice that we do exactly the same for the
address.

--->8---
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 69491f3a515d..c3f4136a7c1d 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -356,6 +356,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
        int nio = 1, i, ret;
        u32 ss_ctrl;
        u8 addr[8];
+       u8 cmd[2];
 
        ret = mxic_spi_set_freq(mxic, mem->spi->max_speed_hz);
        if (ret)
@@ -393,7 +394,10 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
        writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_ASSERT,
               mxic->regs + HC_CFG);
 
-       ret = mxic_spi_data_xfer(mxic, &op->cmd.opcode, NULL, 1);
+       for (i = 0; i < op->cmd.nbytes; i++)
+               cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
+
+       ret = mxic_spi_data_xfer(mxic, cmd, NULL, op->cmd.nbytes);
        if (ret)
                goto out;
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
