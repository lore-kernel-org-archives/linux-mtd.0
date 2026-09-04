Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CFCC79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zp3ZsgigwWoJdJJr4gm4P/grgamVzrgZRU+X4JjtykY=; b=kU0z/IdXIgop5M
	Ad+zUaBJJ+KXxMkAgQT/XtLwkgkC5Ao6YNxSPwwEnuFYHR7p2VfR6AqPI6KvXf4Y1ffTCCM9aA6eY
	qld1GWeEz6Ej+EsbZUTBVbv9ODhTAGFVcIXPVNFsEoQoN+y8VLWb9KtZD5OuFuqGaxhueFBq3HtB8
	3SmkeMXILMWO97aVh1GOiEqvA/SeggPuXx4xhXkphtsFX4AAeaUxq7hqYZuuQ+/e/JhyfJLvaoItX
	Pfr0D7DFHUaW9NB06YLiic94BwHj8WWVkjLBIFPnnAlzK7H0VoGIbszeDh5dyhFMFqCw3lLkKIB1+
	Q+o5lvTe19f7OLuURzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZg-00000002r1R-2ycy;
	Fri, 04 Sep 2026 17:19:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XZe-00000002qxt-3tbb
	for linux-mtd@bombadil.infradead.org;
	Fri, 04 Sep 2026 17:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lKRhbRJg+gr+AbEi6Q5TLmP9Z6+0vw/SP2ZGFlS+B0E=; b=PDdovYP8sN/vbsII/yDm+pgnbU
	hpRBPGogoSZCm6Hk6g0StZpKVPqPG9pnbyBhT2kENSN5pr7V2YydvGdn2g6dPUpB1beg3Uvz1dajR
	JI+7W7ut1jGXNiBfwdrcKOBV1OwjBKt0kAUULtnwWxqsaNcGTpuCvBLuAZvzFmIX9ywy9QJvhS6sl
	ZcdybgjhtU53snR3nyBW8plnbWeCYmViTSSZ4Z3W6AgsLvnnKkExOYkC2Oj6ndsZHe/KkChW7cOUD
	HckB9EO+02CyLwyQVnVCMi0edC4cCjbS/yZSB8LKS6ItQ/BV66lvU7md9hB0/vX3BjRcPtr7pF+u6
	G4qoT4Ug==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x2XZb-0000000EKu6-3MVx
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:19:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 305584E41514;
	Fri,  4 Sep 2026 17:19:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 062776057F;
	Fri,  4 Sep 2026 17:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F30BA11C7A0C2;
	Fri,  4 Sep 2026 19:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKRhbRJg+gr+AbEi6Q5TLmP9Z6+0vw/SP2ZGFlS+B0E=;
	b=g44qHaVYaH1l3TjR5BTcEaeggGjqzCY1usOOsqSyIQjvu0dYFwJJrej1+7XXH1trbrTDe1
	Dz/Z9GlJp/5uLsldkHVE1sPhXPtS73HI/AfnpgBZq4XCj/cRPraWLyvP+TQBh8nY1xsrwT
	6j+MGXaaJLcwV6XW1pEDHAOzsl5/c1z6WS+3PSBq8dXj49MpYnOtjtSO6JI5iKXvi6dUGo
	sOFw88PXbUjHCf2w2r1BUaeBGjerpA6pQ5oU9mS6TXBNcQcaj8acuElbnGA+RCkSehI79+
	L793kMBy/4YQFsUnzH4tij/WGZLeH6wd7Yl2O9kB9tU59QbTFJRIddNbCq2gPA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:19:05 +0200
Subject: [PATCH v6 12/26] mtd: spi-nor: winbond: W25Q64JV-M: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-12-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_181932_096814_6BA8E424 
X-CRM114-Status: GOOD (  13.32  )
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

The benefit is massive @25MHz, but the chip does not implement the 4BAIT
table to advertize this capability, so enable it manually:.

Before:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 558 KiB/s
page write speed is 553 KiB/s
2 page write speed is 555 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 3047 KiB/s
page write speed is 2909 KiB/s
2 page write speed is 2976 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook already makes sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 70 17 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | NO_WP

opcodes
 read		0xeb
  dummy cycles	6
 erase		0xd8
 program	0x32
 8D extension	none

protocols
 read		1S-4S-4S
 write		1S-1S-4S
 register	1S-1S-1S

erase commands
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (8.00 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+---------
 00000000-007fffff |     [   3] | no

locked sectors
 region (in hex)   | status   | #sectors
 ------------------+----------+---------
 00000000-007fffff | unlocked | 64
$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	2
  dummy cycles	2
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4
 4S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	0

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02
 1S-1S-4S
  opcode	0x32

$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ hexdump spi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0200000
$ sha256sum spi_read
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
$ mtd_debug write /dev/mtd0 0 2097152 spi_test
mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_read
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
d79c3f7b40646d437eff15309c5250e8ee203f805b9d13d8ad8a7019f0dd69f8  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 484a2d87a4b3..48b0bb643b15 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -314,8 +314,8 @@ static const struct flash_info winbond_nor_parts[] = {
 		.id = SNOR_ID(0xef, 0x70, 0x17),
 		.name = "w25q64jvm",
 		.size = SZ_8M,
-		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K,
+		.flags = SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 	}, {
 		/* W25Q128JV-M */
 		.id = SNOR_ID(0xef, 0x70, 0x18),

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
