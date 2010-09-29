Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0pbC-0001oo-RH
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 05:53:04 +0000
Received: by fxm15 with SMTP id 15so325887fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Sep 2010 22:53:00 -0700 (PDT)
From: Michal Simek <monstr@monstr.eu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] of: MTD: Fix OF probing on little-endian systems
Date: Wed, 29 Sep 2010 15:52:13 +1000
Message-Id: <1285739538-29058-3-git-send-email-monstr@monstr.eu>
In-Reply-To: <1285739538-29058-2-git-send-email-monstr@monstr.eu>
References: <1285739538-29058-1-git-send-email-monstr@monstr.eu>
	<1285739538-29058-2-git-send-email-monstr@monstr.eu>
Cc: Michal Simek <monstr@monstr.eu>, microblaze-uclinux@itee.uq.edu.au,
	devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca,
	Tejun Heo <tj@kernel.org>, linux-mtd@lists.infradead.org,
	duyl@xilinx.com, linnj@xilinx.com, edgar.iglesias@gmail.com,
	David Woodhouse <dwmw2@infradead.org>, john.williams@petalogix.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert big-endian DTB to little-endian if necessary.

Signed-off-by: Michal Simek <monstr@monstr.eu>
CC: David Woodhouse <dwmw2@infradead.org>
CC: Tejun Heo <tj@kernel.org>
CC: Grant Likely <grant.likely@secretlab.ca>
CC: linux-mtd@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree-discuss@lists.ozlabs.org
---
 drivers/mtd/maps/physmap_of.c |    2 +-
 drivers/mtd/ofpart.c          |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index fe63f6b..ec3edf6 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -294,7 +294,7 @@ static int __devinit of_flash_probe(struct platform_device *dev,
 		info->list[i].map.name = dev_name(&dev->dev);
 		info->list[i].map.phys = res.start;
 		info->list[i].map.size = res_size;
-		info->list[i].map.bankwidth = *width;
+		info->list[i].map.bankwidth = be32_to_cpup(width);
 
 		err = -ENOMEM;
 		info->list[i].map.virt = ioremap(info->list[i].map.phys,
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 8bf7dc6..7bd171e 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -53,8 +53,8 @@ int __devinit of_mtd_parse_partitions(struct device *dev,
 			continue;
 		}
 
-		(*pparts)[i].offset = reg[0];
-		(*pparts)[i].size = reg[1];
+		(*pparts)[i].offset = be32_to_cpu(reg[0]);
+		(*pparts)[i].size = be32_to_cpu(reg[1]);
 
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
-- 
1.5.5.1
