Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC0EC88E75
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2026 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qva5TXfxv8LLDodNd1mOIDL8ZN4138oo9WQIm8Brzqc=; b=AmHOOzEF6BjOxx
	WE5bT/Ydg88Dlugd9CrBoM7CvbFKiVJw6mrdIo+6BCp5J/aKCs0iWVD9TmNVDy+CWWZySA5iCnkS8
	wBvKXWVPzXy/KRzB5xkn4wzM/ZQHJYzTTD/HD1ytTTRVXe4tobcs2Iy8Aoe6pBCiq2PcPTikj0X9b
	ftD3P9YLbJ0oeyt0Bq6j/qvjJeD2sfOgtVIMJKtOYXSZ0D6qi3o5bw48lyUKlGUnJtOMsIcdMq7pb
	F1jQpwAm0U+//aPO7QVCTII3+muMi1pYTOmI1luNjA8bs3MdWM5Qy94BrLK4GILlBMjH8RoC1V6NJ
	B7BDQnVb9OD4k+50sEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RUx-00000006G9B-0hqY;
	Tue, 15 Sep 2026 11:38:51 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6RUu-00000006G7p-1DQV
	for linux-mtd@lists.infradead.org;
	Tue, 15 Sep 2026 11:38:49 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71974de4so1042565e9.1
        for <linux-mtd@lists.infradead.org>; Tue, 15 Sep 2026 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789472326; x=1790077126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P5LU+QL611XVkEd8eqie07UbWEHcEKmuwpDc2acyE/A=;
        b=mQ/PVIreQ2JsMqb7Nx7w350sNtM35xfRAkEPCo5wthBKCLflJOm7aqqAVE5SSfXwHW
         ProSUMo7i62N//ec3M+KtWZ0YUIT6fablXWRaIjZRvQlOiLjvdgLIWQ113I7x8tmSC/y
         HXpEc07Sk8OY6BfQRryZ/gZ8Dnqr8juJsrECCHMwczquhCPMo0V4e6zU9Svm7XpIapv/
         benpAVmZ4GwJeESn9v7nWsSKHl8CoWI8t9+LfNOS3kaEN7qxgOmLETTIeoxnzj6dlqd5
         s6ZKiuRPZAF1CbrRA2q/aC2DTpLLWj8Y8AaFJx6zgFsCMr215GCtviB+IXDdWOBt+uKv
         0kwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789472326; x=1790077126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P5LU+QL611XVkEd8eqie07UbWEHcEKmuwpDc2acyE/A=;
        b=0Lzr3SAj4uZk8O6R4R3S3Cwg/fW0+09ZWF+JASHOurGhQ4zl3AktdwIu84Jpf8svE4
         x4xh7ZK+trg7HM8tjwTcp/QSb7h7yrGRhyjBeybSwYaPM4a9gXZB4DeGwhEUedFLtU6Y
         e8Cg9gr7gM5o0OJZ2SkcD5WkL2ZxH7A5obMKF3PMPa9k1dlQiSaoQjNcbt1eLYvRTzVG
         ynBTgHnZdeBxGvWyLgqUKJbIWPQqrBoa4uqwNA5mQOFJTP5cfpXE/6ZIMBNrX2fwPmK7
         ke5W+kAsjLs1nUCi0FyYS4QI7apE8GhJTzQVMDSHwBzxxlZJQtQgiI7WZXcJsbGnQHhV
         9icw==
X-Forwarded-Encrypted: i=1; AKwUvBwhYOQr1llX9/80OWhYMP7uSv5TS+hkUwEkakYyltcsH3dzWBsmAjmULgYNzQWtNVOh2BVH0k3mKbM=@lists.infradead.org
X-Gm-Message-State: AFuF++lcA6wwwHLig1CpAPjJOgdkI9FXcq5dNA8JXPrhDdDjcE1zME3O
	ojjtG6atoYLayr1cLu2y9YHU3Li7Qlo1vOpvm5ECVxsfCgH6oVrX7R23
