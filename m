Received: from [2002:d592:9a28::1] (helo=pentafluge.infradead.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bn2DZ-0002wA-Il
	for linux-mtd@lists.infradead.org; Tue, 20 Jul 2004 17:32:09 -0400
From: David Woodhouse <dwmw2@infradead.org>
To: tglx@linutronix.de
In-Reply-To: <1090354109.6864.7.camel@lap02.tec.linutronix.de>
References: <09A97B4DFB4DB64FB8B58BBC4A1F3C2905EF2904@GNTMLVEM01.e2k.ad.ge.com>
	<1090354109.6864.7.camel@lap02.tec.linutronix.de>
Content-Type: text/plain
Date: Tue, 20 Jul 2004 16:16:43 -0400
Message-Id: <1090354603.9046.0.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Flash Filesystem corrupted
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-07-20 at 22:08 +0200, Thomas Gleixner wrote:
> On Tue, 2004-07-20 at 20:18, Billalabeitia, Jose Carlos (GE Consumer &
> Industrial) wrote:
> 
> > linux-2.4.4-2002-02-14-denx
> > linux-2.4.4-jffs2-2002-05-01.patch for the JFFS2 
> > (basically improve GC performace)
> 
> Sorry, I don't have any clue which state of mtd/jffs2 is incorporated in
> those kernel versions. Deducing from the date 2002-xxx I assume both the
> kernel and the mtd/jffs2 code are so _ANCIENT_ that it will be hard to
> figure out if there are bugs which are solved in meantime or give you
> any meaningful advice how to track down those problems.

Indeed. Please try to reproduce in 2.6.8-rc2

-- 
dwmw2
