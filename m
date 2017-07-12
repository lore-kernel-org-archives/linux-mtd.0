Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dV9D7-0007DH-Te
 for linux-mtd@lists.infradead.org; Wed, 12 Jul 2017 04:25:15 +0000
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v6C4NmOa130555
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:24:52 -0400
Received: from e23smtp06.au.ibm.com (e23smtp06.au.ibm.com [202.81.31.148])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bncj589t0-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 00:24:52 -0400
Received: from localhost
 by e23smtp06.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Wed, 12 Jul 2017 14:24:49 +1000
Received: from d23av01.au.ibm.com (d23av01.au.ibm.com [9.190.234.96])
 by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6C4NVdg25690210
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:31 +1000
Received: from d23av01.au.ibm.com (localhost [127.0.0.1])
 by d23av01.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v6C4NULb012039
 for <linux-mtd@lists.infradead.org>; Wed, 12 Jul 2017 14:23:31 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: benh@kernel.crashing.org, stewart@linux.vnet.ibm.com, dwmw2@infradead.org,
 rlippert@google.com, alistair@popple.id.au
Subject: [PATCH v3 05/10] powerpc/opal: Make __opal_async_{get,
 release}_token() static
Date: Wed, 12 Jul 2017 14:22:59 +1000
In-Reply-To: <20170712042304.19745-1-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
Message-Id: <20170712042304.19745-6-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There are no callers of both __opal_async_get_token() and
__opal_async_release_token().

This patch also removes the possibility of "emergency through
synchronous call to __opal_async_get_token()" as such it makes more
sense to initialise opal_sync_sem for the maximum number of async
tokens.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/powerpc/include/asm/opal.h             |  2 --
 arch/powerpc/platforms/powernv/opal-async.c | 10 +++-------
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 588fb1c23af9..5553ad2f3e53 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -291,9 +291,7 @@ extern void opal_notifier_enable(void);
 extern void opal_notifier_disable(void);
 extern void opal_notifier_update_evt(uint64_t evt_mask, uint64_t evt_val);
 
-extern int __opal_async_get_token(void);
 extern int opal_async_get_token_interruptible(void);
-extern int __opal_async_release_token(int token);
 extern int opal_async_release_token(int token);
 extern int opal_async_wait_response(uint64_t token, struct opal_msg *msg);
 extern int opal_get_sensor_data(u32 sensor_hndl, u32 *sensor_data);
diff --git a/arch/powerpc/platforms/powernv/opal-async.c b/arch/powerpc/platforms/powernv/opal-async.c
index 83bebeec0fea..1d56ac9da347 100644
--- a/arch/powerpc/platforms/powernv/opal-async.c
+++ b/arch/powerpc/platforms/powernv/opal-async.c
@@ -33,7 +33,7 @@ static struct semaphore opal_async_sem;
 static struct opal_msg *opal_async_responses;
 static unsigned int opal_max_async_tokens;
 
-int __opal_async_get_token(void)
+static int __opal_async_get_token(void)
 {
 	unsigned long flags;
 	int token;
@@ -73,7 +73,7 @@ int opal_async_get_token_interruptible(void)
 }
 EXPORT_SYMBOL_GPL(opal_async_get_token_interruptible);
 
-int __opal_async_release_token(int token)
+static int __opal_async_release_token(int token)
 {
 	unsigned long flags;
 
@@ -199,11 +199,7 @@ int __init opal_async_comp_init(void)
 		goto out_opal_node;
 	}
 
-	/* Initialize to 1 less than the maximum tokens available, as we may
-	 * require to pop one during emergency through synchronous call to
-	 * __opal_async_get_token()
-	 */
-	sema_init(&opal_async_sem, opal_max_async_tokens - 1);
+	sema_init(&opal_async_sem, opal_max_async_tokens);
 
 out_opal_node:
 	of_node_put(opal_node);
-- 
2.13.2
