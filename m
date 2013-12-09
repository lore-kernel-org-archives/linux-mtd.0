Received: from mail-oa0-x235.google.com ([2607:f8b0:4003:c02::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq79I-0000hE-2O
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:09:48 +0000
Received: by mail-oa0-f53.google.com with SMTP id m1so4473388oag.40
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:09:27 -0800 (PST)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 2/4] mtd: nand: add ONFI vendor block for Micron
Date: Mon,  9 Dec 2013 12:09:11 -0800
Message-Id: <1386619753-27613-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
References: <1386619753-27613-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v1 -> v2: no change

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
1.8.5
