From: tglx@linutronix.de (Thomas Gleixner)
Date: Mon, 10 Mar 2003 15:53:09 +0100
Subject: Memory leak
In-Reply-To: <000f01c2e691$1a319a60$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
 <200303092010.44211.tglx@linutronix.de> <000f01c2e691$1a319a60$210486da@ybb>
Message-ID: <200303101553.09156.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Monday 10 March 2003 00:10, matsunaga wrote:
> Yes, I use JFFS2.
> If you mount a device with a file on JFFS2, a dirent node and a dnode are
> alloced. But upper layer does not issue, jffs2_clear_inode for an inode of
> the dnode during unmount. You can see it just by free command if my
> implementation is not wrong.
on umount put_super is called
void jffs2_put_super (struct super_block *sb)
{
SNIP
	jffs2_free_ino_caches(c);
	jffs2_free_raw_node_refs(c);
	vfree(c->blocks);
SNIP
}
So everything is freed there. Are you looking at the first line of output from 
free (Mem:) ? Have a look at the second line (-/+ buffers/cache). If this is 
worrying you too, then send output of free before mount and after umount.

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
