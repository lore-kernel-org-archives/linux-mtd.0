Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8QwA-0002AJ-0N
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 17:42:54 -0500
Date: Mon, 7 Mar 2005 23:42:38 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Gareth Bult <gareth@linux.co.uk>
Message-ID: <20050307224238.GH26318@wohnheim.fh-wedel.de>
References: <1110200816.11535.15.camel@squizzey.bult.co.uk>
	<20050307142402.GC9597@wohnheim.fh-wedel.de>
	<1110220494.11445.44.camel@squizzey.bult.co.uk>
	<20050307190012.GA24412@wohnheim.fh-wedel.de>
	<1110226862.29792.149.camel@baythorne.infradead.org>
	<1110229064.11284.18.camel@squizzey.bult.co.uk>
	<20050307210745.GD26318@wohnheim.fh-wedel.de>
	<1110231980.11310.40.camel@squizzey.bult.co.uk>
	<20050307220138.GF26318@wohnheim.fh-wedel.de>
	<1110234038.11284.62.camel@squizzey.bult.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110234038.11284.62.camel@squizzey.bult.co.uk>
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 March 2005 22:20:38 +0000, Gareth Bult wrote:
> 
> > The old driver also got the interface wrong.  In your example, with
> > just a single device to use, it doesn't matter.  But once you deal
> > with several devices, the old variant really sucks.  That is why I
> > changed it (and why I renamed the driver).
> 
> If you were to change the parameter name back to "device", it would be
> compatible with the old driver. (pretty much) Hence you'd not need to
> change the name (?)

That would work for 99% of all users - those that only use a single
device and no other parameters like erase size.  For the remaining 1%,
I don't want to break anything, so the different name should remain.

What I could do is introduce a new config option, like
CONFIG_RENAME_BLOCK2MTD_TO_BLKMTD.  With the option set, the driver
also accepts the "device" parameter and the kernel module is renamed.

Would this work for you?

Jörn

-- 
Eighty percent of success is showing up.
-- Woody Allen
