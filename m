Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D014FC77B7A
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jun 2023 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1jKuKWZgSYsI+209lGCq7P6y2jMg7j7pmgMxBuR5q8=; b=wjNQOugGbhXI4N
	MpmjViffykP8t1K3/W3Zid+gQUD15gdA+dg9zzDK9zoBuE1uRl9uqNlbO9sUxxXzQMWa1Jwd56VWy
	3HV/IHziPgXV6I65XloDA3rMNMfXaj7keE7CuROCVEWaZulWXe6zNPcoe6EXgFUbOW7FSHwu/skxF
	52PWS0fNequ/i+L6ugTlY6DYKA87/CYzfpmMaSpIfvdBFDgfDRI49md9Oopc16LpYYz7P/k6PVUBz
	QriXSXSH5xNBEIWOmss8jBLHV/pDjhVEeGZo4ggI7pMZRXex4GeedXaFsNGJ/00tbg+0vRiUorCrk
	ICkknI8FW7rHqyVg7fCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5CF9-007vsU-2D;
	Fri, 02 Jun 2023 21:23:31 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5CF6-007vrT-0v
	for linux-mtd@lists.infradead.org;
	Fri, 02 Jun 2023 21:23:29 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f50470d77cso3461571e87.0
        for <linux-mtd@lists.infradead.org>; Fri, 02 Jun 2023 14:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685741005; x=1688333005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I1uptEziDA+3GwFblzZwLieMJnJ27lR4oKjRiRs4njI=;
        b=sBeTFEObOGNCtmU7prkTnfdKqqUt5d4vk5qAFaYsXzIcVqCrD+q2HMsiyyQYr3Eon5
         cO+toDZ14NlXNQXPRy0ivnUKvor6iKVpOsIMqJn71BmS47dkVsqu00CqRC6prGt5e0bn
         aTxkrLpNwG+wUOZEHh0oxm+a0K8mm9ACW6s6ywWgdda7C8DbRCbGtYwWbAq5ZnjqPKa+
         ZQ4JYwiTHwDaF5x1rDsKyGZRCU39H86QMIPfhT/3c2nEIK91di6ZHjJ0PYR71Aq7RKxl
         Hme2E3wzlMoPTRMCPwSc3lKbhzpRvVzYKydBBsXAAfS74/GeRYdvTCp/lrp3LTjT3V/U
         7V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685741005; x=1688333005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I1uptEziDA+3GwFblzZwLieMJnJ27lR4oKjRiRs4njI=;
        b=LRdYGn6CkR/VXqDA3tpigC1/c2minl+SqTKk7ymLTXoEXQCv0SpuqPV8wDOO+JLQrV
         Lxay5E4RIRteLUkS30yVxpGk4hQepepLCDqCLyeHX+82Yrw5nVgKwCrYHBfPXrfjbXxD
         uy9G8OsI9JBM7arSHf/2unak8ZIy4e+3xQe2Cba9JVp1V8q12DS3b8HjmNq4/Ho30q7J
         GpDhHZow3e0oq671m80S+VbfsBPGP+qUgg3pJBQrpcRrKCKQljKQB035Tqxsze/EsOpF
         7ZPh+oxYhnkod4eceV0sR6Q+hwlL2v1Z/E9zH/3cWU42TbDviyn+ffbqr4ZIr6hVv1Hh
         KhGw==
X-Gm-Message-State: AC+VfDzQP+YltGWGHUmuqeE6YAyCeJPb01HvHt0Z65AcrZohxrweDZBA
	QvJQtyUjvADeUd1ZQwPbkcb9iw==
X-Google-Smtp-Source: ACHHUZ4WmNPaqgLb0+cKHHp5pYOxDzhmep12jtcG9UKq2bBHm0f3dxDyNTfPaUsJSj2PTL1b/0REvQ==
X-Received: by 2002:ac2:4285:0:b0:4f4:b3a6:413e with SMTP id m5-20020ac24285000000b004f4b3a6413emr2049023lfh.19.1685741004732;
        Fri, 02 Jun 2023 14:23:24 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id e13-20020ac2546d000000b004db3e330dcesm275944lfn.178.2023.06.02.14.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 14:23:22 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH] mtd: otp: Put factory OTP/NVRAM into the entropy pool
Date: Fri,  2 Jun 2023 23:23:18 +0200
Message-Id: <20230602212318.3524782-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_142328_325298_08D9E1AA 
X-CRM114-Status: GOOD (  16.11  )
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

The factory OTP, if supported, contains factory-programmed
information such as typically the serial number or production
week for the chip.

As this is device-unique information, submit it into the
system entropy pool.

This does not count as improvement of the entropy as such
but in practice it makes it a bit more random to mix in these
numbers.

Cc: Jason A. Donenfeld <Jason@zx2c4.com>
Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
This is similar to the patch I made to add MMC/SD-card serial
numbers to randomness, just with raw NOR flash.
---
 drivers/mtd/mtdcore.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 60670b2f70b9..efc8cf76dc60 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -23,6 +23,7 @@
 #include <linux/idr.h>
 #include <linux/backing-dev.h>
 #include <linux/gfp.h>
+#include <linux/random.h>
 #include <linux/slab.h>
 #include <linux/reboot.h>
 #include <linux/leds.h>
@@ -966,6 +967,25 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
 		}
 
 		if (size > 0) {
+			/*
+			 * The factory OTP contains thing such as a unique serial
+			 * number and is small, so let's read it out and put it
+			 * into the entropy pool.
+			 */
+			void *otp;
+
+			otp = kmalloc(size, GFP_KERNEL);
+			if (!otp)
+				return -ENOMEM;
+			err = mtd_nvmem_fact_otp_reg_read(mtd, 0, otp, size);
+			if (err < 0) {
+				kfree(otp);
+				return err;
+			}
+			if (err == size)
+				add_device_randomness(otp, size);
+			kfree(otp);
+
 			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
 						       mtd_nvmem_fact_otp_reg_read);
 			if (IS_ERR(nvmem)) {
-- 
2.40.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
