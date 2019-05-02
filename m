Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F42EC43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 13:04:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43592063F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 13:04:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o12Xus63"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43592063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fXmZvQDaiMhyVDEiKByIf10X8QdVtwLxgd2NwyJvn0s=; b=o12Xus63DY1VCd
	2fu/1qPvDQyXCtp2NOyiY81pEDVAuT7hLVPJpsPrLE5LqwVBK4Liqwts39yrGT7959OK7IxL2fyIj
	8EokKfu24H3XXgS0a7bnnSzQXj+sahzH6fEUdmaoQvcDT2BtfICiQhECh+sA2g/bDQzwxF2+rRDUC
	3IYbxXQGMx5wHnjnoqElB8sXg9UeKiAqgT/O7Fec66/r4pxE/STge7vAvO0dv7xyGMCpMCW72BqqW
	7ImvDC0qSMf5kWbXh5T97nhbUXwZrfQNQ/3TN0ldPnEzGlM7dRj7SAQG1QBudFCZwgaAs3fWtwXMZ
	gXhEvqrmEvKxyhzvEv7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hMBO2-0006Gq-J8; Thu, 02 May 2019 13:04:30 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hMBNw-0006Ff-1q
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 13:04:28 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id B32F368AFE; Thu,  2 May 2019 15:04:05 +0200 (CEST)
Date: Thu, 2 May 2019 15:04:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH 5/4] 9p: pass the correct prototype to read_cache_page
Message-ID: <20190502130405.GA2679@lst.de>
References: <20190501160636.30841-1-hch@lst.de> <20190501173443.GA19969@lst.de>
 <AEBFD2FC-F94A-4E5B-8E1C-76380DDEB46E@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AEBFD2FC-F94A-4E5B-8E1C-76380DDEB46E@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190502_060424_245010_204C1F2C 
X-CRM114-Status: UNSURE (   7.99  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 02, 2019 at 12:08:29AM -0600, William Kucharski wrote:
> 1) You need to pass "filp" rather than "filp->private_data" to read_cache_pages()
> in v9fs_fid_readpage().

With this patch v9fs_fid_readpage takes a void pointer that must be
a FID, and we pass the FID everywhere:

 - v9fs_vfs_readpage passes filp->private_data
 - v9fs_vfs_readpages passes filp->private_data through
   read_cache_pages
 - v9fs_write_begin passes the local fid variable


> 
> The patched code passes "filp->private_data" as the "data" parameter to
> read_cache_pages(), which would generate a call to:
> 
>     filler(data, page)
> 
> which would become a call to:
> 
> static int v9fs_vfs_readpage(struct file *filp, struct page *page)
> {	
>         return v9fs_fid_readpage(filp->private_data, page);
> }

Except that we don't pass v9fs_vfs_readpage as the filler any more,
we now pass v9fs_fid_readpage.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
