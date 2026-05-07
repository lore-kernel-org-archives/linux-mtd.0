Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F272CD3446
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKfkOVmKsrXA/5ApQUBgODZKMghL/1VPNmIhu7/GKIA=; b=EwvOz5L9HVeP1Y
	zS0m31Yylg7tgiXc4opYGxOQReQG0VEE01uiE5z/K5XObMZ1lRGo+P3QYsnYBJRgXLoU8mtfzw+Qk
	VX9e9FAS6hqdhS6OIthrn1r24057la4J4UWwcjnGLZIVaOzv8jqwB27bA6+q81axK+xuMWBQ3EGgq
	vAhc8Cs8KaeZ8UJlNXkrMHlBmq1K6fU7jUBwhFu1dsP7Wiur2Wvsw16HvNjsZVoezxE0STuCsMlvE
	Gl6Wr9VfFxACpeWF3lDD8kKqYefP6nfjk/yWFdLGOy+XjzAlH47S+zakNBzEKLRCPrzBw9dhYQyX8
	aa9ECCO76+lNzZgroz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sR-00000004Mwp-1bSA;
	Thu, 07 May 2026 16:47:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1sM-00000004MuS-40CP
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8B0501A356B;
	Thu,  7 May 2026 16:47:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59213605CF;
	Thu,  7 May 2026 16:47:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4514F108194A8;
	Thu,  7 May 2026 18:46:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=r/I8HpmdlgiZEDA4JzntxIQZil5h8OVsqG1FV3N20+g=;
	b=dcXqUxO2tgoi2qQeatUweuEc3whB+18tPx9IUiJ/OnXR7WUd12k/11SZ2tHzoW6Waq9lqo
	qn/+d6PfFZnHekXaAqy2nl2SC+9Snr6iOHT0EV1Hoho+L1i0OndrLaf136lD6y22VB+AGM
	N9+m2za0qwGZSgAFAx3Et6nYfMLZ1dm9g0cDFqOjLYqVOciCCg8WIt1wWBucVyCQTfA3Ct
	ymk7iysyd6aHVle/0N+5Z7zRdUsMW0iCF+dnqzWr5bs/CD5qJQnJyvhhi9bJbfNMXf00L/
	VNpOvJKPHtIkiCV46EeBds4b/iSHkJ42kO8uZX++PfGbOcwWaUY9JXz55aHQaA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:46:44 +0200
Subject: [PATCH v5 03/28] mtd: spi-nor: Make sure the QE bit is kept
 enabled if useful
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-3-93453e1a9597@bootlin.com>
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
In-Reply-To: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_094703_133152_F2D2A7C9 
X-CRM114-Status: GOOD (  12.71  )
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

Not all chips implement the 4BAIT table which typically indicates the
program capability, while many of them do implement the relevant SFDP
parts indicating the read capabilities. In such a situation, programs
can happen in single mode (1-1-1) and reads in quad mode (1-1-4 or
1-4-4). For the reads to work in such condition, the QE bit must be set.
In case we later use the spi_nor_write_16bit_sr_and_check() helper with
a chip with such configuration, the QE bit would get incorrectly
cleared.

Make sure this doesn't happen by keeping the QE bit under a simpler
condition:
- the quad enable hook is there (no change)
- and at least one of the two protocols is based on quad I/O cycles

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 5dd0b3cb5250..394c27de02d6 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -869,8 +869,8 @@ static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
 		ret = spi_nor_read_cr(nor, &sr_cr[1]);
 		if (ret)
 			return ret;
-	} else if (spi_nor_get_protocol_width(nor->read_proto) == 4 &&
-		   spi_nor_get_protocol_width(nor->write_proto) == 4 &&
+	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		    spi_nor_get_protocol_width(nor->write_proto) == 4) &&
 		   nor->params->quad_enable) {
 		/*
 		 * If the Status Register 2 Read command (35h) is not

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
