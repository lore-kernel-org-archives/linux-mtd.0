From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Tue, 11 Mar 2003 00:48:22 +0900
Subject: Memory leak
References: <000e01c2e65b$71ca7020$210486da@ybb> <200303092010.44211.tglx@linutronix.de> <000f01c2e691$1a319a60$210486da@ybb> <200303101553.09156.tglx@linutronix.de> <1047305682.23941.44.camel@passion.cambridge.redhat.com>
Message-ID: <002601c2e71c$7abe7d40$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi


> On Mon, 2003-03-10 at 14:53, Thomas Gleixner wrote:
> > On Monday 10 March 2003 00:10, matsunaga wrote:
> > > Yes, I use JFFS2.
> > > If you mount a device with a file on JFFS2, a dirent node and a dnode are
> > > alloced. But upper layer does not issue, jffs2_clear_inode for an inode of
> > > the dnode during unmount. You can see it just by free command if my
> > > implementation is not wrong.
> > on umount put_super is called
> > void jffs2_put_super (struct super_block *sb)
> > {
> > SNIP
> > jffs2_free_ino_caches(c);
> > jffs2_free_raw_node_refs(c);
> > vfree(c->blocks);
> > SNIP
> > }
> > So everything is freed there. Are you looking at the first line of output from 
> > free (Mem:) ? Have a look at the second line (-/+ buffers/cache). If this is 
> > worrying you too, then send output of free before mount and after umount.
> 
> If you can rmmod jffs2 without a BUG() then it's freed everything in its
> own slabs, although it is theoretically possible that it's leaked
> something kmalloc'd. Unlikely though.

It is correct that rmmod will resolve it, but my concern is a consistency of resource and memory saving.
Dnode resource acuqired during mount seems not to be refereneced when you access to the file.
 
Best regards.

__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
