From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148048246.3199.34.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
	<1148041434.3875.137.camel@pmac.infradead.org>
	<1148048246.3199.34.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 15:50:03 +0100
Message-Id: <1148050203.3875.167.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 18:17 +0400, Artem B. Bityutskiy wrote:
> Let's talk not in 'summary' context. Suppose there is no summary. I'm
> talking about how to avoid reading names (and CRC-checking) in this
> case. 

OK.

> In the current implementation, we have to read names. At the source
> code-level language, because we need nhash at jffs2_add_fd_to_list().

We could use the name_crc for that instead. We don't actually need the
name itself. It just has to be a hash of the name -- the Linux nhash
just happened to be a good, cheap one.

> But I'll repeat my statement. The only fundamental reason why we need
> names at the scanning time is to provide correct nlink of inodes. This
> is because the way how JFFS2 unlinks: it writes direntry with the same
> name but with target ino=0.

We still only need the name _if_ the crc32 and length match a previous
dirent in the same directory. For ~99% of dirents, we _don't_ need the
name at scan time at all.

We only actually need to look at the name in the case where there are
two or more dirents which have the same pino, crc32 (or nhash) and
length.

Let us assume that genuine hash collisions are rare enough to be
ignored, statistically. So on NOR flash without summary, where we
actually mark the old nodes obsolete, you'll almost _never_ actually
have to use the real name in jffs2_add_fd_to_list(). You might as well
not read it during the scan.

On NAND flash, or with summary, we don't mark old nodes obsolete. So
it'll happen a bit more often -- specifically, in two cases:

First, there's the case where we've garbage-collected a dirent node but
haven't _yet_ deleted the original. But deleting the original is the
whole _point_ in GC, so that's not a common case. 

Second, there's the case where we've unlinked a dirent node but the
original hasn't yet been actually erased. That may be a _little_ more
common, but I don't think it'll be _so_ common.

So I still think that the benefit we get from dropping the full name
from all the rest of the dirents in the summary (or just not reading it
at scan time, in the !SUMMARY version) is going to be _more_ than the
slowdown caused by occasionally having to go back to the flash and read
the name when there's a collision.

If the time taken by reading names later really _is_ significant, we
could perhaps reduce that further by including "obsoleted version
number" in the summary for dirent nodes.

> So, if we'd not read names at the scanning time at all, we'd have no
> possibility to calculate correct nlinks.

Not so. We could calculate correct nlinks in the majority of cases. We
really don't need the full name very often.

>  They'd be greater or equivalent to the correct values. And some dead
> inodes would no go at scan time. And my idea: so what? Nothing really
> bad in this. We'll adjust them later.

But nlink is visible to userspace. We'd be giving incorrect values to
userspace until we've finished the scan.

-- 
dwmw2
