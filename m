Return-Path: <SRS0=zMDb=SA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94BA4C43381
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 08:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633D9206B6
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2019 08:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kt2I02mO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 633D9206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq4p5OQ6goA+W02Whas7tzu4x9SHotjCNcLxuZu/BIc=; b=Kt2I02mODiGXMX
	jSopcfy2a7aDsG0jtYx4CHZ0YsfgBRci0749hdJaj2ErBwy+hXvye0CydLmdOkLNFCm0T1zXVihmt
	C3t+spZE6CKbPY3PLW2sWAdeeUBuUBmO7PR70R5eoE0kLRDM5VfG0P1xiZTzsa8hJ2m3ne/i3cZ+U
	CMT3wmV+rHhI7IOiSLXwxev9Ay/kKy3/8Bpt6oBr34YgfJjyZ9KAe2+3ZZ+yglnbv31ZAep+v21uO
	6HxWUY8/sD4SGT7pTrGdWxoeWn09QJI/YVudUmHYesRBbjt6veeOHkhtUCfMb4atXLKu4IdT26Abm
	u9Tt2K14/j5FrURcmpnw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9nGH-0004XU-K8; Fri, 29 Mar 2019 08:53:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9nGE-0004X0-GX
 for linux-mtd@lists.infradead.org; Fri, 29 Mar 2019 08:53:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 25C6C27D87F;
 Fri, 29 Mar 2019 08:53:11 +0000 (GMT)
Date: Fri, 29 Mar 2019 09:53:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [LINUX PATCH 2/3] spi: spi-mem: call
 spi_mem_default_supports_op() first
Message-ID: <20190329095307.02d970fd@collabora.com>
In-Reply-To: <d21f7363-eeea-830e-b9b8-ef5bb9e1261b@ti.com>
References: <1553771784-3364-1-git-send-email-naga.sureshkumar.relli@xilinx.com>
 <20190328205522.272e1da6@collabora.com>
 <d21f7363-eeea-830e-b9b8-ef5bb9e1261b@ti.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_015314_682043_24848D4A 
X-CRM114-Status: GOOD (  17.90  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "nagasuresh12@gmail.com" <nagasuresh12@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "michal.simek@xilinx.com" <michal.simek@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 29 Mar 2019 13:50:26 +0530
Vignesh Raghavendra <vigneshr@ti.com> wrote:

> Hi Boris,
> 
> On 29/03/19 1:25 AM, Boris Brezillon wrote:
> > On Thu, 28 Mar 2019 16:46:24 +0530
> > Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com> wrote:
> >   
> >> Call spi_mem_default_supports_op() first, before calling controller
> >> specific ctlr->supports_op().
> >> With this, controller drivers can drop checking the buswidths again.  
> > 
> > No, this was done on purpose, in case the controller does not want the
> > default check to be applied (say it does not need bus-width props to
> > be defined and has another way to check if a device can be accessed in
> > dual, quad or octal mode).  
> 
> Sorry, I don't understand here.
> Based on capabilities declared in spi_device->mode, m25p80 driver will
> claim appropriate  SNOR_HWCAPS_*.  SPI NOR layer chooses opcodes based
> on that for which m25p80 layer populates buswidths.

Well, that test in m25p80 should go away and be replaced by a proper
spi_mem_supports_op() iteration on all modes reported as supported by
the *chip* (I think that's what I did in my series merging m25p80 code
into the spi-nor core). But that's not really related to the problem
we're discussing here.

> 
> So, I don't really expect any mismatch in spi_mem_default_supports_op()
> in the case you mentioned. Or did I miss something? Maybe something SPI
> NAND specific?

Nothing NAND specific, just something controller specific and how we
want to deal with buswidth detection. Most memory devices expose their
caps in some way (be it ID-based detection or using some kind of
caps/parameters table), so they know what they're capable of. SPI
controllers know what they're capable of, of course. The only part that
remains unknown for buswidth negotiation is how things are wired on the
board. I keep thinking that defining buswidth in the DT (using
spi-{tx,rx}-bus-width) should only be done if there are board-related
limiting factors (some IO pins not routed).
If you look at the code, SPI_{TX,RX}_{DUAL,QUAD,OCTAL} flags are only
set if the spi-{tx,rx}-bus-width props are defined.

The idea behind making spi_mem_default_supports_op() optional is to let
new drivers implement a new scheme where missing
spi-{tx,rx}-bus-width does not necessarily mean "use regular SPI mode".

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
