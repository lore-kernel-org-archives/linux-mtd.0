Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2B5C88E77
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 18:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ip6VK5nEBXNvYzH86MQ9yAsew5Z35AKsSnoMghsHHE=; b=jAeSNTENVVs4Qe
	Llprewwkxt7RrMJI0nvrzhXom7/XpyZ634bhEFj1knLQqMAnRGzwhz0gct4Mf+MVjBDiXUN1p2qEs
	ZnwYysh+2+50kmgQzXebLk8Ahol1PCVQRDReYprjvfhG8MvrClnOFTOvQQTwUSTGNoQ/zRX2m5kQv
	nMKHhoSncTWAnUyPu9ZauL869HmYsJuKPO1t/nc0Uv/aFaDSh2c56fN54PA3hx+oYKVsxA13oQwf5
	FLMSqaaZktkWQKkm3wTS9w80ZXdP5SsEJEKSdJfFlZrlmd4phmfs4oodZLVsPRLyN24zjEdOCqPYp
	a8j1qdtygCTcPmBCSpXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YBf-00000007nAw-36gE;
	Tue, 15 Sep 2026 18:47:23 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YBc-00000007nAB-1nv2
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 18:47:22 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so82490a91.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 11:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789498039; x=1790102839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ym8I7ElasyVjMBfbiazIrYcHFFmlucKZerIF/2pMY/M=;
        b=AXJWSn5rLep8aob52Ts4rMDDU+7ueqAmvGxUqn2azkOK0HHfRpIW5ojmOXdiVSsKZx
         3f7Y88ue2wbx5WURxJjV6hA+xK/fpDC5zBjRlEFVR4U+JNEq0BtXbpjk0OrM7iJ0KQOH
         g9nHuVNwsHDuTFDQQYZsddQmZjzAa84YrBznhzt7bZNRDlUi2oGCecnU+FEJruxSNBbN
         8+xgbt4B37cUbI9yn/Q/cafa5J9JaW0X4rzpHUp39DD5d4uB1DvnVqBq70EvoG+50L2E
         2fdlj+IRdcADbQ2PXrqYi98vdu6/DEgSTW0tms31iUQkd6ZYZFEah0G8lNTRVQkR+tE8
         rvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789498039; x=1790102839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ym8I7ElasyVjMBfbiazIrYcHFFmlucKZerIF/2pMY/M=;
        b=sxqq/fEIlBaAjB8VEd/K5ukL5nzseXOqYJ8HZuoOxn1Qw4S3uJLRwZmwlIy7qfOtW4
         P/86dbPDv0X31L4nI78qZuwUQTs3Pedjb2bwks7amHpKKtLqOmpG1Af71gaB9C8Bv4WS
         lIDOyKsxCbGyqPLjoSil0GNyqVI31G7UVjrsvbCJfxA+pTdYtSOerNkBLwMhEYY18IKd
         ORtL+hJDgkNtpsNhL0LVBVcVKlor3Zl0qVXwmJvUTXsRS0yDjPx8DjV/01ELeSY3CDb6
         odhqMs4x4idgHqLU7Oy95Hq7b927eU6v/XxpzGLAQP1EiZC+kfa1tZrAIm1WZCHM/MYp
         qmEw==
X-Gm-Message-State: AFuF++lcJG6CVr/RaeOz1/aDwsAZ/kM3mR6dOsAwcoxCfEYKGaFDqhzD
	vsYYwKePQuk91zOQrofRvdv6J+FWexJBbrzGFIZ8uCRwbXGiES0h9jVKOj7QSUcl
X-Gm-Gg: AYBFou3SEiQ2kc+AQgvFvxx2czSvFStsD5gGMHDW3PCQ4Ik776qqDNxIRAQ75KK1j7n
	TWXxyWMywA9EVWpxmky/h/p+03WgoPuqP3ZjYTy51ep02tZKocfzdWJe+I8Y7ukXc6E+4o/HQde
	gwRmS8zohEMVLnYzqSxRWH7gR1YRkjpEp5iwzphD+cYGCbN73maAp2pH4fIF2xA4h6Mx/LXOqua
	jgpZceEfWTiwyhN4qXZGugQ+r/R5wF7uvczLh5eLHXxKYovr1rrTa095vOdnAtBJ0ztL4yfJUb3
	8FiB67BnstAyqVISKZlVfa8sMKRZ8XcmlvXCnWkQDJ3TnM73Y1nDRUVImYxxlSMn/0BLswX7aLB
	2r46leNOpaFnLAc7r/0oEBB+UYgFDRGvdUmmJK6K/TN+9Mzf3yddNUz3+tNSvRbFSud/PYcBF/0
	F2h9KPHG85ytIS3K/F/TewPP1COzLErOeZLs379U5PLI2L0NA9pvHiSw4V+OYpr3mMyM6XlD+q9
	g==
