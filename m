Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99B5C43465
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 11:20:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54C4B21D42
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 11:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axUcwSX5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OhWnaBzr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54C4B21D42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CJOAoSzr2GC6lQSCAlYMsmzBbTZdEEwPNeWQ9Baw5q8=; b=axUcwSX5ls5p+y9ElFLxFvm4l
	x3lg7+pU+8p3//Flc6csLG/YPiqizwGmOV49V7up/yWs9LvXBYPh28Btkx78QUNGv7UQIZUXWwRJ5
	yd257eZnjZigyHJCEac3hRoqqSpgQAZnialz/vT+8/yZYu2adN/agOIqc8+wvLVMqS62QeRo59H0S
	HyEsV3k/Ub5TQVLArvSHAYaiNFDVnM0WE7MiO62cFIqlI9XFOMFb68ht2PWzA9ELFzZZVynpI+ZYx
	JTT9JN0F6pF7rIPOwH/E3df3bGgMJJUVHRypmEahCMvNX8CkNF/gZXHNERjrZbv2qbRvPi4qnp5VP
	b/zZLGBXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJEQD-0001VN-T5; Fri, 18 Sep 2020 11:19:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJEQB-0001Uo-9o; Fri, 18 Sep 2020 11:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=D2ju8jMz6rNG3JDmyLzknrnz9KKFGg0PYq+DeMuVZKY=; b=OhWnaBzrqkDRbzOwxxDZrAitsW
 uGCQAikASHjYa/PMPuiPlUOcliemRBZlSc/1RLXgVWxgpXKT26jnRaH2hmTM72gxSVdhOPqu6kQPd
 h+y2nYjcOI/MK6CMWwhrlZi9ICHnkGIztdyZsb1kUMTfkP470jFOrvRJfyuy8uYVb1UtlcOcYJKpU
 E5Rm9//Op9Yh9xVsMJdzShSN0jO9N6AGwLLD/O1r3P9sdUd2Ic22Cm/qIxyYzHn5gT/lwgN84usJW
 ACafXKejemQbxTWMfkPL3z3ucBuijE/zG8VKPfz4WQt3m2mP+hkouoscs89VtGRxh2HUUy/mInKXY
 PZ8Gd81Q==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kJEQ9-0002ra-1H; Fri, 18 Sep 2020 11:19:17 +0000
Date: Fri, 18 Sep 2020 12:19:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dominique Martinet <asmadeus@codewreck.org>
Subject: Re: [V9fs-developer] [PATCH 02/13] 9p: Tell the VFS that readpage
 was synchronous
Message-ID: <20200918111916.GA32101@casper.infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-3-willy@infradead.org>
 <20200918055919.GA30929@nautica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918055919.GA30929@nautica>
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2020 at 07:59:19AM +0200, Dominique Martinet wrote:
> Matthew Wilcox (Oracle) wrote on Thu, Sep 17, 2020:
> > diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> > index cce9ace651a2..506ca0ba2ec7 100644
> > --- a/fs/9p/vfs_addr.c
> > +++ b/fs/9p/vfs_addr.c
> > @@ -280,6 +280,10 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
> >  		goto out;
> >  
> >  	retval = v9fs_fid_readpage(v9inode->writeback_fid, page);
> > +	if (retval == AOP_UPDATED_PAGE) {
> > +		retval = 0;
> > +		goto out;
> > +	}
> 
> FWIW this is a change of behaviour; for some reason the code used to
> loop back to grab_cache_page_write_begin() and bail out on
> PageUptodate() I suppose; some sort of race check?
> The whole pattern is a bit weird to me and 9p has no guarantee on
> concurrent writes to a file with cache enabled (except that it will
> corrupt something), so this part is fine with me.
> 
> What I'm curious about is the page used to be both unlocked and put, but
> now isn't either and the return value hasn't changed for the caller to
> make a difference on write_begin / I don't see any code change in the
> vfs  to handle that.
> What did I miss?

The page cache is kind of subtle.  The grab_cache_page_write_begin()
will return a Locked page with an increased refcount.  If it's Uptodate,
that's exactly what we want, and we return it.  If we have to read the
page, readpage used to unlock the page before returning, and rather than
re-lock it, we would drop the reference to the page and look it up again.
It's possible that after dropping the lock on that page that the page
was replaced in the page cache and so we'd get a different page.

Anyway, now (unless fscache is involved), v9fs_fid_readpage will return
the page without unlocking it.  So we don't need to do the dance of
dropping the lock, putting the refcount and looking the page back up
again.  We can just return the page.  The VFS doesn't need a special
return code because nothing has changed from the VFS's point of view --
it asked you to get a page and you got the page.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
