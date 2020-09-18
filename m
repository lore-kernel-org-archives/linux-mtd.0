Return-Path: <SRS0=UcWI=C3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA935C43464
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 06:01:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13EF320789
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Sep 2020 06:01:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K19i1WpT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13EF320789
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codewreck.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GP5YFgJefygCI1LEsgFdmvccpme6I+leQBpPz/rG8zw=; b=K19i1WpTUragVZpzlxY51mln5
	nXfA7UozPKi6rW2eNLCdZNyqkLgloA90yrvVhRu/plqgh7ILUKZbyMfONX6focCGjhajSeeE0FVFN
	anVvB49wWVMg/JPrBcDbWe7cm7vM1xXw8QNOulIzrUAZpjlEO+KcZiPQjKpsRmP8xQMrrLjZptgFw
	13lpvrEpiKE+WWYAqWmoSmr+yNg5w5rGWoDW8l8RRw2MttrVfFBPoBkU/Pts59ANu/n3gIQEYrdfV
	DN/WVB+NuC3OpkN9WmMy5UQhlwr0YwkImPyS39hywSVPO4s5EAh2flQCTR7tf3AbiuWi3QAIeZ+wD
	AhV6eArXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJ9Qs-0003Aa-9d; Fri, 18 Sep 2020 05:59:42 +0000
Received: from ipv6.notk.org ([2001:41d0:1:7a93::1] helo=nautica.notk.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJ9Qo-00039Z-FY; Fri, 18 Sep 2020 05:59:40 +0000
Received: by nautica.notk.org (Postfix, from userid 1001)
 id 5EAEFC01B; Fri, 18 Sep 2020 07:59:34 +0200 (CEST)
Date: Fri, 18 Sep 2020 07:59:19 +0200
From: Dominique Martinet <asmadeus@codewreck.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Subject: Re: [V9fs-developer] [PATCH 02/13] 9p: Tell the VFS that readpage
 was synchronous
Message-ID: <20200918055919.GA30929@nautica>
References: <20200917151050.5363-1-willy@infradead.org>
 <20200917151050.5363-3-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917151050.5363-3-willy@infradead.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_015938_615949_057A13BD 
X-CRM114-Status: GOOD (  13.85  )
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
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
 linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Matthew Wilcox (Oracle) wrote on Thu, Sep 17, 2020:
> diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
> index cce9ace651a2..506ca0ba2ec7 100644
> --- a/fs/9p/vfs_addr.c
> +++ b/fs/9p/vfs_addr.c
> @@ -280,6 +280,10 @@ static int v9fs_write_begin(struct file *filp, struct address_space *mapping,
>  		goto out;
>  
>  	retval = v9fs_fid_readpage(v9inode->writeback_fid, page);
> +	if (retval == AOP_UPDATED_PAGE) {
> +		retval = 0;
> +		goto out;
> +	}

FWIW this is a change of behaviour; for some reason the code used to
loop back to grab_cache_page_write_begin() and bail out on
PageUptodate() I suppose; some sort of race check?
The whole pattern is a bit weird to me and 9p has no guarantee on
concurrent writes to a file with cache enabled (except that it will
corrupt something), so this part is fine with me.

What I'm curious about is the page used to be both unlocked and put, but
now isn't either and the return value hasn't changed for the caller to
make a difference on write_begin / I don't see any code change in the
vfs  to handle that.
What did I miss?


(FWIW at least cifs in the series has the same pattern change; didn't
check all of them)


Thanks,
-- 
Dominique

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
