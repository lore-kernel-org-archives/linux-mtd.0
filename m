Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ddItw-00006H-Rm
 for linux-mtd@lists.infradead.org; Thu, 03 Aug 2017 16:23:10 +0000
Received: by mail-pf0-x241.google.com with SMTP id j68so1937451pfc.2
 for <linux-mtd@lists.infradead.org>; Thu, 03 Aug 2017 09:22:48 -0700 (PDT)
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at,
 cyrille.pitchen@wedev4u.fr
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] mtd: pci: constify pci_device_id.
Date: Thu,  3 Aug 2017 21:52:10 +0530
Message-Id: <1501777330-21380-7-git-send-email-arvind.yadav.cs@gmail.com>
In-Reply-To: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
References: <1501777330-21380-1-git-send-email-arvind.yadav.cs@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

pci_device_id are not supposed to change at runtime. All functions
working with pci_device_id provided by <linux/pci.h> work with
const pci_device_id. So mark the non-const structs as const.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/mtd/maps/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/pci.c b/drivers/mtd/maps/pci.c
index eb0242e..7b3bb40 100644
--- a/drivers/mtd/maps/pci.c
+++ b/drivers/mtd/maps/pci.c
@@ -228,7 +228,7 @@ static struct mtd_pci_info intel_dc21285_info = {
  * PCI device ID table
  */
 
-static struct pci_device_id mtd_pci_ids[] = {
+static const struct pci_device_id mtd_pci_ids[] = {
 	{
 		.vendor =	PCI_VENDOR_ID_INTEL,
 		.device =	0x530d,
-- 
2.7.4
