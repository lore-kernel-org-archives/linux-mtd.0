Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 1580ky-0007bp-00
	for <linux-mtd@lists.infradead.org>; Thu, 07 Jun 2001 15:27:29 +0100
Date: Thu, 7 Jun 2001 10:30:17 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Abraham vd Merwe <abraham@2d3d.co.za>
cc: David Woodhouse <dwmw2@infradead.org>,
        MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: HELP
In-Reply-To: <20010607114319.A23641@crystal.2d3d.co.za>
Message-ID: <Pine.LNX.4.33.0106071025280.24927-100000@xanadu.home>
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


On Thu, 7 Jun 2001, Abraham vd Merwe wrote:

> Hi David!
>
> > abraham@2d3d.co.za said:
> > > mtd_debug: Unaligned memory access at pc=0xca005644, lr=0xc001dc08
> > > (bad address=0xc0135d82, cod) Internal error: alignment exception: 0
> >
> > Enable CONFIG_ALIGNMENT_TRAP.
> >
> > 2.4.4-rmk1 or later will force you to do this before you can enable
> > CONFIG_MTD.
>
> why is this necessary though? The kernel docs make it pretty clear that
> enabling that causes severe performance penalties which I wanted to avoid.

More precisely, _relying_ on it for unaligned access _only_ causes severe
performance penalties.  If you know in advance at compile time that you're
going to make unaligned access to memory then just wrap those with the
get_unaligned()/put_unaligned() macros.  The alignment trap will emulate
unaligned access at run time, with a performance penalty of course, but
still it will work for the rare and unpredictable cases where it might
happen.


Nicolas
