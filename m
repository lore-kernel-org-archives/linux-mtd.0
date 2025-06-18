Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC73C73C66
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EJ6ilxWLtxVqdvRwnpKd1CeRKFZZfAZYhxqUedy89uc=; b=ORw5GQh/uVFPu5
	u49y2QB1qXxIDhXx8Vy0Edl075wVwh6u2GuyW1balaLtds0RMG154QCQODHVhTtlxdebnW+hW4Qua
	dmk+PQy8c2cz3SyfFu+3yqUbThe5XL8yquQgJXMmE1tSFpHz5wDcVLhWSXg/mkbIdAmJTWkwi7lrD
	uKaubVM/dwhsBfRG747ypOT1g128XyVIAzO6jwZ4Mf+Q4jyXNwShH39UQbttrQ1w8hGzUOy64ZmTG
	ewgadxn9xNpiYuswUHpaKg1JcK2/Wcsg7TRCPKC1YTcblwsU/IZMfTGtqn8O0NJnaxfYDGnc0JzU7
	Fdg5paa1uSOMrTzHDnxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWh-0000000AEWc-1dWw;
	Wed, 18 Jun 2025 13:08:27 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr4d-00000009xXi-2Zzq
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3264993f8f.1
        for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2025 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1750246521; x=1750851321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w/3t9gzDu5gcz3totM9Dz5vD1dhk8pE0+MfwGWIZiPY=;
        b=Yr62K91iOsN1NU4uVXADgWtrFrJSV+JJ8UxN8aDo4eHZF2BLRGSqiuI+CeWW8ofRp/
         YL0WTGKN0f3FuEwi6yOtfUocscl3L9qnvGuyWIYhA+AZbHJmmvGndhB/Hu0zXO0xzCFd
         PCfPv6aVcuCyocpdVcSdnJdj3zjVOuRIjRcf+Yf6o2Q40I5ANI6LNKwAhZqPnxb1rYb8
         AAcl46MMQEeaSMxTQZSBwf3TQ/bexkm5iYk5F8CgQHaAzPz5gW125ktsN1/FdmtkXh1W
         NfYpWCiQJJbTDFZbn8I8eEQfg/7mngZSAW/owQm195iw9OxAHriGPJZPWXC9KT1eIWn8
         zd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246521; x=1750851321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/3t9gzDu5gcz3totM9Dz5vD1dhk8pE0+MfwGWIZiPY=;
        b=acxtFECUtPR5gizssG/b0e5Awpgra4qpT7ObyZ46tjAQb//DLOErXOEsW/1DOJNlbJ
         V6z8jstgYqsYWFq4eqeywC0+wCfKvbcUeMxwKG1FGabUnR0iJvH3GX2sE9KSVZqu7LvO
         s1oHh+jLGiRzmwaxGrr5GXh132+RRHzZGntfI1vHofRfLicwVshGbpvm3pmdt3b+VLoB
         VcjKSFsG5CKT5HHqEOf0B4Ve3Biu1FRA9Y6VAHE/j7ijQ462bB7fVhYIaNe11oFkc9BA
         hfHy+OacMFVFt31MSfi3SIhn71BEYfwZY7unZptxFRlYsKWIY5FbYmJzwU/I05oKuMpZ
         mQug==
X-Gm-Message-State: AOJu0YyJEUCf6Xh4BZQanSwaXJldUTqSko8571eN73U/oTcDxGtPIa9O
	wBpwfDHgk851PMn1A24f7FXOxrt+ewzR+scm0EVKXMax56I8H6qVcaIxlmmkxe7HIrE=
X-Gm-Gg: ASbGncuJHNFuE3QaNkLYc67ZvQTRGtZgz4N1LXIjZxN8DAQaiXyh+l0D+IoGKtE9NIp
	xHGFx8/mFfneW/H5mFLi7wbJUTUrvdrAxmFLWMVDGXmXYmLnwAQqvVyWONbXHHMs4gIabnstQSO
	QruzudrynCJNHXypUnWH1iSsJ/KkApa07w7BN3gxp6I7PdzIMw4ShDbDWc419irLgBHlJD1RJlP
	hiq+3WpZIzKGRZkOpQTbeM4kZ/qREKexB3lbCh3W8+ctPfXAZ6C6dOz/nKE0mKsdXxBxTe034nu
	MYmmPyF1AhdajlB2IEDegCKVtgUJOSYLfQPUBI/sxi3qWRX3UOZE28fokdv4O4tmM36N0mkgIEO
	0Rk6Bv7BW/VKSU2Vc6VDkzRhhs7sdq9K/q3Ru12aYPdMy
X-Google-Smtp-Source: AGHT+IFMrQSnrD2aOm8bRaNfhSUlYzNZdGYvuERh0UazXkurrO3hIJk2ehCa+mei6vsGVOTJed/PAw==
X-Received: by 2002:a05:6000:26c1:b0:3a4:ee3f:e9a6 with SMTP id ffacd0b85a97d-3a572e898e3mr13639550f8f.54.1750246520984;
        Wed, 18 Jun 2025 04:35:20 -0700 (PDT)
Received: from pablomg-ThinkStation-P620.iliad.local (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a547ecsm16910300f8f.17.2025.06.18.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:20 -0700 (PDT)
From: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
Subject: [PATCH v2] mtd: spinand: fix memory leak of ECC engine conf
Date: Wed, 18 Jun 2025 13:35:16 +0200
Message-ID: <20250618113516.2137583-1-pmartin-gomez@freebox.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043523_757143_C6AB7394 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

Memory allocated for the ECC engine conf is not released during spinand
cleanup. Below kmemleak trace is seen for this memory leak:

unreferenced object 0xffffff80064f00e0 (size 8):
  comm "swapper/0", pid 1, jiffies 4294937458
  hex dump (first 8 bytes):
    00 00 00 00 00 00 00 00                          ........
  backtrace (crc 0):
    kmemleak_alloc+0x30/0x40
    __kmalloc_cache_noprof+0x208/0x3c0
    spinand_ondie_ecc_init_ctx+0x114/0x200
    nand_ecc_init_ctx+0x70/0xa8
    nanddev_ecc_engine_init+0xec/0x27c
    spinand_probe+0xa2c/0x1620
    spi_mem_probe+0x130/0x21c
    spi_probe+0xf0/0x170
    really_probe+0x17c/0x6e8
    __driver_probe_device+0x17c/0x21c
    driver_probe_device+0x58/0x180
    __device_attach_driver+0x15c/0x1f8
    bus_for_each_drv+0xec/0x150
    __device_attach+0x188/0x24c
    device_initial_probe+0x10/0x20
    bus_probe_device+0x11c/0x160

Fix the leak by calling nanddev_ecc_engine_cleanup() inside
spinand_cleanup().

Signed-off-by: Pablo Martin-Gomez <pmartin-gomez@freebox.fr>
---
Changes in v2:
- Rebased on top of 52da431bf03b, no other changes
---
drivers/mtd/nand/spi/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 7099db7a62be..c411fe9be3ef 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1585,6 +1585,7 @@ static void spinand_cleanup(struct spinand_device *spinand)
 {
 	struct nand_device *nand = spinand_to_nand(spinand);
 
+	nanddev_ecc_engine_cleanup(nand);
 	nanddev_cleanup(nand);
 	spinand_manufacturer_cleanup(spinand);
 	kfree(spinand->databuf);
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
