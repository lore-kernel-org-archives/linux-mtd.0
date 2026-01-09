Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A99D26D7D
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Jan 2026 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+CoP4hvOB4hkI9ZLsDcQOXSB3ZmF8D2MiqKez6kI3Y=; b=jfeBKAk4dn8RTB
	z2ZBURFkZ+kLlbDBM7n1IyseLdCxQjqGTeMh7DHe4L9+G3iOw2szO54VBW+Olq7MnuGusdJ4O/HaV
	HSvJx/7ImnPm1U8vz+JRnK/ohe6ysBCgtT+APjbwFvj+qxBwRTBztDuI+9gesbrIY0A5wZfOTlOyr
	Nq1J0MPwWy/WLG34PlAUrXa13bulv9k1KzeDhVVk1lLR9NTspzoPXoKmwbXNDd1cMPs7iyTjc20nd
	EfjXPuN6AAY6uPbzUlDPKKvYcAaBxHoaeursOk8sWjz9P0UjSjG1NkFnN0hnHUs3QGGzgtC0rpSwi
	HEUVCYjo6DCSpN1zvjtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG88-00000002ltj-2HNM;
	Fri, 09 Jan 2026 17:18:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veG85-00000002lp6-0ovk
	for linux-mtd@lists.infradead.org;
	Fri, 09 Jan 2026 17:18:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 95BEB1A2753;
	Fri,  9 Jan 2026 17:18:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A94F606C6;
	Fri,  9 Jan 2026 17:18:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2028103C8956;
	Fri,  9 Jan 2026 18:18:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767979105; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ba70zlYcbz8QlJI8mSBGaiXcm4X/itTgn1V4VCKgo+E=;
	b=l4DhprWEs5zbKkrQZO+XkLm+NE+5V/RcLPIos0dLXX01VbFKN3IP/Ou8JbsNWVZ6tb/Tzo
	VwUeIRl6DaaNK6kH+bR6imsyI2XRXfADra4GhO29uRY4Lc7hfA1CnmvuB/uRz8AEN+JjUw
	ErTL8HMqvUTi2fAs0c6G2jjIPFfU+yLDoqh8nSRbdIcHGnffpScPTVduslqBfVMdV3bJoo
	s+PkqQyLIowQ5fgqwL//6Ng6yfoWktMK0gmrI/HRYSZV9aFIddGtzXq2frc6yk1SrY1IXP
	pFfYpJE+/M9A6jAFeICx2qynl2KrXmZS01+Q81XpmMnrD9WJv0KxBheGxOkeTA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 09 Jan 2026 18:18:04 +0100
Subject: [PATCH v2 06/27] mtd: spinand: Remove stale definitions
MIME-Version: 1.0
Message-Id: <20260109-winbond-v6-17-rc1-oddr-v2-6-1fff6a2ddb80@bootlin.com>
References: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
In-Reply-To: <20260109-winbond-v6-17-rc1-oddr-v2-0-1fff6a2ddb80@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, Santhosh Kumar K <s-k6@ti.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_091829_368509_26D9B34F 
X-CRM114-Status: UNSURE (   7.70  )
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

SPI NAND command values are directly included in the macros defining the
ops. These are stale definitions, they are unused so drop them.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spinand.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 049d55c38d52..ad2773f1f963 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -232,12 +232,6 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 8))
 
-/**
- * Standard SPI NAND flash commands
- */
-#define SPINAND_CMD_PROG_LOAD_X4		0x32
-#define SPINAND_CMD_PROG_LOAD_RDM_DATA_X4	0x34
-
 /* feature register */
 #define REG_BLOCK_LOCK		0xa0
 #define BL_ALL_UNLOCKED		0x00

-- 
2.51.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
