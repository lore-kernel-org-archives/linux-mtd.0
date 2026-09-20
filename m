Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6ABBC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 18:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvVl0nI+BzDYba/1SBnqcjTYuhiPHcRJg3CpxCchyLc=; b=EnlvJYx1fhgCRt
	X5uRSF/gKhGZjbVjYpIGU4v11ty6qG9X29t/I4JsMMQZro5Gi/aNyQsec1LbbNdqKwyQ29bQWkgxk
	pPPJdYadudHTvLOwRlBNtrMQxO6wehn1ASO6fNbCQktc+spMUeHv5VmWf3c3hYFG0zU2KJGVKJEod
	+LMjcOE/RfwGqQEU90O5EljsGjYC9KJao5wFfokAtYNjMCQYwNw3a7y9nX/0t7BH7ZXDV5gnHnJeH
	M9gKw1j1/5Tfklb2blubLQZNuG0PtyKZswazEQHcM2cNxj8KtKbgLTWO+G8YFAGBU1lSP8rDS3jLI
	0AXGJVw2oUlSFeO9pIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Mdh-00000000GVG-2Fa1;
	Sun, 20 Sep 2026 18:51:49 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Mdf-00000000GUk-1fhc
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 18:51:48 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396cccbba92so2073567a91.0
        for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 11:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789930306; x=1790535106; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C3PcdtvDhtWk0resd1+mjtW2Liv65ZiOwtUfq+Snr3M=;
        b=jQfWK9GTbwCTUfnR8ZTBN8LBP82+qa+Z9UKyVVC0pAuX+UPyTZW9zXLbRq+nRXJN94
         dxHSd8UZgT8fogNMlJpYUpna/1FCgVppnj/2blPN2c+YyODsRuohgVFdCAWfchmN8ajp
         ReHap6Q78J8dLGsdjB9C/+e6JmwrZ7q0VnwTCoYxGb/mhc7byFyW7j9YswP1dS1qGkxA
         1VSswrV5oepo/hajfBDNMcg/ls4/vjR69p5ogGoqYGYjbxjLtKRw+pmsUXu0rH/kEI/W
         /EOWd8GGrF0ge5ac4bgIY2o8QUXuaPhkqiiS+D/GSw3aumY57KnovQK8eg6Ul8rgTe48
         AAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789930306; x=1790535106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C3PcdtvDhtWk0resd1+mjtW2Liv65ZiOwtUfq+Snr3M=;
        b=aJ4WZHY4yYAV6UBwMRYUty4PXuURMa3BJLGNECuf7uDT+F8dVmLsmey14SVzqBCMr7
         844/s6pCPpMxcODFem5TRXSeaQB+O9/2wlRZZl9KyeNFkJMp1uprV6S73HHoTIDRdlxp
         IeC4kYlcWlXN1U/T+uzvewKjCYB6zaiqAvfm59C2UPrWjbZ7A8PCsJJW7ZZ18xcLW6zg
         o+qLQBegNSMnknbDgVNonTNrxn8/Z/sppLU6HvXOtzfFXq1r4bEpz2AS4A2JM+cmN11C
         OnT48zvuDyS5PszzzK/tWAZQFX9SSFbeliszXr4igj9T2B0G8JsPXZmt9061p57wugqY
         vELA==
X-Gm-Message-State: AFuF++l1Lk9ur2f7ppFCAKnWPRLS0r7nvfz3mnA1AHvub2VDRgfW0iXU
	vLyQg3RxDzOwgDNwtCxlivY4LtYpNoWxSPAx7w7jn4ANM966wdn1KkvsRl72HuzRBnUH
