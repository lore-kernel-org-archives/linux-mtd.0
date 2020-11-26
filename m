Return-Path: <SRS0=PI1R=FA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4D2C6379D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A174521D91
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2020 20:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l33Jm+Sp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="lqTB/lJZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A174521D91
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KQC5G2AJE+9UqqhnqqwS/HMnJ7QALlVloPua0+1jlOs=; b=l33Jm+SpRiSiSeoIbegRwdW/8
	pOO+Av1/W8fp2nGIVLwTitzSudyOXA+nI+XLnN10Hd1sHiGB9GsW+JfSxsWtXwdt7mSzV1UVh1KMy
	NCP+mJgrLpJTmgqSFN6t4+e5ZLhWf2MhWf4PqOQiWG+Xxv1Gi5LEj0yDQeY+3b5nJvBKicEvofxS0
	6oWig5UxRNs3M3KTqSeN8kKbnGdsoWiJuRAEVcbQiB5NteY3hhiUKjwKT+9W7aov5g5IfBxhMatHa
	APUJODZpmu6fo7suF5rpKU1iyWOsNqtM/yNlUZNbOv3cT3kPNixpNawKZyo7SYIipyxD7XCUTx89p
	aIfiMXB5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiNqp-0005JQ-Rw; Thu, 26 Nov 2020 20:26:48 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiNqg-0005GJ-AT
 for linux-mtd@lists.infradead.org; Thu, 26 Nov 2020 20:26:39 +0000
Received: from apollo.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id B110423E60;
 Thu, 26 Nov 2020 21:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1606422396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FXRp8EO9EzQHnV4EoMHG5nuEzVXMEmzONm7dcDbt3H0=;
 b=lqTB/lJZrY7hs31qFbLMeawi3L4fjub+pozUsBS7lFMHODwWu5RMsZpdigAmP6A11DbvkX
 8CZ4Z2e7JcpfV65AwRI9vpcGWsjixsrYVJJzUlrFUxa61YlLnATjq6EKlxsJ9nfYfW0YQr
 YLn9jc1KyArdSGuGljUA/yt67G//1ms=
From: Michael Walle <michael@walle.cc>
To: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] mtd: spi-nor: intel: remove global protection flag
Date: Thu, 26 Nov 2020 21:26:12 +0100
Message-Id: <20201126202614.5710-4-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126202614.5710-1-michael@walle.cc>
References: <20201126202614.5710-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_152638_638420_70E077A9 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Michael Walle <michael@walle.cc>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

For the Atmel and SST parts this flag was already moved to individual
flash parts because it is considered bad esp. because newer flash chips
will automatically inherit the "has locking" support. While this won't
likely be the case for the Intel parts, we do it for consistency
reasons.

Signed-off-by: Michael Walle <michael@walle.cc>
---
changes since v5
 - new patch

 drivers/mtd/spi-nor/intel.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/spi-nor/intel.c b/drivers/mtd/spi-nor/intel.c
index d8196f101368..6c31bef3fc60 100644
--- a/drivers/mtd/spi-nor/intel.c
+++ b/drivers/mtd/spi-nor/intel.c
@@ -10,23 +10,13 @@
 
 static const struct flash_info intel_parts[] = {
 	/* Intel/Numonyx -- xxxs33b */
-	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, 0) },
-	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, 0) },
-	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, 0) },
-};
-
-static void intel_default_init(struct spi_nor *nor)
-{
-	nor->flags |= SNOR_F_HAS_LOCK;
-}
-
-static const struct spi_nor_fixups intel_fixups = {
-	.default_init = intel_default_init,
+	{ "160s33b",  INFO(0x898911, 0, 64 * 1024,  32, SPI_NOR_HAS_LOCK) },
+	{ "320s33b",  INFO(0x898912, 0, 64 * 1024,  64, SPI_NOR_HAS_LOCK) },
+	{ "640s33b",  INFO(0x898913, 0, 64 * 1024, 128, SPI_NOR_HAS_LOCK) },
 };
 
 const struct spi_nor_manufacturer spi_nor_intel = {
 	.name = "intel",
 	.parts = intel_parts,
 	.nparts = ARRAY_SIZE(intel_parts),
-	.fixups = &intel_fixups,
 };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
