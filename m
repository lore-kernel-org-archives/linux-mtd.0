From: dwmw2@infradead.org (David Woodhouse)
Date: 30 Mar 2003 20:29:49 +0100
Subject: Required memory size for jffs2?
In-Reply-To: <013d01c2f4ff$6e00f6f0$7d0323d3@tweedledum>
References: <013d01c2f4ff$6e00f6f0$7d0323d3@tweedledum>
Message-ID: <1049052588.16365.759.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Fri, 2003-03-28 at 07:55, ????????? wrote:
> I have tested jffs2 in user memory space, which gave me many advantages to
> understand the inner works of jffs2 and save time; disk i/o request was
> redirected to file i/o and kmalloc() was modified to malloc(). At some point
> I checked the size of all allocated memory using malloc_stats() function to
> meet our memory requirement in embedded environment.

You could reduce the memory requirement by increasing the logical block
size. The 'jffs2_erase_block' structure isn't very small. 

Other than that, it's hard to reduce the size, especially during
read_inode() when we allocate extra information structures temporarily.
For NAND flash, we cannot mark old nodes obsolete, so currently we build
these data structures for all nodes which have ever belonged to the
inode. I wonder if we could perform some merging as we build these
lists, on NAND flash?

-- 
dwmw2
