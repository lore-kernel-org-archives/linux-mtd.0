From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Koeller <thomas.koeller@baslerweb.com>
In-Reply-To: <200310151211.29172.thomas.koeller@baslerweb.com>
References: <1065598642.12197.6.camel@famine>
	 <20031008115231.7d1f012f.jani@iv.ro>
	 <200310151211.29172.thomas.koeller@baslerweb.com>
Content-Type: text/plain
Message-Id: <1066215157.14783.933.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 15 Oct 2003 11:52:38 +0100
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: ecos-discuss@sources.redhat.com
Subject: Re: [ECOS] Stress testing JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-10-15 at 12:11 +0200, Thomas Koeller wrote:
> In an attempt to understand what's really going on inside JFFS2, I
> spent a day analyzing the code. Here's what I found. Please everybody
> comment on this and correct any errors on my side.
> 
> - Every operation that changes the contents of the FLASH (even deleting files!)
>   is performed by writing new nodes to the FLASH. Every such node is represented
>   in RAM by a struct jffs2_raw_node_ref. The memory occupied by these structs
>   is never freed unless the file system is unmounted or garbage collection
>   takes place. Garbage collection starts when there are only five empty
>   erase blocks left. Since every data node on the flash can hold at most one
>   page (4KB) worth of data (uncompressed), the number of in-core instances of
>   struct jffs2_raw_node_ref can grow very large. So in order to support a larger
>   JFFS2 file system, an appropriate amount of RAM is absolutely required.

All correct. But you miss the observation that we also keep a
raw_node_ref around for _obsolete_ nodes, which perhaps we could avoid.
In fact, we do this because the raw_node_ref is in a singly-linked list,
and it's going to be very inefficient to remove obsoleted nodes from
that list when they become obsolete. 

Question: What is your ratio of obsolete to valid nodes, and hence what
benefit, if any, would you gain from turning the singly-linked list into
a doubly-linked list (and increasing the size of the structure by
another pointer) in order to be able to free the obsolete ones? Nobody's
ever checked, to my knowledge.

I suppose it's also possible to take the CPU-time cost of removing the
nodes even from the singly-linked list; nobody's ever done an analysis
of what this would cost either.

Look at jffs2_mark_node_obsolete and see how much time it will take to
start at jeb->first_node, walking the ->next_phys list till you find the
newly-obsoleted raw_node_ref, and free it. You also have to find the
inode number of the inode to which the node belongs (if any), by using
jffs2_raw_ref_to_inum(), and then walk _that_ list too to remove the
raw_node_ref in question.

Note that you can't actually free obsolete node refs which refer to
obsolete directory entries, because we need to keep track of them on
NAND flash. See jffs2_garbage_collect_deletion_dirent() for the gory
details.

> - The size of a single struct jffs2_raw_node_ref is 16 bytes. In ecos, these
>   structs are allocated through calls to malloc(). If the underlying implementation
>   is dlmalloc, as is probably the case most often, the minimum allocation size is
>   24 bytes, so some memory is wasted here. A fixed-size block allocator would be
>   more appropriate.

That one should be relatively easy to do. We do it in Linux already;
each object type already has its own allocation function in malloc.c

> - In http://lists.infradead.org/pipermail/linux-mtd/2003-August/008372.html,
>   David Woodhouse comments on this, suggesting possible improvements. I do not
>   know if any work is going on to implement one of these (probably not).

Omitting the 'totlen' field should be relatively simple if you're not
freeing obsolete refs. Observe that in 99% of cases, it's true that

	ref->totlen == ref_offset(ref->next_phys) - ref_offset(ref)

Make it 100% and make me believe it, and you can remove totlen from the
structure.

You do have the choice between freeing obsolete refs and the totlen
optimisation though -- obviously they don't really work together. You
could _merge_ contiguous obsolete data-node refs and free some RAM
though, while still keeping the simple way of finding totlen.

-- 
dwmw2
