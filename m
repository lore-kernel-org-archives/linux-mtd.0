Return-Path: <SRS0=9lEF=QI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3D32C282D8
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 07:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91B9F2084A
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Feb 2019 07:58:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9iGds7M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="afmZo3YG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91B9F2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kY4eDekGs/bE3PJcLVOifcXveW0jPpBOC5MshlSf3ZQ=; b=Y9iGds7MKM2xIy
	QFq+/xobBSlaEkERjKgla+KkXNStmwBCxIRx+tiwebATSXWvi0p5qAt+WwJqIZ94Gr9WH3FZQhbab
	TJ5NdeGPv+B28pgtQ4NYLjrBhlC9OQCNS0fwYDxQzxBw3c4kf6RaXj/Lzj1XN81LaHkk1flaj/hfl
	zI3Wb7Ow9ZXqySdF7X5SJl+EltC1tQlDRUQAzgZhim9Zdrj1t9P3GThC0oYqxdZS/77yrCOok4/p6
	WnghZYIRU+Az+RqW1aXaeTRJm3ZkI5kazJwLuV0APw9Ny7ro5keezlDLZ/8YWIk6poJbAQnvPg+80
	xeBZqX9Y+yJNhr8t7lyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gpTi8-0006Ae-VO; Fri, 01 Feb 2019 07:58:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gpThv-00060o-DL; Fri, 01 Feb 2019 07:57:52 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 089472084A;
 Fri,  1 Feb 2019 07:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1549007870;
 bh=mPW1kdJvdfWF8y1sFgd0mQFVOp3ErO00h4ymz2Z7ngI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=afmZo3YG5x42LIXPyg6Bm3iewdgEtE7goI9bXwIQwsV3K6N1ZexItakuNwT+Jz0a8
 QyACpsKz63wNVbrmy1SOxunh0feg3PF/B7DR6g1dvk55dZJ3N++8KTdXjvWUyMuWR1
 M5vWP2UyMPd6JboVkhANvPPQByydSBi8aN1Hiff8=
Date: Fri, 1 Feb 2019 08:57:39 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: <Tudor.Ambarus@microchip.com>
Subject: Re: [PATCH v2 10/10] spi: atmel-quadspi: add support for sam9x60
 qspi controller
Message-ID: <20190201085739.775add3f@bbrezillon>
In-Reply-To: <947f148d-3fd8-4e7d-4301-9d67715fbf7d@microchip.com>
References: <20190131161515.21605-1-tudor.ambarus@microchip.com>
 <20190131161515.21605-11-tudor.ambarus@microchip.com>
 <20190131173207.56481a42@bbrezillon>
 <947f148d-3fd8-4e7d-4301-9d67715fbf7d@microchip.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190131_235751_465820_4E5A52D8 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 Nicolas.Ferre@microchip.com, robh+dt@kernel.org, linux-spi@vger.kernel.org,
 Ludovic.Desroches@microchip.com, broonie@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 1 Feb 2019 07:07:40 +0000
<Tudor.Ambarus@microchip.com> wrote:

> >   
> >>  #define QSPI_IFR_TFRTYP_MASK            GENMASK(13, 12)
> >>  #define QSPI_IFR_TFRTYP_TRSFR_READ      (0 << 12)
> >>  #define QSPI_IFR_TFRTYP_TRSFR_READ_MEM  (1 << 12)  
> > 
> > Looks like the read/write flag is on bit 13. Can we just add  
> 
> for sama5d2 only

Feel free to prefix macros with the SoC name to make it clear:

#define QSPI_IFR_SAMA5D2_WRITE_TRSFR		BIT(13)

> 
> > 
> > #define QSPI_IFR_TFRTYP_TRSFR_WRITE	BIT(13)
> > 
> > and drop all others def? This way the implementation is consistent
> > between sam9x60 and sama5d2.  
> 
> BIT(13) has no meaning for sam9x60. I can drop the macros with zero value for
> sama5d2 in a separate patch.
> >   
> >> +#define QSPI_IFR_APBTFRTYP_READ		BIT(24)

And this one would be

define QSPI_IFR_SAM9X60_READ_TRSFR		BIT(24)

> >>  
> >>  /* Bitfields in QSPI_SMR (Scrambling Mode Register) */
> >>  #define QSPI_SMR_SCREN                  BIT(0)
> >> @@ -137,16 +144,37 @@
> >>  #define QSPI_WPSR_WPVSRC(src)           (((src) << 8) & QSPI_WPSR_WPVSRC)
> >>  
> >>  
> >> +/* Describes register values. */
> >> +struct atmel_qspi_cfg {
> >> +	u32 icr;
> >> +	u32 iar;
> >> +	u32 ifr;
> >> +};
> >> +
> >> +struct atmel_qspi_caps;
> >> +
> >>  struct atmel_qspi {
> >>  	void __iomem		*regs;
> >>  	void __iomem		*mem;
> >>  	struct clk		*clk;  
> > 
> > Can we rename that on pclk?  
> 
> will rename it, together with the support for unnamed clock of sama5d2 in a separate
> patch. The dt-bindings patch that imposes "pclk" for sama5d2 should be separated too.

Sounds good.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
