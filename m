Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DECz6-0007Us-Li
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 16:01:49 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DECsa-00081O-Mq
	for linux-mtd@lists.infradead.org; Wed, 23 Mar 2005 21:55:12 +0100
Received: from halhoupro3.halliburton.com ([64.154.26.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2005 21:55:04 +0100
Received: from sergei.sharonov by halhoupro3.halliburton.com with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Mar 2005 21:55:04 +0100
To: linux-mtd@lists.infradead.org
From: Sergei Sharonov <sergei.sharonov@halliburton.com>
Date: Wed, 23 Mar 2005 20:50:52 +0000 (UTC)
Message-ID: <loom.20050323T212715-407@post.gmane.org>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: Re: atomic file operations
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Estelle,

thanks, appreciate your help.

> 
> Sergei Sharonov wrote:
> > Is a write of 1024 bytes atomic?
> > Does it relate to the page size in any way? BTW I am using NAND and the 
> > page may vary between 512 and 2048 bytes depending on a device.
> 
> No write operation is guaranteed to be atomic. Have a look
> at jffs2_write_inode_range in write.c : if there is not enough
> space in the current block for the whole data, it may be split
> into several chunks. Additionally write ops that overlap a
> cache page boundary (not a flash page) are always split at 
> the page limit.

That means that one write may have several CRCs corresponding to 
splinter chunks? 

> If you want to have atomic writes, you could:
> 1) Mandatorily: ensure that your application will not
> issue write ops which overlap a page boundary. 
> You should not tweak the JFFS2 code to write such 
> overlapping nodes, otherwise you must also tweak 
> the GC and it gets difficult.
> 2) Either tweak jffs2_write_inode_range to forbid 
> splitting data which does not overlap a page boundary
> or adjust JFFS2_MIN_DATA_LEN to reserve enough 
> space (difficult to estimate maybe if you have
> compression...).
> 
> The above tweaking should ensure that an input buffer
> is written to JFFS2 FS as a single CRC-protected
> data node.

Ok, got that. Does not seem like a promissing idea considering
how fast jffs2 evolves and therefore how bad forking would be.
Thansk for the suggestion anyway.

> You should be aware that on NAND flash JFFS2 uses
> a (nand flash) page buffer (wbuf.c), which is flushed 
> only on fsync/sync/umount. So even though your write
> ops will be atomic (with above code tweaks), 
> there is no guarantee that a buffer is effectively 
> committed to flash when write() returns, because the
> end of the data node may remain in the buffer.
> If you want that also, you can tweak JFFS2 again 
> by requiring a  wbuf flush after each "atomic write", 
> or you can have your application call fsync after 
> each write.

Beg pardon if it is FAQ, but if I open the file with O_SYNC
flag, wouldn't that guarantee synchronous write that does not
return untill all the data is in flash?

> > Is file rename atomic?
> See jffs2_rename in dir.c. There are two steps:
> make the new hard link, remove the old hard link.
> You may end up with two names for the same inode if
> there is a powerdown, so no it is not atomic.

Could not see that comming. Usualy people assume rename operation
atomic.

> > Second issue is: How badly these small chunks will affect my mount time?
> There have been previous threads about this.
> Some people proposed some (application-side) workaround, 
> you can find it in the archive or maybe someone will point 
> it to you.

I believe I saw a proposal to save small chunks as separate files, then 
append them as a temp file and rename temp file to real log file. 
The problems are (1) the log file is huge (2) rename is not atomic per 
your reply.
 
Sergei Sharonov
