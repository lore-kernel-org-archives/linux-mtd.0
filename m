Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD0C3DA7A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Jan 2023 21:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fzh/bg5X5/0/uFX7wd1qJIwbyS5hvNETtutMsmvpDto=; b=aTXkH0f+DXcs6+
	b5K/4TibhGiuk8NEN7htfJLnKJcKgs1CP3KmCOVKPcqr1p+xBXTs4ki8Vj4qGOZMuR1C0oRx5/7ow
	pHQ9ZxlqvgJPwcm8JIpYg/o5Z9RYPfVeVN+9NiiYAjhnfGNrtbaO5pAmpnGZhvJ+UPDUoTwQJLI6B
	JX6fvWo6/GPjG30s5L7/OgxPKl1dIcLzaAGiYIlMhcZh5Fq0ybf0V4DMRn921joMPAg+4biqnGCOd
	oo75GItOBbx7g5EEThbL936QAkQY/UDm2lxX+hyrDi9Bzxmd5sfNLQojF2IQHUjQ7iWnqHRWv6I7m
	tTC5QKfFoWYZln6ufmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDXLN-00EqWo-Jn; Thu, 05 Jan 2023 21:00:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDUlZ-00DRFH-6a
	for linux-mtd@bombadil.infradead.org; Thu, 05 Jan 2023 18:15:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hw+GYjnpMmI3DeM+Tyw0edFHONPmrI3HFAbyEm7RKLA=; b=S2UTH36cCp1jEa9cehpUCH1Oww
	MJ3BY07BgSWE+nF8QD03MBmPYqmH+bDy+OpKJ1xBYlTTUW/coavo1P1V011Rclwc32m1TJolGhWlW
	77Nwiq5+Y8C+OH6yy4MnhxuxUjaXDEtlq/0lfJTytLocXFR6BVfMdx3ZNRy1wKg4E10hxJ8IWPmcf
	3jOd859V7bKdFIT6Zw201mvnLMxAdtsUiQHKuku9ZzBZH7c5HYK4ki4J9Q7g+UtoqBkTuBTuhJ0vj
	H2sw5OkI5EWs98bxGnjfNTMRcnNnCRPmeW5vp3ADdDQzGpH7ETsbdKrqZn1K7cma/8X4XrlzYjJEU
	NxqoaIUg==;
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTea-001VL3-0x
	for linux-mtd@lists.infradead.org;
	Thu, 05 Jan 2023 17:03:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A4C114000B;
	Thu,  5 Jan 2023 17:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672938219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hw+GYjnpMmI3DeM+Tyw0edFHONPmrI3HFAbyEm7RKLA=;
	b=Qw+Q724gGdIfmnetet3/YD4zplvSuj+j1wjiFdsmPyiy5zIPS8Za9kRfc8Tzr/DFW4BLTc
	LxmWESraHdx92zqR3QST926x6baq2YrdrfUYFJS0ws6jYEs56t5NFApGVnO5yI7QO2lSrg
	txVGAMpCUKbhK9h32zviHr0LWK6aK1ekesTr0VCxuzQ7LfMuqD6/bXa1aQDaLz0TCILVx8
	Djr6qVlTXGq9fj+8JnB0mRsjKqHboEusVsb4BxYKS6Ch61XlgKvDBFo5Xwtl8voTHGy7Ab
	U9cTA4DTuLoBgKEq0LjSiaRbmx5UAWGHxiJVQXGD8yRdJVP1GtC7vQpf4+SQKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 2/3] mtd: rawnand: Prepare the late addition of supported operation checks
Date: Thu,  5 Jan 2023 18:03:32 +0100
Message-Id: <20230105170333.586044-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105170333.586044-1-miquel.raynal@bootlin.com>
References: <20230105170333.586044-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170344_672971_F85AA032 
X-CRM114-Status: GOOD (  11.92  )
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

Add an empty envelope just to show how to add additional checks for new
operations. This is going to be used for sequential cached reads, which
require the page size to be known (and the discovery to be over), hence
the "late" designation.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/raw/nand_base.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 83bfb1ba2fa3..fcaf1d717cbd 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -5009,6 +5009,16 @@ static void rawnand_early_check_supported_ops(struct nand_chip *chip)
 	rawnand_check_data_only_read_support(chip);
 }
 
+static void rawnand_late_check_supported_ops(struct nand_chip *chip)
+{
+	/* The supported_op fields should not be set by individual drivers,
+	 * warn if it happens.
+	 */
+
+	if (!nand_has_exec_op(chip))
+		return;
+}
+
 /*
  * Get the flash and manufacturer id and lookup if the type is supported.
  */
@@ -6345,6 +6355,8 @@ static int nand_scan_tail(struct nand_chip *chip)
 			goto err_free_interface_config;
 	}
 
+	rawnand_late_check_supported_ops(chip);
+
 	/*
 	 * Look for secure regions in the NAND chip. These regions are supposed
 	 * to be protected by a secure element like Trustzone. So the read/write
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
