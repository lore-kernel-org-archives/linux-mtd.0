Received: from www.tglx.de ([62.245.132.106])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IlWtO-00038q-Kd
	for linux-mtd@lists.infradead.org; Fri, 26 Oct 2007 22:39:00 +0100
Date: Fri, 26 Oct 2007 23:37:51 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Valentine Barshak <vbarshak@ru.mvista.com>
Subject: Re: [PATCH 0/2] PowerPC: Add 44x NDFC device-tree aware support
In-Reply-To: <20071026163058.GA11354@ru.mvista.com>
Message-ID: <alpine.LFD.0.9999.0710262316590.3186@localhost.localdomain>
References: <20071026163058.GA11354@ru.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linuxppc-dev@ozlabs.org, sr@denx.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 26 Oct 2007, Valentine Barshak wrote:
> The major difference is that the original implements each chip connected NDFC banks as a
> separate MTD device. Here I try to have one MTD device spread on all chips found.
> However, the chips should have equal ID's and sizes, but I've never seen several different
> chips attached to single ndfc.

Bamboo has 2 different nand chips. And I'm aware of another board
which has a 2k-page onboard NAND and sockets for SmartMedia /
PictureXd cards, which will simply break with your design.

Restricting stuff for no good reason is never a good idea.

mtdconcat can build you a big one if you want, so why adding
restrictions to a driver ?

> I'm adding ndfc_of as a separate file, since some other changes
> have also been made (e.g. all i/o is made with ndfc_readl/writel inline functions).

This should be done in the original ndfc driver and not in a separate
incarnation.

> The original version didn't handle driver removal well (it never calls del_mtd...),it's 
> corrected here.

Why not fixing the original driver ?

> Any comments are greatly appreciated.

NACK.

Please fix the existing driver and convert it to deal with OF and fix
the other short comings as well.

Duplicate code is not going anywhere near drivers/mtd/nand

	tglx
