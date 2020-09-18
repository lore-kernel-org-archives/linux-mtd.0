Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FAKE_REPLY_C,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0422C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 12:31:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 300C2206D9
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 12:31:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xfHGcwwO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 300C2206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:Subject:To:From:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=3HsCRQTqauDRVdFeTfnA9oRfZJbiRMVEsqo6v82Wzls=; b=xfHGcwwOBtNqPSMUHNH8+G6IC
	VNZJGCqYab+jLDrutm8WXScR1OpW1O/oDLONOeUWv3zgmlbrv2QDgANJcq5LVk6cyx59yyo2tVnsh
	CaVs6PHHQlGJVQStDCwb/67I/ovZaECdzakjouFfe43bcdWtcHef4Tv07DQvqyBoGvmCZksS7EJxe
	IGa7OZbJwaWIHDSei7+4c2MDgBGazfTVf4gTBQ1NkeMyFQjt5AUG+4aDUlHoWYETE1DVGmJyjQX2I
	YxMe6m0MmJj7G+4yEALxkp9ZaRuZorZw37yoEFfgSF9ZUL/MI1ja1Gm4cThtCwmrKm7Fk2z8U9yBJ
	YhiMctQjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJFXJ-0003bD-6w; Fri, 18 Sep 2020 12:30:45 +0000
Received: from nautica.notk.org ([91.121.71.147])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJFXG-0003Zr-7E; Fri, 18 Sep 2020 12:30:43 +0000
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 58A7FC01D; Fri, 18 Sep 2020 14:30:40 +0200 (CEST)
Date: Fri, 18 Sep 2020 14:30:25 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [V9fs-developer] [PATCH 02/13] 9p: Tell the VFS that readpage
 was synchronous
Message-ID: <20200918123025.GA735@nautica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918111916.GA32101@casper.infradead.org>
 <20200917151050.5363-3-willy@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_083042_413208_543FA87F 
X-CRM114-Status: GOOD (  19.44  )
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

Matthew Wilcox (Oracle) wrote on Thu, Sep 17, 2020:
> The 9p readpage implementation was already synchronous, so use
> AOP_UPDATED_PAGE to avoid cycling the page lock.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Acked-by: Dominique Martinet <asmadeus@codewreck.org>

(I assume it'll be merged together with the rest)

> > What I'm curious about is the page used to be both unlocked and put, but
> > now isn't either and the return value hasn't changed for the caller to
> > make a difference on write_begin / I don't see any code change in the
> > vfs  to handle that.
> > What did I miss?
> 
> The page cache is kind of subtle.  The grab_cache_page_write_begin()
> will return a Locked page with an increased refcount.  If it's Uptodate,
> that's exactly what we want, and we return it.  If we have to read the
> page, readpage used to unlock the page before returning, and rather than
> re-lock it, we would drop the reference to the page and look it up again.
> It's possible that after dropping the lock on that page that the page
> was replaced in the page cache and so we'd get a different page.

Thanks for the explanation, I didn't realize the page already is
gotten/locked at the PageUptodate goto out.

> Anyway, now (unless fscache is involved), v9fs_fid_readpage will return
> the page without unlocking it.  So we don't need to do the dance of
> dropping the lock, putting the refcount and looking the page back up
> again.  We can just return the page.  The VFS doesn't need a special
> return code because nothing has changed from the VFS's point of view --
> it asked you to get a page and you got the page.

Yes, looks good to me.

Cheers,
-- 
Dominique

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
