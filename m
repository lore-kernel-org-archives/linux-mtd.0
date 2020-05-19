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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D61C9C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:18:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D0F206D4
	for <linux-mtd@archiver.kernel.org>; Tue, 19 May 2020 10:18:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TPe647bV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6nxr6YQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D0F206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9MqiK9hNbLqydDraibofyiuUaNgCVamN0Kd2WzFIa+0=; b=TPe647bV/Fo39dEyWh7s9WceiR
	EGhT7yql0JcXdf0F7FdxYGciZBpCFZwUWCOVnJntGABC2j8BzEKa2ITIyJrdKo15W9TdzCYVXVH65
	/XJgAgeMCc76xKHI/szgHsCzoRS01PqgGf5gPgh6Yj49+yYXnEdSTL0ZcLORFbv17k6Hpsrr5dGSE
	l980Pr7Wz3DS1VbG5uY/757XdZt8uukcZHZTmwcdtjs+drB0QTHBHJKk750YZN764TlT8R1YF/9VK
	wycJJUpUnahUKgt9kYQswRTihZwIPVJ0Fry2uE3ijffo5n+QRgZX5ZI++gBZ+G6b8jAtynYm0Lmrt
	jE+Df40A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jazKL-00013m-Mr; Tue, 19 May 2020 10:18:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jazJp-0000Pu-Ha
 for linux-mtd@lists.infradead.org; Tue, 19 May 2020 10:17:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id k13so13154445wrx.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 May 2020 03:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zgSEgyu5An5GyigcNkf1Yhsncd+sLucumkdkFEyxqlE=;
 b=q6nxr6YQHJig4FIQLsOZ+PDKr+h8lboz/+1TJtyQBJ/+DCsA6WHQjS/WODxjKswbCt
 MZIWPphEjJWZAw6MLtsHSO4RiTBsipgYIeNrb8wNxFlB/dkPYbrfEKZpM3/6V7N/sb+O
 QfwXpPA2lsaIH1KJ0a176usfs+CNIsDyFDjE/u/he8cUkSLOJ6Gl3pkpx//p2+nWdNcv
 +cI9xJCd2soTYEPeZcjVVClB7+20HesVVKR+qNu+swiFIgjzC9JI4BlL45n1TGzYjhBP
 fN2l/BdpjbxAuFhgoAnzT+xadt3MpnW2KT0hvbgTPYMKkAjn26lR3xyAwo8vufRwKnIm
 /ZXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zgSEgyu5An5GyigcNkf1Yhsncd+sLucumkdkFEyxqlE=;
 b=c32pj5XL8u5KfIdCtWa0JMQSklEs/9PnSwD738870XrCOjAS6xpzg2KoGV3B0SHLFN
 hx/D46MvPestGivax+ARlt5u6MfxhyU2mgok0Fv2ChW0Oo3k46S6KE7dmYGMF+9Jaryj
 0P7z/J8kaiy5xG9GmCcTUzosILtjkjDHXSilc+a/ek5ksEFyJVu6ftvjtgocTHspABJH
 7a0WkzXccszVCujnOSL8tQi1pbvAvJM1akjIQ294GsPvRYNsYBhmV/qMukXoiBdXxRK7
 RMq8gCbOTWLQrGEzJyGKk6Zka7MM5lbRGn5XsuyLoNkixPPDUkvFvFwP1rJosaeV9bcU
 Pi8g==
X-Gm-Message-State: AOAM530dV8fI6ITED5YKTQxjKdQOn/ues5HA/JUGBtEutJcNsR9X+lyW
 2bLU8XAzmXIPCVgixdMHwFw=
X-Google-Smtp-Source: ABdhPJzb/prlS7H0turq6VxBxGXU2pntYezfTvzREHoKOQ/5DLsF12XHH6sMIscmiNnQgoujF3Oxfg==
X-Received: by 2002:a05:6000:1c5:: with SMTP id
 t5mr26834855wrx.229.1589883471218; 
 Tue, 19 May 2020 03:17:51 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.86.140])
 by smtp.gmail.com with ESMTPSA id w15sm3062488wmi.35.2020.05.19.03.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 03:17:50 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [RESET PATCH v5 2/5] mtd: rawnand: Add {pre,
 post}_erase hooks in nand_chip_ops
