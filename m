Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED1C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLfkOyFdfmbbgsttA/5/R4Ik9uppGgUih0X9n5QAt/c=; b=ORCCSrMb1sOJEJ
	21cnDrTe/g7+AmGnn4FUzRGoOa5UndI9M12T/eh2kbTxo7kdbdZtRZ0LhFcfLCk2blMF7bFNkAF06
	UEeaZZXeWkPWxYz+MHaH0/yjLf2Gt01WBNMMtCqKp/AZdZ1o5MGvFLN5aEof00E3ksIC7quzEBDzC
	LBDC5FWHXzgL6gMbD6LJCEANdHjR1BYEvoHEF0VtaEnrAdJbSMIw3Vocsfd8mcoAdUrkg1eO43THm
	vRL4DEGNXfU9yzKXZ4VyQzMch2eNjg9HcmtW77J8nYl549NluZ5viyijiW//3b30S8NQsD+TaRU8B
	D46iILCJSoRRMN5g+C4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZY-00000002qpJ-3fNv;
	Fri, 04 Sep 2026 17:19:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZX-00000002qmI-10DV
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=pxzw5jV2DX8wn6S1wpOhBSXoMQmbhVGev9o9A9dgFvE=; b=LForJmfPT+MsuLg5rV3srN+LWt
	xwl6Rr0R+Ge9DlWCGtEAJyWKR1NJuiGS5KjOojUhduGyxSi9kNw3BpTa+m7VrwN34O2Zz0wAJztO3
	cJTfXRas9O9sHHdCczDhdT9sdQUfot1MDCQaPNXbLfsQrUuhEkiLxLr1Vc/z2xU10TmfQiRHSbB6q
	NRRWNDPP70RDqnL6LQNZkvl4AsbT5ficiQnNIyIJUbILHVj+9qVZuKJmBxWyd4W0ZSkjl+bJ+0wql
	bFQDkm4hcmZd/+jRl0k0Er2Q6ejbGbg8aKKeLXwAzU0fu+944bwDSEKrc/MyWFzIYg67JakOPI2TH
	p1Oj3pyw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZT-0000000EKqM-2iRP
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DE3291A19AF
	for <linux-mtd@lists.infradead.org>; Fri,  4 Sep 2026 17:19:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B313C6057F;
	Fri,  4 Sep 2026 17:19:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD99211C78158;
	Fri,  4 Sep 2026 19:19:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542351; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pxzw5jV2DX8wn6S1wpOhBSXoMQmbhVGev9o9A9dgFvE=;
	b=TyS/AJgC8WXX1L6J+0nbHn09yeX7DOiLNLdV88NtmU7M5lP5Ms8WRMKt84wsxy4LRLyS2G
	VbZwf5qiA8mBUlXN5pEMYZ/RfNZVWGHW5ZE6TqYRGB5xFBiw/eWXhmnnbyd3vjILcY/zK4
	og7yKKY2mLETBshbvvXzNHTR2YrGIItLHU4dZpJcEfj23r0avP17/zxLx/ozwT+z0TOlu+
	jjw/AzYcJHiNxqys4pB/15f1BtiiFpsKCZYPHFNqHeb+s20s58APXbo7Ax0m+gcdWcTsR9
	JBd10bz1dDObxu+iM351Lf4mRiQSYthA/9ZYoa28avUHNAI3s5yz/5D1V+TGiQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:55 +0200
Subject: [PATCH v6 02/26] mtd: spi-nor: Garbage collection during sfdp
 parsing
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-2-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181923_922763_187C9D35 
X-CRM114-Status: GOOD (  15.42  )
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

SFDP parsing works as follows:
1- The header is read then parsed
2- If correct, the sfdp structure and the sfdp content table are
   allocated then filled
3- The mandatory BFPT table is parsed
4- The optional tables are then parsed as well

Any failure in steps 1-3 leads to an error and an early return. The
failure is not always fatal though, since the deprecated will fallback
to the non SFDP definition (in the ID table, for legacy chips). In this
case, the devm_ memory allocations for the SFDP table structure and
table will remain in memory for the lifetime of the device but will
never ever be accessed anymore (since they are incorrect). In this case,
we shall free the memory manually since the device is not going out of
scope anytime soon.

The assignation of nor->sfdp is also cleared in case of failure, to
avoid carrying a dangling pointer upon partial failure. This is
particularly important since the presence of valid SFDP support is
checked using the following condition: `if (!nor->sfdp)`.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

This change is particularly useful for the next patches which generalize
the fact that SFDP parsing will be attempted on legacy chips not
manually advertizing dual/quad/octal capabilities. I don't think it is
relevant to backport it.
---
 drivers/mtd/spi-nor/sfdp.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index cc403ae97a83..24e4d07b18c9 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1539,7 +1539,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 					psize, param_headers);
 		if (err < 0) {
 			dev_dbg(dev, "failed to read SFDP parameter headers\n");
-			goto exit;
+			goto free_param_headers;
 		}
 	}
 
@@ -1567,7 +1567,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	sfdp = devm_kzalloc(dev, sizeof(*sfdp), GFP_KERNEL);
 	if (!sfdp) {
 		err = -ENOMEM;
-		goto exit;
+		goto free_param_headers;
 	}
 
 	/*
@@ -1581,16 +1581,13 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 				    sizeof(*sfdp->dwords), GFP_KERNEL);
 	if (!sfdp->dwords) {
 		err = -ENOMEM;
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_sfdp;
 	}
 
 	err = spi_nor_read_sfdp(nor, 0, sfdp_size, sfdp->dwords);
 	if (err < 0) {
 		dev_dbg(dev, "failed to read SFDP data\n");
-		devm_kfree(dev, sfdp->dwords);
-		devm_kfree(dev, sfdp);
-		goto exit;
+		goto free_dwords;
 	}
 
 	nor->sfdp = sfdp;
@@ -1612,7 +1609,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 
 	err = spi_nor_parse_bfpt(nor, bfpt_header);
 	if (err)
-		goto exit;
+		goto clear_sfdp_ptr;
 
 	/* Parse optional parameter tables. */
 	for (i = 0; i < header.nph; i++) {
@@ -1659,7 +1656,20 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
 	}
 
 	err = spi_nor_post_sfdp_fixups(nor);
-exit:
+	if (err)
+		goto clear_sfdp_ptr;
+
+	kfree(param_headers);
+
+	return 0;
+
+clear_sfdp_ptr:
+	nor->sfdp = NULL;
+free_dwords:
+	devm_kfree(dev, sfdp->dwords);
+free_sfdp:
+	devm_kfree(dev, sfdp);
+free_param_headers:
 	kfree(param_headers);
 	if (err)
 		memcpy(nor->params, &params, sizeof(*nor->params));

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
