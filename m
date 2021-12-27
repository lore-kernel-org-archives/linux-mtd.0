Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110C2C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Dec 2021 01:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ipXxeMn5ajJqWlS6PulCJrtGsXrJS0W7Tz4i0q9/rLA=; b=pUz5PG7Ur6Nj04
	DEF/ZMbdDOG9gvH72A+RhBMSNJLZ2t1NqCoagsKworyYRL3dAsctOp+qyQKKNuTf1lzjtkeST3I5S
	7qDBdA6M+zZkp1zhlhnFbktSCUZYpzc8tMIOa6QZ2cABoU2EJloAFFx602YaDUx7IHk8zrIEQEyld
	+MRlojk9o60Rl08ZHWPWamxHbiLKjqZojkzEtAuRnV6BJ2H3xUvgdghEujCYi7D810mfZHIp11W6/
	zgmAOGotb/7bIC+NguKW9awUTuKhVLtXX578Mj6QTtZKVQFNJrEwOE3UiZlMMuBM1GviFVUy8CzQ/
	CEl8R1dPrJB/UEhh7Duw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1evZ-00Fzdt-An; Mon, 27 Dec 2021 01:35:53 +0000
Received: from mail1.systemli.org ([212.103.72.247])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1evX-00FzdX-3B
 for linux-mtd@lists.infradead.org; Mon, 27 Dec 2021 01:35:52 +0000
From: vincent@systemli.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1640568947;
 bh=pBGw2in93wvElXpOJ5wOGA09re3QZeq3M/lNxQ0hx7g=;
 h=From:To:Cc:Subject:Date:From;
 b=Lmnf7WlqSLYom8CR5j04XTHN9rowQvjfxUTuufdiRdcDuwyaUXo7FyNcVFjTFkAbw
 NoPZDxF0c4sif73g/qHLjy4L03MK5YRL22smPa0HFoCDVvH6bnbISzXUmnjUFo4WSe
 SeFtLTyVfYUtNnDZXdFDYG/gzxYxKY3mOop/nj8dShu5q8Iv86Gfm9P6Lz9ms31W7T
 op52SXBtunx5TG/DQZ9Mp7rOUKwN/NQWT6hj+4Xud2343HNf1TTbEQ0deX/N0f2awq
 32GA8s1l1l05fdGChLjaWtscWLEepiCeNUzjo+0XGjNLTFFbA47m37MYAqSpZXLMha
 rVk9mT+bAM53w==
To: linux-mtd@lists.infradead.org
Cc: Nick Hainke <vincent@systemli.org>,
	David Bauer <mail@david-bauer.net>
Subject: [PATCH] mtd: spi-nor: fix reading/writing of MX25L6405D
Date: Mon, 27 Dec 2021 02:35:42 +0100
Message-Id: <20211227013542.1240124-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_173551_294539_BC76C148 
X-CRM114-Status: GOOD (  10.56  )
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

From: Nick Hainke <vincent@systemli.org>

Macronix MX25L6405D supports locking with four block protection bits in
its status register. Furthermore, the chip will not work with the "16-bit
Write Status (01h) Command". Add flash-specific fixup that disables the
SNOR_F_HAS_16BIT_SR flag.

Tested on Nanostation M2 XM.

Fixes: 39d1e3340c73 ("mtd: spi-nor: Fix clearing of QE bit on
lock()/unlock()")

Signed-off-by: David Bauer <mail@david-bauer.net>
Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/mtd/spi-nor/macronix.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 27498ed0cc0d..6dd148e9f660 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -8,6 +8,15 @@
 
 #include "core.h"
 
+static void mx25l6405d_default_init_fixups(struct spi_nor *nor)
+{
+	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+}
+
+static struct spi_nor_fixups mx25l6405d_fixups = {
+	.default_init = mx25l6405d_default_init_fixups,
+};
+
 static int
 mx25l25635_post_bfpt_fixups(struct spi_nor *nor,
 			    const struct sfdp_parameter_header *bfpt_header,
@@ -41,7 +50,9 @@ static const struct flash_info macronix_parts[] = {
 	{ "mx25l1606e",  INFO(0xc22015, 0, 64 * 1024,  32, SECT_4K) },
 	{ "mx25l3205d",  INFO(0xc22016, 0, 64 * 1024,  64, SECT_4K) },
 	{ "mx25l3255e",  INFO(0xc29e16, 0, 64 * 1024,  64, SECT_4K) },
-	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K) },
+	{ "mx25l6405d",  INFO(0xc22017, 0, 64 * 1024, 128, SECT_4K |
+			      SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP)
+		.fixups = &mx25l6405d_fixups },
 	{ "mx25u2033e",  INFO(0xc22532, 0, 64 * 1024,   4, SECT_4K) },
 	{ "mx25u3235f",	 INFO(0xc22536, 0, 64 * 1024,  64,
 			      SECT_4K | SPI_NOR_DUAL_READ |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
