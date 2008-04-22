Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoS6W-0007uS-IW
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 23:40:53 +0000
Message-ID: <480E7784.6030902@gmx.de>
Date: Wed, 23 Apr 2008 01:40:52 +0200
From: Thomas Kunze <thommycheck@gmx.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix cfi for collie flash
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

collie seems to contain LH28F640BF flash chips. According to 
http://sharp-world.com/products/device/flash/pdf/*FUM00701*@E.pdf
(page 83) if they have 0x51 of Extended Query Table (number of hardware 
partitions) set to zero, they have a single fixed partition.
This patch makes those chips work.

Regards,
Thomas

Signed-off-by: Thomas Kunze <thommycheck@gmx.de>
diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c 
b/drivers/mtd/chips/cfi_cmdset_0001.c
index 0080452..34da59b 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -618,7 +618,11 @@ static int cfi_intelext_partition_fixup(struct 
mtd_info *mtd,
                               + (rinfo->NumBlockTypes - 1) *
                                 sizeof(struct cfi_intelext_blockinfo);
               }
-
+
+               /* if numregions=0 we have one big partition */
+               if(!numparts)
+                       numparts = 1;
+
               /* Programming Region info */
               if (extp->MinorVersion >= '4') {
                       struct cfi_intelext_programming_regioninfo *prinfo;
