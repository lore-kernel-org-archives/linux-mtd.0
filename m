Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F90C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 03:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6YhE3jgUcjYZDqZPEDn2MMnf/UcKXzUykTHG/go80A=; b=VxojTQXEx1cK92
	yFic7GXPX2rHqRRyvWru6h1J4N4JQk/kbpmEt9srlaoz3RI69siBjDSfEXrlX2Pq/r+XpdxFUvlXk
	LyG9P8k2mD7nk5d90P5QYsp+1lOkGHJCFuxsTY4yseBorvi7d/hWmw8yDTBjav8t5QmhN0+B+1Fbv
	s1YFD/PHwraEJongzeqPYXyNZWfzm1kOd0vOTFjaOriKDg7oM7Gt8zKtN8SXneb3hx6Mmja1mOgA4
	tk9v00Lfwu49tWsSX9J0wr01Mo3SXXaceZIESlHgr9KSlsUrB5t0nu+jEfIORPgLJMHbaWWoHu06S
	dQDxWJ5PTN5957/UIKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NHd-00HY81-13;
	Tue, 06 Jun 2023 03:22:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6NHb-00HY6n-0q
	for linux-mtd@bombadil.infradead.org;
	Tue, 06 Jun 2023 03:22:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bgQl2HcDSX0CQG5MtHS5EcgGmE+fwx2fMW6fGk5Fo9s=; b=r8SM0Hez73vG3zZ5Qt/3Z7ELWO
	krNzTksNO63lUwn/bCphcv3Ps1oD7ACXalF2JOMCHCFNsdt+DDgtJBiqxft6JMVxr7apoqfmPfwsy
	CfzQnTqkFuFUyUBFYVGejW1boJxGZ22oCYlW+3iSd009UVF/3bmviCuM02MUnGn4rS1dbSAgvFaEK
	DZCyZWQPqdhOO+TG5pwQr9V2JTxsrhNW7Uq87SJzHOO7EAJtMsjGuLVkwcNPo/yF8BXclo8yMs46U
	94oIf7XGULfMkTmiRKwJQdSZfiWOXQjY5NQRb+ZCKPeNb/c21bB8xR/dz6euPtVRZruHmR3HDavlb
	UFRHM+vw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6NHX-00ChDl-GY; Tue, 06 Jun 2023 03:22:51 +0000
Date: Tue, 6 Jun 2023 04:22:51 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH 4/4] ubifs: Convert do_writepage() to take a folio
Message-ID: <ZH6mixCMHce1S+vK@casper.infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-5-willy@infradead.org>
 <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2059298337.3685966.1686001020185.JavaMail.zimbra@nod.at>
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

On Mon, Jun 05, 2023 at 11:37:00PM +0200, Richard Weinberger wrote:
> > -	addr = kmap(page);
> > -	block = page->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
> > +	addr = kmap_local_folio(folio, offset);
> > +	block = folio->index << UBIFS_BLOCKS_PER_PAGE_SHIFT;
> > 	i = 0;
> > -	while (len) {
> > -		blen = min_t(int, len, UBIFS_BLOCK_SIZE);
> > +	for (;;) {
> 
> This change will cause a file system corruption.
> If len is zero (it can be) then a zero length data node will be written.
> The while(len) made sure that upon zero length nothing is written.

I don't see how 'len' can be 0.  len is modified each time around the
loop, and if it's decremented to 0, we break.  So you must be referring
to a case where the caller of do_writepage passes 0.

There are three callers of do_writepage, two in ubifs_writepage():

        int err, len = folio_size(folio);
...
        if (folio_pos(folio) + len < i_size) {
...
                return do_writepage(folio, len);

len is folio_size(), which is not 0.

        len = offset_in_folio(folio, i_size);

Here, we know that len is not 0.  We already tested earlier:
        if (folio_pos(folio) >= i_size) {

so we know that i_size > folio_pos() and i_size < folio_pos() +
folio_size().  Actually, I should make this more explicit:

	len = i_size - folio_pos(folio);

Now it should be clear that len cannot be zero.

The third caller is do_truncation():

        loff_t old_size = inode->i_size, new_size = attr->ia_size;
        int offset = new_size & (UBIFS_BLOCK_SIZE - 1), budgeted = 1;
        if (offset) {
                pgoff_t index = new_size >> PAGE_SHIFT;
                                       offset = offset_in_folio(folio,
                                                        new_size);
                                err = do_writepage(folio, offset);

It's not large-folio-safe, but it's definitely not 0.

Did I miss something?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
