Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E0C021B2
	for <linux-mtd@archiver.kernel.org>; Sun, 23 Feb 2025 06:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=//C0ov9fjAmt3m21hJ1m/em4v1MGRgrEm5gu1UxYWrg=; b=fdCLMOeyobYx1F
	tYi6FGEOUBoTQssJsMbD5OhDqvkvMFuXRLa/YnNEUaYZT3tv+dOilfPHJWjyQg9rB9ub9/DgXs21f
	11hGffICE7JtSBc/YQ6vBFhPft82MwjA1BGPIo3kUFqfiIOBz4Z/fXOn1hDz7BMA4J4+laiynoj8o
	6UUO5J7zroYXglMvmfKzzqMnHqw0Z87OryQgoo2XJ0rhv2GxJEYNHU1zdQDoFxqqyS6cnrUWffJh9
	+Z+cDjZ3oidSVEdtZ6WPfpCCYAJvu6fTBG7F9/PaNQVEhcCzdwNc1sxikiBniouS0EAXmpQxdyDUh
	m6iMN0GQnt0lM55noy8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5nr-0000000AXK3-3Z1q;
	Sun, 23 Feb 2025 06:49:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm5no-0000000AXJd-368h
	for linux-mtd@lists.infradead.org;
	Sun, 23 Feb 2025 06:49:25 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1713612f8f.3
        for <linux-mtd@lists.infradead.org>; Sat, 22 Feb 2025 22:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740293363; x=1740898163; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HHaUx5KktsdgA0Sl0DqP/e15F+R/KAQTbOxMnc+xT7Q=;
        b=tW8IdhdgCIILR3gG6W0REG5yP3EFObQcEw4MS9mBEdp7AVGRWBj4G2+wvRWFctt6vE
         5XuStFjMI2Tsv8l1nO+tK/Xq8H5+7TCna3pemiaWoAGXENmgP8CPEn4qn/htpDdYHK/g
         CRP8hBlBKS2XHtzwVm7RR2yHE3FT12d9vP75tAm18KliDocSrqQ0bT6yLT9tDoyx7IRo
         SuRLcTbAQBwPvFISda2kk/o1Or3LKs7axyEK3NLPJIHN6qd+Yo0w+9jkdx7IgtPAVQk4
         GPwO/wTaToYQ19452HshXVThDtapcunALuI9NdaIiQWoTxywYj/68F8pmRmabUlKrIS4
         PCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740293363; x=1740898163;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHaUx5KktsdgA0Sl0DqP/e15F+R/KAQTbOxMnc+xT7Q=;
        b=nNxC/cpmTFGsQeSYKgpWJxWXYsrkddY+kKPZ2SsjcEghneLk/abgumtkEt31XczkYx
         1rvSbxbPzqcresyrelNghKvIzirAE923Sb171MbNUHiuCSt9Lio1k9US46JXnpA704jH
         cLZLakILreRraELbLiXY8xlqLdSyyhLOr18tvmvGFhRYnUzWdS8bNfk1BCBiPCdWkQM+
         eaKRNndyYEkbXS/oKmhH2hT94i9YtdCrP3WZFvNecYBDsSEQcgJGW3rAqi0yUYgQovhW
         0TWGyzf+ZdJXst/8VcZKv4veDX+PkLJ6HXcTXjwyXsu1T9WD6Q4y1TO8+VdhjINp/rpn
         iuEw==
X-Gm-Message-State: AOJu0Yy8ZM/uYnTnU/VN0UGXtPVwBrXfrZ1fBR2YsuPEtbyGD4ggoB5D
	FEUZTfNBvyLeyW17tcHkAadclEZTxee4cQEZQfWsPymWJbD/q8FyHYdRaEb8E9c=
X-Gm-Gg: ASbGncvQvY3fQ+0waaL4ek3JUOQ9jHrR0ydCP86i69PAQo01BhKFQxYdcvvB8FjrhFR
	Ciz0oG4UfiKhUE1spIRjeavjOVzLA+JswWS2Hc0jM+r5qu11cHHpGzCi24AlUU/lNZmWAv0Lgik
	6tGs5l/pDghaZYsqzT4gfDPk4B4UKkBqgjdCPBoOH+LLW2z4+4LVlWp+vIZzVYpNvRP3V5qxF5D
	1qTRhjlDK5cD9zX8wg3ODjfeXoXKWK4nTPxp4UlSX7DjkZrtAgYt8QBVZk2YVOOvZvX+UNQ4nvD
	e4qNU6n3UajDJhHI8YOTiOguU0ca2db36QhlR+Wwc+TRECCCfival8ex+UXJMvvTHehZbuLA+5X
	EVBJIfQ==
X-Google-Smtp-Source: AGHT+IGXGcm4VljijD4pXFk056tlsVgzjM+6og539uN649E+iow88gvaZwo/9ZveWnY2W90sEPVm2g==
X-Received: by 2002:a5d:598c:0:b0:38f:48ee:ddb1 with SMTP id ffacd0b85a97d-38f6e95d5e2mr10084368f8f.18.1740293362786;
        Sat, 22 Feb 2025 22:49:22 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f64b0f565sm9517570f8f.51.2025.02.22.22.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 22:49:22 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Sun, 23 Feb 2025 06:49:17 +0000
Subject: [PATCH] mtd: spi-nor: explicitly include <linux/math64.h>
MIME-Version: 1.0
Message-Id: <20250223-snor-math64-v1-1-8c7653111356@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOzEumcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNj3eK8/CLd3MSSDDMTXYsUixSzlCQj80QTIyWgjoKi1LTMCrBp0bG
 1tQB6XFgNXQAAAA==
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740293361; l=1375;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=IrXufjhrtURNRtePzuFrUi3VXTx9hYR1zzTLpU4TGdQ=;
 b=crKQ/XDwuTSl008vBr29zYajmXhqcWOZjEjHLb7QU0d8jFL6mrUsGKME6beiK8SuBxYsPd9RI
 U6zsF201b9UCH1O3HoG93JVWpC27CZ3Yrhf4dptkHXvGBsJXJGp1TBP
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_224924_817367_0C0EDFCC 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

swp and otp drivers use div_u64 and div64_u64 and rely on implicit
inclusion if <linux/math64.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/mtd/spi-nor/otp.c | 1 +
 drivers/mtd/spi-nor/swp.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 9a729aa3452d..7d0b145d78d8 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/log2.h>
+#include <linux/math64.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index e48c3cff247a..9c9328478d8a 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2005, Intec Automation Inc.
  * Copyright (C) 2014, Freescale Semiconductor, Inc.
  */
+#include <linux/math64.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/spi-nor.h>
 

---
base-commit: 03e7bb864d9a9efca02743d4a9fab8f3d0b00407
change-id: 20250223-snor-math64-8d8d6db27a42

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
