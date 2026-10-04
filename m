Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 144BCCA5FFC
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aG6BGGeyExRryGxtH5fzd8qLV2YxfBjDukvbNiRXw8=; b=WO7FzecINNk4r/
	HnYqKeNr4GWD4k7wATKxpeNgA9kZTPBhObGtc27hsCDVUo3NeCQgbG0lmUXPxxiSdtCe5Tj97xS8v
	Kq/O5ex2otqmgX0rB63zLcQCc99NmmnxviVBUkHkHN+0WEm8P36JAVPGbTCTxXUSevfkqIZhyDwYo
	Geu77HminFGWcX6qSGDf/b9YeUyWJ32xrj5qcdor++IKh9vtEzr6GlnudffGD7++JJmYRl0HuewAW
	jcB0lkk+3XdpnygVlDRWjU+fu5X2xOK3oUFbra71Fn6X1PYjX5R63ZPvgi9ij/jNtQOjRyFZoKAmB
	D6bejQGC3VLSJk0rlOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTo2-0000000FMZY-1tV7;
	Sun, 04 Oct 2026 21:31:38 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDTnu-0000000FMXw-0MdV
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9AAB81A113B;
	Sun,  4 Oct 2026 21:31:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D987604FE;
	Sun,  4 Oct 2026 21:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C25FB10328384;
	Sun,  4 Oct 2026 23:31:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0yk1JOJZFoVMiBC15xlQjxajHbRrIJKa+K6axnf23aY=;
	b=PQHu8oahjT/em0G2ssYf6se+/f+EyPwG3BFrVnhuO1+CYLhQ9MzNTPmJhzQb2+liqDDIMO
	AegMPoUkTeqEQ4iEmEr8DXrZJ6/Y5YHZgbCjbDjhHcXTgFQiCES4MjnV+mcGFJThb8JBsd
	tblklVgkpFMTcWnUGqktSxu+I3MqzIIf+cIvRLs/Ts2e5jdST6ihOy4FVuaGXTbPYLvneh
	tCQkmEH/f3OmGnErUAGOVQeTseZWxiQ8/spAT4Eihj28CZOEC6jwNhzb318nH9zfSul04B
	iLqdrAKs6pCAHBo6pkrn8HpiAE3ZYfyHCkhaakCPPN9UIy1dggMGRXYMVgSiuQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:15 +0200
Subject: [PATCH v2 01/17] mtd: spi-nor: Only switch to ODTR if the chip has
 a callback for it
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-1-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143130_293144_BCA084EE 
X-CRM114-Status: GOOD (  14.55  )
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

Every manufacturer has its own way of entering ODTR mode. This is
typically implemented by the nor->params->set_octal_dtr()
callback. Without this callback the core cannot switch to ODTR. If it
actually does, the chip will stay in SDR mode and none of the subsequent
operations will succeed.

As of today, any chip not listed in any manufacturer/fixups table will
get parsed through SFDP and operated based on the best compromise the
core can find. A chip advertizing ODTR support in its SFDP content, will
therefore be operated in ODTR mode, leading to a 100% failure rate in
operating the chip out of the box.

Make sure ODTR page reads and page programs are not enabled for chips
without a ->set_octal_dtr() callback. If they support it, they will
anyway work in octal mode, but with an SDR bus interface.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

I faced this problem while operating a Winbond W35T01NW SPI NOR chip
which supports ODTR and properly advertizes it in its SFDP data. However
it was not expected that it would not be usable at all without a vendor
fixup. This commit allows to use all the features available through SFDP
without the IDs being listed. Basic SPI NOR tests then passed and speed
was obviously better than when constraining the I/O lines in DT:

Before:
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16
 8D-8D-8D
  opcode	0x0b
  mode cycles	0
  dummy cycles	22

After:
+ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x13
  mode cycles	0
  dummy cycles	0
 1S-1S-8S
  opcode	0x7c
  mode cycles	0
  dummy cycles	8
 1S-8S-8S
  opcode	0xcc
  mode cycles	0
  dummy cycles	16

+ flash_speed /dev/mtd0 -dc10
not NAND flash, assume page size is 512 bytes.
scanning for bad eraseblocks
scanned 10 eraseblocks, 0 are bad
testing eraseblock write speed
eraseblock write speed is 802 KiB/s
testing eraseblock read speed
eraseblock read speed is 20000 KiB/s
testing page write speed
page write speed is 796 KiB/s
testing page read speed
page read speed is 9696 KiB/s
testing 2 page write speed
2 page write speed is 799 KiB/s
testing 2 page read speed
2 page read speed is 13333 KiB/s
Testing erase speed
erase speed is 445 KiB/s
---
 drivers/mtd/spi-nor/core.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..9c61ff4b93c3 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2991,15 +2991,21 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 {
 	int ret;
 
-	if (!nor->params->set_octal_dtr)
-		return 0;
-
 	if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
 	      nor->write_proto == SNOR_PROTO_8_8_8_DTR))
 		return 0;
 
-	if (!(nor->params->flags & SNOR_F_IO_MODE_EN_VOLATILE))
-		return 0;
+	if (enable &&
+	    (!nor->params->set_octal_dtr ||
+	     !(nor->params->flags & SNOR_F_IO_MODE_EN_VOLATILE))) {
+		struct spi_nor_hwcaps hwcaps = { .mask = SNOR_HWCAPS_ALL };
+
+		dev_err(nor->dev, "Cannot enter octal DTR mode\n");
+		hwcaps.mask &= ~(SNOR_HWCAPS_READ_8_8_8_DTR |
+				 SNOR_HWCAPS_PP_8_8_8_DTR);
+
+		return spi_nor_setup(nor, &hwcaps);
+	}
 
 	ret = nor->params->set_octal_dtr(nor, enable);
 	if (ret)

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
