Return-Path: <SRS0=D7Eh=LO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1378DC48BDF
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jun 2021 08:59:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF4861059
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jun 2021 08:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF4861059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gorani.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=paBn+BfQeixYHQDqojIFVdhFD86SsIRQlsy/A4/ma8w=; b=Y3QXfX+WoV8EEK
	5wJv/4kfhlelC4MW1oWCU4WODUXKeCrHrMfOCgtQ0uh0bf2Gxe06RBhM3y8s4dqcbd0N+1DFdWqVg
	h9DOrustrn63LCajpLgRWWgEvVoHFegiiX+J+0DtT+otxlLIiDTue+3iNpZeeL0J3znSE/VUz9e5n
	EzXfQzjPkwIlCmCpusaQdo0MptO6kfE4bg7sT3sGki9KclZBhBUHDt9UMk20QGJysR23CLWzfPdCX
	crUS49QYF1PxJ57mAiTrfTVSq3kezVkrnmEHU90FHgOpo5xtufXCjpDnechTHKgIaT7/wVdjt7kZR
	zh8YbnWmODmFhzKczbLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lutHQ-000kcC-Ft; Sun, 20 Jun 2021 08:58:12 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lutHN-000kao-Af
 for linux-mtd@lists.infradead.org; Sun, 20 Jun 2021 08:58:11 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:2:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4G764s1MD2zQjxW;
 Sun, 20 Jun 2021 10:58:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gorani.run; s=MBO0001; 
 t=1624179479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=extD/Hqo5FXzNILDp/V15XpNGwwJgk/BQmW5WObrfIc=;
 b=xvWrsOgpb8gZWA8b5CEO0zxPMTqop7MtalDAPyuFln0Pl6WhTpNfYvDcfOt87f9650pGBm
 dOB+u9qj9/E1TAmkPog6M7MKTKEqkirCdGTQ97Y6v3Owxzj39v+z+PQkU2TQ3BVuKO3uwR
 5UPwUmQDPGJx8tvQst31hgg6VYYYqOObYERdD05lMovgxHuvR6BJLZJB4TOlDOqcXwP19C
 DAp7bsBArYInpeah8Rrw28gmN4VCpFBzaFmXKUwl2nAYdCRkoBI247qvNoJlX6j6xyCKiY
 QsZ7CLSfS18rjgtStwnoUO5bfvmAQYr1F2tNJObX6/QFYWqi7UFvDvl7Uy6MrQ==
Received: from smtp2.mailbox.org ([80.241.60.241])
 by hefe.heinlein-support.de (hefe.heinlein-support.de [91.198.250.172])
 (amavisd-new, port 10030)
 with ESMTP id lRW5OQHomprW; Sun, 20 Jun 2021 10:57:55 +0200 (CEST)
From: Sungbo Eo <mans0n@gorani.run>
To: linux-mtd@lists.infradead.org
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH] mtd: spi-nor: esmt: Use correct name of f25l32qa
Date: Sun, 20 Jun 2021 17:56:39 +0900
Message-Id: <20210620085639.143694-1-mans0n@gorani.run>
MIME-Version: 1.0
X-MBO-SPAM-Probability: **
X-Rspamd-Score: 1.58 / 15.00 / 15.00
X-Rspamd-Queue-Id: B66631813
X-Rspamd-UID: d056f8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_015809_613033_13F15117 
X-CRM114-Status: GOOD (  11.89  )
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

The flash ID of F25L32QA is 0x8c4016, whereas that of F25L32QA(2S) is
0x8c4116. F25L32QA(2S) is the newer version of F25L32QA and its BPn bits
are non-volatile, unlike its older version.

References: https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA.pdf
References: https://www.esmt.com.tw/upload/pdf/ESMT/datasheets/F25L32QA_1(2S).pdf
Signed-off-by: Sungbo Eo <mans0n@gorani.run>
---
At first I was going to send a new support patch of F25L16PA(2S),
but before that, I wanted to make sure if "(2s)" suffix is okay or unnecessary.
---
 drivers/mtd/spi-nor/esmt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/esmt.c b/drivers/mtd/spi-nor/esmt.c
index cfc9218c1053..51b3ff764ef6 100644
--- a/drivers/mtd/spi-nor/esmt.c
+++ b/drivers/mtd/spi-nor/esmt.c
@@ -12,8 +12,8 @@ static const struct flash_info esmt_parts[] = {
 	/* ESMT */
 	{ "f25l32pa", INFO(0x8c2016, 0, 64 * 1024, 64,
 			   SECT_4K | SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE) },
-	{ "f25l32qa", INFO(0x8c4116, 0, 64 * 1024, 64,
-			   SECT_4K | SPI_NOR_HAS_LOCK) },
+	{ "f25l32qa(2s)", INFO(0x8c4116, 0, 64 * 1024, 64,
+			       SECT_4K | SPI_NOR_HAS_LOCK) },
 	{ "f25l64qa", INFO(0x8c4117, 0, 64 * 1024, 128,
 			   SECT_4K | SPI_NOR_HAS_LOCK) },
 };
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