Date: Tue, 19 May 2020 12:17:31 +0200
Message-Id: <20200519101734.19927-3-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519101734.19927-1-huobean@gmail.com>
References: <20200519101734.19927-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_031753_632778_3528192B 
X-CRM114-Status: GOOD (  11.59  )
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

Add {pre,post}_erase hooks in the structure nand_chip_ops:
pre_erase will be called before a block is physically erased.
post_erase will be called after a block is erased.

Signed-off-by: Bean Huo <beanhuo@micron.com>
---
 drivers/mtd/nand/raw/nand_base.c | 18 +++++++++++++-----
 include/linux/mtd/rawnand.h      | 16 ++++++++++------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 7af21cf49290..e90b7ae878e2 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4318,7 +4318,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, pages_per_block, ret, chipnr;
+	int page, pages_per_block, ret, chipnr, eb;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -4372,16 +4372,24 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    (page + pages_per_block))
 			chip->pagecache.page = -1;
 
-		ret = nand_erase_op(chip, (page & chip->pagemask) >>
-				    (chip->phys_erase_shift - chip->page_shift));
+		eb = (page & chip->pagemask) >>
+			(chip->phys_erase_shift - chip->page_shift);
+
+		if (chip->ops.pre_erase)
+			chip->ops.pre_erase(chip, eb);
+
+		ret = nand_erase_op(chip, eb);
 		if (ret) {
-			pr_debug("%s: failed erase, page 0x%08x\n",
-					__func__, page);
+			pr_debug("%s: failed erase block %d, page 0x%08x\n",
+					__func__, eb, page);
 			instr->fail_addr =
 				((loff_t)page << chip->page_shift);
 			goto erase_exit;
 		}
 
+		if (chip->ops.post_erase)
+			chip->ops.post_erase(chip, eb);
+
 		/* Increment page address and decrement length */
 		len -= (1ULL << chip->phys_erase_shift);
 		page += pages_per_block;
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 62932cc3ed8d..df3d4b3ef2f6 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1027,12 +1027,14 @@ struct nand_legacy {
 
 /**
  * struct nand_chip_ops - NAND Chip specific operations
- * @suspend:           [REPLACEABLE] specific NAND device suspend operation
- * @resume:            [REPLACEABLE] specific NAND device resume operation
- * @lock_area:         [REPLACEABLE] specific NAND chip lock operation
- * @unlock_area:       [REPLACEABLE] specific NAND chip unlock operation
- * @setup_read_retry:  [FLASHSPECIFIC] flash (vendor) specific function for
- *                     setting the read-retry mode. Mostly needed for MLC NAND.
+ * @suspend:		[REPLACEABLE] specific NAND device suspend operation
+ * @resume:		[REPLACEABLE] specific NAND device resume operation
+ * @lock_area:		[REPLACEABLE] specific NAND chip lock operation
+ * @unlock_area:	[REPLACEABLE] specific NAND chip unlock operation
+ * @setup_read_retry:	[FLASHSPECIFIC] flash (vendor) specific function for
+ *			setting the read-retry mode. Mostly needed for MLC NAND.
+ * @pre_erase:		[FLASHSPECIFIC] prepare a physical erase block
+ * @post_erase:		[FLASHSPECIFIC] physical block erase post
  */
 struct nand_chip_ops {
 	int (*suspend)(struct nand_chip *chip);
@@ -1040,6 +1042,8 @@ struct nand_chip_ops {
 	int (*lock_area)(struct nand_chip *chip, loff_t ofs, u64 len);
 	int (*unlock_area)(struct nand_chip *chip, loff_t ofs, u64 len);
 	int (*setup_read_retry)(struct nand_chip *chip, int retry_mode);
+	int (*pre_erase)(struct nand_chip *chip, u32 eraseblock);
+	int (*post_erase)(struct nand_chip *chip, u32 eraseblock);
 };
 
 /**
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
