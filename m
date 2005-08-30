Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EA3eV-0005rM-Hp
	for linux-mtd@lists.infradead.org; Tue, 30 Aug 2005 06:47:43 -0400
Date: Tue, 30 Aug 2005 12:47:37 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Jared Hulbert <jaredeh@gmail.com>
Message-ID: <20050830104737.GD9504@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
	<20050829100722.GB17088@wohnheim.fh-wedel.de>
	<1125340972.30800.7.camel@windu.rchland.ibm.com>
	<20050829185042.GA28514@wohnheim.fh-wedel.de>
	<6934efce0508291621656374d2@mail.gmail.com>
	<20050830095610.GA9504@wohnheim.fh-wedel.de>
	<20050830102739.GC9504@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050830102739.GC9504@wohnheim.fh-wedel.de>
Cc: Zhao Fusheng <zhao_fusheng@hotmail.com>,
	David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 30 August 2005 12:27:39 +0200, Jörn Engel wrote:
> 
> The rest is code and implementation details.

...which may still be of interest to some of you.


Take 1: Let's just error out.

My patch would cause JFFS2 to fail mounting a device if it would
require virtual blocks.  Not a real solution, but it turns a
compatibility problem into not working at all.  That is quite bad, but
better than data loss, imo.


Take 2: Use vmalloc() instead of kmalloc()

Ferenc just sent this patch.  Whenever virtual block would be
required, we use vmalloc() to allocate the erase block array.
vmalloc() is usually able to support larger amounts of data.  This
doesn't always work, on i386 machines with 1GiB of memory or more
e.g., the virtual address area used for vmalloc() is quite small.  But
for most embedded systems, it shouldn't be a problem.

Another drawback of both kmalloc() and vmalloc() is that all
allocations are done in orders of 2(*).  Therefore, if you have to
allocate space for 1024 blocks requiring 68 bytes each, you allocate
131072 bytes instead of 69632.  That is a loss of 15 pages.


Take 3: slab cache

This would be my preferred solution, although it also has drawbacks
and is a lot of work.  Instead of organizing the struct
jffs2_eraseblock in an array, they are put into a linked list or
similar structure.  Now it is possible to allocate the structures one
at a time, using a dedicated slab cache.  Drawback is a different
handling of blocks and increasing the struct jffs2_eraseblock by one
struct list_head - 8 or 16 bytes depending on your architecture.

For the above example, you'd have to allocate 1024 structs of 84 bytes
each, 86016 bytes.  With slab overhead, you'd have to allocate 22
pages, giving you a net win of 10 pages over kmalloc().


(*) For vmalloc(), this is true for virtual address space only.
Physical pages are allocated one at a time.  Unless you're running on
a nommu system, in which case vmalloc() is just a wrapper around
kmalloc().

Jörn

-- 
ticks = jiffies;
while (ticks == jiffies);
ticks = jiffies;
-- /usr/src/linux/init/main.c
