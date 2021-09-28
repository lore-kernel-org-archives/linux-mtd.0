Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD54C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:53:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50BD661206
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 15:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 50BD661206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9dtLsTVGFKZ4TSkElvdmdLScOl8pcZ8H50aK1WD9nK4=; b=xsKgTa+5b8H4yN
	jnQhLEo9Un6gDeax8KLEhzsCM3pYOBGcYODNQ5LSw2WS7GnKip64XIpON0v4Q6V9Syiw1izasyS0J
	jrO41ZglE7J9PFw7vMfyIf3g3HBRzsJh26ID5XtEGqLujjZBWro9ExuMugc64pBEnOUVD4JfXz1YF
	bgJX2O/K6KuS/tdLSI+EOi0N6tHDvQQRFFmAqlRCcYbaO/2gIGjBPxhsCCrBzmTkYh+8Xl5TBFwSp
	vZQ0pegHdFCj9CkrQc3+bfOxQQkhFlfrZ+exw5kJC3Yxmi1MaNHmfZxYolqdsQDHgL+DtSYcIRliL
	t2NQXLnX8YCaeDHOJH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVFP1-007udB-4l; Tue, 28 Sep 2021 15:52:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVFMt-007sgA-Kx
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 15:50:09 +0000
Received: by mail-lf1-x12e.google.com with SMTP id i25so94814230lfg.6
 for <linux-mtd@lists.infradead.org>; Tue, 28 Sep 2021 08:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=RAz+SemeurRL+kLeYXBsG4GmX+J0JfUBRG/GdO84F4g=;
 b=BxAunaoE6q8YrSAd07AAFZ8BYtpoui+E+5g70yJ7QmTHQpbb1ND6/4rhQDNRgc1YlP
 Jfe5SQ1vu4e54FcECL2ztB9AbirLxErc1Pix9FWo5Y9KDr1xDD22dI5jI6rVxL/Bv9nA
 ssW7N5TCp4DmlBoxlzZJUSYc7GBK4oDECptcVHr7G3nGnXj9FWCRM0Ojxs/5yKfUtoLm
 /enYnDQirv2mezMp4Mp4/ISid4sT3x5sbTxxbRVFQdoBmXP32Lc9HggTR1oyrMwrdGWm
 zReBG73hNcTl7BAWoRm9bw3qKRSR1Fk1jn9lkryZyl+GCWFqR+pFBYBQ2H8rX3PmZcnz
 5uRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=RAz+SemeurRL+kLeYXBsG4GmX+J0JfUBRG/GdO84F4g=;
 b=aLXrPihz8yCPRWmCov/nPpL6lZwxbGDiozF/HVrnkJSW2N85OK/T9yBfRgZJJ50brJ
 ez0cIgU3s3xl+5sB09LX1B+AanbzluIff1EL6emWogScdM8/VYhkwkX/M4RajOI1C8au
 eJ5R1PuhIDM8P8vSDEZTVThRLjl4cso8mXUVppWn6Pryzd8x4VJ1hMiyKOvR2ZlisBBG
 38W+jhg/hmy+tG/iIN+enYq7yvVjD93EnmTbx/AqnU3obCXrqWnY1VSz/xdoAb7Gf0zK
 6zIC7IsVkuCcv9WfDLItl5YVsE6owDefYwKVcpvDWmgtKCqPA/ptsXifYnJulx48MWwU
 QRsw==
X-Gm-Message-State: AOAM533QDEhDRb7yCmkJOUyUb+3BrxE0r9WMyYWkq+L+uW6Spu5hQilN
 LWMoO4M0B5wxrdyJPko4NLfhEa79JRU=
X-Google-Smtp-Source: ABdhPJwLVnrDzW2qtcRCEssyMPAFBbXaShzqQJWuywwgqSh0y/+IQ8iRrOwN98gE5/38hh5iIQR8Fg==
X-Received: by 2002:a2e:a406:: with SMTP id p6mr707372ljn.258.1632844204744;
 Tue, 28 Sep 2021 08:50:04 -0700 (PDT)
Received: from wbg.labs.westermo.se (h-158-174-22-41.NA.cust.bahnhof.se.
 [158.174.22.41])
 by smtp.gmail.com with ESMTPSA id l9sm2037946ljg.44.2021.09.28.08.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 08:50:04 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [RFC PATCH 1/1] mtd: block2mtd: add support for an optional custom
 MTD label
Date: Tue, 28 Sep 2021 17:49:38 +0200
Message-Id: <20210928154937.2668575-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_085007_738572_107CC96D 
X-CRM114-Status: GOOD (  17.97  )
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
MTD devices.  Useful when, e.g. testing device images using Qemu.  The
following /etc/fstab line in can then be used to mount a file system
regardless of the actual MTD partition number:

    mtd:Config  /mnt    jffs2   noatime,nodiratime      0    0

Kernel command line syntax:

    block2mtd.block2mtd=/dev/sda,,Config

The ',,' is the optional erase_size, which like before this patch,
defaults to PAGE_SIZE when omitted.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 drivers/mtd/devices/block2mtd.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index c08721b11642..87cdf041a218 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -214,7 +214,7 @@ static void block2mtd_free_device(struct block2mtd_dev *dev)
 
 
 static struct block2mtd_dev *add_device(char *devname, int erase_size,
-		int timeout)
+		char *label, int timeout)
 {
 #ifndef MODULE
 	int i;
@@ -278,7 +278,10 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	/* Setup the MTD structure */
 	/* make the name contain the block device in */
-	name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+	if (!label)
+		name = kasprintf(GFP_KERNEL, "block2mtd: %s", devname);
+	else
+		name = kstrdup(label, GFP_KERNEL);
 	if (!name)
 		goto err_destroy_mutex;
 
@@ -304,7 +307,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size,
 
 	list_add(&dev->list, &blkmtd_device_list);
 	pr_info("mtd%d: [%s] erase_size = %dKiB [%d]\n",
-		dev->mtd.index,
+		dev->mtd.index, label ? label :
 		dev->mtd.name + strlen("block2mtd: "),
 		dev->mtd.erasesize >> 10, dev->mtd.erasesize);
 	return dev;
@@ -381,8 +384,8 @@ static int block2mtd_setup2(const char *val)
 	/* 80 for device, 12 for erase size, 80 for name, 8 for timeout */
 	char buf[80 + 12 + 80 + 8];
 	char *str = buf;
-	char *token[2];
-	char *name;
+	char *token[3];
+	char *name, *label = NULL;
 	size_t erase_size = PAGE_SIZE;
 	unsigned long timeout = MTD_DEFAULT_TIMEOUT;
 	int i, ret;
@@ -395,7 +398,7 @@ static int block2mtd_setup2(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 3; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str) {
@@ -414,7 +417,7 @@ static int block2mtd_setup2(const char *val)
 		return 0;
 	}
 
-	if (token[1]) {
+	if (token[1] && strlen(token[1])) {
 		ret = parse_num(&erase_size, token[1]);
 		if (ret) {
 			pr_err("illegal erase size\n");
@@ -422,7 +425,12 @@ static int block2mtd_setup2(const char *val)
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
@@ -456,7 +464,7 @@ static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 
 
 module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
-MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
+MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,[<erasesize>][,<name>]]\"");
 
 static int __init block2mtd_init(void)
 {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
