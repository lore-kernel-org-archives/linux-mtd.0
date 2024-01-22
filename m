Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD16AC47DAF
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jan 2024 14:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xiTFkR4cB7v8XB4hpdVJCIMwi8onMCDZN4BKPQ8YLc=; b=ZG8FuAS29Ui/fG
	cYYhlPRpV+mfxZFY3Vhc0gerfNWxx/lU201mBZr33Cu82AK6mCM22+LinxzPEXDaBA6IHEaDWh4wp
	sTxltMVnA8C6BcuCsPlNQtErbrrRqDTIjsZM5bM6ybxcwZxxitrQKCKAr7wZBOWjJrAU4IVwfZwF3
	8Ts7i3h7EabtDSyWPkUAjqmRfp0Lako3Zvg+c3UCNTaq4sSKxt5PZ3oG+lESuZPU3RuJiYQzifLfh
	easLBwY2B8IkC/po8scuYB95r8ywuRh+PxYV+YEw6bO8ndgKvSC3YU0KjIagISeZL+5kxPNdvapTz
	njP5ZRCT9rYtOlARWW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvW5-00CSC1-1v;
	Mon, 22 Jan 2024 14:43:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRvW4-00CSBh-0j
	for linux-mtd@bombadil.infradead.org;
	Mon, 22 Jan 2024 14:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uGlH2cQdxzgPp4Ck+oy8yuCvbKxZt/gQODv9XUzBl4M=; b=TnQjNNkZvVwObrRXdnlD2eWvs5
	DoQ1lKOBtu7FGmCb4CYE2ruUa4rvuHdhUgE4eDHB35BxogBqiyV3CennTA/ly3qH+IPSQwzXap4s2
	g6K8BlxfDOK1aXPq0L9GmUBB7iOwS2BV5RukFRO9U+7k/ENo5hIJE+thM33fUOgi2Z2uFjuPQVfam
	Ai1oAyVTi9ygVDWDWgVnMvOjvjLptzC23oG+FHJsZD20YpSKT/wkbS4wHdrnfoZzQV9v0chwlijyz
	Fa2UPahpb0cB+JmKaKLhaQTw2/iJ5cMvf3HlvfC9MyShpWynNkZEaOxL7Jtx/8Eds8T4JrVtwCnlK
	50XzrJAA==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rRvW3-00000000A3U-0N5N;
	Mon, 22 Jan 2024 14:43:11 +0000
Date: Mon, 22 Jan 2024 14:43:11 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/15] ubifs: Convert ubifs_write_begin() to use a folio
Message-ID: <Za5-_9hwEdPhI-or@casper.infradead.org>
References: <20240120230824.2619716-1-willy@infradead.org>
 <20240120230824.2619716-9-willy@infradead.org>
 <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f015efd-4142-764c-24b3-e413f5e16d4c@huawei.com>
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

On Mon, Jan 22, 2024 at 07:51:03PM +0800, Zhihao Cheng wrote:
> > @@ -437,13 +437,14 @@ static int ubifs_write_begin(struct file *file, struct address_space *mapping,
> >   		return -EROFS;
> >   	/* Try out the fast-path part first */
> > -	page = grab_cache_page_write_begin(mapping, index);
> > -	if (unlikely(!page))
> > -		return -ENOMEM;
> > +	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
> > +			mapping_gfp_mask(mapping));
> > +	if (IS_ERR(folio))
> > +		return PTR_ERR(folio);
> > -	if (!PageUptodate(page)) {
> > +	if (!folio_test_uptodate(folio)) {
> >   		/* The page is not loaded from the flash */
> > -		if (!(pos & ~PAGE_MASK) && len == PAGE_SIZE) {
> > +		if (pos == folio_pos(folio) && len >= folio_size(folio)) {
> 
> Why not len == folio_size(folio)? Although 'len >= folio_size(folio)' is not
> wrong.

This is based on my experience with iomap.  Today, the caller passes in
min(length-of-write, PAGE_SIZE).  In order to be able to create large
folios in the write path, we want to change the caller of write_begin
to pass in the length of the write, so we can see a len which is larger
than the size of the folio we found.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
