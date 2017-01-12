Received: from mout.web.de ([212.227.15.14])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cRcjV-0006nt-DY
 for linux-mtd@lists.infradead.org; Thu, 12 Jan 2017 10:35:51 +0000
Subject: [PATCH 1/3] mtd/ftl: Use kmalloc_array() in build_maps()
To: linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 David Woodhouse <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>
References: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <b379ba57-d926-2572-17ec-5bbe166b0e37@users.sourceforge.net>
Date: Thu, 12 Jan 2017 11:35:19 +0100
MIME-Version: 1.0
In-Reply-To: <4a5a265e-96c8-5fe6-487a-92a0d47a91da@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 12 Jan 2017 10:42:25 +0100

* Multiplications for the size determination of memory allocations
  indicated that array data structures should be processed.
  Thus use the corresponding function "kmalloc_array".

  This issue was detected by using the Coccinelle software.

* Replace the specification of data types by pointer dereferences
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/mtd/ftl.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 9fb3b0dcdac2..ef2f38b6a837 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -207,15 +207,14 @@ static int build_maps(partition_t *part)
     /* Set up erase unit maps */
     part->DataUnits = le16_to_cpu(part->header.NumEraseUnits) -
 	part->header.NumTransferUnits;
-    part->EUNInfo = kmalloc(part->DataUnits * sizeof(struct eun_info_t),
-			    GFP_KERNEL);
+	part->EUNInfo = kmalloc_array(part->DataUnits, sizeof(*part->EUNInfo),
+				      GFP_KERNEL);
     if (!part->EUNInfo)
 	    goto out;
     for (i = 0; i < part->DataUnits; i++)
 	part->EUNInfo[i].Offset = 0xffffffff;
-    part->XferInfo =
-	kmalloc(part->header.NumTransferUnits * sizeof(struct xfer_info_t),
-		GFP_KERNEL);
+	part->XferInfo = kmalloc_array(part->header.NumTransferUnits,
+				       sizeof(*part->XferInfo), GFP_KERNEL);
     if (!part->XferInfo)
 	    goto out_EUNInfo;
 
@@ -275,8 +274,8 @@ static int build_maps(partition_t *part)
     memset(part->VirtualBlockMap, 0xff, blocks * sizeof(uint32_t));
     part->BlocksPerUnit = (1 << header.EraseUnitSize) >> header.BlockSize;
 
-    part->bam_cache = kmalloc(part->BlocksPerUnit * sizeof(uint32_t),
-			      GFP_KERNEL);
+	part->bam_cache = kmalloc_array(part->BlocksPerUnit,
+					sizeof(*part->bam_cache), GFP_KERNEL);
     if (!part->bam_cache)
 	    goto out_VirtualBlockMap;
 
-- 
2.11.0
