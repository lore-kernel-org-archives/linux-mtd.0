Received: from fra-del-02.spheriq.net ([195.46.51.98])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CtPwe-0002Aj-AA
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2005 07:37:23 -0500
Received: from fra-inc-07.spheriq.net (fra-inc-07.spheriq.net [195.46.51.71])
	by fra-del-02.spheriq.net with ESMTP id j0PAEGqL002735
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 10:14:16 GMT
Received: from fra-out-03.spheriq.net (fra-out-03.spheriq.net [195.46.51.131])
	by fra-inc-07.spheriq.net with ESMTP id j0PAEGWL013885
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 10:14:16 GMT
Received: from fra-cus-01.spheriq.net (fra-cus-01.spheriq.net [195.46.51.37])
	by fra-out-03.spheriq.net with ESMTP id j0PAEGlC027913
	for <linux-mtd@lists.infradead.org>; Tue, 25 Jan 2005 10:14:16 GMT
Sender: Estelle HAMMACHE <estelle.hammache@st.com>
Message-ID: <41F61BE1.10A2DDA8@st.com>
Date: Tue, 25 Jan 2005 11:13:53 +0100
From: Estelle HAMMACHE <estelle.hammache@st.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas Gleixner wrote:
> 
> > - avoid filing blocks on the clean list when they have wasted
> > space
> 
> That's plain wrong.
> 
> Wasted space was introduced to prevent endless garbage collection.
> Wasted space is unreclaimable, because it is less than the minimum node
> size. It's totally correct to file those blocks on the clean list,
> because GC _cannot_ reclaim the wasted space.

Well without this patch I got blocks on the clean list with huge
wasted space, more than the ISDIRTY calculation, when a write that
fills exactly the space left in nextblock also obsoletes nodes
in nextblock (not sure about the exact case it was some time ago).
In jffs2_mark_node_obsolete, if the node belongs to nextblock, the
space is always added to wasted_space - not dirty_space. So I don't
understand whether wasted_space is not what you claim, or it is
not well implemented.

I'm afraid my comment in the log was quite misleading: 
this patch merely prevents filing the block to the clean
list in jffs2_add_physical_node_ref. As the comment in that
function says, the block will be filed to the correct list later 
and with proper ISDIRTY check (or am I missing something ?).

Lastly, I did submit this patch beforehand to the list, even if it was
in a thread on NAND failure. I would have expected you to have
an interest in that thread anyway.

(please excuse me if I sound grumpy. Your comments are a bit
of a cold shower on my newbie enthusiasm. If the patch is really
a problem I will reverse it tonight.)

Estelle
