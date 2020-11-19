Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56BE2C6369E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 15:14:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF6AD22268
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 15:14:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cMMrdWqo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="NQxl2LUe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6AD22268
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UN5CSPNxkf2F7XS0oBGwRR5L9tBkrKClaPB3kSzL50g=; b=cMMrdWqojtjyME7rMRAe9TAL/
	6io3XZNlBw3+HGoThFXdGbLtBE7c/sZ6MzTnIhN67eZEd0uVir5GgBii8BJnpvVSJvivSa8yngYJr
	ofy5JhT2+BxV0Puq32zrAMNvmHQK+md1vWpDb9mVE3N0U2hd8zBRhDoDC0lIb20Hl/VCk0fOalafk
	G+6WQug+48UmaGKNbXNjUZhnWt0LTaq+elW6jrWkA4dw1zrPosaM5uOSJSE12tcyJ/q+9yn9rHfyQ
	9FMcSMQ5KjfUNDswRvt68gVB54mNVQMxKhEzd8ZtcSTbBIup3/eQweAewB6orYa/Pj+yvrsihugWN
	R7a/6fdLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kflcf-0002DD-3T; Thu, 19 Nov 2020 15:13:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kflcd-0002D6-OB
 for linux-mtd@merlin.infradead.org; Thu, 19 Nov 2020 15:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=aI9mH0dq7mTuWpujo4T+CjmE2gbvb95KnVfM843FQ84=; b=NQxl2LUeXdxB2yfG38WXbOdZDF
 4m3yXl2LUAYY4UoHaaLjO55fQMRmjPGQ3+B+xj1A4lwNOqB+KRFQoIk1nbaMMuKB/WnQRRcUmsRbV
 R2K9qIjBs0hPN6TTWcG6BAmilJQG1snUXu5nywrLj8Cz/xFJxvZUmVOZATxF0u8B82LwZZSJWb1hl
 RGyLJC+B2H7/mLhmvZRyTkib7wsKGqq179e8VAUmByqV2VbOMsqMaYFdiiZ3EUGK3Uw1hPAA3usoO
 WlHH4d0KOLmy0/ejtH1mtQgmdWJPaNlHqDfX4UPUMcxUgftU+j2y1V0nrwb5yjBJnF9f3J8T+0xqW
 MLlqYaTw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kflcb-0002ed-15; Thu, 19 Nov 2020 15:13:17 +0000
Date: Thu, 19 Nov 2020 15:13:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 17/20] filemap: consistently use ->f_mapping over
 ->i_mapping
Message-ID: <20201119151316.GH29991@casper.infradead.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-18-hch@lst.de>
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
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 09:47:57AM +0100, Christoph Hellwig wrote:
> @@ -2887,13 +2887,13 @@ EXPORT_SYMBOL(filemap_map_pages);
>  vm_fault_t filemap_page_mkwrite(struct vm_fault *vmf)
>  {
>  	struct page *page = vmf->page;
> -	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	struct inode *inode = vmf->vma->vm_file->f_mapping->host;
>  	vm_fault_t ret = VM_FAULT_LOCKED;
>  
>  	sb_start_pagefault(inode->i_sb);
>  	file_update_time(vmf->vma->vm_file);
>  	lock_page(page);
> -	if (page->mapping != inode->i_mapping) {
> +	if (page->mapping != vmf->vma->vm_file->f_mapping) {

Bit messy.  I'd do:

	struct address_space *mapping = vmf->vma->vm_file->f_mapping;

	sb_start_pagefault(mapping->host->i_sb);

	if (page->mapping != mapping)

	sb_end_pagefault(mapping->host->i_sb);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
