Received: from borg.org ([208.218.135.231])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15RhNn-0005gy-00
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2001 22:48:55 +0100
Date: Tue, 31 Jul 2001 17:54:42 -0400
From: Kent Borg <kentborg@borg.org>
To: Linux Mtd <linux-mtd@lists.infradead.org>
Subject: infradead.org vs kernel.org sources
Message-ID: <20010731175442.I10857@borg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello, a newbie here, and I thought I was making good progress
(debugging why I couldn't talk to our flash at all), and then I got
confused over sources.

I am working on an embedded PPC 405 controller.  We started with 2.4.2
sources from mvista.com, which seem quite close to kernel.org.  And
the main MTD web page <http://www.linux-mtd.infradead.org/> says "Very
occasionally, I make snapshot releases. Now that the MTD code is in
the 2.4 kernel, it's become even rarer. ", which I took to mean that
the kernel.org sources were up to date.

But now I had occasion to look at the stuff I grabbed from the
infradead cvs repository.  It looks rather different.

For example, mtd/drivers/mtd in the infradead sources seems to have
files I find in linux/drivers/mtd in kernel.org sources, but the
infradead sources are more elaborate and have sub-directories.

I guess my next move is to drop that infradead sub-tree into the
linux/drivers/mtd directory and see what happens.  (I think we need to
directly link, not be a loadable module, so the sources need to be
merged.)

Is this what I want?


Thanks,

-kb, the Kent who hopes to get JFFS working on top of MTD.
