Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV9C4-0001Lh-JP
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 04:24:10 +0000
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6C4NjaT064593
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:23:46 -0400
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bncjar8fk-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:23:45 -0400
Received: from localhost
 by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Wed, 12 Jul 2017 14:23:36 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay07.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6C4NWk114156028
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:32 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6C4NUxh012048
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:31 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v3 09/10] powerpc/powernv: Add OPAL_BUSY to opal_error_code()
Date: Wed, 12 Jul 2017 14:23:03 +1000
In-Reply-To: <20170712042304.19745-1-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
Message-Id: <20170712042304.19745-10-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Also export opal_error_code() so that it can be used in modules

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 59684b4af4d1..c4008a612473 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -930,6 +930,7 @@ int opal_error_code(int rc)
 
 	case OPAL_PARAMETER:		return -EINVAL;
 	case OPAL_ASYNC_COMPLETION:	return -EINPROGRESS;
+	case OPAL_BUSY:
 	case OPAL_BUSY_EVENT:		return -EBUSY;
 	case OPAL_NO_MEM:		return -ENOMEM;
 	case OPAL_PERMISSION:		return -EPERM;
@@ -968,3 +969,4 @@ EXPORT_SYMBOL_GPL(opal_write_oppanel_async);
 /* Export this for KVM */
 EXPORT_SYMBOL_GPL(opal_int_set_mfrr);
 EXPORT_SYMBOL_GPL(opal_int_eoi);
+EXPORT_SYMBOL_GPL(opal_error_code);
-- 
2.13.2
