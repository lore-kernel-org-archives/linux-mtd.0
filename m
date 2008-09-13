Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeOgx-0000nZ-EQ
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 06:33:11 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1126154wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2008 23:33:10 -0700 (PDT)
Message-ID: <48CB5EA4.10907@gmail.com>
Date: Fri, 12 Sep 2008 23:33:08 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] [MTD] physmap.c: Add a dummy release function
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Adding a dummy release function to the physmap device so as to silence a log
warning on initialization.

Signed-off-by: Zev Weiss <zevweiss@gmail.com>
---
  drivers/mtd/maps/physmap.c |    5 +++++
  1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 49e2039..73a8d3c 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -277,11 +277,16 @@ static struct resource physmap_flash_resource = {
  	.flags		= IORESOURCE_MEM,
  };

+static void physmap_dummy_release(struct device *dev)
+{
+}
+
  static struct platform_device physmap_flash = {
  	.name		= "physmap-flash",
  	.id		= 0,
  	.dev		= {
  		.platform_data	= &physmap_flash_data,
+		.release	= &physmap_dummy_release,
  	},
  	.num_resources	= 1,
  	.resource	= &physmap_flash_resource,
-- 
1.5.4.1
