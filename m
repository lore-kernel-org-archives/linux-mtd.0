Return-Path: <SRS0=EGP2=6R=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7184BC28CBC
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 08:35:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413B22075B
	for <linux-mtd@archiver.kernel.org>; Sun,  3 May 2020 08:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FYSJyKEO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413B22075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZ0aaAeSbfQdeOkf+nnZb1h1Kl64aCpz5Hih65rVtdg=; b=FYSJyKEOzUH2ar
	/IVyEXG74AqMxrDi0SVfWL4M0kNtfIlO4OQz9jxiMeGEEKJDuQ4d/neCeY7yv4PaduztTmfU6gV0c
	7CFaka9Y+S3+eSvIlbu8br0M4YHA+KMUamnczDSmichoU1zb8PBlKvBNPH4mTI0Gk2lM73uBT7Dho
	Pdrbx+jQvSaFZ0Xgm7y7jsftPPqz4mq69ZJJO00iByiZD9MS9tQ1Kq/RAq+g3iovh/Ioh0wrD1gyJ
	mKp7hgFPxPFS7gRyT2ZoWfhqD1oWzTNx5XUYvR4xoHNDGFKW73dBfT0H8ctlaD6ClmO22o3MdQMA8
	ktDvGeW1RNp7nHpnzy2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVA5e-0000f5-PN; Sun, 03 May 2020 08:35:10 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVA5b-0007oL-B0
 for linux-mtd@lists.infradead.org; Sun, 03 May 2020 08:35:09 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF05A2A0197;
 Sun,  3 May 2020 09:35:04 +0100 (BST)
Date: Sun, 3 May 2020 10:35:01 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH 13/17] mtd: rawnand: cafe: Add exec_op() support
Message-ID: <20200503103501.05a3d1e1@collabora.com>
In-Reply-To: <20200503101303.56e34f13@collabora.com>
References: <20200427082028.394719-14-boris.brezillon@collabora.com>
 <20200502111410.330584-1-lkundrak@v3.sk>
 <20200502151811.328eebb0@collabora.com>
 <20200502191843.GA363829@furthur.local>
 <20200503003456.2ddf6047@collabora.com>
 <20200503060610.GA386731@furthur.local>
 <20200503090449.6823bdd9@collabora.com>
 <20200503075208.GA387473@furthur.local>
 <20200503101303.56e34f13@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_013507_546185_ED3DD219 
X-CRM114-Status: GOOD (  17.31  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, dwmw2@infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, 3 May 2020 10:13:03 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> > > > 
> > > > I'm happy to test another patch, or add more tracing (I'm not at all
> > > > familiar with NAND flashes or MTD for that matter, so I have little idea
> > > > what to look for).    
> > > 
> > > I pushed a new version with extended traces. That should tell us what
> > > those operations.    
> > 
> > Thank you.
> > 
> > I moved the last debugging printk() right after the call to
> > readl_poll_timeout(), otherwise we'd not be reaching it on errors.
> > 
> > A quick grep for ret=-110 in the log reveals two kinds of errors:
> > 
> >   [   15.046151] instr[0] = WAITRDY
> >   [   15.065290] instr[1] = DATA_IN(len=2112)
> >   [   16.085166] 2: ret=-110 status=80000000 wait=50000000  
> 
> Ok, that's interesting. While the WAITRDY shouldn't be there, DATA-only
> operations are allowed, and I'd expect at least a DMA_DONE event in
> that case, but we get nothing. Maybe we should use DMA only if there's
> at least one addr/cmd instruction. Or maybe the engine can't do
> DATA-only operations.

Or maybe length is actually 0 here, since my traces print
instr->ctx.data.len instead of nand_subop_get_data_len(subop, i).

> 
> > 
> > and
> >  
> >   [   47.034418] instr[0] = WAITRDY
> >   [   48.054781] 1: ret=-110 status=10000000 wait=c0000000  
> 
> Yep, I don't expect operation to start with a WAITRDY, and this
> situation is probably caused by this commit [1].

This commit is indeed introducing a regression (see the fix here [2]).
That should work better now.

> 
> > 
> > Full log here:
> > https://people.freedesktop.org/~lkundrak/nand-raw-trace2.txt
> > 
> > A log of your original patch, just in case the move of the logging
> > statement was incorrect:
> > https://people.freedesktop.org/~lkundrak/nand-raw-trace.txt
> > 
> > Lubo  
> 
> [1]https://github.com/bbrezillon/linux/commit/30248fb955ba5e33a1863c8654f286b98c35d233

[2]https://github.com/bbrezillon/linux/commit/ec0460c61343a539889ab6298dd043d00717f19b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
