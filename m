Received: from mail-ig0-x22d.google.com ([2607:f8b0:4001:c05::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W2nRw-00038a-IF
 for linux-mtd@lists.infradead.org; Mon, 13 Jan 2014 19:45:29 +0000
Received: by mail-ig0-f173.google.com with SMTP id c10so2881838igq.0
 for <linux-mtd@lists.infradead.org>; Mon, 13 Jan 2014 11:45:03 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v4 2/5] mtd: nand: add ONFI vendor block for Micron
Date: Mon, 13 Jan 2014 11:44:37 -0800
Message-Id: <1389642280-11714-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
References: <1389642280-11714-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Acked-by: Huang Shijie <b32955@freescale.com>
---
No changes since v1

 include/linux/mtd/nand.h | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index f3ea8daf08ee..029fe5948dc4 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -285,7 +285,8 @@ struct nand_onfi_params {
 	u8 reserved4[7];
 
 	/* vendor */
-	u8 reserved5[90];
+	__le16 vendor_revision;
+	u8 vendor[88];
 
 	__le16 crc;
 } __attribute__((packed));
@@ -326,6 +327,26 @@ struct onfi_ext_param_page {
 	 */
 } __packed;
 
+struct nand_onfi_vendor_micron {
+	u8 two_plane_read;
+	u8 read_cache;
+	u8 read_unique_id;
+	u8 dq_imped;
+	u8 dq_imped_num_settings;
+	u8 dq_imped_feat_addr;
+	u8 rb_pulldown_strength;
+	u8 rb_pulldown_strength_feat_addr;
+	u8 rb_pulldown_strength_num_settings;
+	u8 otp_mode;
+	u8 otp_page_start;
+	u8 otp_data_prot_addr;
+	u8 otp_num_pages;
+	u8 otp_feat_addr;
+	u8 read_retry_options;
+	u8 reserved[72];
+	u8 param_revision;
+} __packed;
+
 /**
  * struct nand_hw_control - Control structure for hardware controller (e.g ECC generator) shared among independent devices
  * @lock:               protection lock
-- 
1.8.3.2
