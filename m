Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eARw5-0002n5-KJ
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 02:42:26 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA32crOg146256
 for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2017 22:41:59 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2e0cdf9157-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 22:41:59 -0400
Received: from localhost
 by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Fri, 3 Nov 2017 02:41:58 -0000
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v5 02/10] mtd: powernv_flash: Don't treat OPAL_SUCCESS as an
 error
Date: Fri,  3 Nov 2017 13:41:38 +1100
In-Reply-To: <20171103024146.17086-1-cyrilbur@gmail.com>
References: <20171103024146.17086-1-cyrilbur@gmail.com>
Message-Id: <20171103024146.17086-3-cyrilbur@gmail.com>
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
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
I'll note here that currently no OPAL exists that will return
OPAL_SUCCESS so there isn't the possibility of a bug today.
---
 drivers/mtd/devices/powernv_flash.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index f9ec38281ff2..ca3ca6adf71e 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -63,7 +63,6 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 	if (token < 0) {
 		if (token != -ERESTARTSYS)
 			dev_err(dev, "Failed to get an async token\n");
-
 		return token;
 	}
 
@@ -83,21 +82,25 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		return -EIO;
 	}
 
+	if (rc == OPAL_SUCCESS)
+		goto out_success;
+
 	if (rc != OPAL_ASYNC_COMPLETION) {
 		dev_err(dev, "opal_flash_async_op(op=%d) failed (rc %d)\n",
 				op, rc);
-		opal_async_release_token(token);
-		return -EIO;
+		rc = -EIO;
+		goto out;
 	}
 
 	rc = opal_async_wait_response(token, &msg);
-	opal_async_release_token(token);
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
@@ -106,6 +109,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		rc = -EIO;
 	}
 
+out:
+	opal_async_release_token(token);
 	return rc;
 }
 
-- 
2.15.0
