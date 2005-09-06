Received: from tim.rpsys.net ([194.106.48.114])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECfCQ-00069o-Gj
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 11:17:28 -0400
From: Richard Purdie <rpurdie@rpsys.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050906150819.GA14661@wohnheim.fh-wedel.de>
References: <E1ECeiI-0000H1-91@phoenix.infradead.org>
	<20050906150819.GA14661@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 06 Sep 2005 16:17:19 +0100
Message-Id: <1126019839.8338.156.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Tue, 2005-09-06 at 17:08 +0200, Jörn Engel wrote:
> On Tue, 6 September 2005 15:46:18 +0100, rpurdie@infradead.org wrote:
> > 
> > -	if (machine_is_husky()) {
> > +	if (machine_is_husky() || machine_is_borzoi()) {
> >  		/* Need to use small eraseblock size for backward compatibility */
> >  		sharpsl_mtd->flags |= MTD_NO_VIRTBLOCKS;
> >  	}
> 
> With Ferenc's patch in, MTD_NO_VIRTBLOCKS has lost its effect.  I
> guess we will remove that flag sometime in the near future.

I'm running mainline mtd so I guess I haven't seen this yet.

The problem is that on the Sharp Zaurus series we're stuck with a ROM
bootloader that flashes the partitions in a certain way. The above flag
allowed us to stay compatible with that and is quite important. I'm not
sure where this leaves us...

Thanks for the heads up though.

Richard
