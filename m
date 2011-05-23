Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNC-0002TQ-3M
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:27 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:25 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 14/62] mips/tx99: remove CONFIG_MTD_PARTITIONS check
Date: Mon, 23 May 2011 10:22:55 +0100
Message-Id: <1306142623-24952-15-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org,
	Ralf Baechle <ralf@linux-mips.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

CONFIG_MTD_PARTITIONS no longer exists as MTD partitioning is always
enabled now.

Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 arch/mips/txx9/generic/setup.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/arch/mips/txx9/generic/setup.c b/arch/mips/txx9/generic/setup.c
index 812816c..ec38e00 100644
--- a/arch/mips/txx9/generic/setup.c
+++ b/arch/mips/txx9/generic/setup.c
@@ -639,7 +639,6 @@ void __init txx9_physmap_flash_init(int no, unsigned long addr,
 		.flags = IORESOURCE_MEM,
 	};
 	struct platform_device *pdev;
-#ifdef CONFIG_MTD_PARTITIONS
 	static struct mtd_partition parts[2];
 	struct physmap_flash_data pdata_part;
 
@@ -658,7 +657,7 @@ void __init txx9_physmap_flash_init(int no, unsigned long addr,
 		pdata_part.parts = parts;
 		pdata = &pdata_part;
 	}
-#endif
+
 	pdev = platform_device_alloc("physmap-flash", no);
 	if (!pdev ||
 	    platform_device_add_resources(pdev, &res, 1) ||
-- 
1.7.4.4
