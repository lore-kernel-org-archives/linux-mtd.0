Received: from phoenix.infradead.org ([195.224.96.167])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1983Il-0007jA-5A
	for <linux-mtd@lists.infradead.org>; Tue, 22 Apr 2003 20:19:35 +0100
Received: from covert.brown-ring.iadfw.net ([209.196.123.142])
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 1983It-0002TU-00
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2003 20:19:43 +0100
Date: Tue, 22 Apr 2003 14:18:58 -0500
From: Art Haas <ahaas@airmail.net>
To: J?rn Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20030422191858.GA17381@debian>
References: <20030422155653.GB7260@debian>
	<20030422190324.GC12947@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030422190324.GC12947@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] C99 initializers for drivers/mtd/devices
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 22, 2003 at 09:03:24PM +0200, J?rn Engel wrote:
> On Tue, 22 April 2003 10:56:53 -0500, Art Haas wrote:
> > 
> > Here are two trivial patches adding C99 initializers to the files. The
> > patches are against the current BK.
> 
> Art, would you be willing to provide a patch against mtd cvs, in case
> David prefers that one? Use either cvs:
> cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs login (password: anoncvs)
> cvs -d :pserver:anoncvs@cvs.infradead.org:/home/cvs co mtd
> or the dayly ftp snapshot:
> ftp://ftp.uk.linux.org/pub/people/dwmw2/mtd/cvs/

I'm grabbing the cvs code now. Sorry I didn't follow up on the earlier
threads - I should have grabbed the cvs code then.

Art Haas
-- 
To announce that there must be no criticism of the President, or that we
are to stand by the President, right or wrong, is not only unpatriotic
and servile, but is morally treasonable to the American public.
 -- Theodore Roosevelt, Kansas City Star, 1918
