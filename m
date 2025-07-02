Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75295C83013
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Jul 2025 06:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=au2KEEi+/Ynm+gAkQP1AzaKcYd5ZfDduG7YubrMlTw0=; b=Fjvtmttbehz9Wd
	P3ENbgtK3UCLz4CUTskqyhuecoGlawwiq3gd1L5COktIuLEd15nC9zJb9p9tT6IVS1pNQSmY3WkPB
	S1zh44fQcuerfh+DN4cSFlMPXtpFd7fFkb0is83MBOzUi9p2TixPt/plEKkaF9FVyafQZxuLh8ptN
	6l/I/XwiVyPM5Mlq2k+YRu0rb6jd9m+es4IysVPZzY2yN7M4LzY97P7h2SBHYFQaMgtSnN0/qdEc5
	mxsHEcrSjj0Bh6zp0cZidUdcuoEr1h3WrpLFrxrLJvmwTP3BQMAUoVbyCKIb8uD3k0WtbAR96dXsY
	1oHttHojD5pqcH12BBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrKS-00000007Rjv-29CV;
	Wed, 02 Jul 2025 06:52:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWrEv-00000007RDo-1xH8;
	Wed, 02 Jul 2025 06:46:42 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso7240565e9.3;
        Tue, 01 Jul 2025 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751438800; x=1752043600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z44fZXCKQ2rdMNWqQElWdKkxsLIoVt0uR3JUXZYJwhs=;
        b=FuZjnL1vy4XdSVn1dL9h/y2eWcIWtPJVyxsKHRME2GFCZl36EoXdAmx4KIGTw3HuHX
         QILAGVH9D/Q5k83/bIH59NO761TDRqs8TzXNSlDWX1fdHvcI1UWHaF73hmpp+gwFRGrx
         Eg73te++FGIBxecxeWZ4vPRTm6ttoeEo4kgMKCbgQadpAfraCnPPqjpOIjpFUlO7tX/o
         uWjKd+TaTxSo5mpekYRpEvOBG5E7E8O8gqSItYz97n8JTm4dfCbcdFdaJ9YMWwbfiCqP
         2zBaeM6THsXTdRw7iwU/TEAAs1m8fcOsxck4E6NMZ6gyobWDS+7+DskySuO75tKi5tIX
         uuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438800; x=1752043600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z44fZXCKQ2rdMNWqQElWdKkxsLIoVt0uR3JUXZYJwhs=;
        b=tzjtIqKA0gr0At9FcYLmYDAr9AFjotweQ5VcJ3z97+Gs/h1PBPq7qdKXsXckjzCPGM
         Fntyl4dAVAA+ks6W1Bdp6efHpDd19NmN/XPLbabGGeMQHFTZ7uGMPk+8xBmWH0LLM9zp
         xdvbC7z7kdnZoEAqgn89iTT2NhogmNGsJ1w0Km65/dqL/C+5GbLEne9Ffo3BMiuwQw1R
         EL7k1blDEpbeOSWsni0lSDIKe9+AbvCkphlf9t3niE5BgLhiQ9l4wHceqyI4MEahwtvq
         uMFxrQRjnM6rAKn3TUBdoL6KQenifPQAz1kAV+A/n4k9k0vObCE5knF6mR4xKIWkuYPf
         diKg==
X-Forwarded-Encrypted: i=1; AJvYcCUPQgXtFjqkmNLSX95PuoK86OQ7AvwJtDn8bA8GMhctXyWCjRnNKYKoNVKKzQs1VPhwzQD2twCgJfof6FILap0Y@lists.infradead.org, AJvYcCXwWUeke4ftBSE93bq3Iabs3ciEmJY/nxXW26TdOgYPhNbMPQVa7WKHg2sPaE0UGS1X8Mg/G9bUcODJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyjUZiGIWH4Br6Xrw3nJi7abeMh/AwpbGhlLT4XPXK1CSYpWHnX
	YRJiCir0l7d78bERTmmQnh5cj1i2A0v3O0bFU7PhAlP+CVonLrMRhE0qUTg1pFpG
X-Gm-Gg: ASbGncsRmFb/Rr85X0ObUXghKSILuyH4EUqK4JnIkFzQ3WQ5eqx3Q7pEIG5S8FnMc02
	Bh463KbmHtOn9ngoMRZ/6BtisFJTZjNqhobSmECbozIeCaf/krw4nfEyS46KtjD8fFC2cbhfFuf
	6yJMQcsL86nYcayZ3Wwecd8Cv5EBCl9j3dwRLBnCuswDVr4oKs05xtcd0BWQaPLfsoKZxFyA6jA
	vCcoAHsxJ4hSEpomY3s2Xk92Ra8lKeRbNV95AXDhloENnA3Jy9eIgPUdomn8UohKn6TmHJxCfkH
	gxhWm4LD8LOWfH0H6A0GOAE3zSLvLTz/PmRLotiJ6SjcW1wpc8CvawNO4bPO3uMhvgM1LI3dzS+
	U2TS06VXRCCzp
X-Google-Smtp-Source: AGHT+IGEU3Ny06YRoZuAUkzUDN3QOXyRXaO7n1F+q8fEIPVppChrJnd6v3AlCTeUUNL0apHLFRr+KQ==
X-Received: by 2002:a05:6000:22c1:b0:3a6:d403:6429 with SMTP id ffacd0b85a97d-3b1fe8a00d6mr415529f8f.4.1751438799651;
        Tue, 01 Jul 2025 23:46:39 -0700 (PDT)
Received: from thomas-precision3591.imag.fr ([2001:660:5301:24:9d5:215:761c:daff])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a88c7fab7asm15156201f8f.24.2025.07.01.23.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 23:46:39 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Alexander Dahl <ada@thorsis.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mtd: rawnand: atmel: Fix dma_mapping_error() address
Date: Wed,  2 Jul 2025 08:45:11 +0200
Message-ID: <20250702064515.18145-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_234641_522187_D1DD1141 
X-CRM114-Status: GOOD (  14.45  )
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

It seems like what was intended is to test if the dma_map of the
previous line failed but the wrong dma address was passed.

Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1 -> v2:
- Add stable@vger.kernel.org
- Fix subject prefix

 drivers/mtd/nand/raw/atmel/nand-controller.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index dedcca87defc..84ab4a83cbd6 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -373,7 +373,7 @@ static int atmel_nand_dma_transfer(struct atmel_nand_controller *nc,
 	dma_cookie_t cookie;
 
 	buf_dma = dma_map_single(nc->dev, buf, len, dir);
-	if (dma_mapping_error(nc->dev, dev_dma)) {
+	if (dma_mapping_error(nc->dev, buf_dma)) {
 		dev_err(nc->dev,
 			"Failed to prepare a buffer for DMA access\n");
 		goto err;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
