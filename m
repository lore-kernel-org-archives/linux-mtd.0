Return-Path: <SRS0=Jblq=OZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC7FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:05:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A1FB61881
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Oct 2021 08:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A1FB61881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JS6wB4WKmwrM1KEppYx6Upyj/9IRo1Dmz3BZaUiWbr8=; b=1y8zORauHNlp9o
	9sZGI5HrtDqekGpMnvYal/jnReKlegPWDfvJD0xqr9GUYy62kSTtRJqWzGAmWDBex4OHZWg1l6yVn
	7X/lffPsaQsabQU27gUdtxPSGPbmMZM1V4Rw2YQRH0f5VPTGDdY+S5/QfnuJRaM4K6Gggct03K0Ob
	p/E4r3iRNjGm/skf7rTUT0SfMUp8FrUr3AxVpVqouGCv+87wetzA8Ysc8Ryxe7SYfxsMY+9140iVx
	fEuhZknPM0lqaz78Eivd9u3hLAYy7t93dLfb2186+bhZ/ahPrsbEGBvL62+sw8gIVIsJZv+aF5esY
	MGGCFnWL+SD7Mk8d1yaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXfQy-009T5a-0i; Tue, 05 Oct 2021 08:04:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXfQv-009T4n-Dn
 for linux-mtd@lists.infradead.org; Tue, 05 Oct 2021 08:04:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id e12so15490065wra.4
 for <linux-mtd@lists.infradead.org>; Tue, 05 Oct 2021 01:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:organization
 :content-transfer-encoding;
 bh=Cw1s6avFkhn1KlgqlRSiCB9u7gw5G5qdUVq34g4v+AE=;
 b=lFn8OkT2a8hStQG2y5jVPYhowIgmOQ2arh53C+CRFvOMRBzJSjhKXLTj4fQ2B3R5fi
 dY4NLro1iSbSbWLCCCpXUIaHdsmhCePByi06EQo3iZfPPcfnXqUD3HlNJ5jCDsfViGiL
 DG1SqM8zNjdmV3nK054D0d8ya/6e1AeC0d2U7lRAzKyUMhKivDvQJMum1p8Aia/PAdev
 Cxc6ZXcSMXnGSVpTsV9DPpeiNscQNO6Q13SuRyOfs5v/TVsIRFYMboBjRKLFzKaTftGW
 oDdFvSdt8cZnqEMhA08uHHGliW4NjYixlFSz2TO7mHAXnAsv2Vhr9zG8hQWBPBca1P7w
 6ZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :organization:content-transfer-encoding;
 bh=Cw1s6avFkhn1KlgqlRSiCB9u7gw5G5qdUVq34g4v+AE=;
 b=xTkOHeFk7MI3Buc7PN/qaUecrQwRxUZIiKCDqoTK9FySeC5jtmMpARFBmaM7K/KB41
 D/C42dhwkUGmyH1Z972xfq1dn39mgiZtvAHoa7YA4kcvZSmSQ9ntwdmuvQIXkPYP0xcp
 xjj52L/Vom7IURtA/8rrafwM4N8sd9yp+d2g6gwkbVF4GxIhY9mW5Hi3PKOx3c+4Kml+
 DGVoWWg9AOt6WBzZhh8DJl4qVDmlbzvn9I8LxLvxZ0f2QPmCuI6lDZ0CJOT+tzBZKMc3
 63hkNUG+cC5RHkHrN8ynnHMYMLWy+0V/NDwqcw3vnsKKQ3S07cMoPLTbK+CN1wwkNSXt
 2Jzw==
X-Gm-Message-State: AOAM5317LwVasAI9dno8/xvYjgR34EYX+dGumQq62CTFH8GSqqiD05FA
 q88nIL5F1VMLCuhee7TjpC8NmlU00q4=
X-Google-Smtp-Source: ABdhPJzINUMSjvdGSprsjVTw2f6blm2FhCYwWzG2XXkWW+wE1QThRDyfSY20JhbQrKWLjOrdEde2qA==
X-Received: by 2002:adf:a34b:: with SMTP id d11mr14662704wrb.107.1633421054379; 
 Tue, 05 Oct 2021 01:04:14 -0700 (PDT)
Received: from wbg.labs.westermo.se (static-193-12-47-89.cust.tele2.se.
 [193.12.47.89])
 by smtp.gmail.com with ESMTPSA id v17sm6741370wrm.30.2021.10.05.01.04.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 01:04:13 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Joachim Wiberg <troglobit@gmail.com>
Subject: [PATCH 1/1] mtd: block2mtd: add support for an optional custom MTD
 label
Date: Tue,  5 Oct 2021 10:03:59 +0200
Message-Id: <20211005080359.170360-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Westermo Network Technologies AB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_010417_506313_66591E3D 
X-CRM114-Status: GOOD (  17.49  )
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
index c08721b11642..9465b8ff48f6 100644
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
+MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,[<erasesize>][,<label>]]\"");
 
 static int __init block2mtd_init(void)
 {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
