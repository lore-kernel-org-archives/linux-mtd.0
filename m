Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2677C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 06:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PwGdz7s30XmPBdA3rHXWJ4kI9aC5U0xYLd+xSA+apiU=; b=Vejgd0CB/AT8r3
	d8AZIHSCGWVxZlOfZJoUGWHkjT3VWNngC40n8UOBcqvizlxE1H6xPig0e7VDL5IiSxY9O7Fqna/Uc
	UfHzPc4Zhg80TvUyFNeloPWIk0MWGharsV7h0pX5ILueswmcAOB38nBKUPnd2W/P/KBVMDOBP8td4
	d0lXcw+9M2dPgZwjV3kw1zd2d6cgr7iLIuyehD4acPv397poP5i7y9iil8i9vPUuJ0yixmRgD0gOG
	EOnRN9v8xPBEiC6j5I++53sP8P0JbYFylVjIq/juZkNFMPGnl6QZr74VtqFk49/Eb0ADgfB89cIXl
	OI2XLnNUTWkUQHRYabjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDjT-000qZw-BF; Fri, 13 Jan 2023 06:40:07 +0000
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDjR-000qZP-4T; Fri, 13 Jan 2023 06:40:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Stefan Agner <stefan@agner.ch>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: vf610_nfc: use regular comments for functions
Date: Thu, 12 Jan 2023 22:40:04 -0800
Message-Id: <20230113064004.24391-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
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

These comments are not quite in kernel-doc format and they don't need
to be, so just use "/*" comment markers for them. This prevents these
kernel-doc warnings:

drivers/mtd/nand/raw/vf610_nfc.c:210: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Read accessor for internal SRAM buffer
drivers/mtd/nand/raw/vf610_nfc.c:245: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Write accessor for internal SRAM buffer

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/raw/vf610_nfc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -206,7 +206,7 @@ static inline bool vf610_nfc_kernel_is_l
 #endif
 }
 
-/**
+/*
  * Read accessor for internal SRAM buffer
  * @dst: destination address in regular memory
  * @src: source address in SRAM buffer
@@ -241,7 +241,7 @@ static inline void vf610_nfc_rd_from_sra
 	}
 }
 
-/**
+/*
  * Write accessor for internal SRAM buffer
  * @dst: destination address in SRAM buffer
  * @src: source address in regular memory

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
