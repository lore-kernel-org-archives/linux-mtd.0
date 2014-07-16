Received: from mail-yk0-f172.google.com ([209.85.160.172])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7RxG-0005sK-0Q
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 16:21:19 +0000
Received: by mail-yk0-f172.google.com with SMTP id 10so548829ykt.31
 for <linux-mtd@lists.infradead.org>; Wed, 16 Jul 2014 09:20:56 -0700 (PDT)
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: <linux-mtd@lists.infradead.org>
Subject: [RFC] ubi: updatevol: Support volume to volume update
Date: Wed, 16 Jul 2014 13:19:57 -0300
Message-Id: <1405527597-11394-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?q?Guido=20Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This commit adds the support for ubiupdatevol to recieve a UBI volume
as the second parameter. This could be useful to update a UBI volume,
from another UBI volume present in the system, for instance when
a redundant scheme is used.

Not-yet-signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
Hello,

I'm submitting this patch, to discuss about its inclusion.

If the idea is acceptable we should fix the parameter documentation,
and maybe cleanup the implementation a bit.

One thing to consider, is that this volume to volume update feature
could be moved to the kernel (through yet another ioctl). However,
I think there's no advantage over this simpler approach.

 ubi-utils/ubiupdatevol.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/ubi-utils/ubiupdatevol.c b/ubi-utils/ubiupdatevol.c
index 5096791..6b30210 100644
--- a/ubi-utils/ubiupdatevol.c
+++ b/ubi-utils/ubiupdatevol.c
@@ -212,7 +212,24 @@ static int update_volume(libubi_t libubi, struct ubi_vol_info *vol_info)
 			goto out_free;
 		}
 
-		bytes = st.st_size - args.skip;
+		/* If the argument is a character device and a UBI volume
+		 * we update from it. In this case, skip and size parameters
+		 * are not used.
+		 */
+		if (S_ISCHR(st.st_mode) &&
+		    ubi_probe_node(libubi, args.img) == 2) {
+
+			struct ubi_vol_info src_vol_info;
+
+			err = ubi_get_vol_info(libubi, args.img, &src_vol_info);
+			if (!err)
+				bytes = src_vol_info.data_bytes;
+			else
+				bytes = 0;
+		} else {
+
+			bytes = st.st_size - args.skip;
+		}
 	} else
 		bytes = args.size;
 
-- 
2.0.1
