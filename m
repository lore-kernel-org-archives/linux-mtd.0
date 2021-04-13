Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF07C433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 273F461004
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 273F461004
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpdbnaIwjTFAzawP5pmZljaJuc9mkzUoC8O28y+QZhU=; b=SqibkOm+mEJ13s+DBmT9GzPSN
	TzbFCqJ7qbQLvkwrkWTv3MSpO8Mhh43yijiQ+hK24yYLsQ2b5zGWTRTnNUynFiJRcHy9GsJfbAA3p
	DuOAC1aIKNQFuUu5+lXtkBllSZBqkptuTGA6Z8AgTKqb/TBK7s0eFLdeymvuAUqUtvKfI0te3YaV+
	YzW3sMmMj9UJbNmeN4qWar4ZC+i7sNMjNno/OahQJIdMh8UmXyN6gIbAx44KdCL2HuWtHb1DrDhM3
	j4tANT9lC1AWrhb+dgbaEk8QDd/D/ZUusAu5tmaIF6WGR5uTnEf1x/FrX5Kdl9Tsg22y2TuUvGn/u
	FFozJmq/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLlO-009lto-SL; Tue, 13 Apr 2021 16:19:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkZ-009lmE-No
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=N7qGJMOiGupl/xynfWnYmFT11/Z50yG+H07Dm2kk/hE=; b=VpFFE2D6x2k5Ms96QEfd3dZjku
 vYDEoedNXiV7hn0K2URKFG+EPlUwfg7N+0m3jrRqfbq6fjJBiIORbJ2j3U5/0ZO/20RtAu4PuPChz
 T13NB5pfEpgyM1Onb6S/iUzP111YyeVBLNhOyZzJmhigw/5KjKqdrZ45QWcYmt/shxwENTodz+qh3
 zMd+4egRNXQlSQW7nvgW8tdUJ26gCVyKVAulWlMt5CthB8yBg6CsKQqLWSmWk3OaC9U+f0zo4MTDx
 tIvo9y3IAK7xi11/NGjsUW9H9BuQGvIuG/3WT/p0yC4Dy7/IeTjS8RmyGnQ2qKQBCAF8vvMVgy7uI
 TjAFi7Vw==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkV-007AlK-Rs
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id E45B1FF80E;
 Tue, 13 Apr 2021 16:18:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 5/7] mtd: rawnand: sharpsl: Fix external use of SW Hamming
 ECC helper
Date: Tue, 13 Apr 2021 18:18:38 +0200
Message-Id: <20210413161840.345208-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091848_060782_FBB49AD7 
X-CRM114-Status: GOOD (  12.37  )
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

Since the Hamming software ECC engine has been updated to become a
proper and independent ECC engine, it is now mandatory to either
initialize the engine before using any one of his functions or use one
of the bare helpers which only perform the calculations. As there is no
actual need for a proper ECC initialization, let's just use the bare
helper instead of the rawnand one.

Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
Cc: stable@vger.kernel.org
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/sharpsl.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/sharpsl.c b/drivers/mtd/nand/raw/sharpsl.c
index 5612ee628425..2f1fe464e663 100644
--- a/drivers/mtd/nand/raw/sharpsl.c
+++ b/drivers/mtd/nand/raw/sharpsl.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/mtd/sharpsl.h>
@@ -96,6 +97,15 @@ static int sharpsl_nand_calculate_ecc(struct nand_chip *chip,
 	return readb(sharpsl->io + ECCCNTR) != 0;
 }
 
+static int sharpsl_nand_correct_ecc(struct nand_chip *chip,
+				    unsigned char *buf,
+				    unsigned char *read_ecc,
+				    unsigned char *calc_ecc)
+{
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				      chip->ecc.size, false);
+}
+
 static int sharpsl_attach_chip(struct nand_chip *chip)
 {
 	if (chip->ecc.engine_type != NAND_ECC_ENGINE_TYPE_ON_HOST)
@@ -106,7 +116,7 @@ static int sharpsl_attach_chip(struct nand_chip *chip)
 	chip->ecc.strength = 1;
 	chip->ecc.hwctl = sharpsl_nand_enable_hwecc;
 	chip->ecc.calculate = sharpsl_nand_calculate_ecc;
-	chip->ecc.correct = rawnand_sw_hamming_correct;
+	chip->ecc.correct = sharpsl_nand_correct_ecc;
 
 	return 0;
 }
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
