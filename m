Date: Fri, 21 Jan 2005 09:39:59 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Thomas Weber <tweb@peppercon.de>
In-Reply-To: <41EFAA38.3010903@peppercon.de>
Message-ID: <Pine.LNX.4.58.0501210931330.20175@phoenix.infradead.org>
References: <41EFAA38.3010903@peppercon.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Guaranteed writable space on JFFS2?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 Jan 2005, Thomas Weber wrote:
> Hi,
> 
> I've a problem with JFFS2 (kernel 2.4.26) on a NOR flash with 128k blocks.
> Due to previous unexpected behaviour, I've already changed
> 
> > super.c@85:
> > -       avail = c->dirty_size + c->free_size;
> > +       avail = (c->dirty_size / c->sector_size) * c->sector_size + c->free_size;
> 
> as GC returns ENOSPC on dirty size < sector size. This occurs quite 
> often on a nearly full fs with 128k blocks.
> By now, e.g. df provides the physical free space, but I do not know how 
> much of this space is really writable, since I do not know how much is 
> necessary file system organisation, inodes, etc.
> Is there a way to predict the maximum file size, which will still be 
> writable?
It is hard:

1. We do not exactly know how many nodes will be stored to flash. This 
depends how will you write your file.
2. GC works, it merges modes and sometimes splits them. So the free space 
is f(t) (function of time).
3. Depending on how block is filled we have different amount of unused 
space at the end of block. This space is too small to store any node. But 
after GC process this block, this space may be reclaimed, but there is no 
guarantee.
4. On NAND situation is even worth, because linux periodically syncs wbuf 
(JFFS2 is designed such way), so we flush it when it is partially filled, 
using padding nodes.

So, possibly we may evaluate the lowest border of free space, but can not 
calculate the exact value.

> 
> Thanks for your suggestions,
> Thomas
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
