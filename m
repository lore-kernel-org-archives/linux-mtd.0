Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgjmA-0008GS-5H
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:10:07 -0500
Date: Tue, 21 Dec 2004 14:09:24 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221130924.GB22636@wohnheim.fh-wedel.de>
References: <1103288058.3018.4.camel@weaponx.rchland.ibm.com>
	<1103297611.15917.184.camel@squizzey.bult.co.uk>
	<41C3030D.8040607@us.ibm.com>
	<1103302002.15927.198.camel@squizzey.bult.co.uk>
	<41C31307.70909@us.ibm.com>
	<1103304360.15914.210.camel@squizzey.bult.co.uk>
	<41C318C8.4030702@us.ibm.com>
	<20041218160255.GA1083@wohnheim.fh-wedel.de>
	<1103560493.25853.31.camel@weaponx.rchland.ibm.com>
	<1103562748.10800.62.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103562748.10800.62.camel@squizzey.bult.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 20 December 2004 17:12:28 +0000, Gareth Bult (Encryptec) wrote:
> On Mon, 2004-12-20 at 10:34 -0600, Josh Boyer wrote:
> > Ok, that's why I said "most".  And if your El Cheapo hardware has built
> > in wear leveling, then doing wear leveling on top of that is always
> > questionable.  It might not make things worse, but it's probably not
> > very efficient.

Imo jffs2-style wear leveling is very efficient.  So efficient, it
doesn't really matter whether the hardware does the same or not.

Difference between no wear leveling and what jffs2 does is - at most -
1% additional writes on the jffs2 side.  That's not much.  Agreed, it
can actually cost latency, but from a life-time or overall performance
point of view, it doesn't really matter.

On the other hand, it gives you absolute condidence that your El
Cheapo hardware doesn't need to have anything it may or may not
promise to have.  No nasty surprised when you really don't need them.

> > Now if you have El Super Cheapo hardware that explicitly states you need
> > to do wear leveling, that's a different story ;).

Noone will state that.  It's not exactly good marketing.  You might
remember so interesting stories about what marketing promised and what
actually got delivered, no?

> In summary: lots of manufacturers seem to be quoting virtual / physical
> block mapping on the fly with integrated wear levelling ... (!)
> 
> So maybe wear levelling is out of date at filesystem level ?
> The techworld link to the M-Systems chips looks interesting ..
> 
> Can anyone with detailed flash experience comment ?

The endorsed features sound quite nice, agreed.  But I have still to
read a spec that convinces me.

Jörn

-- 
My second remark is that our intellectual powers are rather geared to
master static relations and that our powers to visualize processes
evolving in time are relatively poorly developed.
-- Edsger W. Dijkstra
