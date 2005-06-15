Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dif1J-0004eN-KS
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2005 17:02:00 -0400
Date: Wed, 15 Jun 2005 23:01:55 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Sean Young <sean@mess.org>
Message-ID: <20050615210155.GA32750@wohnheim.fh-wedel.de>
References: <20050613123626.GB30868@wohnheim.fh-wedel.de>
	<20050614192809.GA46302@atlantis.8hz.com>
	<20050614221844.GB17547@wohnheim.fh-wedel.de>
	<20050615192754.GA60103@atlantis.8hz.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20050615192754.GA60103@atlantis.8hz.com>
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

On Wed, 15 June 2005 21:27:54 +0200, Sean Young wrote:
> On Wed, Jun 15, 2005 at 12:18:44AM +0200, Joern Engel wrote:
> > Next round of comments...
> 
> Thank you. The improved version...
> 
> I'm assuming we're near to a state where it can be committed.

Yep.  No objections from my side.  Nice job!

> According to General Software documentation their implementation "snoops" 
> the fat table in order to see which sectors can be chucked. Hmm...

That's a smart thing to do if you can be certain the user is running
fat on top.  Being certain ain't so easy, though.

Jörn

-- 
This above all: to thine own self be true.
-- Shakespeare
