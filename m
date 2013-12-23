Received: from relay3-d.mail.gandi.net ([2001:4b98:c:538::195])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VvDT4-0000NF-6U
 for linux-mtd@lists.infradead.org; Mon, 23 Dec 2013 21:55:18 +0000
Date: Mon, 23 Dec 2013 13:54:56 -0800
From: Josh Triplett <josh@joshtriplett.org>
To: David Woodhouse <dwmw2@infradead.org>, Jingoo Han <jg1.han@samsung.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] mtd: denali: Drop print of build date/time
Message-ID: <21175198efaf34a67e5108c1dae384656012b7a0.1387833347.git.josh@joshtriplett.org>
References: <cover.1387833347.git.josh@joshtriplett.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1387833347.git.josh@joshtriplett.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The kernel already has this information, and individual drivers
shouldn't duplicate that.  This also eliminates the use of __DATE__ and
__TIME__, which make the build non-deterministic.

Signed-off-by: Josh Triplett <josh@joshtriplett.org>
---
 drivers/mtd/nand/denali_pci.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 033f177..ab64416 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -131,7 +131,6 @@ static struct pci_driver denali_pci_driver = {
 
 static int denali_init_pci(void)
 {
-	pr_info("Spectra MTD driver built on %s @ %s\n", __DATE__, __TIME__);
 	return pci_register_driver(&denali_pci_driver);
 }
 module_init(denali_init_pci);
-- 
1.8.5.2
