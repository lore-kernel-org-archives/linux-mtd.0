Return-Path: <SRS0=PxVx=PH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD80EC4332F
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 05:54:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559FF6115A
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Oct 2021 05:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559FF6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cp16ri23GKsaLPVfaO79IHir2Qs5zLcClmRDmtiKDK4=; b=SLWNIbCA9ZDZwA
	0Gap3cH6OsaE5gtlK5x3wZO4Vw0HUWHTxrBpiBeht/RMDIEQ+8fYNsjf/ZrRBKa9vYhAGl+rYmi9w
	1PqnWFNEazADodKjBUZiY+wunRZxJ/YcrXjR31EjA3wap3B4dpPaqiGn3/GrCW0939nh6iDEu6kRV
	JD9FFPhtjgJijO8jqRpHS4+p5ghHCOlIzVNoCuVu+rRhFhSUuhG7tOxRBYemOW0aVRVGPkkG/I5N9
	hE7rnIidZBliOOQO7KJV6lMZ/sBCuflES1PaRKkz1WyBrVHv6vyaoJKDV11uPJBreW5kn+W3ZQObr
	Y80ed0WH1WVABtDe+pIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mci3m-000Cdq-Rn; Tue, 19 Oct 2021 05:53:14 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mci3j-000Cct-WC
 for linux-mtd@lists.infradead.org; Tue, 19 Oct 2021 05:53:13 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5354768AFE; Tue, 19 Oct 2021 07:53:09 +0200 (CEST)
Date: Tue, 19 Oct 2021 07:53:09 +0200
From: hch <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: hch <hch@lst.de>, joern@lazybastard.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] mtd/block2mtd: don't poke into block layer internals
Message-ID: <20211019055309.GA20805@lst.de>
References: <20211014145206.1488967-1-hch@lst.de>
 <20211014145206.1488967-2-hch@lst.de>
 <1862961222.73085.1634239699925.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1862961222.73085.1634239699925.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_225312_208754_A19D3C62 
X-CRM114-Status: GOOD (  15.89  )
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

On Thu, Oct 14, 2021 at 09:28:19PM +0200, Richard Weinberger wrote:
> > instead.  Note that this contains a small behavior change in that erase
> > now unconditionally writes all Fs instead of first scanning for them.
> 
> Unless you have a strong opinoin I'd like to keep the scanning.
> The original use case of block2mtd is using Compact Flash (ATA)
> as MTD. Some of this devices are super stupid and I fear the 0xFF scanning
> is here to avoid programming 0xFF bytes into the NAND.
> Just to be on the safe side...

I played with keeping the scanning, but it really is a mess.  Shouldn't
the higher layers (ubi, jffs2, etc) know what has already been erased?

Btw, Joerns address bounces.  Does anyone knw if he still wants to
maintain block2mtd and has a new address or if he should be removed from
the maintainers list?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
