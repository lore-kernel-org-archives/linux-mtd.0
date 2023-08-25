Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EC56C71133
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=adt8+yZtcWWeiBqzW2uzD2quAPPmUUB1Td+/htecayc=; b=nAAMVLG3xbRkNI
	0/kXNoKf8ZFUXPfZKOuz52jLYSEEGZ9CFcwBVRij/NgYvTQw9WBvU8uDmyvSASaymS2sluk1lFcuA
	1Zr4rGf99BqcrdeaT1G0JRB19sCCY/SJ4Xcqw+EJVItNC0+Wtu1ujBZlxZ7F/HsOvQog6tFGDZe0m
	s/Vbeb26M5gF8mBTTQvqCaFmChEnedK5li70SDDmjAAs/HZNGK/tHaxGNeEu90KlpBlfMbUQCzV70
	Z/okSUZG3JGROC5Po9Th/+buRNpyZiGeOlRTs1Digh05zYC4I8flb3REe2XSB7DyvvVqn0CIqIzGU
	VdexUqhbB0y5szbqhirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXfw-005aat-0p;
	Fri, 25 Aug 2023 14:20:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXfu-005aai-0O
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Aug 2023 14:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rIMc/jDCj9ILMqoJd0dO659w/9cB73A1MIGl7MCNQc0=; b=oBoPRF9uQlcnzO+kvA9HXiHIxh
	1BCZOYk+GNL3b9Hbl9e0kK321R7GUMuXBq5CnzZVygX8jax4dLYLnGd1XSzW1m9qVXov6cTXOpVyv
	sv5l1EBw3uu95Jxon5Sw3wlu1qTTRFkBQCTr+N8L/Prb1jdIi5jstgZjfRsnuOwWr9LDfkxjeCY5c
	UoI4nSwH2jPxj2QMMHZp0Wkb5xy7QvRuP3ObBs4CYLKVGqr6YBri4brVlX/zJEjbKcNGc0kRvuWzw
	6Da7DA+BObM8TzfQI+r1SxtKCOrEiJNsg27vpqxgEagx4gi10g2HUFqfKuMQw4f6GgzpXJkYlNle8
	RUhWro7w==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qZXfd-00HYsg-Qa; Fri, 25 Aug 2023 14:20:17 +0000
Date: Fri, 25 Aug 2023 15:20:17 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Hao Xu <hao.xu@linux.dev>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Pavel Begunkov <asml.silence@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Stefan Roesch <shr@fb.com>, Clay Harris <bugs@claycon.org>,
	Dave Chinner <david@fromorbit.com>,
	"Darrick J . Wong" <djwong@kernel.org>,
	linux-fsdevel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-cachefs@redhat.com,
	ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-unionfs@vger.kernel.org, bpf@vger.kernel.org,
	netdev@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-nilfs@vger.kernel.org,
	devel@lists.orangefs.org, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-mtd@lists.infradead.org,
	Wanpeng Li <wanpengli@tencent.com>
Subject: Re: [PATCH 12/29] xfs: enforce GFP_NOIO implicitly during nowait
 time update
Message-ID: <ZOi4oV7Ho3y0106O@casper.infradead.org>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-13-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-13-hao.xu@linux.dev>
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

On Fri, Aug 25, 2023 at 09:54:14PM +0800, Hao Xu wrote:
> +++ b/fs/xfs/xfs_iops.c
> @@ -1037,6 +1037,8 @@ xfs_vn_update_time(
>  	int			log_flags = XFS_ILOG_TIMESTAMP;
>  	struct xfs_trans	*tp;
>  	int			error;
> +	int			old_pflags;
> +	bool			nowait = flags & S_NOWAIT;
>  
>  	trace_xfs_update_time(ip);
>  
> @@ -1049,13 +1051,18 @@ xfs_vn_update_time(
>  		log_flags |= XFS_ILOG_CORE;
>  	}
>  
> +	if (nowait)
> +		old_pflags = memalloc_noio_save();
> +
>  	error = xfs_trans_alloc(mp, &M_RES(mp)->tr_fsyncts, 0, 0, 0, &tp);

This is an abuse of the memalloc_noio_save() interface.  You shouldn't
be setting it around individual allocations; it's the part of the kernel
which decides "I can't afford to do I/O" that should be setting it.
In this case, it should probably be set by io_uring, way way way up at
the top.

But Jens didn't actually answer my question about that:

https://lore.kernel.org/all/ZMhZh2EYPMH1wIXX@casper.infradead.org/


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
