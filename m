Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3815C5516D
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2026 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RCiojsup9IQyAfP+z6dUTzROMRJzAik/aeL1UrH4SGA=; b=rQQ6V6N+TM87z4
	cfgsP81IhyMkpGNZDrAYcw/dJbOc2OOkmrR68vplcAUoObqti3WPRG73jaeQZnbPTs2OrFpflNCK2
	9fzzNUAfdIozLSbGZOiNkCCGib5FkROHqxgykCXdabf3k3NZs8w4anfhDozIdQRlP6F+junqYgVcL
	8r9qk+lFM6uSSc+Sg7Nib/RnFJ1Ns5MFK2fsrv5FCcATV8SAPQ4+IPm0O9+2b7UbuelL5HelQpO8B
	Jx/1/vs8QTfUiFy8TH8IKX/Ggy5JfIyYB8vsokZzgoiqRHbE17y8g6QuYcCptjWN5alNh2vRyivWw
	5X7EhA/9uX827u1kCk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplx3-0000000CR3W-1B8K;
	Fri, 31 Jul 2026 12:02:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wplx0-0000000CR0R-1Hr7
	for linux-mtd@lists.infradead.org;
	Fri, 31 Jul 2026 12:02:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D72D51A135C;
	Fri, 31 Jul 2026 12:02:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AD1D36039A;
	Fri, 31 Jul 2026 12:02:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4196C11C167A2;
	Fri, 31 Jul 2026 14:02:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785499372; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=stKyW8eUQlcsmRBlkVE21GPe5QWe6/xHz3keMLC63vY=;
	b=yvo+14sN2paJLiE0lhyfjXQD810/nYrTH2zCaHarWA2KQa2iHSpfr3a78YlBxUuQVgcyfm
	lpSe4TnbxsgIceRgKWBox2IykFJVa7fmlZWIkvvb1Qm6RxhN7yY0dxFhUeb4Ac/azKQGDC
	wwh0NUsuIoK2CUK+rfgltoPrN4N3pfVbfC0pko+4olYzrnD3J3s+cY1hC7m0InrkZtu/78
	CTkVFn4dJ6VVFwNKIozbfqbj37Dv4/nKQLl2HFIal9zs5fUR/37+NvlhRIECzPkJ3gETee
	GnYV/8g5Kx7LmmhgsFcomylPVzlrjdsQqe4TXRy5/sQmBIGXQXdKXpVuNml9VA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 31 Jul 2026 14:01:58 +0200
Subject: [PATCH v2 05/23] mtd: spi-nor: winbond: W25Q32JV-Q/N: Add quad
 page program capability
MIME-Version: 1.0
Message-Id: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-5-2549ef1b1af8@bootlin.com>
References: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
In-Reply-To: <20260731-winbond-v7-1-spi-nor-jv-cleanup-v2-0-2549ef1b1af8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_050254_496574_2008296A 
X-CRM114-Status: GOOD (  15.43  )
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
disabled for them, for backward compatiblity reasons.

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
index b3ff99116335..a391efb926ab 100644
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
 	if (nor->info->id->bytes[1] > 0x30)
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
