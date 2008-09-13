Received: from wf-out-1314.google.com ([209.85.200.174])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KeOgo-0000nZ-I1
	for linux-mtd@lists.infradead.org; Sat, 13 Sep 2008 06:33:06 +0000
Received: by wf-out-1314.google.com with SMTP id 28so1126154wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 Sep 2008 23:33:01 -0700 (PDT)
Message-ID: <48CB5E9A.4010000@gmail.com>
Date: Fri, 12 Sep 2008 23:32:58 -0700
From: Zev Weiss <zevweiss@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] [MTD] physmap.c: Check return of
	platform_device_register()
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


The PHYSMAP_COMPAT code had been ignoring the return value of
platform_device_register() in the physmap_init() function.

Signed-off-by: Zev Weiss <zevweiss@gmail.com>
---
  drivers/mtd/maps/physmap.c |    2 +-
  1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index 42d844f..6fba0d4 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -312,7 +312,7 @@ static int __init physmap_init(void)
  	err = platform_driver_register(&physmap_flash_driver);
  #ifdef PHYSMAP_COMPAT
  	if (err == 0)
-		platform_device_register(&physmap_flash);
+		err = platform_device_register(&physmap_flash);
  #endif

  	return err;
-- 
1.5.4.1
