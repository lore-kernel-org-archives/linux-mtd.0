Received: from web13202.mail.yahoo.com ([216.136.174.187])
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Ch2RT-000550-6I
	for linux-mtd@lists.infradead.org; Wed, 22 Dec 2004 04:06:22 -0500
Message-ID: <20041222090557.21188.qmail@web13202.mail.yahoo.com>
Date: Wed, 22 Dec 2004 01:05:57 -0800 (PST)
From: Rudresh NB <getrudri@yahoo.com>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <41C81A43.C8E52F8@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
    Thanx for the reply.

I have couple of questions.

1) How JFFS2 will take care of Updating the same page
in the block.
2) How does the logical addr to physical addr of block
 no happens

Rgds
NBR

--- Estelle HAMMACHE <estelle.hammache@st.com> wrote:

> Hi,
> JFFS2 write pages sequentially from the start of an
> erase
> block to the end of the block. The current
> write block is in c->nextblock. The current write
> offset
> in this block is c->nextblock->offset.
> There is a write buffer (see file wbuf.c) to ensure
> that 
> only full pages are written, even though data nodes
> may
> overlap a page boundary. 
> Data nodes may not overlap an erase block boundary:
> if there 
> is no more room in the current block, a new (empty)
> block
> is selected (and the page buffer is flushed in the
> old block
> previously to writing to the new block). The new
> block
> selection and the write address selection happen in 
> nodemgmt.c (jffs2_do_reserve_space).
> Does this answer your question ?
> Estelle
> 
> Rudresh NB wrote:
> > 
> > Hi All,
> >        Iam using samsung Nand flash (k9f2g08u0m).
> In
> > that there is restriction of random page program.
> I
> > heard that jffs2 takes care. but iam unable to
> find
> > where exactly (In which file ) it is taken care.
> > Brief explanation is appreciated.
> > 
> > Thanx in advance
> > 
> > Rgds
> > NBR
> 



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Mail - 250MB free storage. Do more. Manage less. 
http://info.mail.yahoo.com/mail_250
