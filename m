Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dUNYI-0000wz-3F
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 01:31:55 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6A1SZtH028816
 for <linux-mtd@lists.infradead.org>; Sun, 9 Jul 2017 21:31:34 -0400
Received: from e23smtp01.au.ibm.com (e23smtp01.au.ibm.com [202.81.31.143])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bjukq9frx-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jul 2017 21:31:33 -0400
Received: from localhost
 by e23smtp01.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Mon, 10 Jul 2017 11:31:31 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6A1VSV316449668
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:28 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6A1VRjb030297
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:27 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v2 02/10] mtd: powernv_flash: Lock around concurrent access to
 OPAL
Date: Mon, 10 Jul 2017 11:30:58 +1000
In-Reply-To: <20170710013106.27276-1-cyrilbur@gmail.com>
References: <20170710013106.27276-1-cyrilbur@gmail.com>
Message-Id: <20170710013106.27276-3-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

OPAL can only manage one flash access at a time and will return an
OPAL_BUSY error for each concurrent access to the flash. The simplest
way to prevent this from happening is with a mutex.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/mtd/devices/powernv_flash.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index a9a20c00687c..7b41af06f4fe 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -38,6 +38,7 @@
 
 struct powernv_flash {
 	struct mtd_info	mtd;
+	struct mutex lock;
 	u32 id;
 };
 
@@ -59,12 +60,15 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 	dev_dbg(dev, "%s(op=%d, offset=0x%llx, len=%zu)\n",
 			__func__, op, offset, len);
 
+	mutex_lock(&info->lock);
+
 	token = opal_async_get_token_interruptible();
 	if (token < 0) {
 		if (token != -ERESTARTSYS)
 			dev_err(dev, "Failed to get an async token\n");
 
-		return token;
+		rc = token;
+		goto out;
 	}
 
 	switch (op) {
@@ -79,18 +83,21 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		break;
 	default:
 		WARN_ON_ONCE(1);
-		return -EIO;
+		rc = -EIO;
+		goto out;
 	}
 
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		dev_err(dev, "opal_flash_async_op(op=%d) failed (rc %d)\n",
 				op, rc);
 		opal_async_release_token(token);
-		return -EIO;
+		rc = -EIO;
+		goto out;
 	}
 
 	rc = opal_async_wait_response(token, &msg);
 	opal_async_release_token(token);
+	mutex_unlock(&info->lock);
 	if (rc) {
 		dev_err(dev, "opal async wait failed (rc %d)\n", rc);
 		return -EIO;
@@ -106,6 +113,9 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 	}
 
 	return rc;
+out:
+	mutex_unlock(&info->lock);
+	return rc;
 }
 
 /**
@@ -237,6 +247,8 @@ static int powernv_flash_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
+	mutex_init(&data->lock);
+
 	dev_set_drvdata(dev, data);
 
 	/*
-- 
2.13.2
