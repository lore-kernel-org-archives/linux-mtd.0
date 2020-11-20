Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6DAC5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:18:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D196A2224C
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 09:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmTZdb6r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D196A2224C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ASV8mNwXw2ldkSPeKfHYn2zzubPH756lqukplbD3ZVA=; b=UmTZdb6rlKlKe5Y7KKTzHJNr1
	kVUhwsfzDt0N93K6ZPpBUWdfkIdtieOIPhe7wZp4lqibUza6Trx3ylg9CZyb9I4sON0GjFhteaWaz
	CCDaWY3dJVDjy2FT0xXJwXERaswaCKuEY+mXL9jfX4+Sl3ozYAp39h/friw6XJCybPZiGHUYkXRjQ
	6zPMC2o4uHatbosdGDdCpKxryBRHTnqlBFZXDwRc8m/ADNwfLfvEwFMxrxoI1J6EozolcDZ0zUyB6
	zzmj754dU+1mtx8lRleZm8GSTTkxIqTZg0UVgQu0l/RjUbP2A1G1BTcOcbMu9MvREphKUVqqFK8cu
	CZqcylxMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2Xg-0006Z9-Cv; Fri, 20 Nov 2020 09:17:20 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2Xc-0006X4-ER
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 09:17:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id E4E0067373; Fri, 20 Nov 2020 10:17:14 +0100 (CET)
Date: Fri, 20 Nov 2020 10:17:14 +0100
From: Christoph Hellwig <hch@lst.de>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 17/20] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201120091714.GF21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-18-hch@lst.de>
 <20201119151316.GH29991@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119151316.GH29991@casper.infradead.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_041716_651324_8B5AE4C8 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 03:13:16PM +0000, Matthew Wilcox wrote:
> On Wed, Nov 18, 2020 at 09:47:57AM +0100, Christoph Hellwig wrote:
> > @@ -2887,13 +2887,13 @@ EXPORT_SYMBOL(filemap_map_pages);
> >  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
> >  {
> >  	struct page *page = vmf->page;
> > -	struct inode *inode = file_inode(vmf->vma->vm_file);
> > +	struct inode *inode = vmf->vma->vm_file->f_mapping->host;
> >  	vm_fault_t ret = VM_FAULT_LOCKED;
> >  
> >  	sb_start_pagefault(inode->i_sb);
> >  	file_update_time(vmf->vma->vm_file);
> >  	lock_page(page);
> > -	if (page->mapping != inode->i_mapping) {
> > +	if (page->mapping != vmf->vma->vm_file->f_mapping) {
> 
> Bit messy.  I'd do:
> 
> 	struct address_space *mapping = vmf->vma->vm_file->f_mapping;
> 
> 	sb_start_pagefault(mapping->host->i_sb);
> 
> 	if (page->mapping != mapping)
> 
> 	sb_end_pagefault(mapping->host->i_sb);

Fine with me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
