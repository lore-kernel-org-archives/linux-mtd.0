Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1Cgk6H-0008TF-Js
	for linux-mtd@lists.infradead.org; Tue, 21 Dec 2004 08:30:54 -0500
Date: Tue, 21 Dec 2004 14:30:35 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Gareth Bult (Encryptec)" <Gareth@Encryptec.net>
Message-ID: <20041221133035.GE22636@wohnheim.fh-wedel.de>
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
> To be honest what's there will do me for now .. although I'd like to
> clean it up a little when I get time.

Guess you've never been patch-bombed before.  I took the liberty to do
some untested cleanups in ~20 patches.  Most likely the end result
will not work anymore, but the direction is where I'd like to go.

If you find the time, could you test the patches and see which work
and which don't?  The former will go into cvs then and I'll try to fix
the latter.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
