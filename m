Received: from fra-del-01.spheriq.net ([195.46.51.97])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgjLo-0007wQ-Vw
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 07:42:55 -0500
Received: from fra-inc-06.spheriq.net (fra-inc-06.spheriq.net [195.46.51.70])
	by fra-del-01.spheriq.net with ESMTP id iBLCgoUV019402
	for <linux-mtd@lists.infradead.org>; Tue, 21 Dec 2004 12:42:50 GMT
Received: from fra-out-02.spheriq.net (fra-out-02.spheriq.net [195.46.51.130])
	by fra-inc-06.spheriq.net with ESMTP id iBLCgous020996
	for <linux-mtd@lists.infradead.org>; Tue, 21 Dec 2004 12:42:50 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-02.spheriq.net with ESMTP id iBLCgnXb029497
	for <linux-mtd@lists.infradead.org>; Tue, 21 Dec 2004 12:42:49 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41C81A43.C8E52F8@st.com>
Date: Tue, 21 Dec 2004 13:42:43 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: Rudresh NB <getrudri@yahoo.com>
References: <20041221120823.80642.qmail@web13205.mail.yahoo.com>
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

Hi,
JFFS2 write pages sequentially from the start of an erase
block to the end of the block. The current
write block is in c->nextblock. The current write offset
in this block is c->nextblock->offset.
There is a write buffer (see file wbuf.c) to ensure that 
only full pages are written, even though data nodes may
overlap a page boundary. 
Data nodes may not overlap an erase block boundary: if there 
is no more room in the current block, a new (empty) block
is selected (and the page buffer is flushed in the old block
previously to writing to the new block). The new block
selection and the write address selection happen in 
nodemgmt.c (jffs2_do_reserve_space).
Does this answer your question ?
Estelle

Rudresh NB wrote:
> 
> Hi All,
>        Iam using samsung Nand flash (k9f2g08u0m). In
> that there is restriction of random page program. I
> heard that jffs2 takes care. but iam unable to find
> where exactly (In which file ) it is taken care.
> Brief explanation is appreciated.
> 
> Thanx in advance
> 
> Rgds
> NBR
