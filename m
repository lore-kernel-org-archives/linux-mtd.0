Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DE2LO-0006BH-Tr
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 04:40:08 -0500
Received: from lon-out-03.spheriq.net ([195.46.50.131])
	by lon-del-03.spheriq.net with ESMTP id j2N9e5kn027505
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2005 09:40:05 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id j2N9e4ZL014036
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2005 09:40:04 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4241396B.D689EB32@st.com>
Date: Wed, 23 Mar 2005 10:39:55 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050322T224733-491@post.gmane.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Sharonov wrote:
> Is a write of 1024 bytes atomic?
> Does it relate to the page size in any way? BTW I am using NAND and the page
> may vary between 512 and 2048 bytes depending on a device.

No write operation is guaranteed to be atomic. Have a look
at jffs2_write_inode_range in write.c : if there is not enough
space in the current block for the whole data, it may be split
into several chunks. Additionally write ops that overlap a
cache page boundary (not a flash page) are always split at 
the page limit.

If you want to have atomic writes, you could:
1) Mandatorily: ensure that your application will not
issue write ops which overlap a page boundary. 
You should not tweak the JFFS2 code to write such 
overlapping nodes, otherwise you must also tweak 
the GC and it gets difficult.
2) Either tweak jffs2_write_inode_range to forbid 
splitting data which does not overlap a page boundary
or adjust JFFS2_MIN_DATA_LEN to reserve enough 
space (difficult to estimate maybe if you have
compression...).

The above tweaking should ensure that an input buffer
is written to JFFS2 FS as a single CRC-protected
data node.

You should be aware that on NAND flash JFFS2 uses
a (nand flash) page buffer (wbuf.c), which is flushed 
only on fsync/sync/umount. So even though your write
ops will be atomic (with above code tweaks), 
there is no guarantee that a buffer is effectively 
committed to flash when write() returns, because the
end of the data node may remain in the buffer.
If you want that also, you can tweak JFFS2 again 
by requiring a  wbuf flush after each "atomic write", 
or you can have your application call fsync after 
each write.

> Is file rename atomic?
See jffs2_rename in dir.c. There are two steps:
make the new hard link, remove the old hard link.
You may end up with two names for the same inode if
there is a powerdown, so no it is not atomic.

See dir.c, file.c, fs.c for other ops. Generally speaking
write_inode_range is not an atomic operation, write_dnode
and write_dirent are atomic ops. The order of operations
in a file-level operation should ensure global atomicity
in most cases. I don't know if there are other file-operations
besides rename which are not atomic.

> Second issue is: How badly these small chunks will affect my mount time?
There have been previous threads about this.
Some people proposed some (application-side) workaround, 
you can find it in the archive or maybe someone will point 
it to you.

Bye
Estelle
