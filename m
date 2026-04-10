Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840CAF459F7
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Apr 2026 17:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=buySzEkwnmwEk8/8kNeMB3bL0Cq/jXy1V6SlJrJqtaI=; b=GDOWuc2hsIvt10
	ny+l0HhbwpiYKWKLYaTxBG+92MwsNOQ+/lBKzsMJQ3nCNu3azSSdJpD72oHGG4h26LBWUnhVPaQGd
	WoLJ+rWupucrxSDw2La8iXzGTkdttNvzNyZOEFNPpPhjIgw0V6wiWmo0U1JBdOVmzaladG9Ev4hlU
	CrwvKTmAkLpFkeIoI14peOSd4LSjRAc9sqNP9qrmubwRMTQuoVDcIa6xZLcQ5a49nP//xoKrk/muT
	P6/Wp3DBfVZj8CSyh6BHVlVm3IRZzBxMnKslEHZjtVCk3F+j5uXUkAg/RyGJ/I7Q4mEV3vkmmPmov
	thXnBvcRvexMBNdZG2zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr9-0000000CdRz-2JAR;
	Fri, 10 Apr 2026 17:41:23 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFr5-0000000CdPn-48H4
	for linux-mtd@lists.infradead.org;
	Fri, 10 Apr 2026 17:41:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 881AF4E429B4;
	Fri, 10 Apr 2026 17:41:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5EF95603F0;
	Fri, 10 Apr 2026 17:41:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7639510450087;
	Fri, 10 Apr 2026 19:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775842877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2AC6qYaca5YIbXnwFi4AJhlPo8WH9aZ0yyO5uwUoPUg=;
	b=COUm0kju/z4kounke5nkPkUbc2iDip1hKvyMU9ThOfb6jduocKZ2+iRGdV+IO541mLXQMO
	TY3rpGKID5axBXVIDek0Qzn8Kf9r3c2WLVvyyYruFCFh/wHmfQFvcsS68VcJWQ3+0LMTxk
	Gr0NgenSplV/EfP3kQ4JpnwAEG1dd8kyk5S/dvJPp6LZlW01B5yc4U3xLuh7zpcUz3CBaD
	fLCx+FCFGe1wWNq1p38QrLiQ/J/o0GzLn6JiJYikU+gYqDzcxpaPLFdv/kfvJgUEe7ezEE
	xja0RYFQugTkG4MtV60mj6sdqbSW1OOECiF8gqZ9O/s/fTsrcqFL4RXvAfm1xw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 10 Apr 2026 19:41:02 +0200
Subject: [PATCH 2/5] spi: spi-mem: Add a packed command operation
MIME-Version: 1.0
Message-Id: <20260410-winbond-6-19-rc1-oddr-v1-2-2ac4827a3868@bootlin.com>
References: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
In-Reply-To: <20260410-winbond-6-19-rc1-oddr-v1-0-2ac4827a3868@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>
Cc: Steam Lin <STLin2@winbond.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_104120_169609_DB7EB455 
X-CRM114-Status: UNSURE (   8.21  )
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

Instead of repeating the command opcode twice, some flash devices try to
pack command and address bits. In this case, the second opcode byte
being sent (LSB) is free to be used. The input data must be ANDed to
only provide the relevant bits.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/spi/spi-mem.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 5774e554c0f0..f54c708f4c50 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -28,6 +28,14 @@
 		.dtr = true,					\
 	}
 
+#define SPI_MEM_DTR_OP_PACKED_CMD(__opcode, __addr, __buswidth)	\
+	{							\
+		.nbytes = 2,					\
+		.opcode = __opcode << 8 | __addr,		\
+		.buswidth = __buswidth,				\
+		.dtr = true,					\
+	}
+
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
 	{							\
 		.nbytes = __nbytes,				\

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
