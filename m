Received: from cbshost-12-155-143-237.sbcox.net ([12.155.143.237]
	helo=sb-lnx3.rinconnetworks.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19VGBV-0004qF-Md
	for <linux-mtd@lists.infradead.org>; Wed, 25 Jun 2003 20:44:01 +0100
Date: Wed, 25 Jun 2003 12:44:21 -0700
From: Paul van Gool <paul.vangool@rinconnetworks.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20030625194421.GB16321@rinconnetworks.com>
References: <20030625182431.GA15901@rinconnetworks.com>
	<03E9F4D1-A73B-11D7-A51A-000393AD6294@regolith.co.uk>
	<20030625184932.GE1770@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030625184932.GE1770@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: Jasmine Strong <jasmine@regolith.co.uk>
Subject: Re: No space left on almost empty JFFS2 filesystem
Reply-To: paul.vangool@rinconnetworks.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jörn and Jasmine,

thanks for the feedback. I'll give it a try.

Paul

On Wed, Jun 25, 2003 at 08:49:33PM +0200, Jörn Engel wrote:
> On Wed, 25 June 2003 19:29:54 +0100, Jasmine Strong wrote:
> > On Wednesday, Jun 25, 2003, at 19:24 Europe/London, Paul van Gool wrote:
> > 
> > >Creating am image with '-e 0x10000' and running with it, results in:
> > >[snip]
> > 
> > Did you erase the flash properly?  It looks like it's got messed up 
> > somehow.
> > 
> > Re- the other point.  You need, afaik, to have at least five empty 
> > erase blocks
> > before jffs2 will try to write to the flash.  This is, yes, half a 
> > mibibit.
> > 
> > Unless this has changed, Jörn?
> 
> No, it hasn't.  The changes were started, but never finished.
> 
> Jörn
> 
> -- 
> With a PC, I always felt limited by the software available. On Unix, 
> I am limited only by my knowledge.
> -- Peter J. Schoenster

-- 
Paul van Gool                                               Rincon Networks
paul.vangool@rinconnetworks.com                              (805)-705-1442
