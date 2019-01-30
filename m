Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0978DC282D5
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:55:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74F621473
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jan 2019 08:55:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cSJiS2wL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhqNCv38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74F621473
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gvxn1t4pjkVpks+/g6ybk6lYLxyJTWRDUpQVnd5ydGk=; b=cSJiS2wLNrNUCz
	rs5X5NsVoSIfwtJnqm2sPphTJAH7yNYHe3qW65Tk4PCJP1e4gO4nqxDATmHM6jpcnMYtZdMMjvI3B
	3A8dyznPSAh+sLNOLTqE3XVkDTNPMjevtuAKNlBKOqaMN2Hl1Ky3a9hkp4LLjV0NXAWwWoXOrz0iq
	r/KDA61D3jOvV/mNTsmJPjhO/MyIGXvrHk5WKdikyh1dNeu19VNRhP0IEz5ovUWbGEdtW7T4Mi4lM
	FhRg88zfq4P/FXmeuTUpD16P5VhthSX1LIqUMHlsaXUAkesDcLdFhdDMLcfJL38Dwuf2/zoH3QH6Y
	6qIeR833JdIQ34LM78yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1golep-00029O-6j; Wed, 30 Jan 2019 08:55:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1golem-000294-0p
 for linux-mtd@lists.infradead.org; Wed, 30 Jan 2019 08:55:41 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D6DB921473;
 Wed, 30 Jan 2019 08:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548838539;
 bh=uyU0ky0OFcK2Qah7tKtByn0ET5zVB4HXUo054UqNosE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WhqNCv38gQkMXOK82ZREzxZpg4639b1DMOhdEhuKB+ZUiYriAvus6X2kQIzqEkVll
 ahqwQbVilCR80SfKG0Ne7I0iFukWvAL8JmHZPxIThHAM7SBvuWq4Ruh4VGZXPFTZ7P
 iPaGHWvbl6Oh7XZ1Rc/JzY7aBf/e5iT4M30em7M4=
Date: Wed, 30 Jan 2019 09:55:30 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 2/2] mtd: Check add_mtd_device() ret code
Message-ID: <20190130095530.44e7fe8a@bbrezillon>
In-Reply-To: <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
References: <20190102143654.24362-1-bbrezillon@kernel.org>
 <20190102143654.24362-2-bbrezillon@kernel.org>
 <CAMuHMdV-=_0htu9w1xK25RVWgnRaXVR-R-oXc7f-Y_cC9SR25A@mail.gmail.com>
 <20190122133159.2033844c@bbrezillon>
 <20190129120337.08754bac@bbrezillon>
 <CAMuHMdXVszyR_fkjmy5RpEDW3L-Ewr_tOK3o07OEm2uh4_aSRA@mail.gmail.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190130_005540_093412_2F1BE919 
X-CRM114-Status: GOOD (  28.21  )
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

On Tue, 29 Jan 2019 16:29:55 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Boris,
> 
> On Tue, Jan 29, 2019 at 12:03 PM Boris Brezillon <bbrezillon@kernel.org> wrote:
> > On Tue, 22 Jan 2019 13:31:59 +0100
> > Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > On Tue, 22 Jan 2019 12:21:11 +0100
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:  
> > > > On Wed, Jan 2, 2019 at 3:37 PM Boris Brezillon <bbrezillon@kernel.org> wrote:  
> > > > > add_mtd_device() can fail. We should always check its return value
> > > > > and gracefully handle the failure case. Fix the call sites where this
> > > > > not done (in mtdpart.c) and add a __must_check attribute to the
> > > > > prototype to avoid this kind of mistakes.
> > > > >
> > > > > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
> > > > > ---
> > > > > No Fixes or Cc-stable tag here, as this seems to have worked just fine
> > > > > without checking add_mtd_device() ret code until we started to expose
> > > > > MTD devices as NVMEM providers (queued for 4.21).  
> > > >
> > > > Oh yes ;-)
> > > >
> > > > https://lore.kernel.org/lkml/87feac02-e955-1897-d4a4-d6d6d1082e45@gmail.com/t/
> > > >
> > > > Your patch is very similar to mine, so the crash is gone.  
> > >
> > > Oops, sorry about that. I completely forgot about this patch. It seems
> > > the discussion led to a different conclusion though (patch
> > > allocate_partitions() to reject wrong parts early) and the v2 was never
> > > sent (or I missed it). Anyway, I guess we should have done both (check
> > > add_mtd_device() ret code everywhere and patch allocate_partitions() to
> > > reject bad parts early).
> > >  
> > > > However, the warning is still there:
> > > >
> > > >     m25p80 spi0.0: s25sl032p (4096 Kbytes)
> > > >     3 fixed-partitions partitions found on MTD device spi0.0
> > > >     Creating 3 MTD partitions on "spi0.0":
> > > >     0x000000000000-0x000000080000 : "loader"
> > > >     0x000000080000-0x000000600000 : "user"
> > > >     mtd: partition "user" extends beyond the end of device "spi0.0" --
> > > > size truncated to 0x380000
> > > >     0x000000600000-0x000004000000 : "flash"
> > > >     mtd: partition "flash" is out of reach -- disabled
> > > >     ------------[ cut here ]------------
> > > >     WARNING: CPU: 0 PID: 1 at drivers/mtd/mtdcore.c:571
> > > > add_mtd_device+0x90/0x3b0
> > > >
> > > > Interestingly, only one partition is created, covering the full size of the
> > > > device:
> > > >
> > > >     # cat /proc/partitions
> > > >     major minor  #blocks  name
> > > >
> > > >       31        0       4096 mtdblock0
> > > >
> > > > While I would expect two partitions, "loader" and truncated "user":
> > > >
> > > >       31        0        512 mtdblock0
> > > >       31        1       3584 mtdblock1  
> > >
> > > Yes, makes sense, I guess your patch was better than mine :-/. Can you
> > > try with the following diff applied and let me know if it solves the
> > > problem?  
> >
> > Gentle ping: is this diff fixing your problem, and do you want me to
> > send a proper patch for it or should I let you send one?  
> 
> Yes, the diff below fixes the partitions for me, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Note that the warning is still there, but that's probably OK.

Just out of curiosity, why do you need to define parts that do not fit
in the flash?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
