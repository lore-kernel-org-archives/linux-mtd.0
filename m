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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F16C433DF
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A4A2073B
	for <linux-mtd@archiver.kernel.org>; Mon, 25 May 2020 12:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrKfl3j7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDVqoWqg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A4A2073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MRE4BF0lqutj8Ud0E15tWyAF3HYHLXuOpkf5cGKi6WE=; b=jrKfl3j7kKPcQVkXn1x/PcCrXt
	3sdYfynvnr9YSR6MTyDBOaA/twswW0SH4WJpuoAbITbUoffe2f92RZzrH9ywqLfmt0RvQ/YaEEQaF
	/8SVwCFb3VZVzkehRy8vhZ5dKxqHRAvF6/z2Mr76fZoZFQXxGfe7noxCRxdJBMmjN+WhjNBsZYgmn
	Kcv38HXz1Y7JxlQipVohXR+IwKkaUME+vWyj82cNmzDFyuUBhLKbebZ8718v7s6TJvPTOURM44UZG
	FqdSeKmvxrcF4H3/p7snwJy9AH1RyQ5P+PKz3S5G/8cDrI6ZLWTmaXHNb3887PduY3qPalgzouBG5
	3MQLIs4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdC4O-0001kC-S9; Mon, 25 May 2020 12:19:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdC45-0001Rm-Mh
 for linux-mtd@lists.infradead.org; Mon, 25 May 2020 12:18:47 +0000
Received: by mail-wm1-x342.google.com with SMTP id l26so967735wme.3
 for <linux-mtd@lists.infradead.org>; Mon, 25 May 2020 05:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ESfsoKlv3Llhx9eyEI7HcxAzaPZGosDjRxZ21yaiW5c=;
 b=LDVqoWqgfksdNgzbBs0mW5BUlWdwRuzRPremNBMFjSvHw7MbbYfvuihyk6FESesJns
 gTWcZE8XS47qGVLZY0d1gyFOfXi70U+P03in3l6lbLv5h768zheCJvpwqwkONbIeIij3
 LXHomugpkcTR5WUtCvsdmgB3588NZ2EIcdVpvdhdHS8Z3KI6PuWp7TjBKjui5DPT7r4b
 whMzDYG1ctT+c4WEJZ95GLNtVKKbRNnon0FMGwefHIYII/m+RD8gHX/EuQOFagZq7eoo
 369pFu13PnqWT2GyXFOiGPStVFEN3MBulaKWC25DzWMZi3S8qYuGEYr6CAU2J+GYQwbC
 Hn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ESfsoKlv3Llhx9eyEI7HcxAzaPZGosDjRxZ21yaiW5c=;
 b=nA+yNsUWM8DYRIPAaBGxcQuKwwqiuffl1TEfM68EgmzTrtILVfGqKW2g4EngFAYknM
 ZheiRdy2N3zosWCaTy6avF95QM3bMI7MhxrHP7+SnvP3Zh+zm2PE9vb5LPMSPTuXEggT
 p9BWeQyErBw97bpsLXQRucaaLSfoVz3IR3BaK/A0KL59TZ7Y/WKJKF5thgvyktGXYeMe
 ni56pg8PQLl7Aa0ya6522fj8lnakYHc2Umxo+PifCXdEqBQ4r23RkKm3AdGFm2gY50Vx
 Rhl/z07dt3PD2OscBi7eyzlw6/a3Ru587wGa8ha6QLLHpwMG58U1sjPb14UGxbBhp53G
 UCEQ==
X-Gm-Message-State: AOAM533X0TCazgrYVDhIKKJocwNKod47LBk3+W2QuWS1fwTKEWRF5OVo
 cDc7gBndyaxWeMcZYVOOwmDtLlgeCZg=
X-Google-Smtp-Source: ABdhPJwkvym87KRYU3fcEG8LCdnFPWaXPFWZG/C1VU/MgRgxDcj6pMJJ59TxmRLBiF9Z+joBW4gQPA==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr24227468wmc.76.1590409123878; 
 Mon, 25 May 2020 05:18:43 -0700 (PDT)
Received: from ubuntu-G3.micron.com ([165.225.203.62])
 by smtp.gmail.com with ESMTPSA id 10sm18136635wmw.26.2020.05.25.05.18.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 05:18:43 -0700 (PDT)
From: Bean Huo <huobean@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v6 2/5] mtd: rawnand: Add {pre,
 post}_erase hooks in nand_chip_ops
Date: Mon, 25 May 2020 14:18:10 +0200
Message-Id: <20200525121814.31934-3-huobean@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200525121814.31934-1-huobean@gmail.com>
References: <20200525121814.31934-1-huobean@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_051845_766835_D5D0F857 
X-CRM114-Status: GOOD (  12.10  )
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
index b86f641f6d74..3de53c42fb74 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4369,7 +4369,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, pages_per_block, ret, chipnr;
+	int page, pages_per_block, ret, chipnr, eb;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -4423,16 +4423,24 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
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
index 0c73e9a81e3a..59150f729cf0 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1029,12 +1029,14 @@ struct nand_legacy {
 
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
@@ -1042,6 +1044,8 @@ struct nand_chip_ops {
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
