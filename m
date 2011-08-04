Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qp6no-0005u7-2E
	for linux-mtd@lists.infradead.org; Thu, 04 Aug 2011 22:54:08 +0000
Received: by wyh11 with SMTP id 11so68315wyh.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Aug 2011 15:54:02 -0700 (PDT)
Sender: Grant Likely <glikely@secretlab.ca>
From: Grant Likely <grant.likely@secretlab.ca>
To: David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Russell King <rmk+kernel@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd/physmap: Fix set_vpp signature in physmap_configure
Date: Thu,  4 Aug 2011 23:53:53 +0100
Message-Id: <1312498433-17950-1-git-send-email-grant.likely@secretlab.ca>
Cc: Grant Likely <grant.likely@secretlab.ca>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

physmap_configure() has the wrong signature for the set_vpp callback.
struct physmap_flash_data expects it to accpet a platform_device
pointer.

However, I can't find any users of physmap_configure(), so maybe the
hook should simply be removed.

Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
---
 drivers/mtd/maps/physmap.c  |    2 +-
 include/linux/mtd/physmap.h |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/physmap.c b/drivers/mtd/maps/physmap.c
index f64cee4..f2b9f5e 100644
--- a/drivers/mtd/maps/physmap.c
+++ b/drivers/mtd/maps/physmap.c
@@ -247,7 +247,7 @@ static struct platform_device physmap_flash = {
 };
 
 void physmap_configure(unsigned long addr, unsigned long size,
-		int bankwidth, void (*set_vpp)(struct map_info *, int))
+		int bankwidth, void (*set_vpp)(struct platform_device *, int))
 {
 	physmap_flash_resource.start = addr;
 	physmap_flash_resource.end = addr + size - 1;
diff --git a/include/linux/mtd/physmap.h b/include/linux/mtd/physmap.h
index e5f21d2..25ef3ed 100644
--- a/include/linux/mtd/physmap.h
+++ b/include/linux/mtd/physmap.h
@@ -36,7 +36,7 @@ struct physmap_flash_data {
  * Board needs to specify the exact mapping during their setup time.
  */
 void physmap_configure(unsigned long addr, unsigned long size,
-		int bankwidth, void (*set_vpp)(struct map_info *, int) );
+		int bankwidth, void (*set_vpp)(struct platform_device *, int) );
 
 /*
  * Machines that wish to do flash partition may want to call this function in
-- 
1.7.4.1
