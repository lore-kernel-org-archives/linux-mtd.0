Return-Path: <SRS0=mnIE=O5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5606C433EF
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:11:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B24B660F6B
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Oct 2021 06:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B24B660F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EMZjBhsHtrlvE+74tUG/lyotiF+iQ83YYBTUhL9hiY=; b=wNtFAe6xuZlmqp
	QSQGxloZF2c/7N6iFQcpuHqFrGKYsZN1RoGGnD6EWJ4gKzKU4yB0F3JIMORqaQQEnMmoIsRgzAQ3F
	uNS8CRPrKM4jk9yZ9pHuICSgQjZroRiqiih2SPFtrsx20p7KyqX6KvskspzeZWPYuSmyvoi5XZXm+
	uAQlQcgGu22KIyeBXj6OVASPtjJa43aTstI8IXbpBCq0ymKrRATnRansD4R901FUkqxbQhPZFnpji
	uL1gSnnKXmoPJx9st9+hZV9KqvNkQwB1uiwx8TZHK6XdMKtwwJP1u0ippU/oz0iJEfXqL0JXLqTgF
	bDCwKYUjKMyoCdQcOvqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ5Z4-005Dz0-KA; Sat, 09 Oct 2021 06:10:34 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ5Yg-005Dw8-J2
 for linux-mtd@lists.infradead.org; Sat, 09 Oct 2021 06:10:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id u18so47771082lfd.12
 for <linux-mtd@lists.infradead.org>; Fri, 08 Oct 2021 23:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:organization:content-transfer-encoding;
 bh=wJQu/Nc8r5HulQdkUvc2Hy1gYHU2tXJOK4rKDhnuT2A=;
 b=Q/Po4TiUER8BOmpTgu+jR/MHME/vIzDVP1Q6I5wc7TwFdgE7ALIny8daPxaYbwIRQ0
 U7og1DdfOGlWQ7Q02KKW9VSctetFmps76b/OhlwDOwMT6aeHUb3cu/rvE0K5FTncbZKe
 Fuwn0Rx/7/xlaUO9uBPDdF+bsGOa6uLwzhnoqoTRGDXProS7+3Z/Yuzg5RlyRVOGTkGk
 YGHotB3u/inbefsTMfXTMOp2sOb8KXBzk+4BbUYUsMqSGRX+oAl2dJ9uN7rnP1T/p3zl
 nia9hTNC30jhkBuQUF5kSg1Rdi7M73vBhiZfqezXbVWx/jtmMz/Nc7zLbnPZnhYcAqIF
 3qYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:organization:content-transfer-encoding;
 bh=wJQu/Nc8r5HulQdkUvc2Hy1gYHU2tXJOK4rKDhnuT2A=;
 b=QmUwWBQU6q622wv8c/GSpKYgBJAgUQdhcuUP32U6aW6UiyJsNYr9ijL7BhRhURzR+s
 lAQKKLSr0D6M7w5SJgMq79JRyGembdfd3Cw38V/JhEbnpoIvZM9I0zSy8B5BTe9Kb5XL
 5SQ//4ub1pgh/vGHzlPHR3Bs7OZWlwPJjbniz84bMG1XWCBt2CDfrh5rXKVCPHhWPxWh
 r2YDS0sj7rEDlezYYhosu9eQr2BBR26Mj7JcMCe3isDWWugNuaNBUvvHlq4mn3PvNf+t
 1gfJobMqPbqGDMld0AnJ4tgaRwm8Nm5Iziqd1g6HVRBrQAT39Dpgmwb5Zk5XiqOg3hg+
 JHcA==
X-Gm-Message-State: AOAM530D2e1jzJoN7x8mp0Mi2C1iYxAsp8ZDOftKMw4flNG4CkfsAIP9
 zEx7y26Polt78PQMh8ae1VgKphH4p0s=
X-Google-Smtp-Source: ABdhPJwojitqZ/8gThZQHxslMhkhe1TIfP19zZI7cPfh9ljy6V+lW9eE9bHZgB4u0VGQN7Q1FqGHig==
X-Received: by 2002:a05:6512:3046:: with SMTP id
 b6mr14773927lfb.650.1633759808826; 
 Fri, 08 Oct 2021 23:10:08 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id q7sm123340lfc.159.2021.10.08.23.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 23:10:08 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [PATCH v3 2/2] mtd: block2mtd: add support for an optional custom MTD
 label
Date: Sat,  9 Oct 2021 08:09:55 +0200
Message-Id: <20211009060955.552636-3-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211009060955.552636-1-troglobit@gmail.com>
References: <20211009060955.552636-1-troglobit@gmail.com>
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_231010_649461_E71A9A85 
X-CRM114-Status: GOOD (  18.67  )
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

This patch adds support for an optional MTD label for mtd2block emulated
MTD devices.  Useful when, e.g., testing device images using Qemu.

The following line in /etc/fstab can then be used to mount a file system
regardless if running on an embedded system, or emulated with block2mtd:

    mtd:Config  /mnt    jffs2   noatime,nodiratime      0    0

Kernel command line syntax in the emulated case:

    block2mtd.block2mtd=/dev/sda,,Config

Notice the ',,' it is the optional erase_size, which like before this
patch, defaults to PAGE_SIZE when omitted.  Hence the strlen() check.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 drivers/mtd/devices/block2mtd.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 6c2871788d59..40d7211485da 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -32,7 +32,7 @@
 #include <linux/major.h>
 
 /* Maximum number of comma-separated items in the 'block2mtd=' parameter */
-#define BLOCK2MTD_PARAM_MAX_COUNT 2
+#define BLOCK2MTD_PARAM_MAX_COUNT 3
 
 /* Info for the block device */
 struct block2mtd_dev {
@@ -217,7 +217,7 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 
 
 static struct block2mtd_dev *add_device(char *devname, int erase_size,
-		int timeout)
+		char *label, int timeout)
 {
 #ifndef MODULE
 	int i;
@@ -281,7 +281,10 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
-	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+	if (!label)
+		name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+	else
+		name = kstrdup(label, GFP_KERNEL);
 	if (!name)
 		goto err_destroy_mutex;
 
@@ -308,7 +311,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 	list_add(&dev->list, &blkmtd_device_list);
 	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
 		dev->mtd.index,
-		dev->mtd.name + strlen("block2mtd: "),
+		label ? label : dev->mtd.name + strlen("block2mtd: "),
 		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
 	return dev;
 
@@ -386,6 +389,7 @@ static int block2mtd_setup2(const char *val)
 	char *str = buf;
 	char *token[BLOCK2MTD_PARAM_MAX_COUNT];
 	char *name;
+	char *label = NULL;
 	size_t erase_size = PAGE_SIZE;
 	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
 	int i, ret;
@@ -417,7 +421,8 @@ static int block2mtd_setup2(const char *val)
 		return 0;
 	}
 
-	if (token[1]) {
+	/* Optional argument when custom label is used */
+	if (token[1] && strlen(token[1])) {
 		ret = parse_num(&erase_size, token[1]);
 		if (ret) {
 			pr_err("illegal erase size\n");
@@ -425,7 +430,12 @@ static int block2mtd_setup2(const char *val)
 		}
 	}
 
-	add_device(name, erase_size, timeout);
+	if (token[2]) {
+		label = token[2];
+		pr_info("Using custom MTD label '%s' for dev %s\n", label, name);
+	}
+
+	add_device(name, erase_size, label, timeout);
 
 	return 0;
 }
@@ -459,7 +469,7 @@ static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 
 
 module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
-MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
+MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,[<erasesize>][,<label>]]\"");
 
 static int __init block2mtd_init(void)
 {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
