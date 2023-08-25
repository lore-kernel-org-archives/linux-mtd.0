Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8504BC79F60
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 14:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=THzYEkojJqTW1HqC8zEfLUY2boEE86y69XbzqEgvm7k=; b=l9dwSMq5SdqzPA
	rrHPXODDUPXARIqP01ir13rgkUIxU1SWrF05QatGFnpAYEiDS8mQIcwFO/4/TEspblXR0SNC+Ad1A
	dOI1a4IDBakLNzvVCo4pn5+FmyqOqZW7GciVzVYWw8Kd31Qp8iVOSZoJssywfTSPENUc1HWxesdNk
	bFP+VMeHi+VeiB46s+8Q1PdNVCJBjdaUQ/HgI6Rprl141KYHvfeqQnBa9MHYGPx4j9MyDtTQarKEG
	KwuAZipNpP7WpugFS6hJ2DfMLm7RuaGiJr2K3O+EotjR6Ip0Y8J09AIgn0Cii8i4VDQkWXsC9Udfg
	Su31d6/YMnh5unrVPyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXV2-005ZYv-2l;
	Fri, 25 Aug 2023 14:09:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZXV1-005ZYN-38
	for linux-mtd@bombadil.infradead.org;
	Fri, 25 Aug 2023 14:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EU4c+QvmUrzx56YT6HV/cCIR2Pjqx+IXpn7k2GV7Q+c=; b=sXnwInRucx8CcJKwrlTfZ031er
	LEY7y8jsL9Hib5zZnhCnKvqEBOaupx8CYhaoOaWj/VYF41GGvSOMwZwP7gnqnUjyUY5nybhBoSrxT
	cix5TlGhcoCY3jjdx5/eXfy7PSYCUWLL6z2ZL1LRTqjCJLf619sI6Mfr/SSckV734m8GK683QEHy+
	aF/xKkJIUvAhE/VXofyvjMKZ4LYU11OPTfozENym+/mg5hUGQWADpmiwU301hOx3e6IcpV8ta4h3y
	7U3MMVZnd623qdMqd3D0FkVtdSaK+AiLgU+Qa7F9jQSRFB1EUCUT2iSVWxr49S72DAzkgcEx6R3cM
	2mytwuWw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qZXUl-00HWBm-5H; Fri, 25 Aug 2023 14:09:03 +0000
Date: Fri, 25 Aug 2023 15:09:03 +0100
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
Subject: Re: [PATCH 22/29] xfs: comment page allocation for nowait case in
 xfs_buf_find_insert()
Message-ID: <ZOi1/yafn3HQFWnW@casper.infradead.org>
References: <20230825135431.1317785-1-hao.xu@linux.dev>
 <20230825135431.1317785-23-hao.xu@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825135431.1317785-23-hao.xu@linux.dev>
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

On Fri, Aug 25, 2023 at 09:54:24PM +0800, Hao Xu wrote:
> @@ -633,6 +633,8 @@ xfs_buf_find_insert(
>  	 * allocate the memory from the heap to minimise memory usage. If we
>  	 * can't get heap memory for these small buffers, we fall back to using
>  	 * the page allocator.
> +	 * xfs_buf_alloc_kmem may return -EAGAIN, let's not return it but turn
> +	 * to page allocator as well.

This new sentence seems like it says exactly the same thing as the
previous sentence.  What am I missing?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
