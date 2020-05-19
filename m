Return-Path: <SRS0=qFGM=7B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBBBC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:06:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CDE7206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TGyYu7OB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdB+hJkW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CDE7206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q2ncklAOSIwv20mK0Fm0ka8gKwJwMfprrkQUQ6jc9WU=; b=TGyYu7OBFX65eAiLomhhlNOuNt
	w+61Fje6+VPRNuaZlncdrgk4DEAVvwPqjNfpN5G2rUJ4I/VbJgqPuwuD/aDmrSWDijsPMCh+5/ZSq
	3KGL7O9EcTty2afl65uxuqkg4XdPnQRNR8C7i+nh/uYV4zMOJps3UA+FdlzJ+Iqloe/NnLouCM47j
	7gjZgnyc3WcSw+JLpg5pZl8uLIsNYPtAvM1AAQF9y/dz7Po/xP6uqvqD8bY0lQ1euJ7KhnlF9C09g
	hF+YBy4LIlmhywAvEivBjGlpxuP1VNqyzHD6Lf3vDQk9xWJhEw5UHpBFgFVbKzyvVCZ49MgeUBJFh
	orBgGG0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaz8k-0001S2-Q7; Tue, 19 May 2020 10:06:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaz7o-0000i5-Ev
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:05:29 +0000
Received: by mail-wm1-x344.google.com with SMTP id f134so2436764wmf.1
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A0dzsFd7YATdAmh4B3Ufb/iHlKjHhY14r5pPPWljdn0=;
 b=UdB+hJkWgTSuFJt0pZRMkIPGDKwdUT1dAU/6a7r9v92AjrCvjKa0IcSnT5TsVDfOoe
 EOq225Fjpx21cFKWpS/ChQhtnI6t4Areto19A0DrDTWl3IVERrdo45OgOn4H3hCcvHea
 bWpDTQms8chEpSf6TdoOyJp/hdLhVJ2MMHfFV2JpvumYB4lzbo3TajM9xjZ3Khb/yHet
 Kbo4joZLHEKrc6FU83rsIP7K+8srtJdgzzApwgJ16V/GJB3Mu0ZdgmafaLH5z5LsJVds
 bo7dTYjEijf1jbvkelKLgY26BLnOmIlnGBH86UKob1/Iet4vxMZwWqzQVDZnFtP2qUPe
 cSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A0dzsFd7YATdAmh4B3Ufb/iHlKjHhY14r5pPPWljdn0=;
 b=BxaQyge6vdaYtJQmGtceh9km2VEcWAFKb5H3HdeT+u2g3YervJNLzzvF+DKEYSaxCH
 7NSJDYFC7PvdHI4za+jR6MACCinngAiOeqKTUPyO7bLpHgLjz1qu7LdBmu8JvVd4AaG/
 fCI6uJSl3gWVElDfYFHjX7lgNUfR5lR0uZCOEuueaBMlPEnrTzJ6rs28+fWL4heDJjoa
 NEjnJt1CXcAh/aQEOiM5madMRCqqVJrdR2VKzBiNpczVYutgC/smDsSgqKvxsme1X/vu
 abqeFen/lQaq/T6lbPMYTAr8EJiuVRX9dFZ/ON4oBNxuNJCtsi/idqq+melQGNRSaQWo
 EYyg==
X-Gm-Message-State: AOAM532W7AAblP/8VWOGtZSPEr7QJglCdA2VK48nkcuBzdrwsff/G9v7
 8dtOnNi2P6vduS47zqiE+dY/NSnKRkgkDQ==
X-Google-Smtp-Source: ABdhPJy75UQcRgxlKDQyvIcayYE4da4DcqqChhNqqn+CKIwudgHm7In5wprKyW16m28JV/a503kkZg==
X-Received: by 2002:a7b:cbd4:: with SMTP id n20mr4577893wmi.101.1589882726576; 
 Tue, 19 May 2020 03:05:26 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id b18sm19968008wrn.82.2020.05.19.03.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:05:26 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v5 3/5] mtd: rawnand: Add write_oob hook in nand_chip_ops
Date: Tue, 19 May 2020 12:05:05 +0200
Message-Id: <20200519100507.19323-4-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519100507.19323-1-huobean@gmail.com>
References: <20200519100507.19323-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_030528_531040_C5D7244B 
X-CRM114-Status: GOOD (  12.73  )
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
Cc: huobean@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Bean Huo <beanhuo@micron.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Bean Huo <beanhuo@micron.com>

Break the function nand_write_oob() into two functions, and one of them
is named nand_write_oob_nand(), which will be assigned to new added hook
write_oob by default. The hook write_oob will be overwritten in the NAND
vendor lower-level driver if needed.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/internals.h | 3 ++-
 drivers/mtd/nand/raw/nand_base.c | 9 +++++++++
 include/linux/mtd/rawnand.h      | 3 +++
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 03866b0aadea..94d300a207ac 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -99,7 +99,8 @@ int nand_read_param_page_op(struct nand_chip *chip, u8 page, void *buf,
 void nand_decode_ext_id(struct nand_chip *chip);
 void panic_nand_wait(struct nand_chip *chip, unsigned long timeo);
 void sanitize_string(uint8_t *s, size_t len);
-
+int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
+			 struct mtd_oob_ops *ops);
 static inline bool nand_has_exec_op(struct nand_chip *chip)
 {
 	if (!chip->controller || !chip->controller->ops ||
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index e90b7ae878e2..09ee490c08a9 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4267,6 +4267,13 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 			  struct mtd_oob_ops *ops)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
+
+	return chip->ops.write_oob(chip, to, ops);
+}
+
+int nand_write_oob_nand(struct nand_chip *chip, loff_t to,
+			struct mtd_oob_ops *ops)
+{
 	int ret;
 
 	ops->retlen = 0;
@@ -4573,6 +4580,8 @@ static void nand_set_defaults(struct nand_chip *chip)
 
 	if (!chip->buf_align)
 		chip->buf_align = 1;
+
+	chip->ops.write_oob = nand_write_oob_nand;
 }
 
 /* Sanitize ONFI strings so we can safely print them */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index df3d4b3ef2f6..3d75e50e5b75 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1035,6 +1035,7 @@ struct nand_legacy {
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @pre_erase:		[FLASHSPECIFIC] prepare a physical erase block
  * @post_erase:		[FLASHSPECIFIC] physical block erase post
+ * @write_oob:		[REPLACEABLE] Raw NAND write operation
  */
 struct nand_chip_ops {
 	int (*suspend)(struct nand_chip *chip);
@@ -1044,6 +1045,8 @@ struct nand_chip_ops {
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
 	int (*pre_erase)(struct nand_chip *chip, u32 eraseblock);
 	int (*post_erase)(struct nand_chip *chip, u32 eraseblock);
+	int (*write_oob)(struct nand_chip *chip, loff_t to,
+			 struct mtd_oob_ops *ops);
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
