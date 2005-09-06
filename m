Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECfHO-0006O9-Uv
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 11:22:39 -0400
Date: Tue, 6 Sep 2005 17:22:38 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Richard Purdie <rpurdie@rpsys.net>
Message-ID: <20050906152238.GC14661@wohnheim.fh-wedel.de>
References: <E1ECeiI-0000H1-91@phoenix.infradead.org>
	<20050906150819.GA14661@wohnheim.fh-wedel.de>
	<1126019839.8338.156.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1126019839.8338.156.camel@localhost.localdomain>
Cc: rpurdie@infradead.org, linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/nand sharpsl.c,1.4,1.5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 September 2005 16:17:19 +0100, Richard Purdie wrote:
> On Tue, 2005-09-06 at 17:08 +0200, Jörn Engel wrote:
> > On Tue, 6 September 2005 15:46:18 +0100, rpurdie@infradead.org wrote:
> > > 
> > > -	if (machine_is_husky()) {
> > > +	if (machine_is_husky() || machine_is_borzoi()) {
> > >  		/* Need to use small eraseblock size for backward compatibility */
> > >  		sharpsl_mtd->flags |= MTD_NO_VIRTBLOCKS;
> > >  	}
> > 
> > With Ferenc's patch in, MTD_NO_VIRTBLOCKS has lost its effect.  I
> > guess we will remove that flag sometime in the near future.
> 
> I'm running mainline mtd so I guess I haven't seen this yet.

Fair enough.

> The problem is that on the Sharp Zaurus series we're stuck with a ROM
> bootloader that flashes the partitions in a certain way. The above flag
> allowed us to stay compatible with that and is quite important. I'm not
> sure where this leaves us...

Actually, this flag is important to *everybody*.  Whoever thought up
the hack to use virtual blocks instead of physical ones was plain
stupid and opened the door for incompatibilities, data loss and who
knows what else.

Hence, Ferenc made the flag implicit.  Actually, he was a bit smarter
and only made it implicit when required.  Either way, the virtual
blocks are gone, thankfully.

Jörn

-- 
When in doubt, punt.  When somebody actually complains, go back and fix it...
The 90% solution is a good thing.
-- Rob Landley
