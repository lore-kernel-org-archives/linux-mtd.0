Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9582CA5FEC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zF70SRmG/gJCdfRfZBPgkVzeNmkpA1zobvJYUzBeNHM=; b=NeBBgWxSOUyy3c
	cs6Vk74pu8nHAqJfEVOfdNo1KFI7avMtoQtt404tNuBCKQm5bNoH/eA3n22KPwx/FvRm3w2ssAlIf
	WWti2xSY1UJ9FEznMmt8eltC5uv2wv1KLfCGNM907e8iqnZYW5bk/NBxE4abdIshJIVpu4slPE3GT
	32QZRDS+6TqMhwkRF5y+qca+TUTp/HXVNgMrk8AZxT7S0ZVgs2z7zEG6oIu6OVs5RZOdqJe50j+C7
	tLyPOqXEaGmzIudqWpHUNfogCCKaTlFz53NGwgXNNmhrbgoo+z+G8elS60X4ThyO9Fu1C8Y8hRdOw
	IlVCN7JigTqsbtS93sZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTpD-0000000FNUh-09Sj;
	Sun, 04 Oct 2026 21:32:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTp9-0000000FNSt-2I2O
	for linux-mtd@bombadil.infradead.org;
	Sun, 04 Oct 2026 21:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZJCKkWbeln3YHmeF1SG+wIijA+DDLjizdoj1hpcvd6M=; b=gwo5F9tcv1qf5dPATBCUg7aPHb
	91GZ4M/r8HEHFRRKgwiRxxztj9UR3UJZqzr+gnGGq/1eE7EliF/J/Ma3RwQBbS/N6AqtE+/SlQaKB
	NmG0OrscsK3ItwJHeBbHMERAbxkdSMxqr03vDxTGRDjOD90OntloMlUlzKclp/5WBAZUbuElGxEoh
	6X5J75WkrRR5FFNtgq9TN//pqnKPNYYQBKtTP7C+a0Ee4nzYZCUm0nMxkbNqeluyNVyRtlZiIqnAy
	s/DZYL9GcJ8T4P8xP4ye2sTxkv4lok/9iybcOAdFIi2n9ITWtzdgzyG2xWHvCPndp5XffltkQH6gY
	CjlEIbHw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xDTor-00000007Tj3-2kcl
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:32:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 899864E41169;
	Sun,  4 Oct 2026 21:32:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF98604FE;
	Sun,  4 Oct 2026 21:32:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6925D1032820F;
	Sun,  4 Oct 2026 23:32:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149547; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZJCKkWbeln3YHmeF1SG+wIijA+DDLjizdoj1hpcvd6M=;
	b=dVkkSnHAA0/ikyFqeoKppjiRAwjVv6oHqCoO5o7PqVCW66vLotlbiDv13D0Npfhl9YvVg7
	LlyWtFxKqhAjRCsV6k2wgQwbsuw04ZrlwwpkJ2rn//g76kkcCADXSqq+dfvzYwRgVNIBth
	v879ajZFURCdbFMlAtH/MnJRLQcISC2dClpavsFieWCHG0xwq2ldL917vTMN1ZSdg4zDu/
	a+a99OvuPNfmVOU/aJ9OXX7lqk+N/EVNphfKWuSJ/8eGu8IG3CEnlJVMoVLieoi930iEUs
	bIrri5LkD8wV4/JErCkBF/xQA78w3jK1jj4d53VWLxdzaUb2Mi0kt8me5UQVxQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:31 +0200
Subject: [PATCH v2 17/17] mtd: spi-nor: Fix the meaning of a comment
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-17-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_223230_339506_BF869D51 
X-CRM114-Status: GOOD (  14.29  )
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

I got mislead by the comment above spi_nor_setup() which implies that we
program a specific configuration into the device. spi_nor_setup() is
pure software, it is the step where the core configures itself for
dealing with the device. spi_nor_init() is where we tell the device how
to communicate with us based on all the knowledge we gathered from its
SFDP table and the DT.

Improve the comment a bit to reflect the fact that one should not write
volatile configurations in spi_nor_setup(). spi_nor_init() should be
used for that instead (since it is called at resume time).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0757e5a7cf2b..bcbce84c1163 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3491,7 +3491,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name,
 		init_waitqueue_head(&nor->rww.wait);
 
 	/*
-	 * Configure the SPI memory:
+	 * Decide how we will deal with the SPI memory:
 	 * - select op codes for (Fast) Read, Page Program and Sector Erase.
 	 * - set the number of dummy cycles (mode cycles + wait states).
 	 * - set the SPI protocols for register and memory accesses.

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
