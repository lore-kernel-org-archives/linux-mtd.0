Received: from www19.your-server.de ([213.133.104.19])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1I3SLr-0000UR-D2
	for linux-mtd@lists.infradead.org; Wed, 27 Jun 2007 03:54:13 -0400
From: Uli Luckas <u.luckas@road.de>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: [PATCH][update] jffs2_gcd_mtd3, Stopping kernel threads timed out
Date: Wed, 27 Jun 2007 09:53:54 +0200
References: <200706141509.50621.u.luckas@road.de>
	<200706261639.49486.u.luckas@road.de>
	<1182872184.19501.15.camel@weaponx.rchland.ibm.com>
In-Reply-To: <1182872184.19501.15.camel@weaponx.rchland.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200706270953.56030.u.luckas@road.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, 26. June 2007, Josh Boyer wrote:
> On Tue, 2007-06-26 at 16:39 +0200, Uli Luckas wrote:
> > On Tuesday, 26. June 2007, Josh Boyer wrote:
> > > The one thing I would hesitate with about your patch is that you've now
> > > broken the existing behavior of the thread in regards to SIGHUP.  You
> > > used to be able to send the threads a SIGHUP and it would do a single
> > > pass.  With your patch, it won't do that unless the thresholds are
> > > right.  Being able to send SIGHUP to force a GC pass is a pretty useful
> > > thing for debugging, etc.
> > >
> > thanks Josh, alot for reviewing the patch. Following your advise, I force GC 
> > now, if SIGHUP was received.
> > The patch still introduces a change in sematics though for all other signals 
> > (except SIGKILL). But I feel, the new behavior is more what one would expect. 
> > In case, the old behavior is desired, it is simple enough to set force_gc in 
> > the coresponding branches.
> 
> Your updated patch looks good to me.  Will need a Signed-off-by: line
> though.
> 
It's there, right above the patch.

Uli

-- 

------- ROAD ...the handyPC Company - - -  ) ) )

Uli Luckas
Software Development

ROAD GmbH
Bennigsenstr. 14 | 12159 Berlin | Germany
fon: +49 (30) 230069 - 64 | fax: +49 (30) 230069 - 69
url: www.road.de

Amtsgericht Charlottenburg: HRB 96688 B
Managing directors: Hans-Peter Constien, Hubertus von Streit
