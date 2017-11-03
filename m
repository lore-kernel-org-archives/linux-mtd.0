Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eARw5-0002nI-Kp
 for linux-mtd@lists.infradead.org; Fri, 03 Nov 2017 02:42:23 +0000
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 vA32crZI031794
 for <linux-mtd@lists.infradead.org>; Thu, 2 Nov 2017 22:42:00 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2e08mkm4fe-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 02 Nov 2017 22:41:59 -0400
Received: from localhost
 by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Fri, 3 Nov 2017 02:41:57 -0000
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v5 01/10] mtd: powernv_flash: Use WARN_ON_ONCE() rather than
 BUG_ON()
Date: Fri,  3 Nov 2017 13:41:37 +1100
In-Reply-To: <20171103024146.17086-1-cyrilbur@gmail.com>
References: <20171103024146.17086-1-cyrilbur@gmail.com>
Message-Id: <20171103024146.17086-2-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

BUG_ON() should be reserved in situations where we can not longer
guarantee the integrity of the system. In the case where
powernv_flash_async_op() receives an impossible op, we can still
guarantee the integrity of the system.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/devices/powernv_flash.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index f5396f26ddb4..f9ec38281ff2 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -78,7 +78,9 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		rc = opal_flash_erase(info->id, offset, len, token);
 		break;
 	default:
-		BUG_ON(1);
+		WARN_ON_ONCE(1);
+		opal_async_release_token(token);
+		return -EIO;
 	}
 
 	if (rc != OPAL_ASYNC_COMPLETION) {
-- 
2.15.0
