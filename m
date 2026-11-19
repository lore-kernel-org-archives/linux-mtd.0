Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B417606A330
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bgaBVumc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s9rSxsnZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wDVeamsmYCcKsGdCvlDohTMiEEW56R7UCgtK5AEBUug=; b=bgaBVumcr8SUN//X3X9kGZapSs
	1hXbh/Z/wEfcK9ErLnZkhXzfqH4B3Wc+MAQt0BUh8Q0c65rnLEcgl+wsZFvFI649e7VZfgs22ZN4s
	am6kJYH5g1gqnQ4AwRZ6lx9QE3Cpu22P81jaoRmpIGehErvjSOSvWAeOAblSWPFHK4B9VXt7bkLEK
	kSbxHwfhpSEABDw9cYfFnJbqNMrJ1SuNKij5cUyihVAd8uxf+GQTSZ04nLiu4gAMopenK4TIk1M4l
	8JPCW6JVu6MiHBzlkWGP3Eo012StKB+vG4hJL5/BwT5Sv8pXR3qEh06/U100LebPqeGeRSmklYF+F
	rKJfxJrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOr-0000000DYRV-3gBy;
	Thu, 19 Nov 2026 22:14:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOo-0000000DYOs-0jUy
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:14:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 925584E41676;
	Thu, 19 Nov 2026 22:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6008F6035B;
	Thu, 19 Nov 2026 22:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D12911BC0DFB;
	Thu, 19 Nov 2026 23:14:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126467; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xZkfdjAIZ0vpg4kWbY88M4W9C6pU2KjaBqMb+XKfG0Y=;
	b=s9rSxsnZZpm+nMGo3cYu5zJMPVytz+74i7ANTtgVZXri8EZ1zpNnIA5+yZzDmr09DOor5P
	rsrZFvgeUjkzy/7K9WxSehM/pqtMhtU/YzZzKt9O4PM51GUwedJ07t8wTyOGAW3YsZApl2
	UHl4hKeBd/RqBqWPRaaEOaZ9fLbtC3Plj/56Xz02/pzunmCUy8857vQ1AJ/KKSk2XwN+mV
	AM80ttvQYYDIcPuts8ce+YfhZTLtKl9Z9ZrI53NNLSyopZDxTVjm/iEyR1oJlDJcrlOwC3
	sODzc6x3UaTXmHanR6n8W99bHdl3wzUH1oczDrzi2MKEA/e4Xdk5/GRMLfr7Rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:53 +0100
Subject: [PATCH 3/4] mtd: spi-nor: Keep RWW wait conditions lockless
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-3-da72ad9c2d4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20261119_141434_506240_AC6D20D3 
X-CRM114-Status: GOOD (  14.98  )
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

The RWW start helpers are evaluated as wait_event_killable() conditions.
The wait_event sets the task to TASK_KILLABLE before the condition
runs. In those conditions, a mutex that cannot be acquired incorrectly
overwrites the state to TASK_UNINTERRUPTIBLE for the time of the sleep,
and then the TASK_RUNNING state set back, which makes the next
wait_event() schedule() a no-op before retrying the loop.

The issue is also visible when enabling CONFIG_DEBUG_ATOMIC_SLEEP, since
the mutex acquisition calls __might_sleep() which triggers a "do not
call blocking ops when !TASK_RUNNING" warning in this case.

Since only the state of the banks must be sampled in the conditions,
rework the wait sections by creating a loop waiting on non-sleeping
conditions.

Fixes: 74df43b3f626 ("mtd: spi-nor: Enhance locking to support reads while writes")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 80 ++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 7394c9a17334..d46c18e4401c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1166,6 +1166,45 @@ static unsigned int spi_nor_banks_mask(struct spi_nor *nor, loff_t start,
 	return mask;
 }
 
+static bool spi_nor_rww_no_ongoing(struct spi_nor *nor)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	return !READ_ONCE(rww->ongoing_io) &&
+	       !READ_ONCE(rww->ongoing_rd) &&
+	       !READ_ONCE(rww->ongoing_pe);
+}
+
+static bool spi_nor_rww_can_start_io(struct spi_nor *nor)
+{
+	return !READ_ONCE(nor->rww.ongoing_io);
+}
+
+static bool spi_nor_rww_can_start_exclusive(struct spi_nor *nor)
+{
+	return spi_nor_rww_no_ongoing(nor);
+}
+
+static bool spi_nor_rww_can_start_pe(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	return spi_nor_rww_no_ongoing(nor) &&
+	       !(READ_ONCE(rww->used_banks) &
+		 spi_nor_banks_mask(nor, start, len));
+}
+
+static bool spi_nor_rww_can_start_rd(struct spi_nor *nor, loff_t start, size_t len)
+{
+	struct spi_nor_rww *rww = &nor->rww;
+
+	if (READ_ONCE(rww->ongoing_io) || READ_ONCE(rww->ongoing_rd))
+		return false;
+
+	return !(READ_ONCE(rww->used_banks) &
+		 spi_nor_banks_mask(nor, start, len));
+}
+
 /* Generic helpers for internal locking and serialization */
 static bool spi_nor_rww_start_io(struct spi_nor *nor)
 {
@@ -1189,10 +1228,19 @@ static void spi_nor_rww_end_io(struct spi_nor *nor)
 
 static int spi_nor_lock_device(struct spi_nor *nor)
 {
+	int ret;
+
 	if (!spi_nor_use_parallel_locking(nor))
 		return 0;
 
-	return wait_event_killable(nor->rww.wait, spi_nor_rww_start_io(nor));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_io(nor));
+		if (ret)
+			return ret;
+		if (spi_nor_rww_start_io(nor))
+			return 0;
+	}
 }
 
 static void spi_nor_unlock_device(struct spi_nor *nor)
@@ -1243,8 +1291,14 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_exclusive(nor));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_exclusive(nor));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_exclusive(nor))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1308,8 +1362,14 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_pe(nor, start, len));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_pe(nor, start, len));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_pe(nor, start, len))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1375,8 +1435,14 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 		return 0;
 	}
 
-	ret = wait_event_killable(nor->rww.wait,
-				  spi_nor_rww_start_rd(nor, start, len));
+	for (;;) {
+		ret = wait_event_killable(nor->rww.wait,
+					  spi_nor_rww_can_start_rd(nor, start, len));
+		if (ret)
+			break;
+		if (spi_nor_rww_start_rd(nor, start, len))
+			break;
+	}
 
 	if (ret)
 		spi_nor_unprep(nor);

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
