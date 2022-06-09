Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B991BC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djIoHbl88M+HIAK5LfuIMBxZt06XXI+YMEvzztjYk2s=; b=fZ8nvG2M+Em8DJ
	CaEFE2elzgUmHKu2GOmA/Aa4rGEI72OQy0SucrH562Vt8JFvmu+4rS0VqfRUiAPjiPDOScnFzVfj+
	7Kf69m3ij+0TP4jBOMowikd6p8SwLzfpAXQL9MVZvSdU2WsuUmhMzH7t3DukVN4LGaf9e+80jLrGI
	SA5pXjNSLkclMus6E+ROq980/A3LRhbJNGauxadhf5Lf5iYCh6Icp0h3CfDuThrMUyu1ysCS96fMk
	dEE7cMnJgbngTKRsT+Wi2l5isBAZsV5kmdqcubTnxnxhudznRgnMNtRBda/U7xx8xtIdC+xkNA8BG
	jUwul7AyzAXW4LliMphQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzM99-003Evd-UY; Thu, 09 Jun 2022 17:40:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzM97-003Eue-RS
	for linux-mtd@bombadil.infradead.org; Thu, 09 Jun 2022 17:40:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=50LH8Dogtui4JOE7bz/ojMzo0HRhZGWl5FgghUdbsso=; b=H80hSPNqGiAd5chM6yyxpXe7GI
	v16rR9GPk1lsBvZCxGkkfPwwIt580VMmgSt7/ZwfufekJhmrwARChvfRps5Isb2jo31hImz/J8zhg
	3Gqid/DHTzlBHrEnpsHq7tbmdB6lizbSwvMg1psBh47cB986OJv32t09q9JTTsGSl5f5sM+mUmbDC
	kBxIqffET9U+LDZy+bNXjBWIq4ozQI6dP3A/jTcDrHF2DBz9xSzltFjBNcK5NRZczIeDZyfqJ8lJf
	qfewZREEYM3aHIjRrfEfYKtBKEBJRQ6UywKBfP0QJhwiV/qPmGd6+tb1EV1S0HSjXDX6WidFPIyNN
	+S04cl5w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzM8y-00DjCy-V3; Thu, 09 Jun 2022 17:40:28 +0000
Date: Thu, 9 Jun 2022 18:40:28 +0100
From: Matthew Wilcox <willy@infradead.org>
To: dsterba@suse.cz, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2 12/19] btrfs: Convert btrfs_migratepage to
 migrate_folio
Message-ID: <YqIwjEO1a0Sbxbym@casper.infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
 <20220608150249.3033815-13-willy@infradead.org>
 <20220609163323.GV20633@twin.jikos.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220609163323.GV20633@twin.jikos.cz>
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

On Thu, Jun 09, 2022 at 06:33:23PM +0200, David Sterba wrote:
> On Wed, Jun 08, 2022 at 04:02:42PM +0100, Matthew Wilcox (Oracle) wrote:
> > Use filemap_migrate_folio() to do the bulk of the work, and then copy
> > the ordered flag across if needed.
> > 
> > Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> > Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Acked-by: David Sterba <dsterba@suse.com>
> 
> > +static int btrfs_migrate_folio(struct address_space *mapping,
> > +			     struct folio *dst, struct folio *src,
> >  			     enum migrate_mode mode)
> >  {
> > -	int ret;
> > +	int ret = filemap_migrate_folio(mapping, dst, src, mode);
> >  
> > -	ret = migrate_page_move_mapping(mapping, newpage, page, 0);
> >  	if (ret != MIGRATEPAGE_SUCCESS)
> >  		return ret;
> >  
> > -	if (page_has_private(page))
> > -		attach_page_private(newpage, detach_page_private(page));
> 
> If I'm reading it correctly, the private pointer does not need to be set
> like that anymore because it's done somewhere during the
> filemap_migrate_folio() call.

That's correct.  Everything except moving the ordered flag across is
done for you, and I'm kind of tempted to modify folio_migrate_flags()
to copy the ordered flag across as well.  Then you could just use
filemap_migrate_folio() directly.

> > -
> > -	if (PageOrdered(page)) {
> > -		ClearPageOrdered(page);
> > -		SetPageOrdered(newpage);
> > +	if (folio_test_ordered(src)) {
> > +		folio_clear_ordered(src);
> > +		folio_set_ordered(dst);
> >  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
