Return-Path: <SRS0=zMTj=7Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E9DAC433E0
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 18:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A5F92068D
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Jun 2020 18:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PJWOYuG9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A5F92068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4G2fUKdOV5PfJQTQw1iIxuPK9brt9bMuzawscr0Oq8I=; b=PJWOYuG9nD3RZy
	tuWFUfMC5alxdiQmPswcBpKInQD8e1PXweMVGynCW+WPw9dCdYwqPJYo47S1hPs9ZRbvfCUfsG7U9
	UrNFLU+jA9pxyiLtB9Zs3Avh4q2z6AiwXjR0W5zq9iMSH9A0Lx/BEbbwRp5GC0MZQplqLP48cvOVL
	AiK1VPsiPLCbwMOsrFEmz3UqHS3+yMAuJzjgJvp3LbYhXrOikW1XMwtjNS9EBjoW2YwJIID0tF9bK
	WfV2RGjKiujRxvSXXrmJ8e44XXJx25aJKCsIxc/FKEW0t9McikAhVLylBRQbGbfMPwYW6sdBTOwMV
	0E8bCxhX3ZFs8jE2NkSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgXhK-0001Oz-Iv; Wed, 03 Jun 2020 18:01:06 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgXeX-00054A-S3; Wed, 03 Jun 2020 17:58:15 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0E39524000E;
 Wed,  3 Jun 2020 17:58:08 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v10 03/20] mtd: rawnand: Move the nand_ecc_algo enum to the
 generic NAND layer
Date: Wed,  3 Jun 2020 19:57:42 +0200
Message-Id: <20200603175759.19948-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200603175759.19948-1-miquel.raynal@bootlin.com>
References: <20200603175759.19948-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_105814_063730_C2BD2B50 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Mason Yang <masonccyang@mxic.com.tw>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This enumeration is generic and will be reused NAND-wide.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h    | 14 ++++++++++++++
 include/linux/mtd/rawnand.h | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index af99041ceaa9..986c7de83326 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -115,6 +115,20 @@ struct nand_page_io_req {
 	int mode;
 };
 
+/**
+ * enum nand_ecc_algo - NAND ECC algorithm
+ * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
+ * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
+ * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
+ * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
+ */
+enum nand_ecc_algo {
+	NAND_ECC_ALGO_UNKNOWN,
+	NAND_ECC_ALGO_HAMMING,
+	NAND_ECC_ALGO_BCH,
+	NAND_ECC_ALGO_RS,
+};
+
 /**
  * struct nand_ecc_props - NAND ECC properties
  * @strength: ECC strength
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index cf49aa678920..ce37569c3f57 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -92,20 +92,6 @@ enum nand_ecc_mode {
 	NAND_ECC_ON_DIE,
 };
 
-/**
- * enum nand_ecc_algo - NAND ECC algorithm
- * @NAND_ECC_ALGO_UNKNOWN: Unknown algorithm
- * @NAND_ECC_ALGO_HAMMING: Hamming algorithm
- * @NAND_ECC_ALGO_BCH: Bose-Chaudhuri-Hocquenghem algorithm
- * @NAND_ECC_ALGO_RS: Reed-Solomon algorithm
- */
-enum nand_ecc_algo {
-	NAND_ECC_ALGO_UNKNOWN,
-	NAND_ECC_ALGO_HAMMING,
-	NAND_ECC_ALGO_BCH,
-	NAND_ECC_ALGO_RS,
-};
-
 /*
  * Constants for Hardware ECC
  */
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
