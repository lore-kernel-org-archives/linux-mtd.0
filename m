Received: from vega.surpasshosting.com ([72.29.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MvRrE-0007OM-Fz
	for linux-mtd@lists.infradead.org; Wed, 07 Oct 2009 08:26:52 +0000
From: Felix Radensky <felix@embedded-sol.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: Fix MEMGETINFO and MEMGETREGIONINFO for devices >= 4GB
Date: Wed,  7 Oct 2009 10:26:42 +0200
Message-Id: <1254904002-24913-1-git-send-email-felix@embedded-sol.com>
In-Reply-To: <>
References: <>
Cc: Felix Radensky <felix@embedded-sol.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently MEMGETINFO and MEMGETREGIONINFO report invalid
information for devices >= 4GB, since relevant fields in
MTD ABI structures are 32-bit while corresponding fields
in kernel internal structures are 64-bit. Fix ABI fields
to be 64-bit as well.

Signed-off-by: Felix Radensky <felix@embedded-sol.com>
---
 include/mtd/mtd-abi.h |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index be51ae2..c66044d 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -64,7 +64,7 @@ struct mtd_oob_buf64 {
 struct mtd_info_user {
 	__u8 type;
 	__u32 flags;
-	__u32 size;	 // Total size of the MTD
+	__u64 size;	 // Total size of the MTD
 	__u32 erasesize;
 	__u32 writesize;
 	__u32 oobsize;   // Amount of OOB data per block (e.g. 16)
@@ -75,7 +75,7 @@ struct mtd_info_user {
 };
 
 struct region_info_user {
-	__u32 offset;		/* At which this region starts,
+	__u64 offset;		/* At which this region starts,
 					 * from the beginning of the MTD */
 	__u32 erasesize;		/* For this region */
 	__u32 numblocks;		/* Number of blocks in this region */
-- 
1.5.4.3
