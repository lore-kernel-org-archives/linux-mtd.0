Received: from mail-bk0-x234.google.com ([2a00:1450:4008:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vfkpr-0005xi-2i
 for linux-mtd@lists.infradead.org; Mon, 11 Nov 2013 06:18:57 +0000
Received: by mail-bk0-f52.google.com with SMTP id v10so1525496bkz.11
 for <linux-mtd@lists.infradead.org>; Sun, 10 Nov 2013 22:18:32 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 11 Nov 2013 14:18:29 +0800
Message-ID: <CAPgLHd-qf8Zj0gWgJh3_WMZOAx5-H6aABrVFqRsAw=XkOfDdmw@mail.gmail.com>
Subject: [PATCH] MIPS: Alchemy: add missing platform_set_drvdata() in
 au1550nd_probe()
From: Wei Yongjun <weiyj.lk@gmail.com>
To: dwmw2@infradead.org, wfp5p@virginia.edu, artem.bityutskiy@linux.intel.com,
 jg1.han@samsung.com, computersforpeace@gmail.com
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

Add missing platform_set_drvdata() in au1550nd_probe(), otherwise
calling platform_get_drvdata() in remove returns NULL.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/mtd/nand/au1550nd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/au1550nd.c b/drivers/mtd/nand/au1550nd.c
index ae8dd7c..909b673 100644
--- a/drivers/mtd/nand/au1550nd.c
+++ b/drivers/mtd/nand/au1550nd.c
@@ -480,6 +480,8 @@ static int au1550nd_probe(struct platform_device *pdev)
 
 	mtd_device_register(&ctx->info, pd->parts, pd->num_parts);
 
+	platform_set_drvdata(pdev, ctx);
+
 	return 0;
 
 out3:
