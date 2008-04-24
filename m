Date: Thu, 24 Apr 2008 11:57:11 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC][patch] NAND partial page read functionality
In-Reply-To: <1209033953.11721.131.camel@sauron>
Message-ID: <Pine.LNX.4.64.0804241149420.6029@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0712131747490.16624@pentafluge.infradead.org>
	<1209018876.11721.100.camel@sauron>
	<20080424074526.GA21709@cloud.net.au>
	<Pine.LNX.4.64.0804241057520.6029@pentafluge.infradead.org>
	<1209033953.11721.131.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Hamish Moffatt <hamish@cloud.net.au>, Thomas Gleixner <tglx@linutronix.de>,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> > Oh I'm glad to hear that this patch is needful. In fact I did
> > not drop it. We did some more investigations about integration subpage
> >  read in background. We tried to remove some drawback caused by
> > invalidation of prestored page in do_read_ops function. (We have found
> > that on large read requests nand subpage read causes ~10% of read performance degradation. I
> > wanted to remove but changes made code ugly and saved only 5%)
> 
> Err, are you referring this chip->pagebuf cache? Have you considered
> making it more complex and keep track of individual sub-pages within the
> pagebuf? You say it introduces a lot of ugliness? May be you could
> somehow separate this ugliness out nicely somehow?
Yes. I mean chip->pagebuf cache. From point of performacne the best
would be traking sub_pages within the pagebuf. But it is too complex and
brings ugliness. Sure I will definetely separate it.

> 
> > Also we investigated possibility to make more universal solution which includes both sub-page 
> > read and partial page write. As it was discussed in December. In fact the partial page write did not
> > give any benefits at all as file system operates write_size. If we reduce writesize JFFS2 will write data by 
> > small chunks only and it will cause strong performance degradation. (it
> > brings more cons than pros until serious hacks in JFFS2 will be
> > implemented)
> 
> Well, in any case, if you have something for writes, this should be a
> separate story.
> 
> 
