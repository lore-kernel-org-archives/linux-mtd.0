Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EwnHF-0004bU-Li
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 16:13:11 -0500
Received: from mail.shareable.org (localhost [127.0.0.1])
	by mail.shareable.org (8.12.8/8.12.8) with ESMTP id k0BLCxHc007584
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jan 2006 21:12:59 GMT
Received: (from jamie@localhost)
	by mail.shareable.org (8.12.8/8.12.8/Submit) id k0BLCxaN007579
	for linux-mtd@lists.infradead.org; Wed, 11 Jan 2006 21:12:59 GMT
Date: Wed, 11 Jan 2006 21:12:59 +0000
From: Jamie Lokier <jamie@shareable.org>
To: linux-mtd@lists.infradead.org
Message-ID: <20060111211259.GA27357@mail.shareable.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Question about JFFS2 space overhead
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have a 1MB partition (on an 8MB chip), on which I'm using JFFS2.
The kernel is 2.4.26-uc0 (uclinux), with patches.

The intention is to store some executables, configuration and scripts
which have to be updated occasionally, and logs which must be updated
regularly.

I'm rather surprised to find it reporting as full sometimes.

According to du, it has 510k of data on it right now.
According to df, it has 916k (108 available, 1024 total).

    # du -s /mnt/flash
    510     /mnt/flash
    # df /mnt/flash
    Filesystem           1k-blocks      Used Available Use% Mounted on
    /dev/mtdblock/2           1024       916       108  89% /mnt/flash

When I try to do little things like touching a file, or even setting
timestamps on existing files, it reports "No space left on device".

Is this due to the space required for garbage collection?

In the JFFS2 paper at
http://sourceware.org/jffs2/jffs2-html/node4.html#SECTION00042000000000000000
it says:

    A major annoyance for users is the amount of space currently required
    to be left spare for garbage collection. It is hoped that a formal
    proof of the amount of required space can be produced, but in the
    meantime a very conservative approach is taken -- five full erase
    blocks must be available for writing before new writes will be
    permitted from user space.

This chip has 64k erase blocks, so that would be 320k of space
consumed for eraseblocks.  Is that why I can't write the smallest
thing when the 1024k filesystem has only 510k of data?  And that
doesn't explain (to me) why the filesystem reports 916k usage.

My most important question is: how much data can I reliably store on a
1MB JFFS2 partition, before I might see write errors?  At the moment,
I don't know how big I need the partition to be, because I don't know
how much space files can effectively take after many writes.  Most of
the time, I have no problem with these files, or indeed larger ones.
It is only occasionally, after several updates, that it gets into this
state.

>From the paper which mentions 5 eraseblocks, I might expect df's
"used" to include those, plus any alignment overhead, and for writes
to stop exactly the point where "available" reaches zero.  But I don't
see that, and I'm surprised that I cannot even fill it to 50% reliably.

Is this to be expected, or is something wrong?  Also, any advice in
picking the most reliable JFFS2 code with 2.4 kernels would be
appreciated, as I saw a number of messages in the archive recently
about data loss problems.

Thanks,
-- Jamie
