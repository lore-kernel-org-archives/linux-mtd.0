Received: from e33.co.us.ibm.com ([32.97.110.131])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Co0jh-0000sK-TR
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 09:41:41 -0500
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by e33.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j0AEfMCO731468
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 09:41:23 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay05.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j0AEfLcf260930
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 07:41:21 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	j0AEfL4p003609
	for <linux-mtd@lists.infradead.org>; Mon, 10 Jan 2005 07:41:21 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050108205152.GF11728@wohnheim.fh-wedel.de>
References: <1104961832.15121.45.camel@weaponx.rchland.ibm.com>
	<20050108205152.GF11728@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 10 Jan 2005 08:41:15 -0600
Message-Id: <1105368075.10074.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tom_gall@vnet.ibm.com, linux-mtd@lists.infradead.org, sallyt@us.ibm.com
Subject: Re: [PATCH] Add error checking to slram
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2005-01-08 at 21:51 +0100, Jörn Engel wrote:
> On Wed, 5 January 2005 15:50:32 -0600, Josh Boyer wrote:
> > 
> > The following patch fixes a couple issues I saw with the slram driver.
> > 
> > 1) No error checking was being done at all.
> > 
> > 2) There was no eraseblock size for slram, which made JFFS2 unhappy.
> 
> Had a look at that one and imo it's jffs2 that should get fixed.  But
> for the moment, your patch is fine.

No argument from me there.  I've been sitting on this patch for a long
time and it was simply the easiest fix.  Until JFFS2 gets fixed, this
should suffice.

> > Please take a look at the patch and commit if it looks good.  Comments
> > are always welcome too :).
> 
> Just one, rest looks fine to me.

<snip>

> > +	if (from > mtd->size)
> > +		return -EINVAL;
> > +
> > +	if (from + len > mtd->size)
> > +		len = mtd->size - from;
> > +
> 
> My code is slightly different:
> 	if (len > mtd->size - from)
> 		...
> 
> And yes, this _can_ make a difference. ;)

It's early and I haven't had my coffee yet :).  Care to educate me on
why that makes a difference?

josh
