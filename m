Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449FD606A326
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xJldnJjq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HnDol19v
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ppn/MF8NrG7zisXR0au9J8/a44Qpv5XRHdE9mg+O2Y=; b=xJldnJjqShZptF9LmAqV8e1Orc
	3/qShFScwBlxjYw8BfyztC9E9HLFZSgjDKCsj8z2SRlq1TSGIn2I4GQJHE8Wb4C78jx008HFDgZBj
	f/g3ROaZAIDnZohdG9iEB9hFU3ZHDuP8ElSZHifOxvwHxJ3rVTJiTagj01OLcChVbdcSzy4U60X7A
	5c/bLZEH+3ZtrSheS1R6Q+3WF43C75ZZXZgED9sNGTTKG/xfzAvQF3X9yO8Myjm8YFdhEEzn6xShA
	u2+PRP1arkErrJk7njhsnDDd7P+7OpT7HUpC9fovz4kwnxeV0MM0ExSRpF4qrjsntu8X+4w/ZN9uF
	ftObMQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOn-0000000DYP2-2yML;
	Thu, 19 Nov 2026 22:14:33 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOj-0000000DYMb-0WUo
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:14:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD0CE1A172B;
	Thu, 19 Nov 2026 22:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7A66B6035B;
	Thu, 19 Nov 2026 22:14:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBD9711BC0623;
	Thu, 19 Nov 2026 23:14:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=jZeCS40OK7HJbunFqLZIEhdAmegoej64W6ZGj2lsJew=;
	b=HnDol19vEThSW//G26TjA3IwmN2arDWpipauVIqyaxQvuHFpeb6/SsMZEjFFC7N+BMJ5QV
	IakBhW/pWgnx8SpRENr4+rR56l/qcUJWfhQmiM0I+XYXMf0EuSx8MgtJrgP2KlElapQAEQ
	UoMJEJ6toKSLrYErPCSf23BbskIoaX4RR6zQrx4nLd3d14ZJc+y30KUmMUNU0kUrfR7u11
	pbDxXdkuni1+kvwhwYvM2XZ34mxkxsSUsUkipni6lDoJtqIpojAM2TfdstYPoBRqDpfTV6
	KaE3RlbmGxKX7sRUeZoouF6dXn+nHUrw/xjdVqcLwHH1XZ92IiTBfOHGC0+HpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:52 +0100
Subject: [PATCH 2/4] mtd: spi-nor: Factorize out the bank mask derivation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-2-da72ad9c2d4e@bootlin.com>
References: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
In-Reply-To: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-0-da72ad9c2d4e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Cheng Ming Lin <linchengming884@gmail.com>, 
 Cheng Ming Lin <chengminglin@mxic.com.tw>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_141429_317260_9B350A90 
X-CRM114-Status: GOOD (  12.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The program/erase and read helpers each walk the bank range to test it
against used_banks, and do it again when ending the operations to clear
the bits. Create a helper to compute those masks.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 60 ++++++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fdd6ff1e0aba..7394c9a17334 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1152,6 +1152,20 @@ static void spi_nor_offset_to_banks(u64 bank_size, loff_t start, size_t len,
 	*last = DIV_ROUND_DOWN_ULL(start + len - 1, bank_size);
 }
 
+static unsigned int spi_nor_banks_mask(struct spi_nor *nor, loff_t start,
+				       size_t len)
+{
+	unsigned int mask = 0;
+	u8 first, last;
+	int bank;
+
+	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
+	for (bank = first; bank <= last; bank++)
+		mask |= BIT(bank);
+
+	return mask;
+}
+
 /* Generic helpers for internal locking and serialization */
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
@@ -1254,24 +1268,18 @@ void spi_nor_unlock_and_unprep(struct spi_nor *nor)
 static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	unsigned int used_banks = 0;
-	u8 first, last;
-	int bank;
+	unsigned int banks;
 
 	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+	banks = spi_nor_banks_mask(nor, start, len);
+	if (rww->used_banks & banks)
+		return false;
 
-		used_banks |= BIT(bank);
-	}
-
-	rww->used_banks |= used_banks;
+	rww->used_banks |= banks;
 	rww->ongoing_pe = true;
 
 	return true;
@@ -1280,15 +1288,10 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	u8 first, last;
-	int bank;
 
 	guard(mutex)(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++)
-		rww->used_banks &= ~BIT(bank);
-
+	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
 	rww->ongoing_pe = false;
 }
 
@@ -1330,24 +1333,18 @@ static void spi_nor_unlock_and_unprep_pe(struct spi_nor *nor, loff_t start, size
 static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	unsigned int used_banks = 0;
-	u8 first, last;
-	int bank;
+	unsigned int banks;
 
 	guard(mutex)(&nor->lock);
 
 	if (rww->ongoing_io || rww->ongoing_rd)
 		return false;
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++) {
-		if (rww->used_banks & BIT(bank))
-			return false;
+	banks = spi_nor_banks_mask(nor, start, len);
+	if (rww->used_banks & banks)
+		return false;
 
-		used_banks |= BIT(bank);
-	}
-
-	rww->used_banks |= used_banks;
+	rww->used_banks |= banks;
 	rww->ongoing_io = true;
 	rww->ongoing_rd = true;
 
@@ -1357,15 +1354,10 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 {
 	struct spi_nor_rww *rww = &nor->rww;
-	u8 first, last;
-	int bank;
 
 	guard(mutex)(&nor->lock);
 
-	spi_nor_offset_to_banks(nor->params->bank_size, start, len, &first, &last);
-	for (bank = first; bank <= last; bank++)
-		nor->rww.used_banks &= ~BIT(bank);
-
+	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
 	rww->ongoing_io = false;
 	rww->ongoing_rd = false;
 }

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
