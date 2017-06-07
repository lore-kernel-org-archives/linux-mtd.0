Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dITnj-0002It-3x
 for linux-mtd@lists.infradead.org; Wed, 07 Jun 2017 05:46:40 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v575jDmc107457
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2017 01:46:17 -0400
Received: from e23smtp02.au.ibm.com (e23smtp02.au.ibm.com [202.81.31.144])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ax98fmtu9-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2017 01:46:17 -0400
Received: from localhost
 by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Wed, 7 Jun 2017 15:46:14 +1000
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v575k2QP63701228
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2017 15:46:10 +1000
Received: from d23av04.au.ibm.com (localhost [127.0.0.1])
 by d23av04.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v575jaHv004913
 for <linux-mtd@lists.infradead.org>; Wed, 7 Jun 2017 15:45:36 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: dwmw2@infradead.org, computersforpeace@gmail.com, mpe@ellerman.id.au
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] mtd: powernv_flash: Use WARN_ON_ONCE() rather than
 BUG_ON()
Date: Wed,  7 Jun 2017 15:43:54 +1000
Message-Id: <20170607054355.10590-1-cyrilbur@gmail.com>
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
I think patches to powernv_flash have gone through MPE in the past -
is this still correct?

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
2.13.0
