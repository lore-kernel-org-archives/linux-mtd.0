Received: from mail-bk0-x22f.google.com ([2a00:1450:4008:c01::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUUWr-0004Oh-F6
 for linux-mtd@lists.infradead.org; Fri, 11 Oct 2013 04:40:46 +0000
Received: by mail-bk0-f47.google.com with SMTP id mx12so1305798bkb.20
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2013 21:40:23 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 11 Oct 2013 12:40:21 +0800
Message-ID: <CAPgLHd_vT4cJ1F1a6TDzYb2LFSb-me90K58K22Z=ae3VsOfbng@mail.gmail.com>
Subject: [PATCH] mtg: docg3: use free_bch() instead of kfree()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, artem.bityutskiy@linux.intel.com, jg1.han@samsung.com,
 dan.carpenter@oracle.com, robert.jarzmik@free.fr
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

Use free_bch() instead of kfree() to free init_bch()
allocated data.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/devices/docg3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 3e1b0a0..4f091c1 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -2097,7 +2097,7 @@ notfound:
 	ret = -ENODEV;
 	dev_info(dev, "No supported DiskOnChip found\n");
 err_probe:
-	kfree(cascade->bch);
+	free_bch(cascade->bch);
 	for (floor = 0; floor < DOC_MAX_NBFLOORS; floor++)
 		if (cascade->floors[floor])
 			doc_release_device(cascade->floors[floor]);
