Received: from e4.ny.us.ibm.com ([32.97.182.104])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1rST-0002UD-NH
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 15:04:51 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.61.0408301450530.19106@xanadu.home>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
	<053c01c48c60$4976ad80$fd0ba8c0@briantpc>
	<1093631103.16320.14.camel@thomas.tec.linutronix.de>
	<068701c48eaf$845dfe70$fd0ba8c0@briantpc>
	<1093888352.25339.39.camel@weaponx.rchland.ibm.com>
	<06d101c48ebe$02a2a340$fd0ba8c0@briantpc>
	<1093890929.25339.45.camel@weaponx.rchland.ibm.com>
	<Pine.LNX.4.61.0408301450530.19106@xanadu.home>
Content-Type: text/plain
Message-Id: <1093892677.25339.50.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 30 Aug 2004 14:04:37 -0500
Content-Transfer-Encoding: 7bit
Cc: Brian T <btuch@usa.net>, linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-08-30 at 13:53, Nicolas Pitre wrote:
> On Mon, 30 Aug 2004, Josh Boyer wrote:
> 
> > On Mon, 2004-08-30 at 13:20, Brian T wrote:
> >> Not sure how to fix it for non-x86 then.  Point me in the right direction?
> >
> > Welcome to the hell that is compatmac.h ;).
> >
> > Seriously though, maybe take a look at generic_ffs() in
> > include/linux/bitops.h (in the 2.6 kernel).
> 
> Again, ffs()/generic_ffs() are not equivalent to __ffs().

Hm, I remember you saying that now.  Care to explain how they are
different?

josh
