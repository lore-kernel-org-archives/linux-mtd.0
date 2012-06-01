Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SaTb5-0001i1-0V
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 15:17:13 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 13/23] UBI: Fastmap: Add comments to fastmap paremters
Date: Fri,  1 Jun 2012 17:16:34 +0200
Message-Id: <1338563804-85990-14-git-send-email-richard@nod.at>
In-Reply-To: <1338563804-85990-1-git-send-email-richard@nod.at>
References: <1338563804-85990-1-git-send-email-richard@nod.at>
Cc: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 adrian.hunter@intel.com, Heinz.Egger@linutronix.de, shmulik.ladkani@gmail.com,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 drivers/mtd/ubi/ubi-media.h |   10 +++++++++-
 1 files changed, 9 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/ubi/ubi-media.h b/drivers/mtd/ubi/ubi-media.h
index 35628c3..adca33c 100644
--- a/drivers/mtd/ubi/ubi-media.h
+++ b/drivers/mtd/ubi/ubi-media.h
@@ -389,9 +389,17 @@ struct ubi_vtbl_record {
 #define UBI_FM_POOL_MAGIC	0x67AF4D08
 #define UBI_FM_EBA_MAGIC	0xf0c040a8
 
-/* TODO: would be great to have short coments for the constants */
+/* A fastmap supber block can be located between PEB 0 and
+ * UBI_FM_MAX_START */
 #define UBI_FM_MAX_START	64
+
+/* A fastmap can use up to UBI_FM_MAX_BLOCKS PEBs */
 #define UBI_FM_MAX_BLOCKS	32
+
+/* 5% of the total number of PEBs have to be scanned while attaching
+ * from a fastmap.
+ * But the size of this pool is limited to be between UBI_FM_MIN_POOL_SIZE and
+ * UBI_FM_MAX_POOL_SIZE */
 #define UBI_FM_MIN_POOL_SIZE	8
 #define UBI_FM_MAX_POOL_SIZE	256
 
-- 
1.7.6.5
