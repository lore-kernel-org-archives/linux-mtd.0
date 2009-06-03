Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBg3y-0007zH-DX
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 02:18:52 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KKN0073O52X4FC0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 22:18:33 -0400 (EDT)
Date: Tue, 02 Jun 2009 22:18:33 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] let include/linux/mtd/partitions.h stand on its own
Message-id: <alpine.LFD.2.00.0906022208560.3906@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When declaring static MTD partitions in board specific code, only 
including include/linux/mtd/partitions.h should suffice without
gcc nagging us.

Signed-off-by: Nicolas Pitre <nico@marvell.com>
---

This is also queued on top of

	git://git.marvell.com/orion mtd

for which a pull request was sent already.

diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index af6dcb9..b70313d 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -47,6 +47,8 @@ struct mtd_partition {
 #define MTDPART_SIZ_FULL	(0)
 
 
+struct mtd_info;
+
 int add_mtd_partitions(struct mtd_info *, const struct mtd_partition *, int);
 int del_mtd_partitions(struct mtd_info *);
 
