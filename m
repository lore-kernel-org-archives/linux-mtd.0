Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF66C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  3 May 2022 14:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dd+i+dzBiMRtzlggUCExzPSv4ZmWivXJKLQstem8SOA=; b=suwBfVxVBkk9Zq
	O/PQwOM4TUlo+20u673s+zmQEGF9TjxM5EfkCSxjdUoHGddnHgxjNh8ILfeLUWJ2tTWfL9wQa/Ox1
	2T4TxOJNEeFbDysp8ErtgugeAVehoa/TlYrKJCUyOh7VCYSR7nax0uDAIovHGMZt+mpHkLA9b9Yp8
	kfDY6b3grxhwAQsAJUcsj+xsnhaAFCZkHIglzK3MxAyTv7dqITjVOOhUODvrgiOTU0jwcg8VhQI9E
	8uQOojjaoB5nan5Kkwkz4v4+vmvnjDV4sA+oGvz7sWOP28cuoNUZalEs8IktZWPulom2RrQ80xcMN
	77mqMaPHigebhhN6qjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltPM-006EUQ-W4; Tue, 03 May 2022 14:21:45 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nltPL-006ETz-4e; Tue, 03 May 2022 14:21:43 +0000
Date: Tue, 3 May 2022 07:21:43 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, cluster-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org
Subject: Re: [PATCH 2/3] nfs: Pass the file pointer to nfs_symlink_filler()
Message-ID: <YnE6d2WvWRuxbk3j@infradead.org>
References: <20220502054159.3471078-1-willy@infradead.org>
 <20220502054159.3471078-3-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220502054159.3471078-3-willy@infradead.org>
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

On Mon, May 02, 2022 at 06:41:58AM +0100, Matthew Wilcox (Oracle) wrote:
> In preparation for unifying the read_cache_page() and read_folio()
> implementations, make nfs_symlink_filler() get the inode
> from the page instead of passing it in from read_cache_page().
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
