Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D683C3DA6F
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Aug 2023 01:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6tKfp9s+AAgwNP8rOEuJ2MgQA2+Xt7lvI78MV4eIO8=; b=NA7EJ9b30RU9Pq
	TWq8nnhzrqaD2i0Y2D7lBt1GzJDwM7sAuzTt32/Q2c1mtFzzQnwTZfYHVizDT+OhXis0KeR2AySH6
	FrT1t+adB2q5C3CxnyEKCRz6RUH/W6hUYjn6rd1hG5NlN9V7iahVbzdD03TDCWFb08t5BkwuUoii5
	Jp7kx6spYhgfqby2pkpW8XD15A//bq6sW1rHVfPpEMOwtNIeJPF3YLDFYY+P7zw0MnlDyWcKbsvgD
	dZLz/6h+xwnshJH7jW6d8BeOT/g44K89fDzDPQPb65uEhrsvu+mdBCPWB7tWAvRyiaT4rCaxOAHLf
	8vd5I8qeNKYiMRnsoOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZM6l-0046ZM-0t;
	Fri, 25 Aug 2023 01:59:31 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZM6i-0046YE-1E;
	Fri, 25 Aug 2023 01:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GqmLor0hgV4H3x7IuvuyaB/m3hDiUm8Yzrd7b9keFg8=; b=bxxlNJ96rsx4L2kKszQ8LF6ai5
	iNtBNOQ6lzvCMPjrA8d2B5SKpMA8ehWy3QlKX8FPouK+kPzVIEZKx+nUetaQRW5JSdDZgZ40B7sUp
	hz637OO4Su1eEUgn8Gl/dIA4NQM5w6cHamU5x0h4uc+j+8uZ5OMjiX5dOjWaEByfsbwcty7NjoKFy
	3XYbSKjy+5wYC+oyCRnyAV7fQupk+8Mu6cgtvaubPBjXdneuinMhpNkKRGbKhUYZMh2pnc+qlSq3t
	/phSE0e2tky2IO5H3c5MgeU2/J9SsgCPwQOsXy7U4/wxiV2850iLaIsQdHEKmyDTGxCmoecJk/YQG
	iXEtALAQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qZM5z-000dvR-0M;
	Fri, 25 Aug 2023 01:58:43 +0000
Date: Fri, 25 Aug 2023 02:58:43 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org, linux-block@vger.kernel.org,
	Christoph Hellwig <hch@infradead.org>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
	ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 0/29] block: Make blkdev_get_by_*() return handle
Message-ID: <20230825015843.GB95084@ZenIV>
References: <20230810171429.31759-1-jack@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230810171429.31759-1-jack@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230824_185928_419399_BEC219EB 
X-CRM114-Status: GOOD (  18.39  )
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

On Fri, Aug 11, 2023 at 01:04:31PM +0200, Jan Kara wrote:
> Hello,
> 
> this is a v2 of the patch series which implements the idea of blkdev_get_by_*()
> calls returning bdev_handle which is then passed to blkdev_put() [1]. This
> makes the get and put calls for bdevs more obviously matching and allows us to
> propagate context from get to put without having to modify all the users
> (again!).  In particular I need to propagate used open flags to blkdev_put() to
> be able count writeable opens and add support for blocking writes to mounted
> block devices. I'll send that series separately.
> 
> The series is based on Christian's vfs tree as of yesterday as there is quite
> some overlap. Patches have passed some reasonable testing - I've tested block
> changes, md, dm, bcache, xfs, btrfs, ext4, swap. This obviously doesn't cover
> everything so I'd like to ask respective maintainers to review / test their
> changes. Thanks! I've pushed out the full branch to:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git bdev_handle
> 
> to ease review / testing.

Hmm...  Completely Insane Idea(tm): how about turning that thing inside out and
having your bdev_open_by... return an actual opened struct file?

After all, we do that for sockets and pipes just fine and that's a whole lot
hotter area.

Suppose we leave blkdev_open()/blkdev_release() as-is.  No need to mess with
what we have for normal opened files for block devices.  And have block_open_by_dev()
that would find bdev, etc., same yours does and shove it into anon file.

Paired with plain fput() - no need to bother with new primitives for closing.
With a helper returning I_BDEV(bdev_file_inode(file)) to get from those to bdev.

NOTE: I'm not suggesting replacing ->s_bdev with struct file * if we do that -
we want that value cached, obviously.  Just store both...

Not saying it's a good idea, but... might be interesting to look into.
Comments?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
