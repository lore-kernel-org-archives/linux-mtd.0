Received: from lon-del-03.spheriq.net ([195.46.50.99])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch2lC-0005KG-Tg
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 04:26:26 -0500
Received: from lon-inc-01.spheriq.net ([195.46.50.65])
	by lon-del-03.spheriq.net with ESMTP id iBM9QJo9016797
	for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2004 09:26:19 GMT
Received: from lon-out-01.spheriq.net (lon-out-01.spheriq.net [195.46.50.129])
	by lon-inc-01.spheriq.net with ESMTP id iBM9QJVo008882
	for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2004 09:26:19 GMT
Received: from lon-cus-01.spheriq.net (lon-cus-01.spheriq.net [195.46.50.37])
	by lon-out-01.spheriq.net with ESMTP id iBM9QKLX019640
	for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2004 09:26:20 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41C93DB6.16162C19@st.com>
Date: Wed, 22 Dec 2004 10:26:14 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Rudresh NB <getrudri@yahoo.com>
References: <20041222090557.21188.qmail@web13202.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Query
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rudresh NB wrote:
> 
> Hi,
>     Thanx for the reply.
> 
> I have couple of questions.
> 
> 1) How JFFS2 will take care of Updating the same page
> in the block.

JFFS2 will not _update_ a NAND Flash page. When the user
overwrites a file with new data, JFFS2 will NOT update the
previous data. Rather JFFS2 will write the new data at
another free place, increasing the version number. The
old data which is not needed anymore will disappear during
garbage collection. JFFS2 does not write twice to the same
physical page, unless the block was erased in the meantime.
I suggest that you read http://sources.redhat.com/jffs2/jffs2.pdf 
if you haven't already.

> 2) How does the logical addr to physical addr of block
>  no happens

JFFS2 is NOT an FTL. There are no logical block numbers
in JFFS2. I think the block adresses are relative to the
start of the partition, this is managed in mtd drivers (?).

bye
Estelle



> --- Estelle Hammache wrote:
> 
> > Hi,
> > JFFS2 write pages sequentially from the start of an
> > erase
> > block to the end of the block. The current
> > write block is in c->nextblock. The current write
> > offset
> > in this block is c->nextblock->offset.
> > There is a write buffer (see file wbuf.c) to ensure
> > that
> > only full pages are written, even though data nodes
> > may
> > overlap a page boundary.
> > Data nodes may not overlap an erase block boundary:
> > if there
> > is no more room in the current block, a new (empty)
> > block
> > is selected (and the page buffer is flushed in the
> > old block
> > previously to writing to the new block). The new
> > block
> > selection and the write address selection happen in
> > nodemgmt.c (jffs2_do_reserve_space).
> > Does this answer your question ?
> > Estelle
> >
> > Rudresh NB wrote:
> > >
> > > Hi All,
> > >        Iam using samsung Nand flash (k9f2g08u0m).
> > In
> > > that there is restriction of random page program.
> > I
> > > heard that jffs2 takes care. but iam unable to
> > find
> > > where exactly (In which file ) it is taken care.
> > > Brief explanation is appreciated.
> > >
> > > Thanx in advance
> > >
> > > Rgds
> > > NBR
