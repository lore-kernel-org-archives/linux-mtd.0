Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B2CC43334
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 14:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YSU4FGN9vQ7Cp1PTlJtN4J4rGCgb6e81shk1DSWCDQ0=; b=k0TEo+2fpUAeke
	2So4lomb9pwwqL2xzSvrCoe3JV346TMZDU1rU3T2fRF0c1IRy5ihfPLIm+RcXZ0GvkJnwot0xXWR/
	JF1oDI9tLw2OCcWBFDdfMIx7TQeqgmadeaW+imiMXzn3PmHTexx/XXbi1ih077n2qhwuBLb3m0TGn
	3HNJeC40z+Z3oNc5aQL0OyCk6TwKIZQeKYHa9NSjrYYzDJ/NSZ8+k9EeOUXxQauWMY2s3lvm5WIHg
	2LFjAGof83KL9QJk1EArnuQolLFb7Rkd2jdv7A+AY+CYlx6RbPBNWQfcg9TDhPgORT9Rkey6xTWu7
	bXd4vU9qD8WzepODETuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZwH-007yA7-IM; Tue, 07 Jun 2022 14:12:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZvu-007xxK-Cs
	for linux-mtd@bombadil.infradead.org; Tue, 07 Jun 2022 14:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4nUpYTI4YzQUWe3MX/DeuqIdjPgTHj7mksBWnabO8pk=; b=IoritkaL90aqbR+RUHZKoSo8fb
	np1ux4ttns5tYj2sJk/FAj12Ak/CQ/wW4eIuwXN5ulK6rhUSeL7wfME8a6K9gYUgIYgqg08BNe9+I
	tus3kQ04SmPJZl9V4GH+E2xTibe280AETqIE3sbtSug/TUXDR0128c42jRa/+qeI8q7uri0dQOk1f
	wWHM11+pgzBreVL8bkL3da/JDGIf99g2HUm8tnTrzT4cPM9I17c3dxlon1CkQMKJOgWEf9FbWmKJ9
	h7TOtnv+jsL8ABFyKBR86bb03b2ZVDj0NIek4XcowncLGE0YjVino+xsZhqucJvOU+7lO9abDpL7s
	BM8iPWpg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZvo-00BhC6-Sq; Tue, 07 Jun 2022 14:11:40 +0000
Date: Tue, 7 Jun 2022 15:11:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Brian Foster <bfoster@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 05/20] mm/migrate: Convert expected_page_refs() to
 folio_expected_refs()
Message-ID: <Yp9cnCaZ1O4qHFEp@casper.infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-6-willy@infradead.org>
 <Yp9VpZDsUEAZHEuy@bfoster>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yp9VpZDsUEAZHEuy@bfoster>
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

On Tue, Jun 07, 2022 at 09:41:57AM -0400, Brian Foster wrote:
> On Mon, Jun 06, 2022 at 09:40:35PM +0100, Matthew Wilcox (Oracle) wrote:
> > -static int expected_page_refs(struct address_space *mapping, struct page *page)
> > +static int folio_expected_refs(struct address_space *mapping,
> > +		struct folio *folio)
> >  {
> > -	int expected_count = 1;
> > +	int refs = 1;
> > +	if (!mapping)
> > +		return refs;
> >  
> > -	if (mapping)
> > -		expected_count += compound_nr(page) + page_has_private(page);
> > -	return expected_count;
> > +	refs += folio_nr_pages(folio);
> > +	if (folio_get_private(folio))
> > +		refs++;
> 
> Why not folio_has_private() (as seems to be used for later
> page_has_private() conversions) here?

We have a horrid confusion that I'm trying to clean up stealthily
without anyone noticing.  I would have gotten away with it too if it
weren't for you pesky kids.

#define PAGE_FLAGS_PRIVATE                              \
        (1UL << PG_private | 1UL << PG_private_2)

static inline int page_has_private(struct page *page)
{
        return !!(page->flags & PAGE_FLAGS_PRIVATE);
}

So what this function is saying is that there is one extra refcount
expected on the struct page if PG_private _or_ PG_private_2 is set.

How are filesystems expected to manage their page's refcount with this
rule?  Increment the refcount when setting PG_private unless
PG_private_2 is already set?  Decrement the refcount when clearing
PG_private_2 unless PG_private is set?

This is garbage.  IMO, PG_private_2 should have no bearing on the page's
refcount.  Only btrfs and the netfs's use private_2 and neither of them
do anything to the refcount when setting/clearing it.  So that's what
I'm implementing here.

> > +
> > +	return refs;;
> 
> Nit: extra ;

Oh, that's where it went ;-)  I had a compile error due to a missing
semicolon at some point, and thought it was just a typo ...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
