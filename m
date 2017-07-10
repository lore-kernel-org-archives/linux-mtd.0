Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dUNYI-0000x1-KB
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 01:31:58 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6A1SY4V056882
 for <linux-mtd@lists.infradead.org>; Sun, 9 Jul 2017 21:31:34 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bjsyjk5r3-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jul 2017 21:31:33 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Mon, 10 Jul 2017 11:31:31 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6A1VSqh12779576
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:28 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6A1VJ9W025718
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:19 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v2 04/10] mtd: powernv_flash: Remove pointless goto in driver
 init
Date: Mon, 10 Jul 2017 11:31:00 +1000
In-Reply-To: <20170710013106.27276-1-cyrilbur@gmail.com>
References: <20170710013106.27276-1-cyrilbur@gmail.com>
Message-Id: <20170710013106.27276-5-cyrilbur@gmail.com>
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
index d50b5f200f73..d7243b72ba6e 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -232,21 +232,20 @@ static int powernv_flash_probe(struct platform_device *pdev)
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
 
 	mutex_init(&data->lock);
 
@@ -257,10 +256,7 @@ static int powernv_flash_probe(struct platform_device *pdev)
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
2.13.2
