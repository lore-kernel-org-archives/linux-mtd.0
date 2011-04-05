Received: from cantor2.suse.de ([195.135.220.15] helo=mx2.suse.de)
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q77jD-0005bJ-CI
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:59:39 +0000
From: Michal Marek <mmarek@suse.cz>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 16/34] nand/denali: Drop __TIME__ usage
Date: Tue,  5 Apr 2011 16:59:03 +0200
Message-Id: <1302015561-21047-17-git-send-email-mmarek@suse.cz>
In-Reply-To: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org, Chuanxiao Dong <chuanxiao.dong@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel already prints its build timestamp during boot, no need to
repeat it in random drivers and produce different object files each
time.

Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Michal Marek <mmarek@suse.cz>
---
 drivers/mtd/nand/denali.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 8c8d3c8..7a3cf8c 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -1721,8 +1721,7 @@ static struct pci_driver denali_pci_driver = {
 
 static int __devinit denali_init(void)
 {
-	printk(KERN_INFO "Spectra MTD driver built on %s @ %s\n",
-			__DATE__, __TIME__);
+	printk(KERN_INFO "Spectra MTD driver\n");
 	return pci_register_driver(&denali_pci_driver);
 }
 
-- 
1.7.4.1
