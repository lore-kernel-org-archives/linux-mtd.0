Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1qlc-0001yS-0i
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 14:20:36 -0400
Message-ID: <06d101c48ebe$02a2a340$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: "Josh Boyer" <jdub@us.ibm.com>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
	<053c01c48c60$4976ad80$fd0ba8c0@briantpc>
	<1093631103.16320.14.camel@thomas.tec.linutronix.de>
	<068701c48eaf$845dfe70$fd0ba8c0@briantpc>
	<1093888352.25339.39.camel@weaponx.rchland.ibm.com>
Date: Mon, 30 Aug 2004 13:20:19 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > 
> > compatmac.h patch attached for __ffs() .
> > 
> > Compiles against 2.4.27 now.  Hope I didn't break anything.
> 
> Hrm...  that won't work on non-x86 architectures.
> 
> josh
> 

Not sure how to fix it for non-x86 then.  Point me in the right direction?

-Brian
