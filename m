Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A51DC433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63D9123330
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63D9123330
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cdQI99N6jJo6Lr0ZcE18tvXePc9FXwmRfcuWeN9eu9k=; b=K63dB/HWZcsYhkBqJsj5eJynq
	2IABzuOFj0F06HnWoVAzM4LqOA4B9r4Ieqo2weL/SMrIMJ2ubWgbWB6oprsFam/9Boto+1+sQQWS0
	zxjC6vebcqB14SmYlv+FcPQwVCVgTbrdXFfNKt86D/x7U+KTr89LOGhi+bkPMBFTvfM++2CEcMW9c
	B0vGhwNMh1AKdQwcdjC6a8xcdQvvTgjtSmjSYc7F2Cclzr5N6CCR/Gd/JWnpxZAAr38hToVQ+g/Su
	PNANVXfUUPhL+M9NFGJWV1R4JOErOxPMqrnESm03bTGhx1539FNmgqOkWEwIHQ2X30o0TVCrs4BfK
	NyTtRPE2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2AYq-0008FB-NM; Wed, 20 Jan 2021 10:18:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2AYm-0008DL-Il
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 10:17:59 +0000
X-Originating-IP: 86.201.233.230
Received: from localhost.localdomain
 (lfbn-tou-1-151-230.w86-201.abo.wanadoo.fr [86.201.233.230])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BDA781C000D;
 Wed, 20 Jan 2021 10:17:52 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 1/2] mtd: nand: Add a helper to retrieve the number of ECC
 steps
Date: Wed, 20 Jan 2021 11:17:49 +0100
Message-Id: <20210120101750.1163-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210120101750.1163-1-miquel.raynal@bootlin.com>
References: <20210120101750.1163-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_051756_743931_B9A53523 
X-CRM114-Status: UNSURE (   9.88  )
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Adam Ford <aford173@gmail.com>, ladis@triops.cz,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This operation is very common and deserves a helper. It of course only
works after the ECC engine initialization.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/nand.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 414f8a4d2853..27e87c02971c 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -585,6 +585,18 @@ nanddev_get_ecc_conf(struct nand_device *nand)
 	return &nand->ecc.ctx.conf;
 }
 
+/**
+ * nanddev_get_ecc_nsteps() - Extract the actual number of ECC steps
+ * @nand: NAND device
+ */
+static inline unsigned int
+nanddev_get_ecc_nsteps(struct nand_device *nand)
+{
+	const struct nand_ecc_props *conf = nanddev_get_ecc_conf(nand);
+
+	return nanddev_page_size(nand) / conf->step_size;
+}
+
 /**
  * nanddev_get_ecc_requirements() - Extract the ECC requirements from a NAND
  *                                  device
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
