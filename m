Received: from lon-del-01.spheriq.net ([195.46.50.97])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Cy7bi-00044x-1U
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 07:03:11 -0500
Received: from lon-inc-09.spheriq.net ([195.46.50.73])
	by lon-del-01.spheriq.net with ESMTP id j17C364h007248
	for <linux-mtd@lists.infradead.org>; Mon, 7 Feb 2005 12:03:06 GMT
Received: from lon-out-03.spheriq.net (lon-out-03.spheriq.net [195.46.50.131])
	by lon-inc-09.spheriq.net with ESMTP id j17C36Vx012210
	for <linux-mtd@lists.infradead.org>; Mon, 7 Feb 2005 12:03:06 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-03.spheriq.net with ESMTP id j17C35ho009670
	for <linux-mtd@lists.infradead.org>; Mon, 7 Feb 2005 12:03:05 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <420758F1.8CAC90A2@st.com>
Date: Mon, 07 Feb 2005 13:02:57 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
References: <ctsr0r$94m$1@sea.gmane.org>
	<20050206220713.D99FE15504@desire.actrix.co.nz>
	<cu7934$irr$1@sea.gmane.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Writing frequently to NAND - wearing, caching?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Martin,

regarding JFFS2/NAND, the filesystem does not cache
write operations, however there is a NAND page cache.
This means that if you write 100 bytes at a time,
you will not use a full NAND page each time, but you will
probably create two JFFS2 data nodes in the same
NAND flash page. (NB a node may overlap a page boundary,
the page buffer is flushed to the device when
it is full).
Now if you do fsync between each write operation,
the page buffer will be flushed immediately. So in
this case you do use a full page (256 bytes or 2KB)
for each write.
The main drawback of JFFS2 in both cases is that
you end up with many small nodes on the flash
and this slows down initialization and access to this
file (see thread "jffs2_get_inode_nodes() very very slow"
in the February archive at 
http://lists.infradead.org/mailman/listinfo/linux-mtd/).
If you were to write 1 byte at a time this problem would
be even more acute. 
There is no "journal" per se in JFFS2, the whole 
filesystem is log-based.

The case with fsync will wear up the flash somewhat faster
but in any case JFFS2 contains integrated wear levelling
which will distribute the wear on all the blocks in the
partition, so no single block should be worn so much
that it fails (ideally. In real life some NAND blocks
may fail at any time even with perfect wear levelling.
However JFFS2 is able to cope with this case, and the
failed write operation will be retried on another block).

Have you read the JFFS/JFFS2 paper at
http://sources.redhat.com/jffs2/jffs2.pdf ?
(it is slightly out of date but the basic principles
of journaling, wear leveling, data nodes etc have not 
changed).

bye
Estelle


Martin Egholm Nielsen wrote:
> 
> Hi,
> 
> >>I have an application which may need to write states frequently to my
> >>nand-fs in order to have these states in case of powerdown.
> >>But I'm a bit concerned about wearing the nand if I write to frequently.
> 
> >>So, if I only need to write, say, 100 bytes every second, how often will
> >>this actually be flushed to the nand?
> >>Is there a maximum commit/flush frequency built in the driver? Or can
> >>this be configured?
> 
> > It depends on what fs you're using.
> > With YAFFS, and I believe JFFS2 too, there is no reason to worry about flash
> > "wearing out".  I have done accelerated lifetime tests on NAND using YAFFS
> > and in one test wrote 130GB to NAND without any data loss, bad blocks
> > happening etc.
> Now, that's a lot :-)
> I'm using JFFS2 - so hopefully you're right...
> 
> > The NAND writes whenever the file system tells it to, so again your question
> > is FS dependent, but all file systems that are NAND-friendly should handle
> > the load you mention with no problems.
> And that is JFFS2 - but since it's a journaling fs it must commit the
> journal, as well, every now and then...
> 
> // Martin
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
