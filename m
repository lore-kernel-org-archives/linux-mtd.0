Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9796ACD3442
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2026 16:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LRP0WUDZo1MZerWGA0VUBU1ZOCtC6BM5I7nXtOrZQX8=; b=RRRplMPTV2FFNe
	Bk66m8yvAGXwfX9fTn8+KdpX+5Ep7+nq64NOemev9JD5No8WbB5RmOqtfTIF7vBFWDBIoLjIAT8Rb
	Kq9HCr8qgofzJ/+Dvxoy2lxsPCIrCSC/G8a4Qb3u9BSTr4ZEsB2Cn4c53awUQffAKQwkNTJYxCh7q
	n0Oj24qjNR8vt8Nny2jROH6SBt3+FuJfKhZOuqRRfxN+vyW9u9eBp+e9ybkSKgAVLwk4RW867y6G8
	T4knwQs99CzVqrdPT2RihvQiQjGSuvUXLRV4vtHc/JpOEuqhLMw2ubt86l2Gy9naWJ8uKDZlXSzRG
	KXMf4Tq6/jX48U7U5Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1tH-00000004O7T-1Pn5;
	Thu, 07 May 2026 16:47:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1tG-00000004O5P-1e6M
	for linux-mtd@bombadil.infradead.org;
	Thu, 07 May 2026 16:47:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=tZrjKlrSTIx0EpT8S91i2zZxREgNAGIUjyhXtv54w/g=; b=Tlk2oZLkBwLblP0oLP6vXY9EE+
	X5F29arAyoUMIB574KRjkOkj2I+51R80NHolaD9Vyf4qBkWpVjt7R7Z+GlvdAKHobbxjRo+HN7qbq
	JAbgAwFpnyKTr+oBynIy2nFUKB97NcURlQhrvRhIGFOGh3AkNggcCLkdMURG7gT4dsTR1e4MTPEDS
	X6rZf7HnncdwgJLAnbIfOqsShWaNK3bLlA1y7YyykBZQ7bY2Zaq53yq7NMDMTVxnyOrrsTs2vKOwW
	WmwOdswF2dGOLsFQK9mhkhMQpjFz2U8PPL5Du4HJaKanGvPd8Sr3/TyZ/AzSaP3F0fwV9Qf7mq7Y4
	MXUvqleg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL1tB-000000035aK-3SSD
	for linux-mtd@lists.infradead.org;
	Thu, 07 May 2026 16:47:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 63C7B1A355D;
	Thu,  7 May 2026 16:47:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31FC7605CF;
	Thu,  7 May 2026 16:47:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2856A108194ED;
	Thu,  7 May 2026 18:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778172465; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tZrjKlrSTIx0EpT8S91i2zZxREgNAGIUjyhXtv54w/g=;
	b=mYvXZdy8urt7OjdZ5yUP+KbpFc+fDEFrhM0yjtEhBT19fVKAnPtcI2Ni6A2QaIN1+GXEhn
	wy9gzxJ1MqCzQQtqERtht7A/B6yBofBfP8BDn1cohGMkQqcq1LCPF+gsWmVRO4RlbtMrXn
	80JuZZBSncYuwUpmJykMVxiaC6/U6WrNxevVZfEfoE4y/SLi9wdUQpG+oWJeoFdS57xEZH
	IP4IOGM2xEuURMMEG/nRKWgsLC9OY4uxxVnOBu1BpA2Zte/4gSTUMe2A2eO0LxB6eUE288
	bJCFUf8uTUZz0eydFl9s+37noV7rmMeaVJLEah6t0QcCsW2R8bY0j1D4lN68yw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 07 May 2026 18:47:09 +0200
Subject: [PATCH v5 28/28] mtd: spi-nor: winbond: Add W25Q02NWxxIM CMP
 locking support
MIME-Version: 1.0
Message-Id: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-28-93453e1a9597@bootlin.com>
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
X-CRM114-CacheID: sfid-20260507_174754_330544_BCA17817 
X-CRM114-Status: GOOD (  12.67  )
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

This chip has support for the locking complement (CMP) feature. Add
the relevant bit to enable it.

Unfortunately, this chip also comes with an incorrect BFPT table,
indicating the Control Register cannot be read back. This is wrong,
reading back the register works and has no (observed) side effect. The
datasheet clearly indicates supporting the 35h command and all bits from
the CR are marked readable. QE and CMP bits are inside, and can be
properly read back.

Add a fixup for this, otherwise it would defeat the use of the CMP
feature.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Test run with W25Q02NWxxIM:
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 $bs $all_but_one # all but the first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0000ffff | unlocked | 1
 00010000-0fffffff |   locked | 4095
$ flash_lock -u /dev/mtd0 $bs 1 # all but the two first
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0001ffff | unlocked | 2
 00020000-0fffffff |   locked | 4094
$ flash_lock -u /dev/mtd0
$ flash_lock -l /dev/mtd0 0 $all_but_one # same from the other side
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffeffff |   locked | 4095
 0fff0000-0fffffff | unlocked | 1
$ flash_lock -u /dev/mtd0 $(($size - (2 * $bs))) 1 # all but two
$ show_sectors
locked sectors
 region (in hex)   | status   | #blocks
 ------------------+----------+--------
 00000000-0ffdffff |   locked | 4094
 0ffe0000-0fffffff | unlocked | 2
---
 drivers/mtd/spi-nor/winbond.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 3a3b7f2f1659..8ebdbcec0b3f 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -379,7 +379,9 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q02NWxxIM */
 		.id = SNOR_ID(0xef, 0x80, 0x22),
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP,
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
+			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
+		.fixups = &winbond_rdcr_fixup,
 	}, {
 		/* W25H512NWxxAM */
 		.id = SNOR_ID(0xef, 0xa0, 0x20),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
