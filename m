Received: from imladris.demon.co.uk ([193.237.130.41])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19BUrf-0000B9-LW
	for <linux-mtd@lists.infradead.org>; Fri, 02 May 2003 08:21:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Kelly <mgkelly59@yahoo.com>
In-Reply-To: <20030501214026.14925.qmail@web9605.mail.yahoo.com>
References: <20030501214026.14925.qmail@web9605.mail.yahoo.com>
Message-Id: <1051860123.21608.26.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 02 May 2003 08:22:03 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Need help understanding jffs2 mount activity
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-05-01 at 22:40, Mike Kelly wrote:
> I need some help understanding what occurs during
> mount/bootup of a jffs2 file system. I have a target
> based on the SH-3, using MontaVista Linux 2.1 with a
> jffs2 root file system of 7MB. The initial bootup time
> is about 75 seconds (about half of the 7MB is not
> initialize, but only erased). 

We can fix bootloaders to put in the 'CLEANMARKER' tags and eliminate
this. Nobody's got round to it yet, that's all.

> Subsequent boots take about 35 seconds.
> 
> I ran some tests where I copied files to fill the
> filesytem, then deleted them. I rebooted and it took
> about 55 seconds to boot up. Subsequent boots took
> about 35 seconds. So, it appears that the blocks used
> for the deleted files have been garbage collected and
> erased. Is this correct?

Not quite. The old blocks belonging to those files are marked obsolete,
so the mount code know it's not necessary to bother checking the crc32
on them -- that's what takes the majority of the time at boot.

> Next we ran an operation, where a file has 65 bytes
> appended to it until it reaches a size of about 700
> kB. When this was completed, the bootup time increased
> to 75 seconds and has not gone back down upon
> subsequent reboots. 

That's expected. 

> So, does the garbage collection
> upon mount/bootup differ between deleted files and
> appended files? When a file is opened, appended, then
> closed, does the jffs2 filesystem essentially copy the
> file to a new location along with the new data, then
> marks the old file as obsolete?

No, it writes out the new bytes in a new log entry, leaving the rest as
it was. See http://sources.redhat.com/jffs2/jffs2.pdf

So instead of a whole file made up of 4KiB nodes as usual, you've ended
up with a file made entirely of 65-byte nodes, each with its own CRC to
check etc. 

Garbage-collection _will_ consolidate these nodes, in time, because
it'll tend to write out a whole page when it's trying to copy and
obsolete a single node. But because these nodes aren't overlapping,
they're considered 'clean' and we don't make any particular effort to
garbage-collect them; we only GC them if they're in the way.

This probably ought to change, and there are some changes in the most
recent CVS code which make a start at this -- at least we now have a
flag which identifies nodes which aren't 'ideally' representing their
data, because, for example, there are other nodes on the same virtual
page in the file which could be merged.

The CVS code has also been reworked to avoid the CRC32 checking at mount
time, letting a kernel thread do it in the background instead -- you
only have to wait for it to complete if you need to do
garbage-collection to make space for new writes, and normal bootup can
continue unhindered.

-- 
dwmw2
