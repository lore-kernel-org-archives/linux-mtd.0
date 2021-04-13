Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A66DC433ED
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:21:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF4E5611F0
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF4E5611F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b6KaYuaMywMhKsdZ3C+4oGhsbbeB0Pi0xHqSKdcBitg=; b=JaAd7mA9sC8zEo2el2urEd+YN
	Ps0ZgT2Zgr8W6aQoYAAP9Qq99ptjmPhmwxZ2qdZhYpPl9/h9GUSp1mpkX8uKYc4gAz5mXYPIiRpnc
	33BZqkT95U1ycggSy7PGefocrljXCY6iFvXCv3LPMRcwqE7NL+EienTIFgPWYlOPdJ+Vik6Jar97p
	zBoCgXG9B4MtUnnIRJ9IAU8pTX5tSAormiVpfZqa6l2OzMJC2ObnhW2LA22rdlkfW1z6m2qyh6evw
	n0dc5rQp/mdIhwCHOXXjZlLrSKRZQEfB4bVuKPs3M+TiE/H4OEv+TqBzIjWu9TdfK5C8XLXM9G7vY
	et9YreqPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLme-009m6f-Sh; Tue, 13 Apr 2021 16:21:01 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkY-009lm9-8t
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=ovURaay2tMBx6h/LeiEmdHxJRimiFUNtXnMwTsKV9Z0=; b=W+1PBDbGABIfMxB9ucvyjQJSw7
 M2Kszr1o5bpEayQmq5bkThkbKYoFvMFfUJGphRsn47zoASjV5NvpUyRpYR2DAAgKDje31cK4uzwh+
 DtJqN2wHI4lmqVVjKrpflrUC25JCRa3y7ni0u1XuMVstODL9Bjib1HANAXx2Pj9AcUXIuDqrbdxfL
 gp3Vlp6aJ0chjzookGk1jqPInGhcaavvVSUalk+qTac+cURq9Y23MlkI+dAF4J1hYqyfEvin3lcfB
 hd90LHIH4/AJYGT+VAAplhOOS7jJgO5ciCWjhWf0stk2j/yDX8Vo16f6m0uaTZi9P7qb4jkq34Gdd
 6TXaJkfg==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkV-007AlB-Ml
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:49 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 971F2FF80D;
 Tue, 13 Apr 2021 16:18:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/7] mtd: rawnand: cs553x: Fix external use of SW Hamming
 ECC helper
Date: Tue, 13 Apr 2021 18:18:34 +0200
Message-Id: <20210413161840.345208-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091847_895533_F35CE0EF 
X-CRM114-Status: GOOD (  10.92  )
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
 drivers/mtd/nand/raw/cs553x_nand.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/cs553x_nand.c b/drivers/mtd/nand/raw/cs553x_nand.c
index 6edf78c16fc8..3e41d815d5b0 100644
--- a/drivers/mtd/nand/raw/cs553x_nand.c
+++ b/drivers/mtd/nand/raw/cs553x_nand.c
@@ -240,6 +240,15 @@ static int cs_calculate_ecc(struct nand_chip *this, const u_char *dat,
 	return 0;
 }
 
+static int cs553x_ecc_correct(struct nand_chip *chip,
+			      unsigned char *buf,
+			      unsigned char *read_ecc,
+			      unsigned char *calc_ecc)
+{
+	return ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				      chip->ecc.size, false);
+}
+
 static struct cs553x_nand_controller *controllers[4];
 
 static int cs553x_attach_chip(struct nand_chip *chip)
@@ -251,7 +260,7 @@ static int cs553x_attach_chip(struct nand_chip *chip)
 	chip->ecc.bytes = 3;
 	chip->ecc.hwctl  = cs_enable_hwecc;
 	chip->ecc.calculate = cs_calculate_ecc;
-	chip->ecc.correct  = rawnand_sw_hamming_correct;
+	chip->ecc.correct  = cs553x_ecc_correct;
 	chip->ecc.strength = 1;
 
 	return 0;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
