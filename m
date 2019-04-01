Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FD03C43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 13:28:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0462070D
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 13:28:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dWsvRfV8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0462070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKx01hF9iH5LMWi0t03nQ3BEyLbj8j2pO8Iimbfm20o=; b=dWsvRfV8WUr73w
	fp/5pwVxopECZ1HzIX4GZaLbU6IC1fVONF46Be9GHiB3DnwzoJnyU+XXK4m+G7XGtsg6TI2FUREyr
	dUqzAI107WDCHQFTUNu6wB/UiwPmkuIjjKAlUdEg8+aB61qtIRRjRBwfYP4JFXl4FihuANWYNoo+i
	EdjlPE+SbE/93U/LYN+jaXm1f0ZLQnhEv98h6vlgjazAsR8gzC5HY17bIGyI1ZPktZ8wZu1mSfve+
	cS5O3HcNeOqUDTGSae+zVmAYczDD95hbC0x/ZzTKqDZnEiIXUMKksO7Y3aZzHbIXwZPL6UqrYRGFt
	IyNAW3xAsGHVdqhSPa6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAwyo-0007bP-Og; Mon, 01 Apr 2019 13:28:02 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAwyk-0007al-Tm
 for linux-mtd@lists.infradead.org; Mon, 01 Apr 2019 13:28:00 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 6E0D8281F80;
 Mon,  1 Apr 2019 14:27:55 +0100 (BST)
Date: Mon, 1 Apr 2019 15:27:51 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Message-ID: <20190401152751.65058bac@collabora.com>
In-Reply-To: <CAMuHMdVBmDErw=2rn6=6p=6Spb++To63QeTaYdMw5RW4iYxD3Q@mail.gmail.com>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon>
 <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
 <CAMuHMdVBmDErw=2rn6=6p=6Spb++To63QeTaYdMw5RW4iYxD3Q@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_062759_226053_EBEDFD7D 
X-CRM114-Status: GOOD (  29.94  )
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
Cc: Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 1 Apr 2019 11:50:01 +0200
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Tue, Jan 29, 2019 at 4:29 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Jan 29, 2019 at 12:03 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > On Tue, 22 Jan 2019 13:31:59 +0100
> > > Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > On Tue, 22 Jan 2019 12:21:11 +0100
> > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > > > On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > > > add_mtd_device() can fail. We should always check its return value
> > > > > > and gracefully handle the failure case. Fix the call sites where this
> > > > > > not done (in mtdpart.c) and add a __must_check attribute to the
> > > > > > prototype to avoid this kind of mistakes.
> > > > > >
> > > > > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > > > > > ---
> > > > > > No Fixes or Cc-stable tag here, as this seems to have worked just fine
> > > > > > without checking add_mtd_device() ret code until we started to expose
> > > > > > MTD devices as NVMEM providers (queued for 4.21).  
> > > > >
> > > > > Oh yes ;-)
> > > > >
> > > > > https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/
> > > > >
> > > > > Your patch is very similar to mine, so the crash is gone.  
> > > >
> > > > Oops, sorry about that. I completely forgot about this patch. It seems
> > > > the discussion led to a different conclusion though (patch
> > > > allocate_partitions() to reject wrong parts early) and the v2 was never
> > > > sent (or I missed it). Anyway, I guess we should have done both (check
> > > > add_mtd_device() ret code everywhere and patch allocate_partitions() to
> > > > reject bad parts early).
> > > >  
> > > > > However, the warning is still there:
> > > > >
> > > > >     m25p80 spi0.0: s25sl032p (4096 Kbytes)
> > > > >     3 fixed-partitions partitions found on MTD device spi0.0
> > > > >     Creating 3 MTD partitions on "spi0.0":
> > > > >     0x000000000000-0x000000080000 : "loader"
> > > > >     0x000000080000-0x000000600000 : "user"
> > > > >     mtd: partition "user" extends beyond the end of device "spi0.0" --
> > > > > size truncated to 0x380000
> > > > >     0x000000600000-0x000004000000 : "flash"
> > > > >     mtd: partition "flash" is out of reach -- disabled
> > > > >     ------------[ cut here ]------------
> > > > >     WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
> > > > > add_mtd_device+0x90/0x3b0
> > > > >
> > > > > Interestingly, only one partition is created, covering the full size of the
> > > > > device:
> > > > >
> > > > >     # cat /proc/partitions
> > > > >     major minor  #blocks  name
> > > > >
> > > > >       31        0       4096 mtdblock0
> > > > >
> > > > > While I would expect two partitions, "loader" and truncated "user":
> > > > >
> > > > >       31        0        512 mtdblock0
> > > > >       31        1       3584 mtdblock1  
> > > >
> > > > Yes, makes sense, I guess your patch was better than mine :-/. Can you
> > > > try with the following diff applied and let me know if it solves the
> > > > problem?  
> > >
> > > Gentle ping: is this diff fixing your problem, and do you want me to
> > > send a proper patch for it or should I let you send one?  
> >
> > Yes, the diff below fixes the partitions for me, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Note that the warning is still there, but that's probably OK.  
> 
> Given the warning was fixed by commit ad4635153034c20c ("mtd: Make sure
> mtd->erasesize is valid even if the partition is of size 0"), do you have any
> plans to apply the below?

Is it still needed now that the only case we care about has been fixed?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
