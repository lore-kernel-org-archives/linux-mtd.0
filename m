Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1lIh-0002kE-Ck
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 03:33:52 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9A3TFXO112184
 for <linux-mtd@lists.infradead.org>; Mon, 9 Oct 2017 23:33:29 -0400
Received: from e06smtp14.uk.ibm.com (e06smtp14.uk.ibm.com [195.75.94.110])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dgcac3thh-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 23:33:29 -0400
Received: from localhost
 by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Tue, 10 Oct 2017 04:33:27 +0100
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9A3XNZl15663198
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 03:33:24 GMT
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v9A3XDOb011042
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 14:33:13 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v4 03/10] mtd: powernv_flash: Remove pointless goto in driver
 init
Date: Tue, 10 Oct 2017 14:32:55 +1100
In-Reply-To: <20171010033302.20854-1-cyrilbur@gmail.com>
References: <20171010033302.20854-1-cyrilbur@gmail.com>
Message-Id: <20171010033302.20854-4-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/mtd/devices/powernv_flash.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index ca3ca6adf71e..4dd3b5d2feb2 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -227,21 +227,20 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!data)
+		return -ENOMEM;
+
 	data->mtd.priv = data;
 
 	ret = of_property_read_u32(dev->of_node, "ibm,opal-id", &(data->id));
 	if (ret) {
 		dev_err(dev, "no device property 'ibm,opal-id'\n");
-		goto out;
+		return ret;
 	}
 
 	ret = powernv_flash_set_driver_info(dev, &data->mtd);
 	if (ret)
-		goto out;
+		return ret;
 
 	dev_set_drvdata(dev, data);
 
@@ -250,10 +249,7 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	 * with an ffs partition at the start, it should prove easier for users
 	 * to deal with partitions or not as they see fit
 	 */
-	ret = mtd_device_register(&data->mtd, NULL, 0);
-
-out:
-	return ret;
+	return mtd_device_register(&data->mtd, NULL, 0);
 }
 
 /**
-- 
2.14.2
