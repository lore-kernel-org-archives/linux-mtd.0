Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PwsIs-0008Pu-BJ
	for linux-mtd@lists.infradead.org; Tue, 08 Mar 2011 08:30:02 +0000
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
Subject: [PATCH v3 0/7] UBIFS: fix recovery on CFI NOR
Date: Tue,  8 Mar 2011 10:32:41 +0200
Message-Id: <1299573168-27760-1-git-send-email-dedekind1@gmail.com>
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

here is the third version of the patches. The differences to v2 are
as follows.

1. UBI now exports the LEB start offset. UBIFS uses this to figure out
   whether the LEB starts at the max_write_size-aligned boundary or
   not.
2. The bugfix in recovery.c is included.

I've also pushed these patches to the master and linux-next branches of
the ubifs-2.6.git tree, and the plan is to merge them upstream.

Note, the "mtd: cfi: fix writebufsize initialization" patch from Anatolij,
which fixes mtd->writebufsize when there is interleaving and which is also
necessary to fix UBIFS recovery on CFI NOR, should be merged upstream via
the MTD tree, and it is currently sitting in my l2-mtd-2.6.git tree.

Artem.
