Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MG4Su-0001fc-Rl
	for linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 05:10:47 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR005.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KL900L5NKJ37620@VL-MO-MR005.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 15 Jun 2009 00:59:27 -0400 (EDT)
Date: Mon, 15 Jun 2009 01:10:18 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: let include/linux/mtd/partitions.h stand on its own
Message-id: <alpine.LFD.2.00.0906150107480.16467@xanadu.home>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

    
When declaring static MTD partitions in board specific code, only
including <include/linux/mtd/partitions.h> should suffice without
gcc nagging us with:
    
In file included from arch/arm/mach-kirkwood/sheevaplug-setup.c:14:
include/linux/mtd/partitions.h:50: warning: 'struct mtd_info' declared inside parameter list
include/linux/mtd/partitions.h:50: warning: its scope is only this definition or declaration, which is probably not what you want
include/linux/mtd/partitions.h:51: warning: 'struct mtd_info' declared inside parameter list
include/linux/mtd/partitions.h:61: warning: 'struct mtd_info' declared inside parameter list
include/linux/mtd/partitions.h:67: warning: 'struct mtd_info' declared inside parameter list
    
Signed-off-by: Nicolas Pitre <nico@marvell.com>

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
 
