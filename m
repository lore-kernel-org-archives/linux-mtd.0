Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q20va-0006Rz-Rb
	for linux-mtd@lists.infradead.org; Tue, 22 Mar 2011 12:43:15 +0000
Received: from nokia.com (localhost [127.0.0.1])
	by mgw-da02.nokia.com (Switch-3.4.3/Switch-3.4.3) with ESMTP id
	p2MChCAM014161
	for <linux-mtd@lists.infradead.org>; Tue, 22 Mar 2011 14:43:12 +0200
From: Artem Bityutskiy <dedekind1@gmail.com>
To: MTD list <linux-mtd@lists.infradead.org>
Subject: [PATCH 2/2] UBI: cleanup comments around volume properties
Date: Tue, 22 Mar 2011 14:45:53 +0200
Message-Id: <1300797953-1976-2-git-send-email-dedekind1@gmail.com>
In-Reply-To: <1300797953-1976-1-git-send-email-dedekind1@gmail.com>
References: <1300797953-1976-1-git-send-email-dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Cleanup and improve commentaries around the "set volume properties" ioctl,
make a simple indentation fix as well.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
 include/mtd/ubi-user.h |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/mtd/ubi-user.h b/include/mtd/ubi-user.h
index 8d8484b..e70bd34 100644
--- a/include/mtd/ubi-user.h
+++ b/include/mtd/ubi-user.h
@@ -224,13 +224,14 @@ enum {
 };
 
 /*
- * UBI set property ioctl constants
+ * UBI set volume property ioctl constants.
  *
- * @UBI_VOL_PROP_DIRECT_WRITE: allow / disallow user to directly write and
- *                             erase individual eraseblocks on dynamic volumes
+ * @UBI_VOL_PROP_DIRECT_WRITE: allow (any non-zero value) or disallow (value 0)
+ *                             user to directly write and erase individual
+ *                             eraseblocks on dynamic volumes
  */
 enum {
-       UBI_VOL_PROP_DIRECT_WRITE = 1,
+	UBI_VOL_PROP_DIRECT_WRITE = 1,
 };
 
 /**
@@ -398,7 +399,7 @@ struct ubi_map_req {
 
 
 /**
- * struct ubi_set_vol_prop_req - a data structure used to set an ubi volume
+ * struct ubi_set_vol_prop_req - a data structure used to set an UBI volume
  *                               property.
  * @property: property to set (%UBI_VOL_PROP_DIRECT_WRITE)
  * @padding: reserved for future, not used, has to be zeroed
-- 
1.7.2.3
