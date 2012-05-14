Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1STxd2-0002ki-3K
 for linux-mtd@lists.infradead.org; Mon, 14 May 2012 15:56:10 +0000
From: Richard Weinberger <richard@nod.at>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] UBI: Remove data type hint from ubi-user.h
Date: Mon, 14 May 2012 17:55:52 +0200
Message-Id: <1337010952-39543-2-git-send-email-richard@nod.at>
In-Reply-To: <1337010952-39543-1-git-send-email-richard@nod.at>
References: <1337010952-39543-1-git-send-email-richard@nod.at>
Cc: Richard Weinberger <richard@nod.at>, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This finally removes the data type hint from the UBI ABI.
>From now on the "dtype" field will be ignored and must not used
anymore.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
 include/mtd/ubi-user.h |   23 ++---------------------
 1 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 3c41097..370c750 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -196,23 +196,6 @@
 #define UBI_MAX_RNVOL 32
 
 /*
- * UBI data type hint constants.
- *
- * UBI_LONGTERM: long-term data
- * UBI_SHORTTERM: short-term data
- * UBI_UNKNOWN: data persistence is unknown
- *
- * These constants are used when data is written to UBI volumes in order to
- * help the UBI wear-leveling unit to find more appropriate physical
- * eraseblocks.
- */
-enum {
-	UBI_LONGTERM  = 1,
-	UBI_SHORTTERM = 2,
-	UBI_UNKNOWN   = 3,
-};
-
-/*
  * UBI volume type constants.
  *
  * @UBI_DYNAMIC_VOLUME: dynamic volume
@@ -375,25 +358,23 @@ struct ubi_rnvol_req {
  *                             requests.
  * @lnum: logical eraseblock number to change
  * @bytes: how many bytes will be written to the logical eraseblock
- * @dtype: data type (%UBI_LONGTERM, %UBI_SHORTTERM, %UBI_UNKNOWN)
  * @padding: reserved for future, not used, has to be zeroed
  */
 struct ubi_leb_change_req {
 	__s32 lnum;
 	__s32 bytes;
-	__s8  dtype;
+	__s8  dtype; /* obsolete, do not use! */
 	__s8  padding[7];
 } __packed;
 
 /**
  * struct ubi_map_req - a data structure used in map LEB requests.
  * @lnum: logical eraseblock number to unmap
- * @dtype: data type (%UBI_LONGTERM, %UBI_SHORTTERM, %UBI_UNKNOWN)
  * @padding: reserved for future, not used, has to be zeroed
  */
 struct ubi_map_req {
 	__s32 lnum;
-	__s8  dtype;
+	__s8  dtype; /* obsolete, do not use! */
 	__s8  padding[3];
 } __packed;
 
-- 
1.7.6.5
