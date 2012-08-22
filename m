Received: from mail-wi0-f171.google.com ([209.85.212.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T4DRE-0002DA-MN
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 16:05:53 +0000
Received: by wibhq4 with SMTP id hq4so4384847wib.0
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 09:05:27 -0700 (PDT)
From: Richard Genoud <richard.genoud@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH MTD-UTILS v2 2/4] sync include/mtd/ubi-user.h: add
 max_beb_per1024 parameter
Date: Wed, 22 Aug 2012 18:04:35 +0200
Message-Id: <1345651477-5301-3-git-send-email-richard.genoud@gmail.com>
In-Reply-To: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
Cc: Richard Genoud <richard.genoud@gmail.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
---
 include/mtd/ubi-user.h |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 19762d0..736a828 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -220,6 +220,7 @@ enum {
  * @ubi_num: UBI device number to create
  * @mtd_num: MTD device number to attach
  * @vid_hdr_offset: VID header offset (use defaults if %0)
+ * @max_beb_per1024: maximum expected number of bad PEB per 1024 PEBs
  * @padding: reserved for future, not used, has to be zeroed
  *
  * This data structure is used to specify MTD device UBI has to attach and the
@@ -243,12 +244,25 @@ enum {
  * be 2KiB-64 bytes = 1984. Note, that this position is not even 512-bytes
  * aligned, which is OK, as UBI is clever enough to realize this is 4th
  * sub-page of the first page and add needed padding.
+ *
+ * The @max_beb_per1024 is the maximum amount of bad PEBs UBI expects on the
+ * UBI device per 1024 eraseblocks.  This value is often given in an other form
+ * in the NAND datasheet (min NVB i.e. minimal number of valid blocks). The
+ * maximum expected bad eraseblocks per 1024 is then:
+ *    1024 * (1 - MinNVB / MaxNVB)
+ * Which gives 20 for most NAND devices.  This limit is used in order to derive
+ * amount of eraseblock UBI reserves for handling new bad blocks. If the device
+ * has more bad eraseblocks than this limit, UBI does not reserve any physical
+ * eraseblocks for new bad eraseblocks, but attempts to use available
+ * eraseblocks (if any). The accepted range is 0-768. If 0 is given, the
+ * default kernel value of %CONFIG_MTD_UBI_BEB_LIMIT will be used.
  */
 struct ubi_attach_req {
 	int32_t ubi_num;
 	int32_t mtd_num;
 	int32_t vid_hdr_offset;
-	int8_t padding[12];
+	int16_t max_beb_per1024;
+	int8_t padding[10];
 };
 
 /**
-- 
1.7.2.5
