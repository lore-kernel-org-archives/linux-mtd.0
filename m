Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1lIi-0002kH-09
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 03:33:56 +0000
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9A3WDX5038681
 for <linux-mtd@lists.infradead.org>; Mon, 9 Oct 2017 23:33:28 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2dgk5k09e2-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 23:33:28 -0400
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Tue, 10 Oct 2017 04:33:26 +0100
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9A3XNTg31588508
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 03:33:24 GMT
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v9A3XPfp031562
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 14:33:26 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v4 04/10] mtd: powernv_flash: Don't return -ERESTARTSYS on
 interrupted token acquisition
Date: Tue, 10 Oct 2017 14:32:56 +1100
In-Reply-To: <20171010033302.20854-1-cyrilbur@gmail.com>
References: <20171010033302.20854-1-cyrilbur@gmail.com>
Message-Id: <20171010033302.20854-5-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Because the MTD core might split up a read() or write() from userspace
into several calls to the driver, we may fail to get a token but already
have done some work, best to return -EINTR back to userspace and have
them decide what to do.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 drivers/mtd/devices/powernv_flash.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 4dd3b5d2feb2..3343d4f5c4f3 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -47,6 +47,11 @@ enum flash_op {
 	FLASH_OP_ERASE,
 };
 
+/*
+ * Don't return -ERESTARTSYS if we can't get a token, the MTD core
+ * might have split up the call from userspace and called into the
+ * driver more than once, we'll already have done some amount of work.
+ */
 static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		loff_t offset, size_t len, size_t *retlen, u_char *buf)
 {
@@ -63,6 +68,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 	if (token < 0) {
 		if (token != -ERESTARTSYS)
 			dev_err(dev, "Failed to get an async token\n");
+		else
+			token = -EINTR;
 		return token;
 	}
 
-- 
2.14.2
