Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DBsKk-0006hr-Cz
	for linux-mtd@lists.infradead.org; Thu, 17 Mar 2005 05:34:31 -0500
Date: Thu, 17 Mar 2005 11:34:18 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Josh Boyer <jdub@us.ibm.com>
Message-ID: <20050317103418.GA4501@wohnheim.fh-wedel.de>
References: <1110827292.7642.26.camel@windu.rchland.ibm.com>
	<1110828016.7642.29.camel@windu.rchland.ibm.com>
	<1110828565.7642.33.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1110828565.7642.33.camel@windu.rchland.ibm.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: lock bit and erase errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 March 2005 13:29:24 -0600, Josh Boyer wrote:
> On Mon, 2005-03-14 at 13:20 -0600, Josh Boyer wrote:
> > On Mon, 2005-03-14 at 13:08 -0600, Josh Boyer wrote:
> > > Caveat:  I am using some pretty old code in this case, but the current
> > > code is also questionable so bear with me.
> 
> FYI, I just ran this with a 2.6 kernel + fairly recent MTD code and I
> see the same problems.
> 
> No more updates from me until I hear back, I promise :).

I've had a quick look and would agree with you right now.  This
appears to be a bug.

Generally speaking, there appears to be a lack of automated tests for
the cfi code.  Getting it to work right for all combinations of bus
widths, etc. is a challenge.  But automated tests would require one
device of each kind and I have no idea how to get all those.

Maybe you should just fix your special case and hope not to break
someone else.

Jörn

-- 
A surrounded army must be given a way out.
-- Sun Tzu
