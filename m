Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16V7ob-0000C7-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 09:11:01 +0000
Date: Mon, 28 Jan 2002 09:21:20 +0000 (GMT)
From: kira brown <kira@hex.linuxgrrls.org>
To: Charles Manning <manningc2@actrix.gen.nz>
Cc: Ramya Ravichandran <rrhsin@yahoo.co.in>,
	<linux-mtd@lists.infradead.org>
Subject: Re: Cf Card vs DiskOnChip
In-Reply-To: <20020128013905.81A0611FD@creative.actrix.co.nz>
Message-ID: <Pine.LNX.4.33.0201280914130.9494-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Mon, 28 Jan 2002, Charles Manning wrote:

> kira I reckon you're being a bit rude!

I'm sorry, I just don't have much respect for people who say things like
'cost is more important than reliability'.  Probably becasue I've cleaned
up their messes so often.

I also don't understand the point of fitting an unreliable Flash to
replace the hard disc in an ordinary PC.  It's not as if it will be any
faster (CF is much slower than a rotating IDE disc) or last any longer
(since CFs tend to drop dead unexpectedly).  Neither can you build a
system free of moving parts, since it will still need a cooling fan or
two.  The only thing you can say is that the power supply requirements
will be a bit smaller-  but if you were really worried about that, why
would you be using a big chunky x86 35-amps-at-two-volts processor?

When designing an embedded system it's important to start by looking at
your application rather than by looking at what technologies you
understand and kludging the design to make it all fit.

I think someone needs to tell us what they actually need from a storage
device, and then we can help them, rather than saying 'I need 128M of
somethign exactly like a hard disc' which is clearly a specification
derived from trying to make a desktop system embedded.

kira.
