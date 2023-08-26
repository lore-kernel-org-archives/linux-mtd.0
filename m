Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD24DC83F11
	for <linux-mtd@archiver.kernel.org>; Sat, 26 Aug 2023 02:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lUeDDfQU4otg9KGixbSyhZhriNDKE7BuPDkiH/uQF+o=; b=H8A3btyONXyqke
	10/mO7/q+qQGaYi2vHPrtc/F13YbEVjGZZb30ooLeuw9CTz21gkP8Jcv0aA4aNie9d/lBZhFor7bL
	9BrRSEdqwl9Ci5xzw55EJxQu2EKsM4RRro74kNcun2OlIdne77r9P1a9KEKSeKkK9dA6wDYPBPWR5
	K7HPl7OBu9Bze6a/ySKo7nVNYmxih0A3nzZszpxes6RATZw0cMkOayDY5uMFv8ub+UKMzE6vtIwy4
	BqJVn2nUuUOGZb0jK7skD9D3uG5Pyq2srWnyc1PS+iPmqGAO2BW966zxcNjKVA0wOwrWd0qvP+uUK
	rucBmjrQUe6h8KRekKTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZj3T-006Jm7-0e;
	Sat, 26 Aug 2023 02:29:39 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZj3Q-006JlI-0d;
	Sat, 26 Aug 2023 02:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kRz17k12DLtH5ptlx3fiiancvtShyoQwDvuAAOUED4Y=; b=mPm/qZCa7MWW4zdrpIjhXYeIS6
	8cbIgOvCf/9Y6gIxhhuc7MbOClbX1o3H4gTlXLJmOpOyil1pufLmdD8oxm6VhlxB4x6C/OQmKz1OC
	9Sg7eN60e8HGn0pn/DtWEZ2zi7uHlJyyQNolWeGdXQEgqn78/62UYsbUB8gsUgOw68YkPTd36+fo0
	kPzizyM3mKJ55bukbV99w6F1Yx4exn0ELF0EHA2mn4TEClpd2hjjcTiwEbEGv+vsWkEq4IC7ejHjR
	rO8uE9/3ipL5VpLJjGdd7WJssIdQ5Tj/z+j2E3fQDWI0Qb9TMLDhfRhfBXk5sw2QK4rJI42xn3tDe
	SBJa1VHw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qZj2i-0010QB-1S;
	Sat, 26 Aug 2023 02:28:52 +0000
Date: Sat, 26 Aug 2023 03:28:52 +0100
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
	xen-devel@lists.xenproject.org, Jens Axboe <axboe@kernel.dk>,
	Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2 0/29] block: Make blkdev_get_by_*() return handle
Message-ID: <20230826022852.GO3390869@ZenIV>
References: <20230810171429.31759-1-jack@suse.cz>
 <20230825015843.GB95084@ZenIV>
 <20230825134756.o3wpq6bogndukn53@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230825134756.o3wpq6bogndukn53@quack3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_192936_257066_6B0C97AB 
X-CRM114-Status: GOOD (  29.31  )
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

On Fri, Aug 25, 2023 at 03:47:56PM +0200, Jan Kara wrote:

> I can see the appeal of not having to introduce the new bdev_handle type
> and just using struct file which unifies in-kernel and userspace block
> device opens. But I can see downsides too - the last fput() happening from
> task work makes me a bit nervous whether it will not break something
> somewhere with exclusive bdev opens. Getting from struct file to bdev is
> somewhat harder but I guess a helper like F_BDEV() would solve that just
> fine.
> 
> So besides my last fput() worry about I think this could work and would be
> probably a bit nicer than what I have. But before going and redoing the whole
> series let me gather some more feedback so that we don't go back and forth.
> Christoph, Christian, Jens, any opinion?

Redoing is not an issue - it can be done on top of your series just
as well.  Async behaviour of fput() might be, but...  need to look
through the actual users; for a lot of them it's perfectly fine.

FWIW, from a cursory look there appears to be a missing primitive: take
an opened bdev (or bdev_handle, with your variant, or opened file if we
go that way eventually) and claim it.

I mean, look at claim_swapfile() for example:
                p->bdev = blkdev_get_by_dev(inode->i_rdev,
                                   FMODE_READ | FMODE_WRITE | FMODE_EXCL, p);
                if (IS_ERR(p->bdev)) {
                        error = PTR_ERR(p->bdev);
                        p->bdev = NULL;
                        return error;
                }
                p->old_block_size = block_size(p->bdev);
                error = set_blocksize(p->bdev, PAGE_SIZE);
                if (error < 0)
                        return error;
we already have the file opened, and we keep it opened all the way until
the swapoff(2); here we have noticed that it's a block device and we
	* open the fucker again (by device number), this time claiming
it with our swap_info_struct as holder, to be closed at swapoff(2) time
(just before we close the file)
	* flip the block size to PAGE_SIZE, to be reverted at swapoff(2)
time That really looks like it ought to be
	* take the opened file, see that it's a block device
	* try to claim it with that holder
	* on success, flip the block size
with close_filp() in the swapoff(2) (or failure exit path in swapon(2))
doing what it would've done for an O_EXCL opened block device.
The only difference from O_EXCL userland open is that here we would
end up with holder pointing not to struct file in question, but to our
swap_info_struct.  It will do the right thing.

This extra open is entirely due to "well, we need to claim it and the
primitive that does that happens to be tied to opening"; feels rather
counter-intuitive.

For that matter, we could add an explicit "unclaim" primitive - might
be easier to follow.  That would add another example where that could
be used - in blkdev_bszset() we have an opened block device (it's an
ioctl, after all), we want to change block size and we *really* don't
want to have that happen under a mounted filesystem.  So if it's not
opened exclusive, we do a temporary exclusive open of own and act on
that instead.   Might as well go for a temporary claim...

BTW, what happens if two threads call ioctl(fd, BLKBSZSET, &n)
for the same descriptor that happens to have been opened O_EXCL?
Without O_EXCL they would've been unable to claim the sucker at the same
time - the holder we are using is the address of a function argument,
i.e. something that points to kernel stack of the caller.  Those would
conflict and we either get set_blocksize() calls fully serialized, or
one of the callers would eat -EBUSY.  Not so in "opened with O_EXCL"
case - they can very well overlap and IIRC set_blocksize() does *not*
expect that kind of crap...  It's all under CAP_SYS_ADMIN, so it's not
as if it was a meaningful security hole anyway, but it does look fishy.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
