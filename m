Received: from mail-bk0-x22a.google.com ([2a00:1450:4008:c01::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UdG5h-00021t-Bl
 for linux-mtd@lists.infradead.org; Fri, 17 May 2013 08:32:42 +0000
Received: by mail-bk0-f42.google.com with SMTP id na1so2194662bkb.29
 for <linux-mtd@lists.infradead.org>; Fri, 17 May 2013 01:32:18 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 May 2013 16:32:18 +0800
Message-ID: <CAPgLHd8p=oOOvOsqSGFGp2DSjDg9g_manEpcNThK7Z7hirKztA@mail.gmail.com>
Subject: [PATCH -next] UBI: fix error return code in ubi_init()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dedekind1@gmail.com, dwmw2@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: yongjun_wei@trendmicro.com.cn, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

Fix to return -ENOMEM in the kmem_cache_create() error handling
case instead of 0, as done elsewhere in this function.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/ubi/build.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8ff08ec..a444d04 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -1243,8 +1243,10 @@ static int __init ubi_init(void)
 	ubi_wl_entry_slab = kmem_cache_create("ubi_wl_entry_slab",
 					      sizeof(struct ubi_wl_entry),
 					      0, 0, NULL);
-	if (!ubi_wl_entry_slab)
+	if (!ubi_wl_entry_slab) {
+		err = -ENOMEM;
 		goto out_dev_unreg;
+	}
 
 	err = ubi_debugfs_init();
 	if (err)
