Received: from e4.ny.us.ibm.com ([32.97.182.104])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1C1qKl-0001mD-Ep
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2004 13:52:50 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: Brian T <btuch@usa.net>
In-Reply-To: <068701c48eaf$845dfe70$fd0ba8c0@briantpc>
References: <042901c48c42$2593cd30$fd0ba8c0@briantpc>
	<045201c48c4b$8407dc40$fd0ba8c0@briantpc>
	<Pine.LNX.4.61.0408271203050.2901@xanadu.home>
	<053c01c48c60$4976ad80$fd0ba8c0@briantpc>
	<1093631103.16320.14.camel@thomas.tec.linutronix.de>
	<068701c48eaf$845dfe70$fd0ba8c0@briantpc>
Content-Type: text/plain
Message-Id: <1093888352.25339.39.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 30 Aug 2004 12:52:32 -0500
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

On Mon, 2004-08-30 at 11:36, Brian T wrote:
> 
> > On Fri, 2004-08-27 at 20:04, Brian T wrote:
> > > So MTD is no longer compatable with the current 2.4 tree?  I just
> unpacked
> > > it and didn't see it in linux/asm-i386/bitops.h .  Am I looking in the
> wrong
> > > place?
> >
> > __ffs was never in 2.4. Move to 2.6 or add it to compatmac.h and provide
> > a nice patch, if you really want to hang on with 2.4
> >
> > tglx
> 
> compatmac.h patch attached for __ffs() .
> 
> Compiles against 2.4.27 now.  Hope I didn't break anything.

Hrm...  that won't work on non-x86 architectures.

josh
