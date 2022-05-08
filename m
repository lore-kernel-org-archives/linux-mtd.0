Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE843C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  8 May 2022 19:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHighoUr+SoF1REety0bfIaPlD9SLh7JwDP/t5Q6ws0=; b=zcKCm2cw2Orp+k
	836yN3PGSJ2La/3zOljg7cOau3DenlY85m2ODvGyVNa4bs3c2EzMLBwh99seFCF+xigTDCuIxdTlk
	RX2DPRedoc8iH9L0IlNJPq9iyzp0lIsqtUv9j4ytpW4NtRjaMZx9iusLbI61DH+WVndEgABXSknoy
	y0q1OyrdEezosOHhHmDGFh02DsVkyFWrFDhlqwF3H95FrcqM5pStmfwfVrKGtud8F6RScnEhG5lOA
	Ai2/D/hcTK5OI2Y1RZ58F9I9h1B1Xm2sFqA08zKO+/Awak+55rr3rIsyY5tRTdexGZB4kP0lksven
	Dr+UfrrQrB+C3bivIh4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnmjG-00BDRW-4D; Sun, 08 May 2022 19:38:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnmjE-00BDQw-Ex; Sun, 08 May 2022 19:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HPtZn1pXVcAa2BUPhG85sgXmXcmLsDiRYjOT7IzzrhM=; b=juEwUtY+Pswar3mi9JCqMG0GB0
 eDZZ9UH2uN8HFDyFlUDrZTXE2YJnQJ3j8xjADLm/8ozl2oFFxoJ/3UBpi+cv0JS8p9k50jwwdYWMG
 bmk1L+0tuu0X6IG8b5oiZmaRi4DThDX0pwC35eYJ46I5qO+kJTs50VM+tsRtqqkny2m36qFziDIiS
 Y9x+nmjbz0OjJnsZSJXJScraAShlBtty6se+Fj21xQly9hqNdBCBkMW0jiHleQgCXnAUO4HuuEy6X
 71WDfR3YtiizfRmphYM5ZobpS7DEUGLZWl5ml+RPoyjFo63IwmpUryJxGIvk95gnj1FLLYHUf/HtE
 rb2k7tLg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nnmEn-002k8z-4S; Sun, 08 May 2022 19:06:37 +0000
Date: Sun, 8 May 2022 20:06:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 3/3] fs: Change the type of filler_t
Message-ID: <YngUvbIyPA2gsslF@casper.infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
 <20220502054159.3471078-4-willy@infradead.org>
 <YnE60WTzSzxt9OxY@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YnE60WTzSzxt9OxY@infradead.org>
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

On Tue, May 03, 2022 at 07:23:13AM -0700, Christoph Hellwig wrote:
> > @@ -3504,9 +3504,9 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
> >  
> >  filler:
> >  		if (filler)
> > -			err = filler(data, &folio->page);
> > +			err = filler(file, folio);
> >  		else
> > -			err = mapping->a_ops->read_folio(data, folio);
> > +			err = mapping->a_ops->read_folio(file, folio);
> 
> Wouldn't it just make sense to just pass mapping->a_ops->read_folio as
> the filler here from the callers that currently pass NULL?

Thanks for the review.  We're heading in the same direction; my
plan was to (in some subsequent merge window) convert all callers of
read_cache_page() to use read_mapping_folio() (by setting ->read_folio)
and then get rid of filler_t altogether.

Maybe there are some filesystems that can't do that, eg they need a
different ->read_folio() when called from read_cache_folio() to the
one they need when called for filemap_read(), but I bet they can all be
worked around.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
