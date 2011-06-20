Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYaiQ-0003nd-2H
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 09:24:19 +0000
Received: from [192.168.0.16] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id F3F161B4
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 11:24:06 +0200 (CEST)
Message-ID: <4DFF129E.6070808@free-electrons.com>
Date: Mon, 20 Jun 2011 11:27:58 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] UBI: clarify the volume notification types' doc
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I found the UBI_VOLUME_REMOVED inline documentation not to be clear.
This patch fixes it and tweaks the documentation of the other
notification types.

Signed-off-by David Wagner <david.wagner@free-electrons.com>
---
 include/linux/mtd/ubi.h |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index b31bd9e..ddc453f 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -134,11 +134,11 @@ struct ubi_device_info {

 /*
  * enum - volume notification types.
- * @UBI_VOLUME_ADDED: volume has been added
- * @UBI_VOLUME_REMOVED: start volume volume
- * @UBI_VOLUME_RESIZED: volume size has been re-sized
- * @UBI_VOLUME_RENAMED: volume name has been re-named
- * @UBI_VOLUME_UPDATED: volume name has been updated
+ * @UBI_VOLUME_ADDED: a volume has been added (attached)
+ * @UBI_VOLUME_REMOVED: a volume has been removed (detached)
+ * @UBI_VOLUME_RESIZED: a volume has been re-sized
+ * @UBI_VOLUME_RENAMED: a volume has been re-named
+ * @UBI_VOLUME_UPDATED: data has been written to a volume
  *
  * These constants define which type of event has happened when a volume
  * notification function is invoked.
-- 
1.7.0.4

-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
