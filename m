Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19NXNI-0004gQ-AO
	for <linux-mtd@lists.infradead.org>; Wed, 04 Jun 2003 13:28:16 +0100
Date: Wed, 4 Jun 2003 14:28:36 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20030604122836.GA19246@wohnheim.fh-wedel.de>
References: <1054715689.17921.183.camel@passion.cambridge.redhat.com>
	<20030604095754.GB27112@wohnheim.fh-wedel.de>
	<1054721184.17921.212.camel@passion.cambridge.redhat.com>
	<1054721328.17921.214.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1054721328.17921.214.camel@passion.cambridge.redhat.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Execute in place.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 4 June 2003 11:08:48 +0100, David Woodhouse wrote:
> On Wed, 2003-06-04 at 11:06, David Woodhouse wrote:
> > On Wed, 2003-06-04 at 10:57, Jörn Engel wrote:
> > > For my flash chips, an erase operation is in the ballpark of a second.
> > > That is very long for interrupts, so I would assume, we never complete
> > > an erase without being interrupted.  Does this mean that a formerly
> > > suspended and resumed erase operation completes quicker than a fresh
> > > one? 
> > 
> > That appears to be the case, yes. Certainly, in the common case of it
> > being 10ms before you get the next timer tick and consider rescheduling,
> > the chip's made enough progress that it doesn't have to start again from
> > scratch.
> 
> Oh, and bear in mind that if erases were happening and you were trying
> to read from the filesystem, that was causing many many erase suspends
> to happen too anyway -- if this was a problem, it would have bitten us
> as soon as we started suspending erases to permit reads to happen.

Right.  The great goddess Empiria smiles upon us.

Jörn

-- 
The cheapest, fastest and most reliable components of a computer
system are those that aren't there.
-- Gordon Bell, DEC labratories
