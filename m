Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CtOOm-0000v2-UV
	for linux-mtd@lists.infradead.org; Tue, 25 Jan 2005 05:58:18 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Estelle HAMMACHE <estelle.hammache@st.com>
In-Reply-To: <41F61BE1.10A2DDA8@st.com>
References: <1106603928.5081.50.camel@tglx.tec.linutronix.de>
	<41F61BE1.10A2DDA8@st.com>
Content-Type: text/plain
Date: Tue, 25 Jan 2005 11:58:10 +0100
Message-Id: <1106650690.5081.81.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/fs/jffs2 nodemgmt.c,1.115,1.116
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Estelle,

On Tue, 2005-01-25 at 11:13 +0100, Estelle HAMMACHE wrote:
> Thomas Gleixner wrote:
> > 
> > > - avoid filing blocks on the clean list when they have wasted
> > > space
> > 
> > That's plain wrong.
> > 
> > Wasted space was introduced to prevent endless garbage collection.
> > Wasted space is unreclaimable, because it is less than the minimum node
> > size. It's totally correct to file those blocks on the clean list,
> > because GC _cannot_ reclaim the wasted space.
> 
> Well without this patch I got blocks on the clean list with huge
> wasted space, more than the ISDIRTY calculation, when a write that
> fills exactly the space left in nextblock also obsoletes nodes
> in nextblock (not sure about the exact case it was some time ago).
> In jffs2_mark_node_obsolete, if the node belongs to nextblock, the
> space is always added to wasted_space - not dirty_space. So I don't
> understand whether wasted_space is not what you claim, or it is
> not well implemented.

Things have changed over time, so I'm not sure whether the wasted ->
dirty accounting is still correct all over the place. It was once :)

> I'm afraid my comment in the log was quite misleading: 
> this patch merely prevents filing the block to the clean
> list in jffs2_add_physical_node_ref. As the comment in that
> function says, the block will be filed to the correct list later 
> and with proper ISDIRTY check (or am I missing something ?).

Sorry, I misunderstood the comment. 

Filing the block in jffs2_add_physical_node_ref to the clean list if
appropriate is an optimization. Your check in fact disables the
optimization path as almost all blocks have wasted space. 

Please check !ISDIRTY(jeb->wasted_size) instead of !jeb->wasted_size.

> Lastly, I did submit this patch beforehand to the list, even if it was
> in a thread on NAND failure. I would have expected you to have
> an interest in that thread anyway.

I can not follow 100% of the mail threads all the time.

> (please excuse me if I sound grumpy. Your comments are a bit
> of a cold shower on my newbie enthusiasm. 

I did not intend to slow down your enthusiasm. :)

> If the patch is really a problem I will reverse it tonight.)

Fixing it is ok (see above). 

The coding style violations which dwmw2 pointed out need to be fixed
too.

tglx
