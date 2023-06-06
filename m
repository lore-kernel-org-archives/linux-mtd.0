Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994BCC7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cdze7MuvBgdtHduZhoG9zzFkDlLSeLpuelJ7bvfceeQ=; b=Je6bal6275T/HN
	WIdjlhkvL9idjgCX2LWCJOF4hPkkNyHH6QmCzuyvnjVyyo6CSpDfR29KknkUE5oCUFINKj7IHwZeh
	le/L4CrDNZl0LpvO5Jw5ZZXWqJ3w+igPOc8Nl7oIJQQHVnQ2K9oa45WIGbR2A2b8cH5n+hjscZBXi
	XEvmdAnatbdPLDP4TVyrjLgvPJdeBb/jsAk9VYotslPOze2ZgLk6k0Jkn7d+CTf8iGLP0NPC2Qvgx
	t8Ax3yIynEDyNP/qAfNjVUec8/GLeZABu00OSrVYNAyQYz8pl51GemSw5aVWTrMPaHpfJJL5+HooB
	cySO/f1dKcoVhF7kee4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Xgq-0021Ia-1j;
	Tue, 06 Jun 2023 14:29:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Xgo-0021HR-0T
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 14:29:39 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so7631716e87.0
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 07:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686061775; x=1688653775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jT6hSAAsbUjx2Cyf4kC7RBU5Bm/m1+UuuRRxQOJbexo=;
        b=Spl0K8l8EB/yE+DZnhzjdIaK0fRb74Zxz9z8J657WqrjygEfHpuyuwPS1gU4rM27iL
         8W50FVw7k780eL3gfvcoJmbfZcvJpTZYCp9MN/7LrmlMwHGSELLW2pyYOb204LEQtMoz
         keiF3d3Fs7prDHvvsjw9jLTcARpDuykfTn6BoPddIexdIUwRijLEjQOqgedkyUY+pq8m
         vZTTX3NWMQNJEAav7pYdR470BlWv9Wo5IfTPM/wkN1YGhEeQSvHW1736bXc5uoA62yf6
         gOMNz2gwLOxmcbI19R0aAV+6MDONmQpxnzJaQdItd4LExEyROln2X2t6RcE1sYLcGWMh
         RvPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061775; x=1688653775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jT6hSAAsbUjx2Cyf4kC7RBU5Bm/m1+UuuRRxQOJbexo=;
        b=lgvWl3euQZXPvLnn5Q9+EH+Q0x8MgCdAonHzZgIZ8hYxQqME34vJLwoTXuhfaoGCjj
         sdiSmnlhpV0ZD+HnMnrTfGanBF3AcCiTUdT/S4KQKrQdRSoHxRxHiGcq++JhFcncQRHb
         AzvpD2qEsBLw/lOHEOBO1+0JsI4+OunRCzc1Tv/tiZ0IrguNoIm8Km9SOrFykpcqSGJk
         8v1sgVsadW4ySXOrisCDyg+qpv7axAFmEenZFbaDGXJhdWYTUgJ2iGvynolRFGJqR/hA
         0jmpM3GH2WfGE3Wmmxf3t3FyUsS4jtFbCm3l02Lb/3FHYXjnzRp/IxjVVdPsWFTT5Ntg
         uQXg==
X-Gm-Message-State: AC+VfDzG/8qIbHgcWWXU3h9GHkG8mjuKwfhEhSewDyHp7Uuwva8oQNsc
	wsaVFRdgp72Sn9RXkoSH6SGtjoWESnKDaWMcotY=
X-Google-Smtp-Source: ACHHUZ6Cj5wjGQm4Dfcu/Y++O91caR2A7shmtGGpl+DqhQ4PUQKPk4QKwJyme4ZwiPMJhmLp40Gs3A==
X-Received: by 2002:a05:6512:3c9:b0:4f6:145b:e334 with SMTP id w9-20020a05651203c900b004f6145be334mr931424lfp.16.1686061775309;
        Tue, 06 Jun 2023 07:29:35 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id v15-20020a19740f000000b004e8508899basm1484254lfe.86.2023.06.06.07.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:29:34 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Walle <michael@walle.cc>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v3] mtd: otp: Put factory OTP/NVRAM into the entropy pool
Date: Tue,  6 Jun 2023 16:29:31 +0200
Message-Id: <20230606142931.3721374-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_072938_217886_655105D0 
X-CRM114-Status: GOOD (  18.09  )
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
ChangeLog v2->v3:
- Contribute the number of bytes actually read back from
  OTP to the entropy shuffle.
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
index 60670b2f70b9..abf4cb58a8ab 100644
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
+			add_device_randomness(otp, err);
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
