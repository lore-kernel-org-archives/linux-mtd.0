Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70E52C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 128DE6124B
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 16:20:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 128DE6124B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wDceLMTJk4AE+czx9/l/2GrW7Fl0it+GkSYahVsiXKw=; b=qqKrbAVXAzwfsnFWR1TIIiwZ0
	cSmmeX9mF1tq38XMMpP8X+ubpcVkXCxYuk3qQCr2+eBTdbraoUaduHVB1cEMsPpjfE6JhofcNliHG
	9r/Ojd7BVdZsUx7L51boLhfoX1gGKy6rYxnKEixIK556QKIuft1rp5WkGdLlMfHJDEeo/at8hjNDf
	A0y8eRqkK/KnQfJnSRygauHgZqGtQU6lbi+B8Juu01z60BAUuU3dNovMj1aurj7Kv7uEYJP5CeRfX
	wIyLeKXPP5UNgvFKSQEHYrnaYJ1M8ndP2PMOeCPwBHbfvcCL1UbpI0gNGo7iQs4Y/UpeuYdx70l9M
	w/pV0kCPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWLks-009lom-5K; Tue, 13 Apr 2021 16:19:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkZ-009lmG-Rd
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 16:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=oOcBYJA4dmUbN1DtEP+CAinSySkv6+yR1iPibBDfX8Y=; b=4p6bKA/e3jdVor5tK3oPAmOUO7
 sOxqpn9YW2qWO8AnYwGReFXegGvwIOhc+brdgMQGAVTrqcTn7ilwtLZGm1ZbWNAFh+TvumiR2YdD2
 LauCaZaaWXWFA7s7CdZBgLA2jkj9zyc95XeyQopo9LnpuQLuIgrgn2kAoVEd/S6zLJPkL3skM/tvo
 jcxrerlRnsO9chme1ym2d1XAIwNmThrGGYDjfmrh/JMshqJ83FkmLO1xGIJI9ykimKhDQLH2fmBtV
 IwdlciyJOwAgm9xpmxc4HBMCurKkg4g55sIqqXIcyx5tMP4GtafdBepcPOaq6ojSwAFgLMgPc/a5N
 dsv9ko/g==;
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWLkW-007AlM-IP
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 16:18:50 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 9DE86FF811;
 Tue, 13 Apr 2021 16:18:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v3 6/7] mtd: rawnand: tmio: Fix external use of SW Hamming ECC
 helper
Date: Tue, 13 Apr 2021 18:18:39 +0200
Message-Id: <20210413161840.345208-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210413161840.345208-1-miquel.raynal@bootlin.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_091848_761068_CA759875 
X-CRM114-Status: GOOD (  11.48  )
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
 drivers/mtd/nand/raw/tmio_nand.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/tmio_nand.c b/drivers/mtd/nand/raw/tmio_nand.c
index de8e919d0ebe..6d93dd31969b 100644
--- a/drivers/mtd/nand/raw/tmio_nand.c
+++ b/drivers/mtd/nand/raw/tmio_nand.c
@@ -34,6 +34,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/mtd/mtd.h>
+#include <linux/mtd/nand-ecc-sw-hamming.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
 #include <linux/slab.h>
@@ -292,11 +293,12 @@ static int tmio_nand_correct_data(struct nand_chip *chip, unsigned char *buf,
 	int r0, r1;
 
 	/* assume ecc.size = 512 and ecc.bytes = 6 */
-	r0 = rawnand_sw_hamming_correct(chip, buf, read_ecc, calc_ecc);
+	r0 = ecc_sw_hamming_correct(buf, read_ecc, calc_ecc,
+				    chip->ecc.size, false);
 	if (r0 < 0)
 		return r0;
-	r1 = rawnand_sw_hamming_correct(chip, buf + 256, read_ecc + 3,
-					calc_ecc + 3);
+	r1 = ecc_sw_hamming_correct(buf + 256, read_ecc + 3, calc_ecc + 3,
+				    chip->ecc.size, false);
 	if (r1 < 0)
 		return r1;
 	return r0 + r1;
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
