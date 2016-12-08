Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cF20k-0005c7-Ee
 for linux-mtd@lists.infradead.org; Thu, 08 Dec 2016 16:57:38 +0000
Received: by mail-wm0-x244.google.com with SMTP id g23so4745055wme.1
 for <linux-mtd@lists.infradead.org>; Thu, 08 Dec 2016 08:57:13 -0800 (PST)
Date: Thu, 8 Dec 2016 19:57:08 +0300
From: "Andrey Jr. Melnikov" <temnota.am@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH] Add Winbond manufacturer id
Message-ID: <20161208165707.ebtk5vclxc6xvbpw@ppc.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Add WINBOND manufacturer id.

Signed-off-by: Andrey Jr. Melnikov <temnota.am@gmail.com>
---

diff --git a/drivers/mtd/nand/nand_ids.c b/drivers/mtd/nand/nand_ids.c
index 2af9869..6508682 100644
--- a/drivers/mtd/nand/nand_ids.c
+++ b/drivers/mtd/nand/nand_ids.c
@@ -182,6 +182,7 @@ struct nand_manufacturers nand_manuf_ids[] = {
 	{NAND_MFR_SANDISK, "SanDisk"},
 	{NAND_MFR_INTEL, "Intel"},
 	{NAND_MFR_ATO, "ATO"},
+	{NAND_MFR_WINBOND, "Winbond"},
 	{0x0, "Unknown"}
 };
 
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 8dd6e01..035f207 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -797,6 +797,7 @@ static inline void nand_set_controller_data(struct nand_chip *chip, void *priv)
 #define NAND_MFR_SANDISK	0x45
 #define NAND_MFR_INTEL		0x89
 #define NAND_MFR_ATO		0x9b
+#define NAND_MFR_WINBOND	0xef
 
 /* The maximum expected count of bytes in the NAND ID sequence */
 #define NAND_MAX_ID_LEN 8
