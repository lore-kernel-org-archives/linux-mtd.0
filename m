Return-Path: <SRS0=rUMq=7A=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B904FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:01:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DD24207E8
	for <linux-mtd@archiver.kernel.org>; Mon, 18 May 2020 14:01:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BJGwh3gK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0ui3OTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DD24207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q2ncklAOSIwv20mK0Fm0ka8gKwJwMfprrkQUQ6jc9WU=; b=BJGwh3gK+W6qdqPzee6QSHNaSJ
	FHQNE9bTT+NN+NkIJ5oZc1eH4KrEaaRVevvOePA8mc8zvupTV1fVV1n7lXXcjQXApbrPzpM7fmQq2
	ddHYEW7zYrqFy18de8sIPrcgEAg7fDpihSaQJ0c/K944UU7e2mXcWC/zhJp6kZl8pFQAvC6NHqG6p
	/wspUuDZ8SO78xnaLvaof1GMWsqRuM3NTRERcAGxBZibwAxCy2Ry8D5K2wzjZhscUzVCRjByA33+S
	UYkvAIRXu/2oZAg1Kj5pPBP76abTfyaoQoET5lOZQLBQghp4m1wiIE6TmtJH29xpKOstkPcTSrf+p
	t3utpjFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jagK9-0003wD-Tr; Mon, 18 May 2020 14:00:57 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jagJI-00014c-Gw
 for linux-mtd@lists.infradead.org; Mon, 18 May 2020 14:00:06 +0000
Received: by mail-wm1-x341.google.com with SMTP id z72so10581482wmc.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 May 2020 07:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A0dzsFd7YATdAmh4B3Ufb/iHlKjHhY14r5pPPWljdn0=;
 b=g0ui3OTSkdJShadSlw+WcDWAUcm6y3J7YghKX95julkcaI4O4wZrMf3JOkUqdcFx35
 aEuXbH1XbUYj+PmfcTNHJS7b7me4PympHBUltaCtxkINQzPHpSFbSyPDEo9g7dA+rxsR
 kF3sPnA0Op4R4UZT+Q4taN8bonFab/1kXD2qIwRHeyqQCjncj2KcggBjVh9EHvqMiQe5
 PujuqQ/m04AYJ9lRwbKp+RR0H8yZVQFTV7NoNiHstGXtegRo72BvuwWllGlksiFSKrqx
 4BvTDXOzxjiMZkz2BaC+pxrj1/9H5ku4SlL7Zb6cYkijKPFn9G6wFzGOkypMjYYscJ2Q
 xVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A0dzsFd7YATdAmh4B3Ufb/iHlKjHhY14r5pPPWljdn0=;
 b=HJF63VhlbOGniWpwSduZ/KrV8xoP8jE/TxvQqHmMTfCG1T5eVJNXT8fmlT0bhwIfLo
 cpDUfYtsE8EwtXhaWE1K+JWSvpKzfI1euCfWsF8g5A3lqdZyHKeU0H/v7ORj4Ybz011n
 cfMysl32UZ7DEsaVskD3j67UrRxDkP3elNXd6TmlElc224B/3FiHeImwxjFs48uMX+as
 nCTk7sxF0R6Q2+b4iCFqfuDdd0ssr65Tp67OZtIByHlil2YDRj240yETx9T9A/4utp3U
 7ny0kPRJPo0JbpVlTM9YzcmU5umMpZoVNus8yPMxcpbKzlicdQPPxIRt2Lcv0ghm1dzR
 wL+Q==
X-Gm-Message-State: AOAM530M8qB1SszYud/CrxCiW/3lvAfovR8+g1t4bGrZ1zuJHU/DWE88
 N2z5B/2RCcUltZbEa+yGJ523E6OR
X-Google-Smtp-Source: ABdhPJzJM6UZDI0PriKylI2w6FhVHwt18WruFbLtc9Ca+rp2Dmr/RFDUJjS8WsGgVPhIfCXSAlD8wg==
X-Received: by 2002:a1c:7305:: with SMTP id d5mr20288874wmb.85.1589810403095; 
 Mon, 18 May 2020 07:00:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:598:b884:8d4:84ab:c471:b6eb:fcab])
 by smtp.gmail.com with ESMTPSA id
 81sm18114519wme.16.2020.05.18.07.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:00:02 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v4 3/5] mtd: rawnand: Add write_oob hook in nand_chip_ops
Date: Mon, 18 May 2020 15:59:41 +0200
Message-Id: <20200518135943.11749-4-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518135943.11749-1-huobean@gmail.com>
References: <20200518135943.11749-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_070004_587829_BA8F8342 
X-CRM114-Status: GOOD (  12.49  )
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
