Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD40BC7EE24
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jun 2023 18:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sYOP2b5ek5s/9cmVukQ/OQSLClLGGM2+Ty3dYhWw5Ns=; b=XQChFWVD4RSb5W
	iU/N6SXArDtuGfDqVBG0ULN5qlmR5vKuTBAG1XQKwrJjvy7sKidN8S05DTPlloZ21GBwnu8UgOeyY
	ipviIsTLo7mXLzEXY3zKBQ5M8YwXeZPRkicDrAWQAW5tr3JxkZQpC8p5faZoWvwBNHJSAESvl8F0M
	vdpkLhbBjXjwaqQ5cYMH6KB8SxeNErASBOuBU7esONo+2sZqfa+PQAc8XFsAZIpA/nkiUvN9uL+ku
	BxchlWjglfrPWCXajA50IVVU84eD9DbfGr3S4++X2aQ392/g9UTcvIVYyzYiv+M1+3tK6M7SNBTDK
	rbx6cLRMp20dRrdCGuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5W2q-00AJpV-2n;
	Sat, 03 Jun 2023 18:32:08 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5W2m-00AJos-3D
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jun 2023 18:32:06 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b86146afso11079711fa.3
        for <linux-mtd@lists.infradead.org>; Sat, 03 Jun 2023 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685817122; x=1688409122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgDRH8d1GRS4rbgyYx3mp+sxJsQM0fGHFWCyiKUk2qg=;
        b=jpy6vR00aJt5N/jm7mKiMZPoWdSCYvdmagTqJzRdTdV8d7Jfc/SpMScq5d1U/ClxV+
         +rJODTSV04g6FVI3VDijVi1q/qXEF1fiZxP9cTn2petZjf/2fVVd5XWw0XkPAB+4aCq8
         PdWVKiknatSmJ5BI/uvUjPTj+c4QN43dAohpnTjMTi0VZnonccxo0Cfu0xW2sI/HqcDq
         G0ZgxfSgWx28v4a+PocnG6g8cDQbnN/u9/39Xz9bqtKzTDuDdmgGJFVpE29qjsJmtq5y
         vodziDQSLVF4TxPCgEGLNnS8iKoz8o4pzTD4lL4gndJBMCX5iDYfkoAao/fFphuYVwwy
         yx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685817122; x=1688409122;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgDRH8d1GRS4rbgyYx3mp+sxJsQM0fGHFWCyiKUk2qg=;
        b=KkJnSrjQM5NTisPYoMGPWx1xA+kPjuKomBPfDbKP1V4dggFWkp5psh9lQJdCOyzwIs
         gAwfSwsEFBVlM/B2kl+bdRo9guoC2eo4rQIJ5xpWxGhBbz3X1WW8T/4ZWF1gDMAiqUMj
         RlhG+VgsuZTiXdmcVYNyImCKkCzKCtRaRgtnM/8NAHtZOHLpsVFoqdkBTtPT2xk2UuTQ
         9K0ZpIgY4BRQhjxVrrVMD6wt/JSTR1OhEFwdk8DFvaLTA68aFsGi4THCqLyt9rmo9Doq
         SMD2AaZgUWtBZgKOPyPIosPzNKvG/BX9/J+Apxc6Yr+KpH6+HtVAdKLl1XURouyDL4qA
         VHPQ==
X-Gm-Message-State: AC+VfDx4ZKErvpywMJGmV1wnI/zra4l7pNRcnqh+Qd705o1Wa6LLMIc2
	u0gEsbfuz9zSGP33B6kwfYj+dQ==
X-Google-Smtp-Source: ACHHUZ7sWY26/pNRPmsELbsESZfkwj2BjTp8ru+LS4wZpk7u8YWFvtFOCVJtFn78fzc/1/yu2uMdTg==
X-Received: by 2002:a05:651c:238:b0:2af:18c3:8bd5 with SMTP id z24-20020a05651c023800b002af18c38bd5mr1896885ljn.14.1685817122098;
        Sat, 03 Jun 2023 11:32:02 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id m22-20020a2e97d6000000b002ac78893a9csm720174ljj.72.2023.06.03.11.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 11:32:01 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <michael@walle.cc>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] mtd: otp: Put factory OTP/NVRAM into the entropy pool
Date: Sat,  3 Jun 2023 20:31:59 +0200
Message-Id: <20230603183159.3566505-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_113205_090986_832A722E 
X-CRM114-Status: GOOD (  16.91  )
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

Cc: Michael Walle <michael@walle.cc>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Drop the conditional to return as many bytes as requested
  to add the OTP to the entropy pool: it doesn't matter
  whatsoever in this case.
- Collected Jason's ACK.

This is similar to the patch I made to add MMC/SD-card serial
numbers to randomness, just with raw NOR flash.
---
 drivers/mtd/mtdcore.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 60670b2f70b9..d03412a82549 100644
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
@@ -966,6 +967,24 @@ static int mtd_otp_nvmem_add(struct mtd_info *mtd)
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
+			add_device_randomness(otp, size);
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