X-Received: by 2002:a17:90b:3c92:b0:395:4de0:b78f with SMTP id 98e67ed59e1d1-39debf6f1ddmr14524014a91.1.1789498038935;
        Tue, 15 Sep 2026 11:47:18 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b69c756sm176804a91.3.2026.09.15.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 11:47:18 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: joern@lazybastard.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Adarsh Das <adarshdas950@gmail.com>,
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
Subject: [PATCH mtd] mtd: block2mtd: defer device open on module param write
Date: Wed, 16 Sep 2026 00:16:59 +0530
Message-ID: <20260915184659.6939-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_114720_475667_FB4DBF26 
X-CRM114-Status: GOOD (  18.04  )
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

When you write to /sys/module/block2mtd/parameters/block2mtd, the kernel
holds a module parameter lock for the whole callback. block2mtd was
opening the block device path inside that callback. Opening by path can
walk the filesystem and take overlayfs locks.

syzbot found this can create a circular lock dependency with overlayfs
(ovl_create_object). I was able to reproduce it with their C repro and
lockdep.

In this patch I applied the fix of copying the parameter string,
returning from the callback, then calling
block2mtd_setup2() from a work item so the device open happens after
the parameter lock is released.

Reported-by: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
Link: https://syzkaller.appspot.com/bug?id=3e420300f6b231aa906425cbb4bd55dd64f42da4
Tested-by: Adarsh Das <adarshdas950@gmail.com>
Signed-off-by: Adarsh Das <adarshdas950@gmail.com>
---
 drivers/mtd/devices/block2mtd.c | 53 ++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 03e80b2c4f5a..35ce306ed8fb 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -18,6 +18,7 @@
 
 #include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/workqueue.h>
 #include <linux/fs.h>
 #include <linux/blkdev.h>
 #include <linux/backing-dev.h>
@@ -33,6 +34,8 @@
 
 /* Maximum number of comma-separated items in the 'block2mtd=' parameter */
 #define BLOCK2MTD_PARAM_MAX_COUNT 3
+/* 80 for device, 12 for erase size, 80 for label, 8 for timeout */
+#define BLOCK2MTD_PARAM_MAXLEN (80 + 12 + 80 + 8)
 
 /* Info for the block device */
 struct block2mtd_dev {
@@ -405,8 +408,7 @@ static char block2mtd_paramline[80 + 12];
 
 static int block2mtd_setup2(const char *val)
 {
-	/* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
-	char buf[80 + 12 + 80 + 8];
+	char buf[BLOCK2MTD_PARAM_MAXLEN];
 	char *str = buf;
 	char *token[BLOCK2MTD_PARAM_MAX_COUNT];
 	char *name;
@@ -461,11 +463,54 @@ static int block2mtd_setup2(const char *val)
 	return 0;
 }
 
+struct block2mtd_deferred {
+	struct work_struct work;
+	char *val;
+};
+
+static void block2mtd_deferred_workfn(struct work_struct *work)
+{
+	struct block2mtd_deferred *req =
+		container_of(work, struct block2mtd_deferred, work);
+
+	block2mtd_setup2(req->val);
+	kfree(req->val);
+	kfree(req);
+	module_put(THIS_MODULE);
+}
+
+static int block2mtd_defer_setup2(const char *val)
+{
+	struct block2mtd_deferred *req;
+
+	if (strnlen(val, BLOCK2MTD_PARAM_MAXLEN) >= BLOCK2MTD_PARAM_MAXLEN)
+		return -EINVAL;
+
+	if (!try_module_get(THIS_MODULE))
+		return -ENODEV;
+
+	req = kmalloc_obj(struct block2mtd_deferred, GFP_KERNEL);
+	if (!req) {
+		module_put(THIS_MODULE);
+		return -ENOMEM;
+	}
+
+	req->val = kstrdup(val, GFP_KERNEL);
+	if (!req->val) {
+		kfree(req);
+		module_put(THIS_MODULE);
+		return -ENOMEM;
+	}
+
+	INIT_WORK(&req->work, block2mtd_deferred_workfn);
+	schedule_work(&req->work);
+	return 0;
+}
 
 static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 {
 #ifdef MODULE
-	return block2mtd_setup2(val);
+	return block2mtd_defer_setup2(val);
 #else
 	/* If more parameters are later passed in via
 	   /sys/module/block2mtd/parameters/block2mtd
@@ -473,7 +518,7 @@ static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 	   we can parse the argument now. */
 
 	if (block2mtd_init_called)
-		return block2mtd_setup2(val);
+		return block2mtd_defer_setup2(val);
 
 	/* During early boot stage, we only save the parameters
 	   here. We must parse them later: if the param passed
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
