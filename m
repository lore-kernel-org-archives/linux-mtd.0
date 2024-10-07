Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9F1CFB43F
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Oct 2024 12:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kOZwFSshLo+8Vm8yLC9HauJbq9GV2J9HR+luh63fZ/Q=; b=aBED/Q4a84w6Np
	/ep6F77r6j4sx481t62MNTtMTaX7WelE9O4mTbWbop7BYq6YS7cO5ZtoVB8alXUCXFcvysVmh501P
	r9iZ60amqPETskdDVcCLRe6dwP5iLRfKsrr39ag10mNgZoEU2EP16OBoZajStoyX27subbFYB1F2D
	/wimwHbYY1HYiA8l5YRidKzJGOF8zeIQ48jgd41bFof128clJe67XmKvj25UutBVlDPgF+I2zMD7K
	feST5bC89v3OA0xuVwQZoyThs8pI14/+R1zuy6DtoFgBqdiAPKSFWPxolDxecLuVd8tfspvMISv5A
	4/B3YFVnu5+VXqObtfIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxn6V-00000002O0M-2M1t;
	Mon, 07 Oct 2024 12:44:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxmmR-00000002Jit-1nXU
	for linux-mtd@lists.infradead.org;
	Mon, 07 Oct 2024 12:24:05 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37cd3419937so2671024f8f.0
        for <linux-mtd@lists.infradead.org>; Mon, 07 Oct 2024 05:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728303841; x=1728908641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i0x8y87bn5ImDPZMm7UguhM/GLub+WZyzCKBTUmGFdo=;
        b=lNrDCOMNghjzh963pKtlMkhURWRRb1BCxVOGZERqp1ywE7taggayL0bE4wHkuQeuxa
         XgeAhvmii4VGLvRvI/e2TWVlduOkYFjIZBZj4o6dN+Y6MzJGogX/CXRP7Gjf6yeS4iX/
         wZX/LxWQqecvqlRuSKp4ju+FkSh/RwmFnyeHruNzCIsCpg1MCKe+8qUekS/fsOUed4vT
         Rg9yiuBrQt5dobQrWAuw4VicdjRx7Ydk9M5XS6+nKraZpc3e+evXJMVe8/e+zEAOrcxE
         kyfLyB4GBhlILWYhA7+auh4nk7GOuchiLY4r1wLghx0A0pEeXD0YA8xSR7CxjX+vC5vW
         UwQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728303841; x=1728908641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0x8y87bn5ImDPZMm7UguhM/GLub+WZyzCKBTUmGFdo=;
        b=ZhGj8XKy4Gc5QJlZqT8rbHdwCGwvCpt+zYk+6j5Tk2LHstTRAICNV4W7cqwdYwp1Gq
         KW2eIli/N0Cb10K+ML1vRntaeTq/jTcm+4vZGRwT/tZ/EBZMK7VAsBf3WdLBO2ph6cTl
         +R/ksx/uyfHsBdcxzof/W8AsI5DMkh5AL13sqZ/1SgfwSk/xdFsdhxlRuQ0ZDKtpsOKJ
         5yXr/MM8ZqGZvkOAl+pexuFLMCpWzQrbtWMBilzqJGK8z7dpm0tLeW0F9N92O9ognizD
         o4g8UesXbErRAJnMDhbHp62UAKTkDhuMM/+apFOwzIHjdUNVH7+BpXG4sz0sntZgghlB
         aaEA==
X-Gm-Message-State: AOJu0Yz8vqynSXWrH3CXPx/adNdgF9Gr6qWQl7V6QIv5+3G6v8hCZxUL
	cBPd4jUdxCe405+elRggAsH8aacWUzc70Z1lp/xfPZgUHTC9uyyEaFGyJSCrK2A=
X-Google-Smtp-Source: AGHT+IH7Z3gGU+OpbosbKN5JB3GncLHxrRWfwfdnT4hZxzI1DxGshRKwTaLqBpQOhnt6dyskjjSC7Q==
X-Received: by 2002:a5d:4a06:0:b0:37c:d26d:1d03 with SMTP id ffacd0b85a97d-37d0eafa5b9mr7222670f8f.43.1728303841039;
        Mon, 07 Oct 2024 05:24:01 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6100:637:cbe9:f3bc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1695eee7sm5626914f8f.82.2024.10.07.05.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 05:24:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 1/3] mtd: rawnand: davinci: order headers alphabetically
Date: Mon,  7 Oct 2024 14:23:48 +0200
Message-ID: <20241007122350.75285-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_052403_501209_4E8A3FE5 
X-CRM114-Status: UNSURE (   9.55  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

For better readability, put all includes in alphabetical order.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/mtd/nand/raw/davinci_nand.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 392678143a36..5510b39c0b98 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -10,15 +10,15 @@
  *   Dirk Behme <Dirk.Behme@gmail.com>
  */
 
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/iopoll.h>
-#include <linux/mtd/rawnand.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
 #include <linux/mtd/partitions.h>
-#include <linux/slab.h>
+#include <linux/mtd/rawnand.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #define NRCSR_OFFSET		0x00
 #define NANDFCR_OFFSET		0x60
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