X-Gm-Gg: AYBFou3FjoCT028u2BQvr9hiOEkjdVipdUeu81Qa9kqQ3Lnf+viIZSa3NawEkUjiKWP
	D5fncOgpG3i1oCcuzGZAc8mgew1XQGVSEkUjUlfK3Y4H+2AjGn1jrdbnwxz2r/myrMCuFc7/TB/
	rjnT0Vj8EY2WQ4Q0/Y/JxQECvqNtGb1FF/lZclXqV8p03xGuBoaT3Y9GBOrax/xdVuAA+Zx+9ls
	L6JPOLGIw4JOXgE8rwg605dLUDm5qkSkXeQfvwLP3oEdy4h7WfLatIac4+9zbq6pbJuRZ/dMpr4
	pPpP+I97w1M9CkmuolkCpfFYLKlmcRLpoxQzHg/fOx26Sfx8KOHOILvOhkpmvYMoz4g7BW5f1aW
	Y8JxnhKjQEpWWDN9uoDqnxE3lORchD3duqNyplReQHtg6jP+ps4V6M9RO14ypRwUGVb4DtH4lGS
	HEY9nookyGPOmR/244yvBkiUcuyCLW6yOIW3evY2uhbn8UpD+Iq4cci4+aZlajNUHhip3aLDqZT
	Mr+zee5WESisEn1RdraY8d8K8nuwVOp2en7lMOJH8gnV6W49SdKVqHkFBwBIq0HslHlzhtRbB0=
X-Received: by 2002:a17:90b:4a85:b0:39e:6a80:dd9b with SMTP id 98e67ed59e1d1-39e6a810c53mr7579979a91.34.1789930306330;
        Sun, 20 Sep 2026 11:51:46 -0700 (PDT)
