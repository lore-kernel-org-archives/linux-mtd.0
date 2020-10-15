Return-Path: <SRS0=04ME=DW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5A54C433E7
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 11:51:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D469212CC
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2020 11:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ma3gYUUq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VixR6nbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D469212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YD4a7CRzB71qEhl1b8Y3R6lOW587NS1pWKmwnoqS2LE=; b=ma3gYUUqeLsL+TMEoq0zUQ7jk
	wgHUGXl0qugh6V9hxdey62U6WqXSZHhKqrX4cI/GJWjkrtSeUtRjH96Ka/FEyQBVRrmooI8Fg2bfP
	yrWxhJFQDF/kfBWqjik2Uav/SBajnVG1fqfFUtRS7279HH7GgYKOW//1VyRt87l6A9Eb7oJ/Iboba
	c+8dZ8Y98XcWBI5wiQ6EEB8Lapj/X0N7VvK/eQF0NMpaS/if8MJfK8uJnONMVNyYC1UQWaaenuFjI
	grGdDWapkDO8pPYhq45nOP1HNI/ACxYPIxoGKHMDOz8HCus4BLVV6A73TljD2faSVqzMThyJnCPUd
	ynaBK2rQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kT1la-0002mZ-6L; Thu, 15 Oct 2020 11:49:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kT1lY-0002mC-04; Thu, 15 Oct 2020 11:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XLRuihqm3fAlHyAROY0lvBAgKqxOu9ggAgyL2LNoHgw=; b=VixR6nbubUCnsr4ZO2wy9wuxCn
 lduZ4bu+AY2nVEOKTBe3JvtWf0PlYzWVbpiellQE6WWeKJ46G0qRMjoBJK9Zqxld+20RhqXCyTXW8
 iIJ7jl6BzmDlIQEHhkYHBhTOphSFccJhtJ7PpwARQc60tLRYyOXI9J4I06bLQgXnncAM+vpCMN1TW
 moWLhI0VJd33AOfpSmp24xN24NWqTOcT4f7uyXVJtcRgmtAdi8WW/5Tj8q5TbdPOmTEfJAcHjHHpN
 vx2Me/S+s+qLI0dsDRm2ZiSRjkSNyE2miUVgJCU5cSIyqF0lNfp5SeuzMdGwwLIvbsLqhY94JNLFJ
 JtXRqa5w==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kT1lV-0004fH-KR; Thu, 15 Oct 2020 11:49:49 +0000
Date: Thu, 15 Oct 2020 12:49:49 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 00/16] Allow readpage to return a locked page
Message-ID: <20201015114949.GY20115@casper.infradead.org>
References: <20201009143104.22673-1-willy@infradead.org>
 <20201015090242.GA12879@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201015090242.GA12879@infradead.org>
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Oct 15, 2020 at 10:02:42AM +0100, Christoph Hellwig wrote:
> On Fri, Oct 09, 2020 at 03:30:48PM +0100, Matthew Wilcox (Oracle) wrote:
> > Ideally all filesystems would return from ->readpage with the page
> > Uptodate and Locked, but it's a bit painful to convert all the
> > asynchronous readpage implementations to synchronous.  The first 14
> > filesystems converted are already synchronous.  The last two patches
> > convert iomap to synchronous readpage.
> 
> Is it really that bad?  It seems like a lot of the remainig file systems
> use the generic mpage/buffer/nobh helpers.
> 
> But I guess this series is a good first step.

I'm just testing a patch to mpage_readpage():

+++ b/fs/mpage.c
@@ -406,11 +406,17 @@ int mpage_readpage(struct page *page, get_block_t get_block)
                .nr_pages = 1,
                .get_block = get_block,
        };
+       int err;
 
        args.bio = do_mpage_readpage(&args);
-       if (args.bio)
-               mpage_bio_submit(REQ_OP_READ, 0, args.bio);
-       return 0;
+       if (!args.bio)
+               return 0;
+       bio_set_op_attrs(args.bio, REQ_OP_READ, 0);
+       guard_bio_eod(args.bio);
+       err = submit_bio_wait(args.bio);
+       if (!err)
+               err = AOP_UPDATED_PAGE;
+       return err;
 }
 EXPORT_SYMBOL(mpage_readpage);
 

but I'm not looking forward to block_read_full_page().

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
