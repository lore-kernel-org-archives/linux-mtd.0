Received: from mailout3.samsung.com ([203.254.224.33])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VnclT-0004hw-B0
 for linux-mtd@lists.infradead.org; Mon, 02 Dec 2013 23:18:57 +0000
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MX700F4JCQSH2C0@mailout3.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 03 Dec 2013 08:18:28 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
References: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
In-reply-to: <001501ceefb1$69c96820$3d5c3860$%han@samsung.com>
Subject: [PATCH 19/39] mtd: denali: remove DEFINE_PCI_DEVICE_TABLE macro
Date: Tue, 03 Dec 2013 08:18:28 +0900
Message-id: <002801ceefb4$cef24a20$6cd6de60$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Brian Norris' <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Don't use DEFINE_PCI_DEVICE_TABLE macro, because this macro
is not preferred.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/mtd/nand/denali_pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/denali_pci.c b/drivers/mtd/nand/denali_pci.c
index 033f177..622dfb7 100644
--- a/drivers/mtd/nand/denali_pci.c
+++ b/drivers/mtd/nand/denali_pci.c
@@ -21,7 +21,7 @@
 #define DENALI_NAND_NAME    "denali-nand-pci"
 
 /* List of platforms this NAND controller has be integrated into */
-static DEFINE_PCI_DEVICE_TABLE(denali_pci_ids) = {
+static const struct pci_device_id denali_pci_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x0701), INTEL_CE4100 },
 	{ PCI_VDEVICE(INTEL, 0x0809), INTEL_MRST },
 	{ /* end: all zeroes */ }
-- 
1.7.10.4
