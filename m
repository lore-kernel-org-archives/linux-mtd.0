Received: from fra-del-03.spheriq.net ([195.46.51.99])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEPJi-00024O-Bo
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 05:11:57 -0500
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-del-03.spheriq.net with ESMTP id j2OABr7Z017401
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 10:11:53 GMT
Received: from fra-cus-02.spheriq.net (fra-cus-02.spheriq.net [195.46.51.38])
	by fra-out-03.spheriq.net with ESMTP id j2OABqe4006515
	for <linux-mtd@lists.infradead.org>; Thu, 24 Mar 2005 10:11:53 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <4242925F.D29BC7CE@st.com>
Date: Thu, 24 Mar 2005 11:11:43 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050322T224733-491@post.gmane.org>
	<4241396B.D689EB32@st.com> <loom.20050323T212715-407@post.gmane.org>
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

Hi Sergei,

more info below.

Sergei Sharonov wrote:
> > No write operation is guaranteed to be atomic. Have a look
> > at jffs2_write_inode_range in write.c : if there is not enough
> > space in the current block for the whole data, it may be split
> > into several chunks. Additionally write ops that overlap a
> > cache page boundary (not a flash page) are always split at
> > the page limit.
> 
> That means that one write may have several CRCs corresponding to
> splinter chunks?

Yes, when I write that the input buffer is split it means that
several data nodes are written to the flash - each data node
is an independent piece of data complete with header and CRC.
If a data node is only partly written to flash, its CRC check
will fail so the partial data will not be taken into account
when building the file at next mount. In this sense each data
node is an atomic write - but JFFS2 does not guarantee that
a write() input buffer will be written as a single data node.


> > If you want to have atomic writes, you could:
> > 1) Mandatorily: ensure that your application will not
> > issue write ops which overlap a page boundary.
> > You should not tweak the JFFS2 code to write such
> > overlapping nodes, otherwise you must also tweak
> > the GC and it gets difficult.
> > 2) Either tweak jffs2_write_inode_range to forbid
> > splitting data which does not overlap a page boundary
> > or adjust JFFS2_MIN_DATA_LEN to reserve enough
> > space (difficult to estimate maybe if you have
> > compression...).
> >
> > The above tweaking should ensure that an input buffer
> > is written to JFFS2 FS as a single CRC-protected
> > data node.
> 
> Ok, got that. Does not seem like a promissing idea considering
> how fast jffs2 evolves and therefore how bad forking would be.
> Thansk for the suggestion anyway.

You can always submit your patch to the list and then
either someone will merge it for you, or you can ask
for a CVS account to do it yourself.
It could be a conditionally-compiled option. Or maybe 
there is an appropriate fcntl or open flag that could 
be implemented in JFFS2  ?
Anyway I think it would be an interesting option to 
have. The main problem is the cache page boundary 
which would require more thinking about to solve 
and lots of testing...

> > You should be aware that on NAND flash JFFS2 uses
> > a (nand flash) page buffer (wbuf.c), which is flushed
> > only on fsync/sync/umount. So even though your write
> > ops will be atomic (with above code tweaks),
> > there is no guarantee that a buffer is effectively
> > committed to flash when write() returns, because the
> > end of the data node may remain in the buffer.
> > If you want that also, you can tweak JFFS2 again
> > by requiring a  wbuf flush after each "atomic write",
> > or you can have your application call fsync after
> > each write.
> 
> Beg pardon if it is FAQ, but if I open the file with O_SYNC
> flag, wouldn't that guarantee synchronous write that does not
> return untill all the data is in flash?

I am not familiar with Linux VFS, however from previous 
discussion on the list I was led to understand that
it doesn't work with JFFS2. Probably you could implement 
O_SYNC yourself without too much trouble.

bye
Estelle
