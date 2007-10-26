Received: from [212.176.242.38] (helo=vaxon.spb.rtsoft.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IlS8B-0005AX-LP
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 17:33:58 +0100
Date: Fri, 26 Oct 2007 20:30:58 +0400
From: Valentine Barshak <vbarshak@ru.mvista.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/2] PowerPC: Add 44x NDFC device-tree aware support
Message-ID: <20071026163058.GA11354@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: tglx@linutronix.de, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've worked in parallel with Stefan Roese on the new OF NDFC support.
This version (as well as Stefan's) is based on the original NDFC driver by Thomas Gleixner.
The major difference is that the original implements each chip connected NDFC banks as a
separate MTD device. Here I try to have one MTD device spread on all chips found.
However, the chips should have equal ID's and sizes, but I've never seen several different
chips attached to single ndfc. I'm adding ndfc_of as a separate file, since some other changes
have also been made (e.g. all i/o is made with ndfc_readl/writel inline functions).
The original version didn't handle driver removal well (it never calls del_mtd...),it's 
corrected here. I decided not to add ecc pos and oob layout to DTS, since we should be OK with
the default ones with NDFC.
This stuff has been tested on PowerPC 440EPx Sequoia board.
Any comments are greatly appreciated.
Thanks,
Valentine.
