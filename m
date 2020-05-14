Return-Path: <SRS0=QwSX=64=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AA4C433DF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 21:24:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714D02065D
	for <linux-mtd@archiver.kernel.org>; Thu, 14 May 2020 21:24:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1LNDdI6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tQywWIn+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 714D02065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=l7/I63PhwwKJ5v/DUllxHzF1GxoRJfqS3+bzHJYhRNI=; b=n1LNDdI6Mzs6fB3GA77fLCRAUK
	iAfYmx8Q81ZH9cuWUBjMaLkW+v5S2XqIc57NvLPp3exgdQ8D2E2GVBt0nTZG1mwzydaC/S85UmBAZ
	r65/+znNcbtzGRQcMA2iWixBlIonXKUZgxaIx9l+xmuPdc7JylJMTtAvvEdWd+9OBcKQmjrRAOcsW
	i9gljWvhfjU9Am6MIeKRlalHCTNviLat2swz7HcjXaKgISUhBUi4tuYhERAk6jfudXf4ESZsKl52F
	gW6kgjsqJamSbuHNzxZgohRP/UKPSGQdW4AboTL2DHf6SlVLjNqbUAKJAZ1wMKgtJYlbc4v0KdnGP
	pzQHZDYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZLLF-00080n-N7; Thu, 14 May 2020 21:24:33 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZLKa-0007KG-7Z
 for linux-mtd@lists.infradead.org; Thu, 14 May 2020 21:23:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id k12so32317533wmj.3
 for <linux-mtd@lists.infradead.org>; Thu, 14 May 2020 14:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lOO96wShAJuqAKs9HTsMILVEmF21sJSmi2TS/KIsZio=;
 b=tQywWIn+EQM58SefyACM7saPcnu0WrnBE7CVKDLYcJKvF0TF0kpVMMsWl07+aXsIFN
 nNqDWuyGj8Qo1Qn8cWKIaMikHmDSJmxZm138w1tc2G0YA4ZXMoInsKvEgWSlqiF7wNNb
 UwI7XZegXPGOmO8IpQHBDV5Jj5ceOt3qkF38htqD0ZOKy4/1S+ppfvgbPCXsuS/TMiUM
 rIVG+kMsslB3jhLXpRdTrPTVnoR4SUEHytb0MD4wZjoyYRUXdG+5vNbOtodS+2BamKwr
 NaPTNye9gRq6NobW8N3qz4V/kcXmzbcqX1sJg0qVvhe7cg2UBJHpX7vkyG9EvileZUbb
 6xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=lOO96wShAJuqAKs9HTsMILVEmF21sJSmi2TS/KIsZio=;
 b=t7HT0aIcgA8zBrkCMJWn0YycArVFRarU4y8oGAHYPbrRLYKoOPSUOhFd887qbc3y2G
 Ha9vW72foTAB2ru/V1fbVGJqNX4bjsEOHapCsBnTnahvhbdVg3Mzyc1qMHhFowD6CKd6
 cr35zCaUZT8sHGkz+u62lwh8yG1eJHDfjQb9dOQPBuOhvS+5WzpgpNwbUqFuQFZ9P13p
 V44g77qWJrdMIV3yuWBExqpcNGSNaQ4fimq5l+1JfKG65z9JFYoAEWGqYoDFR/zZYgJR
 CQs84dopT6rx4MhFCKXIbLxJzARVWyl0XSf3rNfwF95Nk+d9FiNy73iZhhy/k3g1391J
 xBQg==
X-Gm-Message-State: AOAM533GdKJjsLJC8liO4aiZznItnvT33CAqVmDBaKswvpOGtWSJCgbF
 brZzIcMX3BGuMCK+P89I780=
X-Google-Smtp-Source: ABdhPJybyMp/7RRfr70w9s/bNCxLau75t6A3qL7/kggPaMS1TEgCk4YCZ3jmZxKyRhRdiufFCbYjdw==
X-Received: by 2002:a05:600c:1403:: with SMTP id
 g3mr320697wmi.51.1589491431114; 
 Thu, 14 May 2020 14:23:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5bfcc8.dynamic.kabel-deutschland.de.
 [95.91.252.200])
 by smtp.gmail.com with ESMTPSA id 128sm491210wme.39.2020.05.14.14.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 14:23:50 -0700 (PDT)
From: huobean@gmail.com
X-Google-Original-From: beanhuo@micron.com
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 s.hauer@pengutronix.de, boris.brezillon@collabora.com, derosier@gmail.com
Subject: [PATCH v3 2/5] mtd: rawnand: Add {pre,
 post}_erase hooks in nand_chip_ops
Date: Thu, 14 May 2020 23:23:30 +0200
Message-Id: <20200514212333.28692-3-beanhuo@micron.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200514212333.28692-1-beanhuo@micron.com>
References: <20200514212333.28692-1-beanhuo@micron.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_142352_275523_33492CD5 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bean Huo <beanhuo@micron.com>
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
index a9432e9abf82..842490d9fd09 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -4172,7 +4172,7 @@ static int nand_erase(struct mtd_info *mtd, struct erase_info *instr)
 int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		    int allowbbt)
 {
-	int page, pages_per_block, ret, chipnr;
+	int page, pages_per_block, ret, chipnr, eb;
 	loff_t len;
 
 	pr_debug("%s: start = 0x%012llx, len = %llu\n",
@@ -4226,16 +4226,24 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
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
index 8f5871cf2542..f60cfe93b226 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1012,12 +1012,14 @@ struct nand_legacy {
 
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
@@ -1025,6 +1027,8 @@ struct nand_chip_ops {
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
