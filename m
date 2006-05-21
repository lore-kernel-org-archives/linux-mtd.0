From: David Woodhouse <dwmw2@infradead.org>
To: KaiGai Kohei <kaigai@ak.jp.nec.com>
In-Reply-To: <44704CA9.8010604@ak.jp.nec.com>
References: <1148150486.3875.251.camel@pmac.infradead.org>
	<44704CA9.8010604@ak.jp.nec.com>
Content-Type: text/plain
Date: Sun, 21 May 2006 13:41:27 +0100
Message-Id: <1148215287.3875.274.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2/xattr problems.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-05-21 at 20:19 +0900, KaiGai Kohei wrote:
> delete_xattr_datum_node() try to write invalid data to ensure the target
> node was already deleted. I was worried about that a xdatum already removed
> may be reused as a effective xdatum on next mounting.
> But it's purely design problem that should be changed.

Yes. You cannot remove it from the flash -- you have to know that it is
there and make sure your scan code copes with it appropriately.

> Alternatively, I plan to write a delete marker on new node allocated by
> jffs2_reserve_space() when xdatum is removed.
> I intend to be dealt with a xdatum with 0xffffffff of version number
> as a delete marker for xdatum. This node will be ignored on next mounting.

OK, that can work. It'll be a little like the 'deletion dirent' with
child inode #0. The same issues apply here -- the 'deletion' node must
remain on the flash for as long as any copies of the _original_ xattr
do.

Also, you must not reuse that xid until all nodes are completely erased.
For inodes, we do this by keeping the jffs2_inode_cache around even when
it's dead, as long as it has nodes. You could possibly use the same
mechanism in erase.c

> Some days will be necessary to change it.
> Would you wait for a while? 

Of course.

If it's convenient (i.e. if I haven't broken it entirely), please work
from git://git.infradead.org/jffs2-devel-2.6.git from now on. That tree
contains a few other JFFS2 improvements, including the elimination of
'__totlen' from the jffs2_raw_node_ref, and some speedup of the code
which reads a summary node from the flash during mount.

-- 
dwmw2
