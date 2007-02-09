Received: from nat-132.atmel.no ([80.232.32.132] helo=relay.atmel.no)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFWm1-0003Gt-JE
	for linux-mtd@lists.infradead.org; Fri, 09 Feb 2007 09:30:52 -0500
Date: Fri, 9 Feb 2007 15:30:29 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] Don't include linux/mtd/map.h from linux/mtd/physmap.h
Message-ID: <20070209153029.1ffe2420@dhcp-252-105.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace the inclusion of linux/mtd/map.h with a forward-declaration
of struct map_info. This allows linux/mtd/physmap.h to be included by
e.g. board code even if the MTD subsystem is disabled.

Signed-off-by: Haavard Skinnemoen <hskinnemoen@atmel.com>
---
 include/linux/mtd/physmap.h |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index 86831e3..0dc07d5 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -18,9 +18,10 @@
 #define __LINUX_MTD_PHYSMAP__
 
 #include <linux/mtd/mtd.h>
-#include <linux/mtd/map.h>
 #include <linux/mtd/partitions.h>
 
+struct map_info;
+
 struct physmap_flash_data {
 	unsigned int		width;
 	void			(*set_vpp)(struct map_info *, int);
-- 
1.4.4.3