X-Gm-Gg: AYBFou3HJqWvzdiXNVLRhY/gD+CWCACIm7CfgRe/vw6gnMiW5xrWCAjwFp2Lot0oRtW
	JMgktC5Dzwwx2onCybIO+DXxbhCmNviORGlh217WPbB/ZfSS4fj+tF9HRCoME9rx9sl7v+6IuSp
	pa4ggc5vomerNGYoxKMTyWE18WaCMuakWQvbCZIXEArHMXmuXQlqPp8rGWvI5EjR44h2wczWrPI
	jpvJimQ0Kjz+5mgAyo7z3zYbZ0EW68kWQiSpXnjDgYEdW1xZ0+fBRv00IK50SyPaN6NZEXGAdu7
	s9tmXTHKgAdI5kKYJx/olQVTM2z+G7LPWrgSF3vmDEiQ108dioV5F188SzrRBEDHhCrZoVeWKjH
	bSg+pKc7LERz5VbB3QeS3GdWRYRhMDyuloOhZOO1HefRw3nR8xLit0YMmKvjM4NDCTWguvJ4RFl
	CLBi5gzQkEpN9WiCJCv3MIFvTa1/vqKQvT59Lvcv+wgPCsejO3fzUmzKE1m5la3ZosBGPrNHOlG
	lGzlFztveDGs1ebUOA=
X-Received: by 2002:a05:600c:3b9f:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49e7a5f41a5mr97454745e9.0.1789472326047;
        Tue, 15 Sep 2026 04:38:46 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef6bbdasm53917485e9.4.2026.09.15.04.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 04:38:45 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	vigneshr@ti.com,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	takahiro.kuwano@infineon.com,
	Itai Handler <itai.handler@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] mtd: spi-nor: take the flash lock around spi_nor_restore()
Date: Tue, 15 Sep 2026 14:38:11 +0300
Message-Id: <20260915113811.2429311-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_043848_345884_C00BCB41 
X-CRM114-Status: GOOD (  17.00  )
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

spi_nor_shutdown() and spi_nor_remove() call spi_nor_restore() without
nor->lock, which every other path to the chip takes through
spi_nor_prep_and_lock(). Both run with the MTD device still registered,
so another thread can be in the middle of an operation.

A busy flash ignores everything but status reads, so the restore is
silently dropped and the chip is left in 4-byte mode. A restore landing
between two chunks of a read switches the chip to 3-byte addressing
while spi_nor_read() carries on sending four address bytes.

Take the lock, so the restore runs between operations instead of during
one. This narrows the race rather than closing it: an operation starting
afterwards still addresses a 3-byte chip with nor->addr_nbytes left at 4.

Fixes: 59b356ffd0b0 ("mtd: m25p80: restore the status of SPI flash when exiting")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Itai Handler <itai.handler@gmail.com>
---
v2 1/3, the spi_nor_rww_start_exclusive() lock fix, is dropped from this
series now that it is queued in spi-nor/next. This patch still depends
on it: it adds the first ->shutdown and ->remove callers of the
exclusive lock, so an RWW flash would deadlock without it. Please let it
reach stable first.

Changes in v3:
- Fold the spi_nor_remove() patch into this one, as requested by
  Michael Walle. Both call sites now share a small helper.
- Cut the commit message down.
- Add an Assisted-by: tag, as requested by Michael Walle.
- Drop patch 1/3, queued in spi-nor/next.
- Link to v2:
  https://lore.kernel.org/r/20260914081149.1916589-1-itai.handler@gmail.com

 drivers/mtd/spi-nor/core.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index ccf4396cdcd0..c891197ffa5b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3849,11 +3849,26 @@ static int spi_nor_probe(struct spi_mem *spimem)
 				   data ? data->nr_parts : 0);
 }
 
+/*
+ * Restore between operations, not during one. Removal and shutdown both run
+ * with MTD users still attached: a busy flash silently ignores the commands
+ * spi_nor_restore() sends, and a restore landing inside a read changes the
+ * chip's address width under the transfer.
+ */
+static void spi_nor_restore_locked(struct spi_nor *nor)
+{
+	if (spi_nor_prep_and_lock(nor))
+		return;
+
+	spi_nor_restore(nor);
+	spi_nor_unlock_and_unprep(nor);
+}
+
 static int spi_nor_remove(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_restore_locked(nor);
 
 	/* Clean up MTD stuff. */
 	return mtd_device_unregister(&nor->mtd);
@@ -3863,7 +3878,7 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
-	spi_nor_restore(nor);
+	spi_nor_restore_locked(nor);
 }
 
 /*

base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
