Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44442606A337
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U2dtzcIW;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bmPNfoBK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VZUSiBHLs5nDMUUEgNxAbS1dWaLyEUHXZyU8pDRO5O4=; b=U2dtzcIWel+vGfQ0dG/ZfCYP3O
	wiK3GgOpuOpYcoJJC3VAdVp84KocpYbAIRGiVYbSu3oB9EJFp6gNJIVWFybTZqFFpoytDObHe0Za9
	z+G74OlZFrkBj7IxOOSuVog8/zB4C1PSmHW9lh9vv206f809Yyww7xIYQvNqeMT0NFdCM/Mers3U4
	K1jVNgaHkwbke59aIJLeO0AXaPEELmlecV1gScybaGI4JYBloFId33u+2JrgLvApKITD7tIG1E2SV
	i9ZHK6QdVm0yMR0vXZqKqDkEHaqJ9nSCyV2E6MDaTcX6t1/0BkBHJtGhmwVlkwPezEu3rMuoPEHfn
	LUXphKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOw-0000000DYUX-4Bao;
	Thu, 19 Nov 2026 22:14:43 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOt-0000000DYSG-3xKN
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:14:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C8453C2F4C7;
	Thu, 19 Nov 2026 22:14:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 61FB16035B;
	Thu, 19 Nov 2026 22:14:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F07911BC0EF6;
	Thu, 19 Nov 2026 23:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126473; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sBOk3zq3/sAxgpSLSLJdWXLaL1GWT/tFKJSdrQrw+zw=;
	b=bmPNfoBK4zcS4Lzw9/eZ1ndS5A3d9cSGMxwpu9FbvVTzZln/KpwfiJq7U3jUBuhrrwrOie
	NxAjmk/Jf6h7rf8nuHEB6ugmJH/dnj0EfHsi/y6i3O7C/LmAxRkthOfjpqcjuGmUn7JF4G
	2nXy7LpYAnP/r9NavmHoahTUC96GpeWLv8wzSQQr/b1/VPcPUhM3LQ6U3nEJgJZ4q0b4Qo
	OVW9njfvt8Sj6BDNvu2uboDMcMDoCF08d6JTRVaxHRdg2e6eIQeTcu/66FvY3WBybN75oC
	1c/wPJt/Lj9r+c76y/qwyRFwIyEtPhkA4EE/cmRyG1zYFxLD6sTfkukRE7h43A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:54 +0100
Subject: [PATCH 4/4] mtd: spi-nor: Prevent KCSAN warnings in the RWW path
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-4-da72ad9c2d4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20261119_141440_275151_F62BE24E 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
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

The RWW wait predicates expectedly sample the "ongoing" state of the
chips without nor->lock. Mark the state updates with WRITE_ONCE() to
pair with the existing READ_ONCE() to avoid possible KCSAN warnings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d46c18e4401c..623275637495 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -579,8 +579,8 @@ static int spi_nor_rww_start_rdst(struct spi_nor *nor)
 	if (rww->ongoing_io || rww->ongoing_rd)
 		return -EAGAIN;
 
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
 
 	return 0;
 }
@@ -591,8 +591,8 @@ static void spi_nor_rww_end_rdst(struct spi_nor *nor)
 
 	guard(mutex)(&nor->lock);
 
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
 }
 
 static int spi_nor_lock_rdst(struct spi_nor *nor)
@@ -1215,7 +1215,7 @@ static bool spi_nor_rww_start_io(struct spi_nor *nor)
 	if (rww->ongoing_io)
 		return false;
 
-	rww->ongoing_io = true;
+	WRITE_ONCE(rww->ongoing_io, true);
 
 	return true;
 }
@@ -1223,7 +1223,7 @@ static bool spi_nor_rww_start_io(struct spi_nor *nor)
 static void spi_nor_rww_end_io(struct spi_nor *nor)
 {
 	guard(mutex)(&nor->lock);
-	nor->rww.ongoing_io = false;
+	WRITE_ONCE(nor->rww.ongoing_io, false);
 }
 
 static int spi_nor_lock_device(struct spi_nor *nor)
@@ -1261,9 +1261,9 @@ static bool spi_nor_rww_start_exclusive(struct spi_nor *nor)
 	if (rww->ongoing_io || rww->ongoing_rd || rww->ongoing_pe)
 		return false;
 
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
-	rww->ongoing_pe = true;
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
+	WRITE_ONCE(rww->ongoing_pe, true);
 
 	return true;
 }
@@ -1273,9 +1273,9 @@ static void spi_nor_rww_end_exclusive(struct spi_nor *nor)
 	struct spi_nor_rww *rww = &nor->rww;
 
 	guard(mutex)(&nor->lock);
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
-	rww->ongoing_pe = false;
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
+	WRITE_ONCE(rww->ongoing_pe, false);
 }
 
 int spi_nor_prep_and_lock(struct spi_nor *nor)
@@ -1333,8 +1333,8 @@ static bool spi_nor_rww_start_pe(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->used_banks & banks)
 		return false;
 
-	rww->used_banks |= banks;
-	rww->ongoing_pe = true;
+	WRITE_ONCE(rww->used_banks, rww->used_banks | banks);
+	WRITE_ONCE(rww->ongoing_pe, true);
 
 	return true;
 }
@@ -1345,8 +1345,9 @@ static void spi_nor_rww_end_pe(struct spi_nor *nor, loff_t start, size_t len)
 
 	guard(mutex)(&nor->lock);
 
-	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
-	rww->ongoing_pe = false;
+	WRITE_ONCE(rww->used_banks,
+		   rww->used_banks & ~spi_nor_banks_mask(nor, start, len));
+	WRITE_ONCE(rww->ongoing_pe, false);
 }
 
 static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t len)
@@ -1404,9 +1405,9 @@ static bool spi_nor_rww_start_rd(struct spi_nor *nor, loff_t start, size_t len)
 	if (rww->used_banks & banks)
 		return false;
 
-	rww->used_banks |= banks;
-	rww->ongoing_io = true;
-	rww->ongoing_rd = true;
+	WRITE_ONCE(rww->used_banks, rww->used_banks | banks);
+	WRITE_ONCE(rww->ongoing_io, true);
+	WRITE_ONCE(rww->ongoing_rd, true);
 
 	return true;
 }
@@ -1417,9 +1418,10 @@ static void spi_nor_rww_end_rd(struct spi_nor *nor, loff_t start, size_t len)
 
 	guard(mutex)(&nor->lock);
 
-	rww->used_banks &= ~spi_nor_banks_mask(nor, start, len);
-	rww->ongoing_io = false;
-	rww->ongoing_rd = false;
+	WRITE_ONCE(rww->used_banks,
+		   rww->used_banks & ~spi_nor_banks_mask(nor, start, len));
+	WRITE_ONCE(rww->ongoing_io, false);
+	WRITE_ONCE(rww->ongoing_rd, false);
 }
 
 static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t len)

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
