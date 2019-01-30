Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C709C282D5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:10:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C5012087F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 09:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dIKLGZDU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDE1W+dc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C5012087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1tKeowedyoun2RsqqxRoNmWIqwk1TiDqpnjNJvkNAA=; b=dIKLGZDU+wSN2I
	gMEOSlo40qfCTBFuiE5mgB4J4FerB5/pyVyVE3Y8hBvOsP0JIIfrGisqQUPDDPkfaCpEsd2J2/Oqq
	25whDk993VzqFQbKxijcAEWSXRuaKx2k6xKrqcXW/B61h3Tu+BJSTWCHImUcLxOxkb/jU6QVGeRFw
	GWObfUDP4gaGa6ojs4HXCy0h/TqoBdNI2QpEloepH8dw8N0OpoybHHTrNo71VdnC/jy4INUNxQ3J6
	4jajoq0nL+hiQmA3RKnCIXYCRgsCCON728dA8BCaE7brEMjtyfHe1Ddw3P6+tcXXo4B7N+opgV4KY
	uK2B+wJVimvFF0oDSsCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goltR-0000Ib-HX; Wed, 30 Jan 2019 09:10:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goltO-0000IE-5w
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 09:10:47 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D16B62087F;
 Wed, 30 Jan 2019 09:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548839445;
 bh=1bj9/u2m91RmQmM4zuRcui/oq2j0vKxKoHFon4qyqXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WDE1W+dcCpNbpSMD7iQ5YJGnlKWypZIniHf5lb+scmsaav8cFxdiwwQaKcX0DXZw6
 YVBmnHcC/CwUJyHQvOYuNVRyLOiPrMjnW0hM4KfaEF/La74JeY/9w3Y6eU2MnkLFSM
 snWV5snIIGm4hR3fUcmrV0TfvcXHZQO1dxrx7bZo=
Date: Wed, 30 Jan 2019 10:10:36 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Message-ID: <20190130101036.0e63fec6@bbrezillon>
In-Reply-To: <CAMuHMdUgcgayOo=bhEZsuWMcRavjsweFPo1=KmcGa=PYxEoRNQ@mail.gmail.com>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon>
 <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
 <20190130095237.1a6a598f@bbrezillon>
 <CAMuHMdUgcgayOo=bhEZsuWMcRavjsweFPo1=KmcGa=PYxEoRNQ@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_011046_259556_C4DBA77D 
X-CRM114-Status: GOOD (  30.24  )
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
 Boris Brezillon <boris.brezillon@bootlin.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 30 Jan 2019 10:05:29 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Wed, Jan 30, 2019 at 9:52 AM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > On Tue, 29 Jan 2019 16:29:55 +0100
> > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > On Tue, Jan 29, 2019 at 12:03 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > On Tue, 22 Jan 2019 13:31:59 +0100
> > > > Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > > On Tue, 22 Jan 2019 12:21:11 +0100
> > > > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > > > > On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > > > > add_mtd_device() can fail. We should always check its return value
> > > > > > > and gracefully handle the failure case. Fix the call sites where this
> > > > > > > not done (in mtdpart.c) and add a __must_check attribute to the
> > > > > > > prototype to avoid this kind of mistakes.
> > > > > > >
> > > > > > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > > > > > > ---
> > > > > > > No Fixes or Cc-stable tag here, as this seems to have worked just fine
> > > > > > > without checking add_mtd_device() ret code until we started to expose
> > > > > > > MTD devices as NVMEM providers (queued for 4.21).  
> > > > > >
> > > > > > Oh yes ;-)
> > > > > >
> > > > > > https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/
> > > > > >
> > > > > > Your patch is very similar to mine, so the crash is gone.  
> > > > >
> > > > > Oops, sorry about that. I completely forgot about this patch. It seems
> > > > > the discussion led to a different conclusion though (patch
> > > > > allocate_partitions() to reject wrong parts early) and the v2 was never
> > > > > sent (or I missed it). Anyway, I guess we should have done both (check
> > > > > add_mtd_device() ret code everywhere and patch allocate_partitions() to
> > > > > reject bad parts early).
> > > > >  
> > > > > > However, the warning is still there:
> > > > > >
> > > > > >     m25p80 spi0.0: s25sl032p (4096 Kbytes)
> > > > > >     3 fixed-partitions partitions found on MTD device spi0.0
> > > > > >     Creating 3 MTD partitions on "spi0.0":
> > > > > >     0x000000000000-0x000000080000 : "loader"
> > > > > >     0x000000080000-0x000000600000 : "user"
> > > > > >     mtd: partition "user" extends beyond the end of device "spi0.0" --
> > > > > > size truncated to 0x380000
> > > > > >     0x000000600000-0x000004000000 : "flash"
> > > > > >     mtd: partition "flash" is out of reach -- disabled
> > > > > >     ------------[ cut here ]------------
> > > > > >     WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
> > > > > > add_mtd_device+0x90/0x3b0
> > > > > >
> > > > > > Interestingly, only one partition is created, covering the full size of the
> > > > > > device:
> > > > > >
> > > > > >     # cat /proc/partitions
> > > > > >     major minor  #blocks  name
> > > > > >
> > > > > >       31        0       4096 mtdblock0
> > > > > >
> > > > > > While I would expect two partitions, "loader" and truncated "user":
> > > > > >
> > > > > >       31        0        512 mtdblock0
> > > > > >       31        1       3584 mtdblock1  
> > > > >
> > > > > Yes, makes sense, I guess your patch was better than mine :-/. Can you
> > > > > try with the following diff applied and let me know if it solves the
> > > > > problem?  
> > > >
> > > > Gentle ping: is this diff fixing your problem, and do you want me to
> > > > send a proper patch for it or should I let you send one?  
> > >
> > > Yes, the diff below fixes the partitions for me, so
> > > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Note that the warning is still there, but that's probably OK.  
> >
> > You mean the pr_warn() or the WARN_ON() backtrace? The former is
> > expected not the latter.  
> 
> The WARN_ON() backtrace is still there.

I don't see a WARN_ON() at drivers/mtd/mtdcore.c:571. Which branch are
you using for your tests?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
