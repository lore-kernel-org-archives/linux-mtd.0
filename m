Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9250C83F14
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Aug 2023 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVojmtjXjokY4AXC49v76BefW0lkG4VVdulb6XBymKs=; b=mlmgz1bDVVxDb/
	ZPiBHFevEFUdOtnz9fIJYwVvg8YRHlfs2ai26qQ9KuwMRmRRw8nnlpoOCvxaB+f2C5A9S0keOHnJ8
	a7oO7e11RmuxvySKOurK/HlF6q9sA25KD6hEhYx4kB/TjoihBU3WS7rAe9bRtJFk8Coq2OlfUREeg
	sH654ndXL5M8UYkqTk7IbHhSghqAVyJtHy+5OQB4OPcOEQbb6JlAIEsHkncswN4c7yCUGxNxk97dP
	+fMgEdQaiGdxUjNMiDIOptCipkNNIBgFAfZfrZhcxrc+2L5aEDSyk3A+j5k2cwcQWGNA4oobfS6QY
	Sdb+mbYY6UFmGVVYzWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxHj-00BRy6-1f;
	Tue, 29 Aug 2023 11:53:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaxHi-00BRxx-21
	for linux-mtd@bombadil.infradead.org;
	Tue, 29 Aug 2023 11:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=YZxpYOTF14BVcouqFhbahruwZXBLTSy2TCKsEoryGgA=; b=kNMS0YeYJE43XRXxkVUmLf2G+X
	0F+Ci8x/vmTvip6eYnQqjlZo85hPiq+1XBtqpwy24WfkqxJcN3oDroYdU0hmUGTZO8DmOvrKcLnsA
	I7wiz/QgNWUfJcZJ1P+jwtCGJuvaBfIm6i+nYBm4G4q1TzqZrEd8vmeeXhUF+nfDcEVXWTUFH8hQX
	gmgzKK6rDBAyLZFUyKz32+/IHnRsGl+xYuxNBS8JVzpCmXVMJxm/LAsn2AL2YmcWHqJedjjw347sz
	rnlxqkUfOTw1wHOoS2VuCxy8fDxR1A9rikvDXoQ9fhtzraRL7eHJTnjVX6n6aHUnUp8GZkipnoXzv
	988YMF3g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qaxHQ-006P4x-1X; Tue, 29 Aug 2023 11:53:08 +0000
Date: Tue, 29 Aug 2023 12:53:07 +0100
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
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Message-ID: <ZO3cI+DkotHQo3md@casper.infradead.org>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
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

On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
> On 8/28/23 05:32, Matthew Wilcox wrote:
> > On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
> > > From: Hao Xu <howeyxu@tencent.com>
> > > 
> > > Add a boolean parameter for file_accessed() to support nowait semantics.
> > > Currently it is true only with io_uring as its initial caller.
> > 
> > So why do we need to do this as part of this series?  Apparently it
> > hasn't caused any problems for filemap_read().
> > 
> 
> We need this parameter to indicate if nowait semantics should be enforced in
> touch_atime(), There are locks and maybe IOs in it.

That's not my point.  We currently call file_accessed() and
touch_atime() for nowait reads and nowait writes.  You haven't done
anything to fix those.

I suspect you can trim this patchset down significantly by avoiding
fixing the file_accessed() problem.  And then come back with a later
patchset that fixes it for all nowait i/o.  Or do a separate prep series
first that fixes it for the existing nowait users, and then a second
series to do all the directory stuff.

I'd do the first thing.  Just ignore the problem.  Directory atime
updates cause I/O so rarely that you can afford to ignore it.  Almost
everyone uses relatime or nodiratime.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
