Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQTM7-0003a1-Sv
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 06:55:15 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5T6s63S096286
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:54:50 -0400
Received: from e23smtp07.au.ibm.com (e23smtp07.au.ibm.com [202.81.31.140])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bcr4u0s86-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:54:49 -0400
Received: from localhost
 by e23smtp07.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Thu, 29 Jun 2017 16:54:46 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5T6shnq61210804
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:54:43 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5T6sgJb027996
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:54:42 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, stewart@linux.vnet.ibm.com
Subject: [PATCH 4/5] powerpc/powernv: Add OPAL_BUSY to opal_error_code()
Date: Thu, 29 Jun 2017 16:54:12 +1000
In-Reply-To: <20170629065413.19845-1-cyrilbur@gmail.com>
References: <20170629065413.19845-1-cyrilbur@gmail.com>
Message-Id: <20170629065413.19845-5-cyrilbur@gmail.com>
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
 arch/powerpc/platforms/powernv/opal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 59684b4af4d1..f87e000e7c28 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -930,6 +930,7 @@ int opal_error_code(int rc)
 
 	case OPAL_PARAMETER:		return -EINVAL;
 	case OPAL_ASYNC_COMPLETION:	return -EINPROGRESS;
+	case OPAL_BUSY:
 	case OPAL_BUSY_EVENT:		return -EBUSY;
 	case OPAL_NO_MEM:		return -ENOMEM;
 	case OPAL_PERMISSION:		return -EPERM;
-- 
2.13.2
