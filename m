Return-Path: <SRS0=OCz7=HG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39E0C433E0
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 13:18:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ED3764D87
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Feb 2021 13:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ED3764D87
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LGpCnrs6yPdfyVHi4UZVF814HHduHzyfZEIGvH+0uh4=; b=bUPnGS0QWb0EYJhC0Qz8lTRtsD
	MuxcQr9RACzK9HkmPbDwFC369foBtKV2+C1+Cwg/PMAzPMcjyhu9EpcdQ0FWvlSbALCzF+bmHaiEm
	HCOcXqFoZzpuo3yE+nmDGVrhKATTXXOClkA1SIk+1wqLgXSSn+wHJ2l7AhPFon3B9LFNmGwu/QnAh
	xB6k2pmdSew5ZT5MqQSOv6Pyfe49XASFYf4+hbiImuw746KhI20tRjXp6hUuqTfjV9R8WbMTt9MSZ
	FPK+bl/UL/K5hL0fSnPKPSX4XVoFEIyudUl4LRUKLemBhTD6pS3FQb5PQ1+drOPbVkgcRE1m2t5sV
	pcSgTO2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7eVv-00063Y-Ev; Thu, 04 Feb 2021 13:17:39 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7eVr-00062e-Tq
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2021 13:17:37 +0000
Received: by mail-lj1-x229.google.com with SMTP id r23so1447563ljh.1
 for <linux-mtd@lists.infradead.org>; Thu, 04 Feb 2021 05:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version;
 bh=GUpMXLwMfcRcj3703oYRbTNpd3HWR33aRK/RTVSxqek=;
 b=ozmiwcV/Pc07h4IMZZjbdz3g83XsGo9/17WkOhZsQkM6OZqxSDiw1ftb1X30/Qqy8X
 OWgt9iBHpPHC6FSrCYZCPj7iRDAbHjWj0JW2sGIIMHk+PN6IzAmMdXXeF11X3daVZbCp
 qXJa391KutSFgOIAbr4SO8CsJuXsm81QUJu3Vk4Dx6N8Uf+Gt3P/vmSgfUziGWIFobWH
 BhPKNB+KGaEl8fwWRWUJ2HGNu2H0sJfInaWIwdoR2PKJgy7cx5Qhnuda2MG1bHYYHgl6
 +trb9WYpX4tfgXkAZyWr7/ajzhLr3qA4pZ7AMynHPZao0arjsbOKHTW9+Ia9UNR230OH
 VRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version;
 bh=GUpMXLwMfcRcj3703oYRbTNpd3HWR33aRK/RTVSxqek=;
 b=tt81Ahcj+iCei0mQR161hHtArwa4nUQzaUMEozUPKOv8MMp3j8XaBwcWewGbzCUhCX
 tUssAR2/d2FV04crCpWdGypI4vqNtmAY8zpKKXWGJa8VMvRADQDhkUi+0CfA+8OJCOUq
 5AN+jYRhH3MZC1N/59k4mTsiyo5eBb8TK+x2us+NUNoD9DvYDmjBcf9na3bl2AVFk8RQ
 R7I2wB/JLkhhZeNyg1se5bWRwGcROP1WAxtTxsB4Cl7uhqjGjvhiUXz8gWa9E2n6gI8S
 0bSaSpafOzue+M6ZzEFcSR9WweS7q/PthdIq1AkqiIT1rchKj3Wfd6wnIVCRH49p/nqD
 Isiw==
X-Gm-Message-State: AOAM530mqNEVw7fVLjRs8mT4uRDg+fbPyfkSVSIUcI+vWy+AVCtRdz7N
 4qfOAGtVGgcq4wziWQB0Mp/iqMn6CaAa7g==
X-Google-Smtp-Source: ABdhPJyTSjBL4WRfYv+aZ6PxHtppoHIXsvxn1IBESh0yf+AsI/rbXUUn5zMsqKvkOi4weVCOGJynzg==
X-Received: by 2002:a2e:b015:: with SMTP id y21mr4903613ljk.363.1612444651082; 
 Thu, 04 Feb 2021 05:17:31 -0800 (PST)
Received: from wbg (h-98-128-228-165.NA.cust.bahnhof.se. [98.128.228.165])
 by smtp.gmail.com with ESMTPSA id c10sm602131lfs.75.2021.02.04.05.17.30
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:17:30 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: []
Date: Thu, 04 Feb 2021 14:17:29 +0100
Message-ID: <87a6skynti.fsf@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_081736_048744_B20D71E5 
X-CRM114-Status: GOOD (  14.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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


commit 72282e537222988d1dfa787e79554d136fd1fc56
Author: Joachim Wiberg <troglobit@gmail.com>
Date:   Wed Nov 18 16:38:13 2015 +0100

    mtd: mtd2block: add support for an optional custom MTD label
    
    This patch adds support for an optional MTD label for mtd2block emulated
    MTD devices.  Useful when, e.g. testing device images using Qemu.  The
    following /etc/fstab line in can then be used to mount a file system
    regardless of the actual MTD partition number:
    
        mtd:Config  /mnt    jffs2   noatime,nodiratime      0    0
    
    Kernel command line syntax:
    
        block2mtd.block2mtd=/dev/sda,,Config
    
    The ',,' is the optional erase_size, which like before this patch,
    defaults to PAGE_SIZE if left out.
    
    Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index c9e424993e37..f9c14146bf9c 100644
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
 
@@ -379,8 +382,8 @@ static int block2mtd_setup2(const char *val)
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
@@ -393,7 +396,7 @@ static int block2mtd_setup2(const char *val)
 	strcpy(str, val);
 	kill_final_newline(str);
 
-	for (i = 0; i < 2; i++)
+	for (i = 0; i < 3; i++)
 		token[i] = strsep(&str, ",");
 
 	if (str) {
@@ -412,7 +415,7 @@ static int block2mtd_setup2(const char *val)
 		return 0;
 	}
 
-	if (token[1]) {
+	if (token[1] && strlen(token[1])) {
 		ret = parse_num(&erase_size, token[1]);
 		if (ret) {
 			pr_err("illegal erase size\n");
@@ -420,7 +423,12 @@ static int block2mtd_setup2(const char *val)
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
@@ -454,7 +462,7 @@ static int block2mtd_setup(const char *val, const struct kernel_param *kp)
 
 
 module_param_call(block2mtd, block2mtd_setup, NULL, NULL, 0200);
-MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,<erasesize>]\"");
+MODULE_PARM_DESC(block2mtd, "Device to use. \"block2mtd=<dev>[,[<erasesize>][,<name>]]\"");
 
 static int __init block2mtd_init(void)
 {

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
