Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CpAJD-0002HH-Nj
	for linux-mtd@lists.infradead.org; Thu, 13 Jan 2005 14:07:05 -0500
Date: Thu, 13 Jan 2005 20:06:46 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050113190646.GG18864@wohnheim.fh-wedel.de>
References: <20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<6934efce050112084111ef438c@mail.gmail.com>
	<Pine.LNX.4.58.0501121708100.10617@phoenix.infradead.org>
	<6934efce0501121430471e55a8@mail.gmail.com>
	<1105569824.3896.44.camel@weaponx.rchland.ibm.com>
	<6934efce05011214553465438@mail.gmail.com>
	<1105631437.15265.12.camel@weaponx.rchland.ibm.com>
	<6934efce050113103077c06b4d@mail.gmail.com>
	<1105641413.26551.230.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105641413.26551.230.camel@hades.cambridge.redhat.com>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 January 2005 18:36:53 +0000, David Woodhouse wrote:
> On Thu, 2005-01-13 at 10:30 -0800, Jared Hulbert wrote:
> > I think it says it's worth adding a no-checksum option to serve this
> > potential userbase that just doesn't need the checksums but does need
> > the speed.
> 
> You may be right. That doesn't make me relish the thought of providing
> support to people who do that though :)
> 
> Perhaps we could make it a mount option, and that way it's easy enough
> for people to turn it on if they have problems, before we'll talk to
> them about it.

How about making the checksum algorithm a config option?  "return 0"
will also speed up the writes.

If this change is needed to get some million cell phones converted to
jffs3, I'm all for it.

Jörn

-- 
But this is not to say that the main benefit of Linux and other GPL
software is lower-cost. Control is the main benefit--cost is secondary.
-- Bruce Perens
