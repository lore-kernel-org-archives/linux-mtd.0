Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxaJR-0001zP-0m
	for linux-mtd@lists.infradead.org; Mon, 20 Sep 2010 06:57:17 +0000
Received: by pwj3 with SMTP id 3so1569382pwj.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 19 Sep 2010 23:57:14 -0700 (PDT)
Message-ID: <4C9705C8.4090603@gmail.com>
Date: Sun, 19 Sep 2010 23:57:12 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: Edit comments on deprecation of ioctl ECCGETLAYOUT
References: <4C5CA4A1.1040000@broadcom.com>	
	<1282154806-9420-1-git-send-email-norris@broadcom.com>	
	<4C6DD170.1060807@renesas.com> <4C6E9C23.6060703@broadcom.com>	
	<1282646703.24044.162.camel@localhost>
	<4C746DE0.7000104@gmail.com>	 <1283163647.12995.43.camel@brekeke>
	<1284830690.1721.3.camel@brekeke> <4C96FF10.2010805@gmail.com>
In-Reply-To: <4C96FF10.2010805@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, Kevin Cernekee <cernekee@gmail.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Sneha Narnakaje <nsnehaprabha@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

** Applies to l2-mtd-2.6.git: master **

There were some improvements and additions necessary in the
comments explaining of the expansion of nand_ecclayout, the
introduction of nand_ecclayout_user, and the deprecation of the
ioctl ECCGETLAYOUT.

Also, I found a better placement for the macro MTD_MAX_ECCPOS_ENTRIES;
next to the definition of MTD_MAX_OOBFREE_ENTRIES in mtd-abi.h. The macro
is really only important for the ioctl code (found in drivers/mtd/mtdchar.c)
but since there are small edits being made to the user-space header, I
figured this is a better location.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdchar.c   |    2 +-
 include/linux/mtd/mtd.h |    8 ++++----
 include/mtd/mtd-abi.h   |   11 ++++++++---
 3 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 44868cf..5895de7 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -495,7 +495,7 @@ static int shrink_ecclayout(const struct nand_ecclayout *from,
 
 	memset(to, 0, sizeof(*to));
 
-	to->eccbytes = min((int)from->eccbytes, MTD_MAX_ECCPOS_ENTRIES_OLD);
+	to->eccbytes = min((int)from->eccbytes, MTD_MAX_ECCPOS_ENTRIES);
 	for (i = 0; i < to->eccbytes; i++)
 		to->eccpos[i] = from->eccpos[i];
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 03a1e95..fe8d77e 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -112,11 +112,11 @@ struct mtd_oob_ops {
 
 #define MTD_MAX_OOBFREE_ENTRIES_LARGE	32
 #define MTD_MAX_ECCPOS_ENTRIES_LARGE	448
-#define MTD_MAX_ECCPOS_ENTRIES_OLD	64	/* Previous maximum */
 /*
- * Correct ECC layout control structure. This replaces old nand_ecclayout
- * (mtd-abi.h) that is exported via ECCGETLAYOUT ioctl. It should be expandable
- *  in the future simply by the above macros.
+ * Internal ECC layout control structure. For historical reasons, there is a
+ * similar, smaller struct nand_ecclayout_user (in mtd-abi.h) that is retained
+ * for export to user-space via the ECCGETLAYOUT ioctl.
+ * nand_ecclayout should be expandable in the future simply by the above macros.
  */
 struct nand_ecclayout {
 	__u32 eccbytes;
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index 5bce083..a57c4cb 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -144,13 +144,18 @@ struct nand_oobfree {
 };
 
 #define MTD_MAX_OOBFREE_ENTRIES	8
+#define MTD_MAX_ECCPOS_ENTRIES	64
 /*
- * ECC layout control structure. Exported to userspace for
- * diagnosis and to allow creation of raw images
+ * OBSOLETE: ECC layout control structure. Exported to user-space via ioctl
+ * ECCGETLAYOUT for backwards compatbility and should not be mistaken as a
+ * complete set of ECC information. The ioctl truncates the larger internal
+ * structure to retain binary compatibility with the static declaration of the
+ * ioctl. Note that the "MTD_MAX_..._ENTRIES" macros represent the max size of
+ * the user struct, not the MAX size of the internal struct nand_ecclayout.
  */
 struct nand_ecclayout_user {
 	__u32 eccbytes;
-	__u32 eccpos[64];
+	__u32 eccpos[MTD_MAX_ECCPOS_ENTRIES];
 	__u32 oobavail;
 	struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
 };
-- 
1.7.0.4
