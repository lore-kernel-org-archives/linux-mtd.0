Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cfr40-0007xv-3W
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 21:44:53 -0500
Date: Sun, 19 Dec 2004 03:44:51 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041219024451.GA22451@wohnheim.fh-wedel.de>
References: <1103158974.15929.37.camel@squizzey.bult.co.uk>
	<1103201631.25765.7.camel@weaponx.rchland.ibm.com>
	<1103232128.15927.70.camel@squizzey.bult.co.uk>
	<41C1FDFF.3020308@us.ibm.com>
	<1103233669.15929.81.camel@squizzey.bult.co.uk>
	<20041218161923.GD1083@wohnheim.fh-wedel.de>
	<1103391155.10788.13.camel@squizzey.bult.co.uk>
	<20041218175222.GB4147@wohnheim.fh-wedel.de>
	<20041218181100.GD4147@wohnheim.fh-wedel.de>
	<1103402930.10792.20.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1103402930.10792.20.camel@squizzey.bult.co.uk>
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

On Sat, 18 December 2004 20:48:50 +0000, Gareth Bult (Encryptec) wrote:
> 
> Like I said, hacked to work [for me] and not to look pretty.
> 
> To be honest what's there will do me for now .. although I'd like to
> clean it up a little when I get time.
> 
> fyi; don't confuse the old and new code.

Sure.  I had a look at tkdiff and there was ~50% unchanged code.
"This code ain't pretty." didn't mean "You sh*thead are stupid and
cannot create decent code."  It was more like "It still ain't pretty,
although you already improved it."

> > o Coding style (Lindent?)
> 
> Whatever was there already.
> 
> > o Function length
> 
> My functions are shorter than the ones that were there, lots can be
> cleaned up here.
> 
> > o #ifdef MODULE
> 
> .. ? I only use it as a module, not of this code was touched.
> 
> > o parameters have an insane interface
> 
> .. again , parameters and interfaces are all from the original with the
> exception of a couple of new routines which mirror existing parameter
> lists.
> 
> > o ro-devices.  the same can be achieved with chmod.
> 
> Again, not touched this.

Yep.  Those five point were the obvious stuff I could find in five
minutes.  Fixing them takes a lot more than five minutes and changing
the parameter interface basically means copying the thing and fixing
the new one.

I did the same with slram/phram.  The slram interface was different
for module/non-module built and insane once you had more than a single
device.  Mtdblock looks quite similar and seems to need the same cure.
So whatever you can improve, please do.

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
