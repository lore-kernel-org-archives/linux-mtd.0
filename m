Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkNEf-00086r-Cz
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 21:58:33 +0000
Received: by iadk27 with SMTP id k27so8529370iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 13:58:32 -0800 (PST)
Message-ID: <4F0B6301.3020405@gmail.com>
Date: Mon, 09 Jan 2012 16:58:25 -0500
From: Xi Wang <xi.wang@gmail.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Lucas De Marchi <lucas.demarchi@profusion.mobi>
Subject: Re: [PATCH] pmc551: fix signedness bug in init_pmc551()
References: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
In-Reply-To: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since "length" is a u32, the error handling below didn't work when
fixup_pmc551() returns -ENODEV.

	if ((length = fixup_pmc551(PCI_Device)) <= 0)

This patch changes both the type of "length" and the return type of
fixup_pmc551() to int.

Suggested-by: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Xi Wang <xi.wang@gmail.com>
---
 drivers/mtd/devices/pmc551.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/pmc551.c b/drivers/mtd/devices/pmc551.c
index ecff765..cfccf65 100644
--- a/drivers/mtd/devices/pmc551.c
+++ b/drivers/mtd/devices/pmc551.c
@@ -359,7 +359,7 @@ static int pmc551_write(struct mtd_info *mtd, loff_t to, size_t len,
  * mechanism
  * returns the size of the memory region found.
  */
-static u32 fixup_pmc551(struct pci_dev *dev)
+static int fixup_pmc551(struct pci_dev *dev)
 {
 #ifdef CONFIG_MTD_PMC551_BUGFIX
 	u32 dram_data;
@@ -669,7 +669,7 @@ static int __init init_pmc551(void)
 	struct mypriv *priv;
 	int found = 0;
 	struct mtd_info *mtd;
-	u32 length = 0;
+	int length = 0;
 
 	if (msize) {
 		msize = (1 << (ffs(msize) - 1)) << 20;
-- 
1.7.5.4
