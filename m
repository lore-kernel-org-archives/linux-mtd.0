Received: from mail.imc-berlin.de ([217.110.46.186] helo=mail.berlin.imc-berlin.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Vp9g-0006eQ-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Jan 2003 08:32:12 +0000
Message-ID: <3E1A97C2.DA5A0FC0@imc-berlin.de>
Date: Tue, 07 Jan 2003 10:02:58 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: tglx@linutronix.de
CC: linux-mtd@lists.infradead.org
Subject: Re: Compile error in mtdblock-core...
References: <3E199E9D.8A02D98F@imc-berlin.de> <200301062003.40607.tglx@linutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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


Thomas Gleixner wrote:
> 
> On Monday 06 January 2003 16:19, Steven Scholz wrote:
> > -DKBUILD_BASENAME=mtdblock_core  -c -o mtdblock-core.o mtdblock-core.c
> > In file included from
> > /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blk
> >.h:4, from mtdblock-core.c:18:
> > /opt/BITKEEPER/Exports/linuxppc_2_4_devel-2003-01-06.test/include/linux/blk
> >dev.h:147: parse error before `struct'
> Check in blkdev.h, if the define before the struct contains any control
> characters. Happens sometimes and gcc is not very happy with this. Should not
> be a problem of mtd, because mtd does not modify blkdev.h.

Hmm, I see. But this only happens after I used the patchin script from MTD CSV.
I can't see any control characters in blkdev.h.

Is it working for you? With the latest BitKeeper tree?

Steven
