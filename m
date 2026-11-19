Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFB3606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 22:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r+/hkayN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2BQVFObA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7kra8a/HHtT/+Pg41t2dRwlPqHMAFck21ULypr1m/Ms=; b=r+/hkayNl2YXgFG4LlmX7K3VU9
	Ay/E/BnkPatWecaU6FVIDjdluvlkLNdPtEOEcHBUWO9aFLC32fEI/ZJzJGM1V+aXwhsfHqfpyC4dV
	KX6Ju6Z+JXV/1e273JmBk/mXMa0CDRQeL3xgd0L7SAlW82B5LOEImtjMt2e6r2vi7K9peu7vqpjz+
	NnQ4bsMmTEmiO6QZ1uZx/sdP5BCjARIzD9adjPT7pZNe1ibqesq7wf/A/0SrtL/o1bx9jRoCjkOKN
	DnYxuwvFOZMSsuL8cecrsEy1QCFXb33aJdYiVQGzTLrl+W3hqrDKD36egsYZt4WUsLL3tOF9I+h26
	DeORc2mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOf-0000000DYLs-2Yct;
	Thu, 19 Nov 2026 22:14:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUAOd-0000000DYLB-1j6S
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 22:14:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D0A8C2F4C7;
	Thu, 19 Nov 2026 22:14:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A378E6035B;
	Thu, 19 Nov 2026 22:14:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DDA4B11BC0DFB;
	Thu, 19 Nov 2026 23:14:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795126455; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QUhDIKa/sqfQRowaGrbQDBdkAr5ivf2TV421uK0bqak=;
	b=2BQVFObAwb7foT8q7P8Uhx8Iqr69QEuila1vxzLrlqOrhOz0wchEK5miLp0mq7IOFux8DK
	jQ8TbacyPas5yu5p/f1Zts7uim7ghTa5ogDb5ZihYp2gMkw0n6u9kM7PxjhMfQXR2wWbxn
	c9UuxjHVbqlCdFi+cQqulUhc6OJceBcA9cgEF8Nti3zn/VevkBwHFy4cmgwf7NopIDv2iG
	Bl9AIFXokuKQg9OREXnLe7Okn/2d+R1MIoH682EHR2+GhFz5jFMV5YE476QeTATHVcVYsz
	qeLAE9y7T8CuIeTRJlOpg58B6DKy/IPOLOAYEq+bBy6j5Xa2BqY2iJeqMWqXHQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 19 Nov 2026 23:13:51 +0100
Subject: [PATCH 1/4] mtd: spi-nor: Return early in the non-RWW lock paths
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-macronix-upstreaming-spi-nor-rww-guard-v1-1-da72ad9c2d4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20261119_141423_611044_5FA176C9 
X-CRM114-Status: GOOD (  10.65  )
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

Return early from the non-RWW path so the RWW branch can later grow.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index a04d22d2e2e1..fdd6ff1e0aba 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1224,11 +1224,13 @@ int spi_nor_prep_and_lock(struct spi_nor *nor)
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_exclusive(nor));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_exclusive(nor));
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1298,11 +1300,13 @@ static int spi_nor_prep_and_lock_pe(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_pe(nor, start, len));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_pe(nor, start, len));
 
 	if (ret)
 		spi_nor_unprep(nor);
@@ -1374,11 +1378,13 @@ static int spi_nor_prep_and_lock_rd(struct spi_nor *nor, loff_t start, size_t le
 	if (ret)
 		return ret;
 
-	if (!spi_nor_use_parallel_locking(nor))
+	if (!spi_nor_use_parallel_locking(nor)) {
 		mutex_lock(&nor->lock);
-	else
-		ret = wait_event_killable(nor->rww.wait,
-					  spi_nor_rww_start_rd(nor, start, len));
+		return 0;
+	}
+
+	ret = wait_event_killable(nor->rww.wait,
+				  spi_nor_rww_start_rd(nor, start, len));
 
 	if (ret)
 		spi_nor_unprep(nor);

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
