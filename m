Date: Wed, 26 Jan 2005 17:11:34 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1106759204.6955.43.camel@weaponx.rchland.ibm.com>
Message-ID: <Pine.LNX.4.58.0501261710570.3222@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501260841380.3222@phoenix.infradead.org>
	<1106730647.6480.190.camel@localhost.localdomain>
	<Pine.LNX.4.58.0501261534050.3222@phoenix.infradead.org>
	<1106759204.6955.43.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 memory consumption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Jan 2005, Josh Boyer wrote:

> On Wed, 2005-01-26 at 09:57, Artem B. Bityuckiy wrote:
> > On Wed, 26 Jan 2005, David Woodhouse wrote:
> > 
> > > On Wed, 2005-01-26 at 08:44 +0000, Artem B. Bityuckiy wrote:
> > > > K1 is decreased by the Ferenc Havasi's "summary" patch well. Would be
> > > > nice to decrease K2 either. Any Ideas how to do so?
> > > 
> > > For a start, we can increase the maximum node size. Limiting it to
> > > PAGE_SIZE means we have a larger number of nodes than we'd otherwise
> > > have. If we quadruple that, we'll probably end up with about a third as
> > > many nodes. 
> > I thought about to have several 4K chunks within one node. Thus we will 
> > keep reading fast but will have few nodes number. Didi you mean this?
> 
> If you use larger "chunks" you'll get better overall compression.  E.g. 
> a 64KiB node should compress better than a 4KiB node.  This is partially
> how squashfs achieves better compression that cramfs.
Surely, but how about read degradation?

> 
> So the end result is better compression and fewer nodes.
> 
> josh
> 
> 

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
