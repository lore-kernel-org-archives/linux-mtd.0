From: David Woodhouse <dwmw2@infradead.org>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
Content-Type: text/plain
Date: Wed, 26 Jan 2005 09:10:47 +0000
Message-Id: <1106730647.6480.190.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-26 at 08:44 +0000, Artem B. Bityuckiy wrote:
> K1 is decreased by the Ferenc Havasi's "summary" patch well. Would be
> nice to decrease K2 either. Any Ideas how to do so?

For a start, we can increase the maximum node size. Limiting it to
PAGE_SIZE means we have a larger number of nodes than we'd otherwise
have. If we quadruple that, we'll probably end up with about a third as
many nodes. 

We can also look at true write-behind caching, if we're a _lot_ more
careful about free space than we are now. To have data outstanding in
the page cache, we need to be able to guarantee that we have enough free
space to write it out, and we need to be able to write it out _without_
allocating memory. That includes any memory which might be required for
GC. Doing that would allow us to coalesce writes so we fill a page (or a
full node size) more often.

Removing the __totlen field from the node ref is also a 25% improvement
in its ram usage.

Also, perhaps we could use _arrays_ of nodes instead of lists? That
would allow us to drop one of the list pointers. Probably it's easiest
to do this for the next_phys list -- make it an array in physical order.
I'm not sure how workable that would be. You'd need to deal with
reallocation, and it'd be hard to remove obsolete elements from the
middle; you'd probably just have to leave them there.

Perhaps we can use values other than pointers in our next_phys and
next_in_ino lists. These objects are in slab caches, and are quite
neatly laid out. We could find a way of referencing them which doesn't
require a whole 32 bits (or 64 on some machines).

Another idea which I don't think is workable but which someone may be
able to get something from... can we reduce the 'offset' to something
smaller than 32 bits? Make it an offset within the block instead of from
the start of the medium? Probably hard because it's not that quick to
_find_ the block given just a raw_node_ref*. But if we've already put
all the nodes for a given block into an _array_ rather than a linked
list then maybe...

There are some implementable ideas in there, and some more random ones. 
It's all still linear though.

-- 
dwmw2
