Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dUNYI-0000wv-KJ
 for linux-mtd@lists.infradead.org; Mon, 10 Jul 2017 01:31:59 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6A1SaYl031437
 for <linux-mtd@lists.infradead.org>; Sun, 9 Jul 2017 21:31:33 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bjuhhha14-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Sun, 09 Jul 2017 21:31:33 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Mon, 10 Jul 2017 11:31:30 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6A1VSpH12583050
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:28 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6A1VRIB014300
 for <linux-mtd@lists.infradead.org>; Mon, 10 Jul 2017 11:31:27 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v2 03/10] mtd: powernv_flash: Don't treat OPAL_SUCCESS as an
 error
Date: Mon, 10 Jul 2017 11:30:59 +1000
In-Reply-To: <20170710013106.27276-1-cyrilbur@gmail.com>
References: <20170710013106.27276-1-cyrilbur@gmail.com>
Message-Id: <20170710013106.27276-4-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

While this driver expects to interact asynchronously, OPAL is well
within its rights to return OPAL_SUCCESS to indicate that the operation
completed without the need for a callback. We shouldn't treat
OPAL_SUCCESS as an error rather we should wrap up and return promptly to
the caller.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
I'll note here that currently no OPAL exists that will return
OPAL_SUCCESS so there isn't the possibility of a bug today.

 drivers/mtd/devices/powernv_flash.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 7b41af06f4fe..d50b5f200f73 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -66,9 +66,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 	if (token < 0) {
 		if (token != -ERESTARTSYS)
 			dev_err(dev, "Failed to get an async token\n");
-
-		rc = token;
-		goto out;
+		mutex_unlock(&info->lock);
+		return token;
 	}
 
 	switch (op) {
@@ -87,23 +86,25 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		goto out;
 	}
 
+	if (rc == OPAL_SUCCESS)
+		goto out_success;
+
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		dev_err(dev, "opal_flash_async_op(op=%d) failed (rc %d)\n",
 				op, rc);
-		opal_async_release_token(token);
 		rc = -EIO;
 		goto out;
 	}
 
 	rc = opal_async_wait_response(token, &msg);
-	opal_async_release_token(token);
-	mutex_unlock(&info->lock);
 	if (rc) {
 		dev_err(dev, "opal async wait failed (rc %d)\n", rc);
-		return -EIO;
+		rc = -EIO;
+		goto out;
 	}
 
 	rc = opal_get_async_rc(msg);
+out_success:
 	if (rc == OPAL_SUCCESS) {
 		rc = 0;
 		if (retlen)
@@ -112,8 +113,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		rc = -EIO;
 	}
 
-	return rc;
 out:
+	opal_async_release_token(token);
 	mutex_unlock(&info->lock);
 	return rc;
 }
-- 
2.13.2
