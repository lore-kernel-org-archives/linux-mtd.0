Received: from atlantis.8hz.com ([212.129.237.78])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DiqTX-0006yi-Mh
	for linux-mtd@lists.infradead.org; Thu, 16 Jun 2005 05:15:52 -0400
Date: Thu, 16 Jun 2005 11:15:46 +0200
From: Sean Young <sean@mess.org>
To: Joern Engel <joern@wohnheim.fh-wedel.de>
Message-ID: <20050616091546.GA68824@atlantis.8hz.com>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
	<20050615210155.GA32750@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20050615210155.GA32750@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Embedded bios FTL
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 15, 2005 at 11:01:55PM +0200, Joern Engel wrote:
> On Wed, 15 June 2005 21:27:54 +0200, Sean Young wrote:
> > I'm assuming we're near to a state where it can be committed.
> 
> Yep.  No objections from my side.  Nice job!

Thanks, committed.

> > According to General Software documentation their implementation "snoops" 
> > the fat table in order to see which sectors can be chucked. Hmm...
> 
> That's a smart thing to do if you can be certain the user is running
> fat on top.  Being certain ain't so easy, though.

Indeed so. Besides, it would be more elegant if the file system driver 
passed this on to the block device, via an ioctl. Would such a thing
stand up to scrutiny? As far as I can see, only the ftl block devices 
would benefit.


Sean
