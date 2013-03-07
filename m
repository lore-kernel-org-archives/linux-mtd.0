Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
 helo=am1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDYPq-0008Ln-Df
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2013 10:51:19 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH V4 1/3] mtd: add new fields to nand_flash_dev{}
Date: Thu, 7 Mar 2013 18:49:22 +0800
Message-ID: <1362653364-29993-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1362653364-29993-1-git-send-email-b32955@freescale.com>
References: <1362653364-29993-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: artem.bityutskiy@linux.intel.com, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As time goes on, we begin to meet the situation that we can not get enough
information from some nand chips's id data. Take some Toshiba's nand chips
for example. I have 4 Toshiba's nand chips in my hand:
	TC58NVG2S0F, TC58NVG3S0F, TC58NVG5D2, TC58NVG6D2

When we read these chips' datasheets, we will get the geometry of these chips:
	TC58NVG2S0F : 4096 + 224
	TC58NVG3S0F : 4096 + 232
	TC58NVG5D2  : 8192 + 640
	TC58NVG6D2  : 8192 + 640

But we can not parse out the correct oob size for these chips from the id data.

This patch adds some new fields to the nand_flash_dev{}:
  @id_len: the valid length of the id data. See the comments in
           nand_id_has_period()
  @oobsize: the oob size.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 include/linux/mtd/nand.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 591eeeb..f0a9d93 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -578,6 +578,8 @@ struct nand_chip {
  * @erasesize: eraseblock size in bytes (determined from the extended ID if 0)
  * @chipsize: total chip size in MiB
  * @options: stores various chip bit options
+ * @id_len: The valid length of the @id.
+ * @oobsize: OOB size
  */
 struct nand_flash_dev {
 	char *name;
@@ -592,6 +594,8 @@ struct nand_flash_dev {
 	unsigned long chipsize;
 	unsigned long erasesize;
 	unsigned long options;
+	unsigned long id_len;
+	unsigned long oobsize;
 };
 
 /**
-- 
1.7.1
