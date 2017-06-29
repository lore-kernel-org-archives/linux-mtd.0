Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dQTM7-0003ZV-Sn
 for linux-mtd@lists.infradead.org; Thu, 29 Jun 2017 06:55:14 +0000
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5T6s36B018149
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:54:48 -0400
Received: from e23smtp08.au.ibm.com (e23smtp08.au.ibm.com [202.81.31.141])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2bcqp71x37-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 02:54:47 -0400
Received: from localhost
 by e23smtp08.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Thu, 29 Jun 2017 16:54:44 +1000
Received: from d23av03.au.ibm.com (d23av03.au.ibm.com [9.190.234.97])
 by d23relay08.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5T6sfLH7406012
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:54:41 +1000
Received: from d23av03.au.ibm.com (localhost [127.0.0.1])
 by d23av03.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v5T6sWeP031490
 for <linux-mtd@lists.infradead.org>; Thu, 29 Jun 2017 16:54:32 +1000
From: Cyril Bur <cyrilbur@gmail.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org
Cc: dwmw2@infradead.org, stewart@linux.vnet.ibm.com
Subject: [PATCH 1/5] powerpc/opal: Make __opal_async_{get,
 release}_token() static
Date: Thu, 29 Jun 2017 16:54:09 +1000
In-Reply-To: <20170629065413.19845-1-cyrilbur@gmail.com>
References: <20170629065413.19845-1-cyrilbur@gmail.com>
Message-Id: <20170629065413.19845-2-cyrilbur@gmail.com>
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