Received: from devils-dell.. ([2405:201:8004:88ab:1946:9b98:4be:3aba])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c3145dasm10240765a91.4.2026.09.20.11.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 11:51:45 -0700 (PDT)
From: Chris Roy <iam@thechris.in>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	joern@barelysecure.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	Chris Roy <iam@thechris.in>
Subject: [PATCH v4] mtd: block2mtd: defer device open out of param/sysfs write
Date: Mon, 21 Sep 2026 00:21:32 +0530
Message-Id: <20260920185132.1266699-1-iam@thechris.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
References: <6aa178fc.f2639fcc.29487d.0008.GAE@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_115147_594637_F42B241B 
X-CRM114-Status: GOOD (  24.50  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

block2mtd_setup() opens the named block device while still under
param_lock, and on the sysfs write path under kernfs (and possibly a
splice pipe lock). That nests VFS locking the wrong way relative to
overlayfs and trips lockdep.

Drop param_lock and run setup on a dedicated ordered workqueue. Keep
the call synchronous with wait_for_completion(). Allocate the work on
the heap so DEBUG_OBJECTS_WORK stays quiet.

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Chris Roy <iam@thechris.in>
---
v4:
 - rename list_mutex / setup_wq to say what they are for
 - tidy new comments
 - fix Assisted-by tag format (checkpatch: AGENT_NAME:MODEL_VERSION)
 - drop redundant setup_wq check in block2mtd_setup_defer() (the sole
   caller already gates on it)
 - claim Tested-by from syzbot (granted on v2, v3, and this content)
v3:
 - rewrite the new comments to match the rest of the file
 - add Assisted-by
v2:
 - heap-allocated work (v1 tripped DEBUG_OBJECTS_WORK)
 - dedicated ordered workqueue instead of system_wq
 - module reference across the deferred open
 - flush/destroy the workqueue before exit teardown
 - serialize setup2 on the worker under list_mutex
 - early-boot paramline updates under that mutex

Not proposed for stable. block2mtd has no known production use (per
Richard Weinberger, testing is the only real use case), so there is
no backport trail worth chasing here.

 drivers/mtd/devices/block2mtd.c | 116 ++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2..a540089 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -27,6 +27,8 @@
 #include <linux/init.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mutex.h>
+#include <linux/workqueue.h>
+#include <linux/completion.h>
 #include <linux/mount.h>
 #include <linux/slab.h>
 #include <linux/major.h>
@@ -45,6 +47,9 @@ struct block2mtd_dev {
 
 /* Static info about the MTD, used in cleanup_module */
 static LIST_HEAD(blkmtd_device_list);
+/* Protects blkmtd_device_list and early-boot paramline updates */
+static DEFINE_MUTEX(list_mutex);
+static struct workqueue_struct *setup_wq;
 
 
 static struct page *page_read(struct address_space *mapping, pgoff_t index)
@@ -461,31 +466,85 @@ static int block2mtd_setup2(const char *val)
 	return 0;
 }
 
+struct block2mtd_setup_work {
+	struct work_struct work;
+	struct completion done;
+	char *val;
+	int ret;
+};
+
+static void block2mtd_setup_workfn(struct work_struct *work)
+{
+	struct block2mtd_setup_work *w =
+		container_of(work, struct block2mtd_setup_work, work);
+
+	mutex_lock(&list_mutex);
+	w->ret = block2mtd_setup2(w->val);
+	mutex_unlock(&list_mutex);
+	complete(&w->done);
+}
+
+/* Runs block2mtd_setup2() on setup_wq, blocking until it completes */
+static int block2mtd_setup_defer(const char *val)
+{
+	struct block2mtd_setup_work *w;
+	int ret;
+
+	w = kzalloc(sizeof(*w), GFP_KERNEL);
+	if (!w)
+		return -ENOMEM;
+
+	w->val = kstrdup(val, GFP_KERNEL);
+	if (!w->val) {
+		kfree(w);
+		return -ENOMEM;
+	}
+
+	init_completion(&w->done);
+	INIT_WORK(&w->work, block2mtd_setup_workfn);
+	queue_work(setup_wq, &w->work);
+	wait_for_completion(&w->done);
+
+	ret = w->ret;
+	kfree(w->val);
+	kfree(w);
+	return ret;
+}
 
 static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 {
-#ifdef MODULE
-	return block2mtd_setup2(val);
-#else
-	/* If more parameters are later passed in via
-	   /sys/module/block2mtd/parameters/block2mtd
-	   and block2mtd_init() has already been called,
-	   we can parse the argument now. */
-
-	if (block2mtd_init_called)
-		return block2mtd_setup2(val);
-
-	/* During early boot stage, we only save the parameters
-	   here. We must parse them later: if the param passed
-	   from kernel boot command line, block2mtd_setup() is
-	   called so early that it is not possible to resolve
-	   the device (even kmalloc() fails). Deter that work to
-	   block2mtd_setup2(). */
-
-	strscpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
+	int ret = 0;
 
-	return 0;
+	if (!try_module_get(kp->mod))
+		return -ENODEV;
+
+	kernel_param_unlock(kp->mod);
+
+#ifndef MODULE
+	mutex_lock(&list_mutex);
+	if (!block2mtd_init_called) {
+		/* Cannot resolve block devices this early */
+		strscpy(block2mtd_paramline, val, sizeof(block2mtd_paramline));
+		mutex_unlock(&list_mutex);
+		kernel_param_lock(kp->mod);
+		module_put(kp->mod);
+		return 0;
+	}
+	mutex_unlock(&list_mutex);
 #endif
+
+	if (setup_wq) {
+		ret = block2mtd_setup_defer(val);
+	} else {
+		/* Not yet deferred to setup_wq; safe to call setup2 directly */
+		mutex_lock(&list_mutex);
+		ret = block2mtd_setup2(val);
+		mutex_unlock(&list_mutex);
+	}
+
+	kernel_param_lock(kp->mod);
+	module_put(kp->mod);
+	return ret;
 }
 
 
@@ -496,10 +555,17 @@ static int __init block2mtd_init(void)
 {
 	int ret = 0;
 
+	setup_wq = alloc_ordered_workqueue("block2mtd", 0);
+	if (!setup_wq)
+		return -ENOMEM;
+
 #ifndef MODULE
+	mutex_lock(&list_mutex);
 	if (strlen(block2mtd_paramline))
 		ret = block2mtd_setup2(block2mtd_paramline);
+	/* Avoid racing sysfs with the early paramline */
 	block2mtd_init_called = 1;
+	mutex_unlock(&list_mutex);
 #endif
 
 	return ret;
@@ -510,9 +576,16 @@ static void block2mtd_exit(void)
 {
 	struct list_head *pos, *next;
 
-	/* Remove the MTD devices */
+	if (setup_wq) {
+		flush_workqueue(setup_wq);
+		destroy_workqueue(setup_wq);
+		setup_wq = NULL;
+	}
+
+	mutex_lock(&list_mutex);
 	list_for_each_safe(pos, next, &blkmtd_device_list) {
 		struct block2mtd_dev *dev = list_entry(pos, typeof(*dev), list);
+
 		block2mtd_sync(&dev->mtd);
 		mtd_device_unregister(&dev->mtd);
 		mutex_destroy(&dev->write_mutex);
@@ -522,6 +595,7 @@ static void block2mtd_exit(void)
 		list_del(&dev->list);
 		block2mtd_free_device(dev);
 	}
+	mutex_unlock(&list_mutex);
 }
 
 late_initcall(block2mtd_init);

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
