Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ES7Xp-0007t8-1i
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 02:35:29 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20051018233441.GC20236@wohnheim.fh-wedel.de>
References: <20051014010726.GA28898@plexity.net>
	<20051018233441.GC20236@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Wed, 19 Oct 2005 08:37:41 +0200
Message-Id: <1129703862.19559.206.camel@tglx.tec.linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [Trivial] Make physmap messages more user friendly
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-10-19 at 01:34 +0200, Jörn Engel wrote:
> On Thu, 13 October 2005 18:07:26 -0700, Deepak Saxena wrote:
> > 
> > Can I commit the following to CVS? It makes the message a bit more
> > readalbe (and obvious that it is in hex) and tells the user if 
> > the probe failed.
> 
> I'd like to wait until tglx considers cvs stable enough for a mainline
> merge.  Thomas, besides the general lack of time, are there any major
> blockers left?

Not that I'm aware of. I put it on the agenda for the weekend.

tglx
