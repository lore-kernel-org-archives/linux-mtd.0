Received: from cmsout01.mbox.net ([165.212.64.31])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C0mIj-0002nq-0F
	for linux-mtd@lists.infradead.org; Fri, 27 Aug 2004 15:22:20 -0400
Message-ID: <057701c48c6b$2431f6a0$fd0ba8c0@briantpc>
From: "Brian T" <btuch@usa.net>
To: <linux-mtd@lists.infradead.org>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc><045201c48c4b$8407dc40$fd0ba8c0@briantpc><Pine.LNX.4.61.0408271203050.2901@xanadu.home><053c01c48c60$4976ad80$fd0ba8c0@briantpc>
	<1093631103.16320.14.camel@thomas.tec.linutronix.de>
Date: Fri, 27 Aug 2004 14:22:05 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Re: undefined reference to `__ffs'
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> __ffs was never in 2.4. Move to 2.6 or add it to compatmac.h and provide
> a nice patch, if you really want to hang on with 2.4
>

Thanks, I'll  try to get that working and test it.  If it works I'll send in
a patch.

-Brian
