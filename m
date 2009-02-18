Received: from buzzloop.caiaq.de ([212.112.241.133])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LZt8U-00019G-D1
	for linux-mtd@lists.infradead.org; Wed, 18 Feb 2009 20:35:17 +0000
Received: from localhost (localhost [127.0.0.1])
	by buzzloop.caiaq.de (Postfix) with ESMTP id 0FFCE7F4029
	for <linux-mtd@lists.infradead.org>;
	Wed, 18 Feb 2009 21:35:06 +0100 (CET)
Received: from buzzloop.caiaq.de ([127.0.0.1])
	by localhost (buzzloop.caiaq.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eyoDXThIml27 for <linux-mtd@lists.infradead.org>;
	Wed, 18 Feb 2009 21:35:03 +0100 (CET)
Date: Wed, 18 Feb 2009 21:35:03 +0100
From: Daniel Mack <daniel@caiaq.de>
To: linux-mtd@lists.infradead.org
Subject: pxa3xx: NAND chip initial reset
Message-ID: <20090218203503.GA20149@buzzloop.caiaq.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On my PXA300 based system, I'm facing a problem with a recent Micron
NAND chip which needs to get a reset command to make it wake up
initially. The pxa3xx_nand.c does not seem to do this.

I've seen a post[1] from October 2008 which addresses exactly this
issue, but the mentioned commit (in the follow-up) does not fix it for
me. I did some print tracing and the generic code path is not entered
because the platform driver's probe routine returns with an error.
Before I dig into all the mtd code, I'd like to ask whether anyone can
come up with a simple idea of how to do this.

Thanks,
Daniel

[1] http://lists.infradead.org/pipermail/linux-mtd/2008-October/023419.html
