Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CrdTn-0004gd-6Y
	for linux-mtd@lists.infradead.org; Thu, 20 Jan 2005 09:40:12 -0500
Date: Thu, 20 Jan 2005 15:40:11 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20050120144011.GB18170@wohnheim.fh-wedel.de>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<20050120143525.GA18170@wohnheim.fh-wedel.de>
	<1106231843.26551.584.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1106231843.26551.584.camel@hades.cambridge.redhat.com>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 20 January 2005 14:37:22 +0000, David Woodhouse wrote:
> On Thu, 2005-01-20 at 15:35 +0100, Jörn Engel wrote:
> > 
> > a) Never generate checksums.
> > b) Always generate checksums, but never check them.
> > 
> > Strategy b) sounds pretty stupid, but it optimizes the 90% case - read
> > - and allows the user to remount the filesystem to switch to PARANOID
> > mode.  So, we could go as you proposed, we could settle for either a)
> > or b) or we could allow both.  In that case I'd call a) the SLOPPY
> > case and b) the RELAXED, just to distinguish things.
> > 
> > Which one makes most sense?
> 
> B

I agree.  Deal.

Jörn

-- 
The strong give up and move away, while the weak give up and stay.
-- unknown
