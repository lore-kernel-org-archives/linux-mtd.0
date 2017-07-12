Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV9C4-0001Lg-JO
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 04:24:10 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6C4NirT050047
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:23:45 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bncj509e9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:23:44 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Wed, 12 Jul 2017 14:23:36 +1000
Received: from d23av06.au.ibm.com (d23av06.au.ibm.com [9.190.235.151])
 by d23relay09.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6C4NVjr24314022
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:31 +1000
Received: from d23av06.au.ibm.com (localhost [127.0.0.1])
 by d23av06.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6C4NUlV007236
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:31 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v3 01/10] mtd: powernv_flash: Use WARN_ON_ONCE() rather than
 BUG_ON()
Date: Wed, 12 Jul 2017 14:22:55 +1000
In-Reply-To: <20170712042304.19745-1-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
Message-Id: <20170712042304.19745-2-cyrilbur@gmail.com>
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
---
 drivers/mtd/devices/powernv_flash.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index f5396f26ddb4..a9a20c00687c 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -78,7 +78,8 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 		rc = opal_flash_erase(info->id, offset, len, token);
 		break;
 	default:
-		BUG_ON(1);
+		WARN_ON_ONCE(1);
+		return -EIO;
 	}
 
 	if (rc != OPAL_ASYNC_COMPLETION) {
-- 
2.13.2
