Return-Path: <SRS0=YgIB=6I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9CDC54FCB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:43:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 518C6206D7
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Apr 2020 16:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nJA0ofeu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 518C6206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BgZ0nVnZDSe9d6H1Pr3bu2p94Kf02/n2wXh1VVfXS9o=; b=nJA0ofeu2AtMbq
	9OYHbi/N8TpP6mG1vidabGD5mD2GvCMdFFvlttQVJ3ETLzWTGLdlMUudax23+SOOqDgB/+InAF4ob
	oxtgnVzvjfOUPfDT/f2OAo9Zxu1+GPvwjIxYP0CV3/3hgxb+Vc9fMCdWmKyy4E0DTN4ZlagREU+Er
	jzWVUZ9ox1UhxTYPwSiHsMboX3+J3YuDkU+bn+ico0yrrJH2NKG2iLpblZkV/5sYDsBUnCUDMPAZ1
	lwGrRYZV5VepoWI8DMJgS+WV6B6FidS4QPgCsFa5c3XygE2Yzk4RbHhW+HVeCciSEJKGw7AU9Izq5
	fz/BaT0YwSYJQvmOBSuQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jS1Q0-00060O-KT; Fri, 24 Apr 2020 16:43:12 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jS1Nj-0003wP-Ij
 for linux-mtd@lists.infradead.org; Fri, 24 Apr 2020 16:40:54 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 763CA2000D;
 Fri, 24 Apr 2020 16:40:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 5/9] mtd: rawnand: onfi: Define the number of parameter
 pages
Date: Fri, 24 Apr 2020 18:40:38 +0200
Message-Id: <20200424164042.26572-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424164042.26572-1-miquel.raynal@bootlin.com>
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200424_094051_815293_23236269 
X-CRM114-Status: GOOD (  12.27  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Use a macro to define the number of parameter page instead of
hardcoding it everywhere.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_onfi.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_onfi.c b/drivers/mtd/nand/raw/nand_onfi.c
index 7d9a3130443a..9fe39adbde4c 100644
--- a/drivers/mtd/nand/raw/nand_onfi.c
+++ b/drivers/mtd/nand/raw/nand_onfi.c
@@ -16,6 +16,8 @@
 
 #include "internals.h"
 
+#define ONFI_PARAM_PAGES 3
+
 u16 onfi_crc16(u16 crc, u8 const *p, size_t len)
 {
 	int i;
@@ -156,7 +158,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 		return 0;
 
 	/* ONFI chip: allocate a buffer to hold its parameter page */
-	p = kzalloc((sizeof(*p) * 3), GFP_KERNEL);
+	p = kzalloc((sizeof(*p) * ONFI_PARAM_PAGES), GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -166,7 +168,7 @@ int nand_onfi_detect(struct nand_chip *chip)
 		goto free_onfi_param_page;
 	}
 
-	for (i = 0; i < 3; i++) {
+	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
 		ret = nand_read_data_op(chip, &p[i], sizeof(*p), true);
 		if (ret) {
 			ret = 0;
@@ -181,8 +183,8 @@ int nand_onfi_detect(struct nand_chip *chip)
 		}
 	}
 
-	if (i == 3) {
-		const void *srcbufs[3] = {p, p + 1, p + 2};
+	if (i == ONFI_PARAM_PAGES) {
+		const void *srcbufs[ONFI_PARAM_PAGES] = {p, p + 1, p + 2};
 
 		pr_warn("Could not find a valid ONFI parameter page, trying bit-wise majority to recover it\n");
 		nand_bit_wise_majority(srcbufs, ARRAY_SIZE(srcbufs), p,
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
