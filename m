Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2AC7EE2D
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Jun 2023 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZAofVEjI2638R/0ulDMW61scVCOCivB1Q8LvuMY3Nag=; b=MCRgRuj9YnDzEt
	3ldeFybYgmR15YPVPVAsAvo9OttqH3N3OAE7UAFR+9ju7/B8oABNDGwoBwHx+HNL9p+DhaSVfqVAH
	B38+WSFFZ3bvIguJra5p6mchJ4ssYlREbka9v5YQX3OYdl0DFNhpRAXZSgusrQ0N7ndF3idYoRSRv
	ACSEcVdDEhXpsZu8o3+khdQtbA/rj84hygj2gYza+iTWg+EE52EFuY5fDTBbj9BV4DX2WsQg8uWFk
	Vnu77pd+KYrRSCta8VYy9t9faureTvqFxqFouZlLtsXdT+wdzDIq3db3T7IfhIhsZc3zqtgCjqI8B
	dJTLd7BLwRVBnNOTW3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ddn-00GEMh-2Y;
	Mon, 05 Jun 2023 17:05:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ddm-00GEMT-2o
	for linux-mtd@bombadil.infradead.org;
	Mon, 05 Jun 2023 17:05:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LBEHna36Uqv0DtI27xHHPAjPGLK1nkaVHaUv/vrGrqc=; b=H/yLWyeN4OqUM4cMLvEOC1taDO
	Hpa4Fe79T8Y4Y6SfisBrVTRWiQ5mpyoDtzgAYDsgPaGsbu+2uMLPGPua+IWXlicLctjfuVOBYWyR+
	TzNVy4P2Fr3yguKQH8E8xhCK0q3DWc4Ms8tclnh0ZEVjC2FhubQkQL2zT6BdXEcPpYg8J4lrd8qGE
	9qViKdZQq18AFRCSWGG6Rm5cdPx0V2s1rz/kjHQ5R5Vk7cGHjYh8BXMNJO73V/iit1QL06SFatwaY
	ZP0r6BCFNJBN7Wslh2rCt9R/saxvZkm2E9WdBtQDDBMnVXiSCzTHMv9tsUj5JXahTPxC/BVMDn/Hd
	Xc1dAm7A==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q6Ddl-00CDQa-Eb; Mon, 05 Jun 2023 17:05:09 +0000
Date: Mon, 5 Jun 2023 18:05:09 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 3/4] ubifs: Use a folio in do_truncation()
Message-ID: <ZH4VxTWB3d9oNW5X@casper.infradead.org>
References: <20230605165029.2908304-1-willy@infradead.org>
 <20230605165029.2908304-4-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605165029.2908304-4-willy@infradead.org>
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

On Mon, Jun 05, 2023 at 05:50:28PM +0100, Matthew Wilcox (Oracle) wrote:
> Convert from the old page APIs to the new folio APIs which saves
> a few hidden calls to compound_head().

Argh.  This fix was supposed to be folded in.


diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index 1b2055d5ec5f..67cf5138ccc4 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -1161,7 +1161,7 @@ static int do_truncation(struct ubifs_info *c, struct inode *inode,
 		struct folio *folio;
 
 		folio = filemap_lock_folio(inode->i_mapping, index);
-		if (folio) {
+		if (!IS_ERR(folio)) {
 			if (folio_test_dirty(folio)) {
 				/*
 				 * 'ubifs_jnl_truncate()' will try to truncate

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
