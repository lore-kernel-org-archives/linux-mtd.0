Received: from herkules.vianova.fi ([194.100.28.129] helo=mail.vianova.fi)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FyPEB-00032z-Es
	for linux-mtd@lists.infradead.org; Thu, 06 Jul 2006 04:29:09 -0400
Date: Thu, 6 Jul 2006 11:28:48 +0300
From: Ville Herva <vherva@vianova.fi>
To: linux-mtd@lists.infradead.org
Subject: Re: block2mtd: Overrun end of disk in cache readahead
Message-ID: <20060706082847.GM15078@vianova.fi>
References: <20060705072614.GQ6240@vianova.fi> <44AB6EFA.9000604@thinstuff.com>
	<20060705100727.GC15078@vianova.fi>
	<20060705112223.GA29743@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060705112223.GA29743@wohnheim.fh-wedel.de>
Reply-To: vherva@vianova.fi
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 05, 2006 at 01:22:23PM +0200, you [Jörn Engel] wrote:
> 
> I'm fairly tempted to just nuke the readahead code completely.  For
> some users, it is outright harmful (usbstick, some other flash behind
> blockdev interface), for others it should be done by the block device
> driver, not by block2mtd.
> 
> If either of you wants to do that and can test the resulting patch,
> you have my blessing.

I'm afraid the box I tested this with already has already gone to
"production". So I currently have zero flash devices I could test this on.
Of course, I guess I could just use regular block device (a loop file,
even)...



-- v -- 

v@iki.fi
