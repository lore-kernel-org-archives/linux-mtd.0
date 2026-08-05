Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4CDC55182
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Aug 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VnNo4R98cgBEXj/1ew/DNGvW5WKJ2Uf9+xLeyhLSd4I=; b=DreEokqepisQbo
	rdQTR6e6R6GE+BUrFd1oiJ72qVhmJoljMTAH+TighQfsfoLc8cQA0zcAGCj00juRTksLut/6Lm6Mo
	QPUdusHy0bMdETh/h/ammJeodvnd8Bl6SZ3kcV16rK0+WF7fUQ528WSDcpN7uix/vf/cFAahdhN+E
	cd5gciZU90+8zjZvJugwjsMTm8xtLuTSYGbRJV8ykKwVrbk7CrW6rxgvvkmLZe36+3Rjtt6oHuG+x
	cQJQAZDsjX9xrj639PVMShq6kn0RaP8m8Zwe5qXuSJGZcfUqUBDmnc3aMhxRfGAa9Siz/RUAuiYD/
	WNdUriqIJkOrEA103CsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWag-00000003Slv-2zXb;
	Wed, 05 Aug 2026 08:03:06 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWac-00000003SfX-2IgE
	for linux-mtd@lists.infradead.org;
	Wed, 05 Aug 2026 08:03:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E9D71A1424;
	Wed,  5 Aug 2026 08:03:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E6E0E602AB;
	Wed,  5 Aug 2026 08:03:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1823611C34363;
	Wed,  5 Aug 2026 10:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785916976; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PWG7dcXykTf/QNQURaBjc2iIchYoAomro/OqlQDcSt8=;
	b=D7DZiOHnYvVXwkONMMf5hZrvjPoCeBPcNt7LXIaUnRx2p5yUVxVF3VgF0VYqdqyuap0RVw
	XP86M6/v+OPNoWmN2bI7VaPmhjn+Qu1JzIWEsXqe2PO434xCo0T6ICCL07z7fldflV74pT
	FvySqd77TDT4DuM4gT3sPjTkOaLukU46eYXu1+cpvg+yJKfhmaz3282EWSFoa0lsOiUQEn
	aBpxLgesmNbkXn5oztNUZO0/pJapU3VoKGZOqmjo0WBZrZ9qZVfMtq0dIIiaP1VPRevuYg
	xyM2erKFf4lGZa7hEDoNBYqFv146ZmAD1ahfMhDiXcGvJVSk1OdVT7u4WADv4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 05 Aug 2026 10:02:35 +0200
Subject: [PATCH v5 10/28] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-10-87238e577794@bootlin.com>
References: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
In-Reply-To: <20260805-winbond-v7-1-spi-nor-jv-cleanup-v5-0-87238e577794@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_010302_752807_A1699056 
X-CRM114-Status: GOOD (  15.82  )
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

The benefit is not massive @25MHz, yet it is a supported feature
of the chip which is already handled by a flag, so let's enable it and
earn that little 1% write throughput.

Before:
$ flash_speed /dev/mtd0 -d -c10
eraseblock write speed is 560 KiB/s
page write speed is 540 KiB/s
2 page write speed is 550 KiB/s

After:
eraseblock write speed is 578 KiB/s
page write speed is 557 KiB/s
2 page write speed is 567 KiB/s

The QUAD_PP capability was historically not supported by non-SFDP chips,
so a Winbond wide late hook is added to make sure the capability remains
disabled for them, for backward compatibility reasons.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
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
Copied 2097152 bytes from spi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_read
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
83e7d587bce3b2031c82939839cc1fbcf62b8939b35882d176f207b0722d0dba  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 04713ab04d01..2e53f16a9f93 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -203,6 +203,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q32",
 		.size = SZ_4M,
 		.no_sfdp_flags = SECT_4K,
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
@@ -504,6 +505,22 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 	if (nor->id[1] > 0x30)
 		nor->flags &= ~SNOR_F_NO_READ_CR;
 
+	/*
+	 * Winbond has reused many IDs, up to four times at this
+	 * stage. In general, most of the chips with SFDP support are
+	 * correctly described by the ID table, but the non-SFDP chips,
+	 * however, are known to not feature as many capabilities. Make
+	 * sure we filter out those capabilities to keep backward
+	 * compatibility with these devices manufactured until ~2016.
+	 */
+	if (!nor->sfdp) {
+		struct spi_nor_flash_parameter *p = nor->params;
+
+		/* SPI_NOR_QUAD_PP was unsupported */
+		p->hwcaps.mask &= ~SNOR_HWCAPS_PP_1_1_4;
+		spi_nor_set_pp_settings(&p->page_programs[SNOR_CMD_PP_1_1_4], 0, 0);
+	}
+
 	return 0;
 }
 

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
