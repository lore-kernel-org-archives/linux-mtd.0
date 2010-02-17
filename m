Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nhf5E-000324-0S
	for linux-mtd@lists.infradead.org; Wed, 17 Feb 2010 08:16:36 +0000
Received: from sesr04.transmode.se (sesr04.transmode.se [192.168.201.15])
	by gw1.transmode.se (Postfix) with ESMTP id E61EB2597E6
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Feb 2010 09:16:29 +0100 (CET)
From: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 0/2] Move erasing to the GC thread.
Date: Wed, 17 Feb 2010 09:16:19 +0100
Message-Id: <1266394581-32450-1-git-send-email-Joakim.Tjernlund@transmode.se>
Cc: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Current JFFS2 erases blocks from write_super() which is
problematic as a reboot while erasing will make the
umount hang until all blocks has been erased.

These patches address this problem by moving the erasing
to the GC task instead, leaving write_super() to only
handle dirty data.

Joakim Tjernlund (2):
  jffs2: Move erasing from write_super to GC.
  jffs2: Make jffs2_erase_pending_trigger() initiate GC.

 fs/jffs2/background.c |    1 +
 fs/jffs2/erase.c      |    7 +++++--
 fs/jffs2/nodemgmt.c   |    4 ++++
 fs/jffs2/os-linux.h   |    9 +++++++--
 fs/jffs2/super.c      |    2 --
 fs/jffs2/wbuf.c       |    2 +-
 6 files changed, 18 insertions(+), 7 deletions(-)
