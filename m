Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Co0xj-0001Eb-9U
	for linux-mtd@lists.infradead.org; Mon, 10 Jan 2005 09:56:08 -0500
Date: Mon, 10 Jan 2005 15:55:41 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050110145541.GD12520@wohnheim.fh-wedel.de>
References: <1104961832.15121.45.camel@weaponx.rchland.ibm.com>
	<20050108205152.GF11728@wohnheim.fh-wedel.de>
	<1105368075.10074.4.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1105368075.10074.4.camel@windu.rchland.ibm.com>
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

On Mon, 10 January 2005 08:41:15 -0600, Josh Boyer wrote:
> On Sat, 2005-01-08 at 21:51 +0100, Jörn Engel wrote:
> > On Wed, 5 January 2005 15:50:32 -0600, Josh Boyer wrote:
> 
> > > +	if (from > mtd->size)
> > > +		return -EINVAL;
> > > +
> > > +	if (from + len > mtd->size)
> > > +		len = mtd->size - from;
> > > +
> > 
> > My code is slightly different:
> > 	if (len > mtd->size - from)
> > 		...
> > 
> > And yes, this _can_ make a difference. ;)
> 
> It's early and I haven't had my coffee yet :).  Care to educate me on
> why that makes a difference?

from = (uint32_t) -50;
len = 100;

Currently, I wouldn't dare creating a 4GiB mtd. ;)

Jörn

-- 
And spam is a useful source of entropy for /dev/random too!
-- Jasmine Strong
