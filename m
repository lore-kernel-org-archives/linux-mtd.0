Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19sJwK-0005e7-AF
	for <linux-mtd@lists.infradead.org>; Thu, 28 Aug 2003 11:23:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: John Hall <john-news1@cambridgetechgroup.com>
In-Reply-To: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
References: <6306.3f4dd070.667ee@irwin2.crw.uk.net>
Message-Id: <1062066193.8465.1571.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 28 Aug 2003 11:23:14 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Lost space on JFFS2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-08-28 at 10:50 +0100, John Hall wrote:
> Hi,
> 
> I have a 7MB NAND flash partition, on which I'm running JFFS2. This
> partition contained about 3.5MB of files, yet df reported that the partition
> was 96% full. I tried sending SIGHUP to the gc thread and unmounting and
> remounting the device, but it had no effect. I then moved the files off the
> partition and then copied them back, and the usage went down to just 31%,
> which with compression is what one would expect.
> 
> I've got two ideas about what happened:
> 
> 1. The files in question are log files and so there are lots of small writes
> happening. How does JFFS2 compress files? Is it on a block basis or per
> write? If it is the latter then I could imagine that compression is actually
> having an adverse effect when a file is created from a large number of small
> writes.

What do you mean by 'on a block basis'?  JFFS2 does compression within
each log entry, which in the case of small writes is basically
per-write. It doesn't hurt though -- if the node payload would grow on
compression, we write it out uncompressed.

> 2. A bug in JFFS2 was causing some unused space not to be garbage collected.
> The version of JFFS2 being used is 9 months old, so perhaps I should merge a
> later version in anyway.

Sort of. I think it's related to a NAND-specific bug that I fixed last
week, where we'd consistently waste space under that usage pattern, and
not although it's reclaimable we wouldn't account it as free in
statfs().

We still don't account it as free -- but we don't waste space nearly as
often as we used to either; we trigger garbage-collection to fill our
buffer rather than just padding it.

-- 
dwmw2
