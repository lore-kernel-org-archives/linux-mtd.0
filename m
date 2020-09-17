Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8686C43463
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 22:04:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022E320872
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 22:04:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="21olIhda";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ICDUnkL7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022E320872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MPMn9vArCS183V0/ENUsTpaflKvxFpZjtTDPMEAyi84=; b=21olIhdaZ1BmBRnG7/gpJ4Xi2
	5deIhhmIGN3UcmC4ATBQ+BgkNWPwiJGhRTHCwIUHFmI1u+gko4aMeZhomaTOIm235KfrufiosRU5p
	nUluZ8Og2gL8jj6/NfTXUICk2ipdOTljEEsbwY3Ubpq8u52DWearVnvOs3psZFhM5qgJNT+XWau0A
	+515oPlXRgJPULWbPdbLW4krOd0waI3y203zM9RwROpm/kj9awW979hJylTOe0EHgsEDNOAPCSSkQ
	ZzcyGdqjW7eaGVpPoKmZdCXk86c/Z0M37m+hDfWgEylh0uh1LyomeXeQhn+R9kscISKh2ARXcgACv
	k2BFYWtYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ1zk-0001vB-18; Thu, 17 Sep 2020 22:03:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ1zh-0001uf-NR; Thu, 17 Sep 2020 22:03:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ubJtVk08jzU3J8YPE2lJLRaYSsnYYHZKYdrpjiW6yU4=; b=ICDUnkL72CW96WATA+3jxM5vWb
 6oYT1enLOn3O4Ag28G+e5sc4FqNNUy2Ikgxnpx/LhvjaiBKvrZWAbYzkaYIkc/NjzWtAUaMsW8kTk
 Yue6qkZhlQb9iYXfoXv9v9sKs+He0hXzIgOzvhGW01abuVdlCsLu5ep5X71lnTxbrbq9ljbXhS2jN
 fZS2WZ9OlwwNROzSqPlT2fhEu7ifLnDLSIWkeEha9ouk+MkogWQ6Zy5o5FAh5nDVbZ7+o9C1tZcrW
 sIbCrABL5nerc0GAMK3sNquTExIDELUO/f3nddMDsbHnosACnqilx6WvwEtmQbtPzdCn8oS1kPCcM
 eCOrz5Qw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kJ1zf-0003eq-8d; Thu, 17 Sep 2020 22:03:07 +0000
Date: Thu, 17 Sep 2020 23:03:07 +0100
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 01/13] mm: Add AOP_UPDATED_PAGE return value
Message-ID: <20200917220307.GX5449@casper.infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-2-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917151050.5363-2-willy@infradead.org>
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
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2020 at 04:10:38PM +0100, Matthew Wilcox (Oracle) wrote:
> +++ b/mm/filemap.c
> @@ -2254,8 +2254,10 @@ ssize_t generic_file_buffered_read(struct kiocb *iocb,
>  		 * PG_error will be set again if readpage fails.
>  		 */
>  		ClearPageError(page);
> -		/* Start the actual read. The read will unlock the page. */
> +		/* Start the actual read. The read may unlock the page. */
>  		error = mapping->a_ops->readpage(filp, page);
> +		if (error == AOP_UPDATED_PAGE)
> +			goto page_ok;
>  
>  		if (unlikely(error)) {
>  			if (error == AOP_TRUNCATED_PAGE) {

If anybody wants to actually test this, this hunk is wrong.

+++ b/mm/filemap.c
@@ -2256,8 +2256,11 @@ ssize_t generic_file_buffered_read(struct kiocb *iocb,
                ClearPageError(page);
                /* Start the actual read. The read may unlock the page. */
                error = mapping->a_ops->readpage(filp, page);
-               if (error == AOP_UPDATED_PAGE)
+               if (error == AOP_UPDATED_PAGE) {
+                       unlock_page(page);
+                       error = 0;
                        goto page_ok;
+               }
 
                if (unlikely(error)) {
                        if (error == AOP_TRUNCATED_PAGE) {

> @@ -2619,7 +2621,7 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  	 */
>  	if (unlikely(!PageUptodate(page)))
>  		goto page_not_uptodate;
> -
> +page_ok:
>  	/*
>  	 * We've made it this far and we had to drop our mmap_lock, now is the
>  	 * time to return to the upper layer and have it re-find the vma and
> @@ -2654,6 +2656,8 @@ vm_fault_t filemap_fault(struct vm_fault *vmf)
>  	ClearPageError(page);
>  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>  	error = mapping->a_ops->readpage(file, page);
> +	if (error == AOP_UPDATED_PAGE)
> +		goto page_ok;
>  	if (!error) {
>  		wait_on_page_locked(page);
>  		if (!PageUptodate(page))
> @@ -2867,6 +2871,10 @@ static struct page *do_read_cache_page(struct address_space *mapping,
>  			err = filler(data, page);
>  		else
>  			err = mapping->a_ops->readpage(data, page);
> +		if (err == AOP_UPDATED_PAGE) {
> +			unlock_page(page);
> +			goto out;
> +		}
>  
>  		if (err < 0) {
>  			put_page(page);
> -- 
> 2.28.0
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
