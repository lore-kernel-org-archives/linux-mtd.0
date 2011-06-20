Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QYgQs-0004DZ-1i
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 15:30:34 +0000
Received: from [192.168.0.34] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 3AF1213A
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 17:30:25 +0200 (CEST)
Message-ID: <4DFF687B.6070806@free-electrons.com>
Date: Mon, 20 Jun 2011 17:34:19 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCHv2] UBI: clarify the volume notification types' doc
References: <4DFF129E.6070808@free-electrons.com>
In-Reply-To: <4DFF129E.6070808@free-electrons.com>
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

I realized the new descriptions of ADDED and REMOVED could also be
misleading: they can also be triggered after using a userland util
(ubi{mk,rm}vol).

(the indentation looks odd but is fine once the patch has been applied)

Signed-off-by David Wagner <david.wagner@free-electrons.com>
---
 include/linux/mtd/ubi.h |   12 +++++++-----
 1 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index b31bd9e..b79e741 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -134,11 +134,13 @@ struct ubi_device_info {

 /*
  * enum - volume notification types.
- * @UBI_VOLUME_ADDED: volume has been added
- * @UBI_VOLUME_REMOVED: start volume volume
- * @UBI_VOLUME_RESIZED: volume size has been re-sized
- * @UBI_VOLUME_RENAMED: volume name has been re-named
- * @UBI_VOLUME_UPDATED: volume name has been updated
+ * @UBI_VOLUME_ADDED: a volume has been added (containing device attached
+ *		      or volume created from a userland util)
+ * @UBI_VOLUME_REMOVED: a volume has been removed (containing device
detached
+ *			or volume created from a userland util)
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

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
