Received: from mail-fx0-f214.google.com ([209.85.220.214])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Nse2U-0008Vg-Ql
	for linux-mtd@lists.infradead.org; Fri, 19 Mar 2010 15:23:11 +0000
Received: by fxm6 with SMTP id 6so861249fxm.2
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Mar 2010 08:23:05 -0700 (PDT)
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 1/2] MTD: SM_FTL: initialize sysfs attributes This is new
	requirement in 2.6.34
Date: Fri, 19 Mar 2010 17:22:53 +0200
Message-Id: <1269012174-5375-1-git-send-email-maximlevitsky@gmail.com>
In-Reply-To: <1269000351-12023-1-git-send-email-maximlevitsky@gmail.com>
References: <1269000351-12023-1-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, Maxim Levitsky <maximlevitsky@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>
---
 drivers/mtd/sm_ftl.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index 812e212..a9b4e34 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -70,6 +70,8 @@ struct attribute_group *sm_create_sysfs_attributes(struct sm_ftl *ftl)
 	vendor_attribute =
 		kzalloc(sizeof(struct sm_sysfs_attribute), GFP_KERNEL);
 
+	sysfs_attr_init(&vendor_attribute->dev_attr.attr);
+
 	vendor_attribute->data = vendor;
 	vendor_attribute->len = vendor_len;
 	vendor_attribute->dev_attr.attr.name = "vendor";
-- 
1.6.3.3
