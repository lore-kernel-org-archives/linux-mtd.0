Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e1lIh-0002kF-CU
 for linux-mtd@lists.infradead.org; Tue, 10 Oct 2017 03:33:57 +0000
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
 v9A3TCGl001040
 for <linux-mtd@lists.infradead.org>; Mon, 9 Oct 2017 23:33:29 -0400
Received: from e06smtp10.uk.ibm.com (e06smtp10.uk.ibm.com [195.75.94.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2dgjf99vbw-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 09 Oct 2017 23:33:29 -0400
Received: from localhost
 by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-mtd@lists.infradead.org> from <cyrilbur@gmail.com>;
 Tue, 10 Oct 2017 04:33:26 +0100
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v9A3XNWG19136698
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 03:33:24 GMT
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
 by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 v9A3XDFu011054
 for <linux-mtd@lists.infradead.org>; Tue, 10 Oct 2017 14:33:14 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 stewart@linux.vnet.ibm.com
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, sjitindarsingh@gmail.com
Subject: [PATCH v4 06/10] powerpc/opal: Rework the opal-async interface
Date: Tue, 10 Oct 2017 14:32:58 +1100
In-Reply-To: <20171010033302.20854-1-cyrilbur@gmail.com>
References: <20171010033302.20854-1-cyrilbur@gmail.com>
Message-Id: <20171010033302.20854-7-cyrilbur@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Future work will add an opal_async_wait_response_interruptible()
which will call wait_event_interruptible(). This work requires extra
token state to be tracked as wait_event_interruptible() can return and
the caller could release the token before OPAL responds.

Currently token state is tracked with two bitfields which are 64 bits
big but may not need to be as OPAL informs Linux how many async tokens
there are. It also uses an array indexed by token to store response
messages for each token.

The bitfields make it difficult to add more state and also provide a
hard maximum as to how many tokens there can be - it is possible that
OPAL will inform Linux that there are more than 64 tokens.

Rather than add a bitfield to track the extra state, rework the
internals slightly.

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
---
 arch/powerpc/platforms/powernv/opal-async.c | 92 ++++++++++++++++-------------
 1 file changed, 50 insertions(+), 42 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-async.c b/arch/powerpc/platforms/powernv/opal-async.c
index c43421ab2d2f..fbae8a37ce2c 100644
--- a/arch/powerpc/platforms/powernv/opal-async.c
+++ b/arch/powerpc/platforms/powernv/opal-async.c
@@ -1,7 +1,7 @@
 /*
  * PowerNV OPAL asynchronous completion interfaces
  *
- * Copyright 2013 IBM Corp.
+ * Copyright 2013-2017 IBM Corp.
  *
  * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
@@ -23,40 +23,45 @@
 #include <asm/machdep.h>
 #include <asm/opal.h>
 
-#define N_ASYNC_COMPLETIONS	64
+enum opal_async_token_state {
+	ASYNC_TOKEN_UNALLOCATED = 0,
+	ASYNC_TOKEN_ALLOCATED,
+	ASYNC_TOKEN_COMPLETED
+};
+
+struct opal_async_token {
+	enum opal_async_token_state state;
+	struct opal_msg response;
+};
 
-static DECLARE_BITMAP(opal_async_complete_map, N_ASYNC_COMPLETIONS) = {~0UL};
-static DECLARE_BITMAP(opal_async_token_map, N_ASYNC_COMPLETIONS);
 static DECLARE_WAIT_QUEUE_HEAD(opal_async_wait);
 static DEFINE_SPINLOCK(opal_async_comp_lock);
 static struct semaphore opal_async_sem;
-static struct opal_msg *opal_async_responses;
 static unsigned int opal_max_async_tokens;
+static struct opal_async_token *opal_async_tokens;
 
 static int __opal_async_get_token(void)
 {
 	unsigned long flags;
-	int token;
+	int token = -EBUSY;
 
 	spin_lock_irqsave(&opal_async_comp_lock, flags);
-	token = find_first_bit(opal_async_complete_map, opal_max_async_tokens);
-	if (token >= opal_max_async_tokens) {
-		token = -EBUSY;
-		goto out;
+	for (token = 0; token < opal_max_async_tokens; token++) {
+		if (opal_async_tokens[token].state == ASYNC_TOKEN_UNALLOCATED) {
+			opal_async_tokens[token].state = ASYNC_TOKEN_ALLOCATED;
+			goto out;
+		}
 	}
-
-	if (__test_and_set_bit(token, opal_async_token_map)) {
-		token = -EBUSY;
-		goto out;
-	}
-
-	__clear_bit(token, opal_async_complete_map);
-
 out:
 	spin_unlock_irqrestore(&opal_async_comp_lock, flags);
 	return token;
 }
 
+/*
+ * Note: If the returned token is used in an opal call and opal returns
+ * OPAL_ASYNC_COMPLETION you MUST opal_async_wait_response() before
+ * calling another other opal_async_* function
+ */
 int opal_async_get_token_interruptible(void)
 {
 	int token;
@@ -76,6 +81,7 @@ EXPORT_SYMBOL_GPL(opal_async_get_token_interruptible);
 static int __opal_async_release_token(int token)
 {
 	unsigned long flags;
+	int rc;
 
 	if (token < 0 || token >= opal_max_async_tokens) {
 		pr_err("%s: Passed token is out of range, token %d\n",
@@ -84,11 +90,18 @@ static int __opal_async_release_token(int token)
 	}
 
 	spin_lock_irqsave(&opal_async_comp_lock, flags);
-	__set_bit(token, opal_async_complete_map);
-	__clear_bit(token, opal_async_token_map);
+	switch (opal_async_tokens[token].state) {
+	case ASYNC_TOKEN_COMPLETED:
+	case ASYNC_TOKEN_ALLOCATED:
+		opal_async_tokens[token].state = ASYNC_TOKEN_UNALLOCATED;
+		rc = 0;
+		break;
+	default:
+		rc = 1;
+	}
 	spin_unlock_irqrestore(&opal_async_comp_lock, flags);
 
-	return 0;
+	return rc;
 }
 
 int opal_async_release_token(int token)
@@ -96,12 +109,10 @@ int opal_async_release_token(int token)
 	int ret;
 
 	ret = __opal_async_release_token(token);
-	if (ret)
-		return ret;
-
-	up(&opal_async_sem);
+	if (!ret)
+		up(&opal_async_sem);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(opal_async_release_token);
 
@@ -122,13 +133,15 @@ int opal_async_wait_response(uint64_t token, struct opal_msg *msg)
 	 * functional.
 	 */
 	opal_wake_poller();
-	wait_event(opal_async_wait, test_bit(token, opal_async_complete_map));
-	memcpy(msg, &opal_async_responses[token], sizeof(*msg));
+	wait_event(opal_async_wait, opal_async_tokens[token].state
+			== ASYNC_TOKEN_COMPLETED);
+	memcpy(msg, &opal_async_tokens[token].response, sizeof(*msg));
 
 	return 0;
 }
 EXPORT_SYMBOL_GPL(opal_async_wait_response);
 
+/* Called from interrupt context */
 static int opal_async_comp_event(struct notifier_block *nb,
 		unsigned long msg_type, void *msg)
 {
@@ -140,9 +153,9 @@ static int opal_async_comp_event(struct notifier_block *nb,
 		return 0;
 
 	token = be64_to_cpu(comp_msg->params[0]);
-	memcpy(&opal_async_responses[token], comp_msg, sizeof(*comp_msg));
+	memcpy(&opal_async_tokens[token].response, comp_msg, sizeof(*comp_msg));
 	spin_lock_irqsave(&opal_async_comp_lock, flags);
-	__set_bit(token, opal_async_complete_map);
+	opal_async_tokens[token].state = ASYNC_TOKEN_COMPLETED;
 	spin_unlock_irqrestore(&opal_async_comp_lock, flags);
 
 	wake_up(&opal_async_wait);
@@ -178,24 +191,19 @@ int __init opal_async_comp_init(void)
 	}
 
 	opal_max_async_tokens = be32_to_cpup(async);
-	if (opal_max_async_tokens > N_ASYNC_COMPLETIONS)
-		opal_max_async_tokens = N_ASYNC_COMPLETIONS;
+	opal_async_tokens = kcalloc(opal_max_async_tokens,
+			sizeof(*opal_async_tokens), GFP_KERNEL);
+	if (!opal_async_tokens) {
+		err = -ENOMEM;
+		goto out_opal_node;
+	}
 
 	err = opal_message_notifier_register(OPAL_MSG_ASYNC_COMP,
 			&opal_async_comp_nb);
 	if (err) {
 		pr_err("%s: Can't register OPAL event notifier (%d)\n",
 				__func__, err);
-		goto out_opal_node;
-	}
-
-	opal_async_responses = kzalloc(
-			sizeof(*opal_async_responses) * opal_max_async_tokens,
-			GFP_KERNEL);
-	if (!opal_async_responses) {
-		pr_err("%s: Out of memory, failed to do asynchronous "
-				"completion init\n", __func__);
-		err = -ENOMEM;
+		kfree(opal_async_tokens);
 		goto out_opal_node;
 	}
 
-- 
2.14.2
