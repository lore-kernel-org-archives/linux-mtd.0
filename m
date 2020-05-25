Return-Path: <SRS0=SzYL=7H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E676EC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC6A92073B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pdzpTQ13";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEy5EDr9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC6A92073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=U3RVvnFViaUekVgOix75XRIfhvTKb77qBElkjP+gBes=; b=pdzpTQ138PThEjYiC6Mgsgfshn
	ayo7530tHPSjxYYEBUYyG/rlHin3tT1RodbNUQo240HJMMu8M3EO02cdJSbUiIjLiTKFsINJK0saQ
	DyaTfQ10a9FRe5Q3diI/F8d7p3Nb1Ai7UBpVVj0pxYKzIq5dwTipaAGC+sNlDXT+2R5jlelwHVeJR
	Dve4E/6fAilrBUBofLrVSRz+zlanQDbkPEE4JR4BeQ+a0FnsCQcc+yzEYuZSV1KueuPv07Msmr6Lb
	266t9iDUYbHuFM6GNLnjoWWDjjp8eeG9qZ4fbnl2srakDeQ9rC/C8fI6TRQM9taNRlnwtVDJbVp/m
	v759S0LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdC4b-0001wA-TV; Mon, 25 May 2020 12:19:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdC49-0001Vy-Em
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 12:18:51 +0000
Received: by mail-wr1-x442.google.com with SMTP id y17so8500984wrn.11
 for <linux-mtd@lists.infradead.org>; Mon, 25 May 2020 05:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tVA1UbOaARrvvv1nlYyFoEmayQWYr9sKJ7BoMFNxaQk=;
 b=BEy5EDr9haL+F0ICTwU1254kVADvxBIYDTTH+LQKwuWjj5ubU4pvHRj0xn4d2T8EQh
 6D2fTveYYKSZFhAzyA7vLt65JccZVR2weFUSR3jouLVxxF4DiepNTxFEl6XJ4+OHO2Un
 wooRh97Oh8vle8uffYNF7Xby2Mgy/ln54AFl1O8IUVSKyby1e12rKWw85m/23LSIr1XI
 9m1C/Vl/gq1LOJ/2HC9Z+2SU1FCFcNauo/1DATTekWNMwcMmthi1DKsTuA4bE3bu2dAq
 aBeBSSR1lVYUEh5zi3sXuZ3d41cN+x4haDbynGJ9/JzlesP6YO/20jvYYhzNQIl85/Kv
 kZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tVA1UbOaARrvvv1nlYyFoEmayQWYr9sKJ7BoMFNxaQk=;
 b=c/0jR76I1ylZxEAHGZAc9XirMviN2l1/1cEYsRvZqn6XFT/k4JnshRTeJOlvrboxnG
 FoV2ukbTtpKwV9/gG6h6BU0hzr6cyOPUrebILz05rHyMuq7XWUBo7QdA9lWU0ZGtLgl9
 atzVEXbtS2hBmCByp6ZbCK7yPsXFioOSNNTiQ88ZvnOmxm11UFnu3KekEUnXoBsUmuZP
 pr7gbBRevn2pzWF8mQaZ0rMrku6H3d17cO7P3LYlaRz5m2MjrS4wpo8zpJBd53eFgsyN
 /BFIwovjl12bWlz2+FWgwtGjHGegiRC77Kgw6982zVdqqX8Z/9DaFypuje+OWnLlq3cx
 u3bg==
X-Gm-Message-State: AOAM531GT7Vdrnuk6s/0QFsYaILvNITA700RHIeKvW7rJsgKKHFYsDn+
 PW0qG9ElUJMINqT29ELOXQ8=
X-Google-Smtp-Source: ABdhPJxwE9kB9MmZL64vT0gVFu1JaJrEJsau2tAB6wBPkMN495vO2Iq+1kX+vuWT2/qnq+n8aSt2Lg==
X-Received: by 2002:adf:e744:: with SMTP id c4mr16252259wrn.71.1590409127451; 
 Mon, 25 May 2020 05:18:47 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.203.62])
 by smtp.gmail.com with ESMTPSA id 10sm18136635wmw.26.2020.05.25.05.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 05:18:47 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v6 3/5] mtd: rawnand: Add write_oob hook in nand_chip_ops
Date: Mon, 25 May 2020 14:18:11 +0200
Message-Id: <20200525121814.31934-4-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525121814.31934-1-huobean@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_051849_542481_A101F2D7 
X-CRM114-Status: GOOD (  12.63  )
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
index 3de53c42fb74..ab39bb33e688 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4318,6 +4318,13 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
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
@@ -4624,6 +4631,8 @@ static void nand_set_defaults(struct nand_chip *chip)
 
 	if (!chip->buf_align)
 		chip->buf_align = 1;
+
+	chip->ops.write_oob = nand_write_oob_nand;
 }
 
 /* Sanitize ONFI strings so we can safely print them */
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 59150f729cf0..ae1cc60260a7 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1037,6 +1037,7 @@ struct nand_legacy {
  *			setting the read-retry mode. Mostly needed for MLC NAND.
  * @pre_erase:		[FLASHSPECIFIC] prepare a physical erase block
  * @post_erase:		[FLASHSPECIFIC] physical block erase post
+ * @write_oob:		[REPLACEABLE] Raw NAND write operation
  */
 struct nand_chip_ops {
 	int (*suspend)(struct nand_chip *chip);
@@ -1046,6 +1047,8 @@ struct nand_chip_ops {
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
