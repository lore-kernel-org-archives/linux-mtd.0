Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E9gYO-0006cS-ML
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2005 06:07:52 -0400
Date: Mon, 29 Aug 2005 12:07:22 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050829100722.GB17088@wohnheim.fh-wedel.de>
References: <20050826102512.GA23886@wohnheim.fh-wedel.de>
	<1125087149.26481.12.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125087149.26481.12.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] remove support for virtual blocks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 26 August 2005 15:12:29 -0500, Josh Boyer wrote:
> On Fri, 2005-08-26 at 12:25 +0200, Jörn Engel wrote:
> > Trivial patch.  Anyone complaining about this is free to write a
> > better one.  Can I commit?
> 
> So now with this 1:1 mapping, a user is limited to using a 64 MiB chip
> if the physical block size is 32 KiB?  I know there are NAND chips out
> there that use such a block size and are larger than 64MiB.  Do we
> really want to stop supporting all of these devices?  

No.

What we have right now is an ugly hack that causes random
incompatibilities.  And it happens to be that both summary and erase
count increase the chances of an incompatibility, so this hack
effectively blocks both patches from inclusion.

What we need is a decent design that works without incompatibilities.
And the design should define what's on the medium, _independently_ of
whatever goes on in memory.  Changing the format on the medium because
some struct now has an extra field is not an option.  Changing the
format because the medium moved from a 32bit to a 64bit machine is not
an option.

Problem is that code for the decent design doesn't exist yet.  I
personally prefer this patch to the current broken implementation, as
it increases the pressure to write the correct code.  If such code
doesn't show up in the near future, I'd be inclined to commit my
patch.

Jörn

-- 
They laughed at Galileo.  They laughed at Copernicus.  They laughed at
Columbus. But remember, they also laughed at Bozo the Clown.
-- unknown
