From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Tue, 11 Mar 2003 00:36:24 +0900
Subject: Memory leak
References: <000e01c2e65b$71ca7020$210486da@ybb> <200303092010.44211.tglx@linutronix.de> <000f01c2e691$1a319a60$210486da@ybb> <200303101553.09156.tglx@linutronix.de>
Message-ID: <001801c2e71a$cefdca20$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi.

> On Monday 10 March 2003 00:10, matsunaga wrote:
> > Yes, I use JFFS2.
> > If you mount a device with a file on JFFS2, a dirent node and a dnode are
> > alloced. But upper layer does not issue, jffs2_clear_inode for an inode of
> > the dnode during unmount. You can see it just by free command if my
> > implementation is not wrong.
> on umount put_super is called
> void jffs2_put_super (struct super_block *sb)
> {
> SNIP
> jffs2_free_ino_caches(c);
> jffs2_free_raw_node_refs(c);
> vfree(c->blocks);
> SNIP
> }
> So everything is freed there.

Fragtree and the dnode resoure belongs to it are not freed there.

>  Are you looking at the first line of output from 
> free (Mem:) ? Have a look at the second line (-/+ buffers/cache). 
> If this is worrying you too, then send output of free before mount and after umount.

I will send the output later... not available now.. 
I am looking at amount of free area by free command.

If you have an environment, could you please check it with a device which is written a large file?
Because it might be just the problem of my environment...

Best regards.

__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
