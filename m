Date: Fri, 14 Dec 2007 15:45:55 +0900
From: Kyungmin Park <kyungmin.park@samsung.com>
To: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Subject: [PATCH/RFC] [MTD] Increase the MTD_MAX_ECCPOS_ENTRIES to 80
Message-ID: <20071214064555.GA29506@party>
Mime-Version: 1.0
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

Besides from the SLC flash, MLC flash s required more powerful ECC scheme than 1-bit. Usually, it used the 4-bit ECC. It means it needs more eccpos.
However the current eccpos array doesn't fit for it.

So I hope to increase this one to 80.
I'm not sure the bare NAND needs more rooms.

Any comments are welcome.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 5a61074..2e2f828 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -114,13 +114,14 @@ struct nand_oobfree {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES	8
+#define MTD_MAX_ECCPOS_ENTRIES	80
 /*
  * ECC layout control structure. Exported to userspace for
  * diagnosis and to allow creation of raw images
  */
 struct nand_ecclayout {
 	uint32_t eccbytes;
-	uint32_t eccpos[64];
+	uint32_t eccpos[MTD_MAX_ECCPOS_ENTRIES];
 	uint32_t oobavail;
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };
