Date: Wed, 2 Feb 2005 11:23:38 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1107340552.12063.8.camel@baythorne.infradead.org>
Message-ID: <Pine.LNX.4.58.0502021122260.29798@phoenix.infradead.org>
References: <20050201150810.M93647@unsec.nl>
	<Pine.LNX.4.58.0502011601470.23856@phoenix.infradead.org>
	<20050202085600.M52308@unsec.nl>
	<1107340012.21196.507.camel@tglx.tec.linutronix.de>
	<1107340552.12063.8.camel@baythorne.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: jffs2_get_inode_nodes() very very slow
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2 Feb 2005, David Woodhouse wrote:

> On Wed, 2005-02-02 at 11:26 +0100, Thomas Gleixner wrote:
> > This converts the small nodes to bigger nodes when the data are
> > appended to log.big. I guess garbage collection should kick in quite
> > fast and clean up the small nodes. It might not totally go away, but
> > it should be much better than now. This will also give you more
> > capacity on your partition as the small nodes consist mostly of node
> > overhead. 
> 
> We could possibly do this for ourselves quite easily. When writing to a
> page which already has more than N fragments, obsolete them all and
> write the whole page out again.
IMO, perfectly good idea! I think the reasonable thrashhold is about 3-6 
fragments.

> 
> Or maybe, when writing the _last_ byte in a page which already has N
> fragments, rewrite the whole page?
> 
> -- 
> dwmw2
> 
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
