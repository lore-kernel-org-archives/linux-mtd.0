Received: from mailout2.samsung.com ([203.254.224.25])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EVkmm-0000cG-NJ
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 03:05:56 -0400
Received: from ep_mmp1 (mailout2.samsung.com [203.254.224.25])
	by mailout2.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0IP400G9811OKJ@mailout2.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 16:05:48 +0900 (KST)
Received: from july7 ([10.88.163.199])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0IP40047711OXJ@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Sat, 29 Oct 2005 16:05:48 +0900 (KST)
Date: Sat, 29 Oct 2005 16:05:48 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: linux-mtd@lists.infradead.org
Message-id: <0IP40047811OXJ@mmp1.samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: [PATCH] OneNAND: Use flash_platform_data
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

Now we use flash_platform_data instead of onenand_platform_data.

If you want to support OneNAND Sync. Burst Read, apply following patch and
enable mmcontrol 

http://www.arm.linux.org.uk/developer/patches/viewpatch.php?id=3057/1

Of course, you have to implement mmcontrol function in board specific files.

Thank you,

Kyungmin Park

--

diff --git a/drivers/mtd/onenand/generic.c b/drivers/mtd/onenand/generic.c
--- a/drivers/mtd/onenand/generic.c
+++ b/drivers/mtd/onenand/generic.c
@@ -39,7 +39,7 @@ static int __devinit generic_onenand_pro
 {
 	struct onenand_info *info;
 	struct platform_device *pdev = to_platform_device(dev);
-	struct onenand_platform_data *pdata = pdev->dev.platform_data;
+	struct flash_platform_data *pdata = pdev->dev.platform_data;
 	struct resource *res = pdev->resource;
 	unsigned long size = res->end - res->start + 1;
 	int err;
@@ -61,7 +61,8 @@ static int __devinit generic_onenand_pro
 		goto out_release_mem_region;
 	}
 
-	info->onenand.mmcontrol = pdata->mmcontrol;
+	// FIXME Enable this, If flash_platform_data has mmcontrol method
+//	info->onenand.mmcontrol = pdata->mmcontrol;
 
 	info->mtd.name = pdev->dev.bus_id;
 	info->mtd.priv = &info->onenand;
