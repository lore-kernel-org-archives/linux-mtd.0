Return-Path: <SRS0=RgZt=UU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C99F8C43613
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 06:26:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D0CC2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2019 06:26:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VoCM+qsx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTRHYMfg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D0CC2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Be5/E1bGk6zXGe1ZGdrUGtyoXKZX54+W3Lpis0hpeo=; b=VoCM+qsxF1zFrE
	yGNOjBq/g9UJAAehkS/t0QRuude+Y9O/JTWnH/flSZ5deFuU46WI/VIKS+pVq/FDdPI09tyOZldWq
	oj0TmJ2pC/b/F2ukKsug/ahiUgzrW97y/i4E8uXOFiX+XbVHDn8ZDEiwPoVUW2KLoP3qVT38N4fKf
	HOe2VU02jBdElRQCLijrqQyj/g9lwiryhRHF66I9vtSacL4oSE/JJld3SlLBGQ0L8if9ISPRj3juo
	3CIXZS+NufQYvh6kEQzDjN5p5EHxHXetxWCeIrlmYSiDmuAr9ErXcKJ+upzkxxITe6t90EMAxUvWQ
	645OtuoWYWHG5hcoMsgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1heD0P-0003CX-Es; Fri, 21 Jun 2019 06:26:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1heD0M-0003C9-Jo
 for linux-mtd@lists.infradead.org; Fri, 21 Jun 2019 06:26:35 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9915020673;
 Fri, 21 Jun 2019 06:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561098393;
 bh=XYbXweMpuaynOcY+nT1g0YPrH1Rpfi5GHw7WUdRg77s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lTRHYMfgF0ipxXwUgC3S6fbt4sKSxVZMpRmn0VZOujrxh3Aa2r11A6d/nGGvHedCY
 +QuP7k2kHdXU48sZdzp/ISJfmgkxVXse4jrh1pwExfvi1WyWj92pQ+J0n0FyrIh1uD
 LTWmHrYTjnTuXLUyrg3oJD28j6dEwsz1xi5PeAFQ=
Date: Fri, 21 Jun 2019 08:26:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] mtd: mtd-abi: Don't use C++ comments
Message-ID: <20190621062630.GC11084@kroah.com>
References: <20190620155505.27036-1-natechancellor@gmail.com>
 <CAKwvOdk7ZTcWEXPTBASPzk1SjOdnONawtQJkR-jU=REFSo1hVQ@mail.gmail.com>
 <20190620201549.GA65397@archlinux-epyc>
 <CAKwvOd=okFdfSfGpXTAUqyF=vfnaZFgdwHC-i+CnaFxGSh2Thg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwvOd=okFdfSfGpXTAUqyF=vfnaZFgdwHC-i+CnaFxGSh2Thg@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_232634_670788_31BDF8CC 
X-CRM114-Status: GOOD (  15.71  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Richard Weinberger <richard@nod.at>, LKML <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2019 at 01:29:47PM -0700, Nick Desaulniers wrote:
> On Thu, Jun 20, 2019 at 1:15 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, Jun 20, 2019 at 12:56:58PM -0700, Nick Desaulniers wrote:
> > > Should there be a fixes by tag?
> >
> > Normally, I would have added one but this issue has been present since
> > the beginning of git history. According to Thomas Gleixner's pre-git
> > history tree, it would be:
> >
> > Fixes: 7df80b4c8964 ("MTD core include and device code cleanup")
> >
> > but since that hash doesn't exist in the normal git history, I don't
> > think it is worth adding. Of course, if the maintainers want to add it,
> > I won't object.
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git
> 
> LOL good point; I wonder if the stable maintainers have thoughts on
> that or how they expect us to signal that case if we even need to do
> anything at all.

If you want it applied "since the beginning of time", then just do:

Cc: <stable@vger.kernel.org> # 2.6.0+

or some such marking.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
