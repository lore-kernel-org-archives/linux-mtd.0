Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32266C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:30:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD8C620B1F
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 18:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AFZOs8MG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD8C620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=86tKBEgedSfFagwa8EfOKSCSR9bR6+G2w2IXCrq6Jf0=; b=AFZOs8MGrN33hj
	TAdkXtPEl28FOoQmTvE0pudStIiek9eJjiIvO4xHchYavD/XzvdZG8hCLsl+VzK/Nh75XFUrgneKD
	BLX/Cgqm9gxe8PBit1BgIeeWCanduq7H67NKjG3SMSYWUp6oNfuAaUHOCJrnHPZwttIEM9jX0cbWY
	EGvjBj7njr6QSP9NEX5miaJLAoiRcr+7vFMiaAz9DXQRHe9f/fmFucyU3nQTWyj6rKLN5pad9wMY+
	E5mORox6ksavAXORJCjCVbOqpk0Hb7C4kpkaa2RPIXRdfiUNDBfwr9h9W7SNkZ0I2esRNjuMmcZ5t
	iPBnXwz7/5lfUc6sSYTA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8W9-0003Mf-VA; Mon, 27 Apr 2020 18:30:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8W5-0002HX-Na
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 18:30:07 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E82952A0D29;
 Mon, 27 Apr 2020 19:30:03 +0100 (BST)
Date: Mon, 27 Apr 2020 20:30:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200427203001.1d583322@collabora.com>
In-Reply-To: <20200427173846.3866c506@xps13>
References: <20200417082147.43384-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200417082147.43384-3-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200418105533.477ce529@collabora.com>
 <20200427173846.3866c506@xps13>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_113005_932611_C5606539 
X-CRM114-Status: GOOD (  19.96  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org,
 andriy.shevchenko@intel.com, anders.roxell@linaro.org, vigneshr@ti.com,
 arnd@arndb.de, hauke.mehrtens@intel.com, richard@nod.at, qi-ming.wu@intel.com,
 brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, "Ramuthevar,
 Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>,
 robh+dt@kernel.org, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 masonccyang@mxic.com.tw, piotrs@cadence.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 27 Apr 2020 17:38:46 +0200
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@collabora.com> wrote on Sat, 18 Apr
> 2020 10:55:33 +0200:
> 
> > On Fri, 17 Apr 2020 16:21:47 +0800
> > "Ramuthevar,Vadivel MuruganX"
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> >   
> > > From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > > 
> > > This patch adds the new IP of Nand Flash Controller(NFC) support
> > > on Intel's Lightning Mountain(LGM) SoC.
> > > 
> > > DMA is used for burst data transfer operation, also DMA HW supports
> > > aligned 32bit memory address and aligned data access by default.
> > > DMA burst of 8 supported. Data register used to support the read/write
> > > operation from/to device.
> > > 
> > > NAND controller driver implements ->exec_op() to replace legacy hooks,
> > > these specific call-back method to execute NAND operations.
> > > 
> > > Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
> > > ---
> > >  drivers/mtd/nand/raw/Kconfig          |   7 +
> > >  drivers/mtd/nand/raw/Makefile         |   1 +
> > >  drivers/mtd/nand/raw/intel_lgm_nand.c | 740 ++++++++++++++++++++++++++++++++++    
> > 
> > I wonder if we shouldn't name the driver infineon-nand-controller.c
> > since the original design comes from Infineon IIUC. intel_lgm_nand.c is
> > definitely misleading, as we also have a nand_intel.c file which is for
> > Intel NAND chips (not NAND controllers). If we keep intel in the name,
> > let's at least add a "-controller" suffix to make it clear.
> > 
> > Side note for Miquel: I guess we would also benefit from having a clear
> > core vs controller-drivers split as recently done for spi-nor (a
> > controller subdir has been created).  
> 
> I would even like a core vs controller drivers vs nand chips drivers.
> 
> Macronix for instance has a NAND controller driver and a NAND chip
> driver, that's why, even if it is a bit long, I enforce the -nfc or
> -nand-controller (my favorite) suffix now.

Maybe we can make it happen. I mean, moving drivers to a sub-dir is
pretty easy ;).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
