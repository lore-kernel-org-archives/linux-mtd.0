Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 190zMN-0001J3-Ur
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 08:42:08 +0100
Date: Thu, 3 Apr 2003 09:41:48 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20030403074147.GA19536@wohnheim.fh-wedel.de>
References: <Pine.GSO.4.44.0304021225270.18949-100000@unix.cs.tamu.edu>
	<20030402201233.GA17890@wohnheim.fh-wedel.de>
	<200304030039.18812.tglx@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200304030039.18812.tglx@linutronix.de>
cc: Siddharth Choudhuri <choudhri@cs.tamu.edu>
cc: linux-mtd@lists.infradead.org
Subject: Re: newbie: struct flchip in flashchip.h...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 3 April 2003 00:39:18 +0200, Thomas Gleixner wrote:
> On Wednesday 02 April 2003 22:12, Jörn Engel wrote:
> > On Wed, 2 April 2003 12:28:47 -0600, Siddharth Choudhuri wrote:
> > > What are the members of the structure <mtd/flashchip.h>
> > > struct flchip {
> > > ...
> > > 	int word_write_time;
> > > 	int buffer_write_time;
> > > 	int erase_time;
> > > }
> > > used for ?
> >
> > I don't know, but you can figure it out yourself. Try
> > http://lxr.linux.no/
> grep -r word_write_time *
> would help too :)

Yes, and so would ctags.
Usually I prefer lxr. It is fast, knows the difference between
declaration, definition and invocation and usually doesn't screw up.
There are some rather obscure functions, though, where I have to fall
back to grep. huft_build e.g.

Jörn

-- 
Beware of bugs in the above code; I have only proved it correct, but
not tried it.
-- Donald Knuth
