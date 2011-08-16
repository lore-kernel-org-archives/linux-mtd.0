Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QtFrt-00011E-72
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2011 09:23:29 +0000
From: Chunhe Lan <Chunhe.Lan@freescale.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH] mtd/physmap_of: Don't add disabled flash devices
Date: Tue, 16 Aug 2011 17:25:50 +0800
Message-ID: <1313486750-15211-1-git-send-email-Chunhe.Lan@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: kumar.gala@freescale.com, linuxppc-dev@ozlabs.org, scottwood@freescale.com,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Chunhe Lan <Chunhe.Lan@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Flash(cfi-flash, jedec-flash, and so on) nodes with the
property status="disabled" are not usable and so avoid
adding "disabled" flash devices with the system.

Signed-off-by: Chunhe Lan <Chunhe.Lan@freescale.com>
---
 drivers/mtd/maps/physmap_of.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index d251d1d..812e6dc 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -219,6 +219,9 @@ static int __devinit of_flash_probe(struct platform_device *dev)
 	struct mtd_info **mtd_list = NULL;
 	resource_size_t res_size;
 
+	if (!of_device_is_available(dp))
+		return -ENODEV;
+
 	match = of_match_device(of_flash_match, &dev->dev);
 	if (!match)
 		return -EINVAL;
-- 
1.5.6.5
