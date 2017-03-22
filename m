Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqdR9-0007S8-R3
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 10:24:18 +0000
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-mtd@lists.infradead.org
Cc: Yuanjie.Huang@windriver.com, raj.khem@gmail.com,
 David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH 5/5] Return correct error number in ubi_get_vol_info1
Date: Wed, 22 Mar 2017 11:22:57 +0100
Message-Id: <20170322102257.7605-6-david.oberhollenzer@sigma-star.at>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If the specified UBI device or volume does not exist, the function
is supposed to set errno to ENODEV.

This patch adds a check to ubi_get_vol_info1 to change the errno
to ENODEV if vol_get_major cannot access the underlying sysfs file,
so the function propperly returns that the device or volume does
not exist, instead of failing with errno set to ENOENT.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 lib/libubi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/libubi.c b/lib/libubi.c
index 99022dd..f1cc37a 100644
--- a/lib/libubi.c
+++ b/lib/libubi.c
@@ -1242,8 +1242,11 @@ int ubi_get_vol_info1(libubi_t desc, int dev_num, int vol_id,
 	info->dev_num = dev_num;
 	info->vol_id = vol_id;
 
-	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor))
+	if (vol_get_major(lib, dev_num, vol_id, &info->major, &info->minor)) {
+		if (errno == ENOENT)
+			errno = ENODEV;
 		return -1;
+	}
 
 	ret = vol_read_data(lib->vol_type, dev_num, vol_id, buf, 50);
 	if (ret < 0)
-- 
2.10.2
