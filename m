Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E10CD6E51
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TbL7CmDwQHO+YwPVYxxexGJlCZmyhY98ph+n5yDSuxM=; b=W54vaQWqi1YXyW
	h6lKmpNuoLXk8roQ921r7Cguei2ZZaeVR/R1Y/9rXjxjSyDK0UpO1MbldjRtnRWdQbSD2Gc59ItS9
	mR9QjUDS1fxj/HY8eMaPH95tKz0+I0ja7nBfzQrX1qcv0pyum7EpRzY0v8uscq42qGoLs8cLuyDOp
	zvmN2Lop/TMwlt/7Fk4valBpTfX7yNAdlUTGOvh2VHCOLJrUC8CWiDyQihdsEFZHvpcwhxElspHjm
	sPqwuyJSn3BOsy/b8fALEs7VcA1TECzcT7IbvFE1xgkIZl7UkjEGVZeCCW9YQfzdv0njVRWt5gzJ1
	Dayqjz9U191R3JjBngxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz37-00000007fOg-0Vrf;
	Fri, 29 May 2026 15:23:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSz32-00000007fH2-1RvU
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 15:22:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF12A1A373B;
	Fri, 29 May 2026 15:22:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4099601FA;
	Fri, 29 May 2026 15:22:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 286E410888CDA;
	Fri, 29 May 2026 17:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780068174; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ceVgiWO8hrEHRXZ8WIqZCZWHo1Shn1Gp3ZMrr5u3hng=;
	b=2lBzU5MoCfF33JscxvqouRgcev5cPuFh4+00NcH8QFTydCbnyrdY4TR6o7cwiW1XuAR03M
	YyfJ+CFLOCQp4UAOi1mnFk8pv2qtXyLrCblCqNwQ1CyLhcS6c0+B14ux3iUPr5HM0RkPou
	fVNtiWBWTnbQTqPx/xhLo6obWla1QEcgC8fwGQs4VKesGlHSLXE1wmj8b95l21XOdvKtyG
	3oXdm+YR/W06c91lDQ4fae3xl1VO3EOK7ooNPtyogkoEg3gPxc8ie5hdAecin6t5c3W2E/
	aB8oopkoB9fjg0UOIbbazq3JkDkttxlA/PtA6xKSRKiIO9DbsFcFQJwy/487Kw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 17:22:29 +0200
Subject: [PATCH 09/30] mtd: spi-nor: winbond: W25Q64JV-Q/N: Add quad page
 program capability
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-9-87e5d3122244@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-jv-cleanup-v1-0-87e5d3122244@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_082256_529859_A92E624A 
X-CRM114-Status: GOOD (  10.25  )
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
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 539 KiB/s
page write speed is 535 KiB/s
2 page write speed is 536 KiB/s

After:
$ flash_speed /dev/mtd0 -dc10
eraseblock write speed is 556 KiB/s
page write speed is 549 KiB/s
2 page write speed is 552 KiB/s

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		(null)
id		ef 40 17 00 00 00
size		8.00 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_16BIT_SR | SOFT_RESET | NO_WP

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
$ dd if=/dev/urandom of=./spi_test bs=1M count=2
2+0 records in
2+0 records out
$ mtd_debug erase /dev/mtd0 0 2097152
mtd_debug read /dev/mtd0 0 2097152 spi_readErased 2097152 bytes from address 0x00000000 in flash
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
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
36667197a637b731cc2068022138e6963a9499ce9b0ddda1a1585f7f5ebe66ff  spi_test
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 7a8e3cbdd6a4..6f496be03e46 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -204,6 +204,7 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		/* W25Q64JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x17),
+		.flags = SPI_NOR_QUAD_PP,
 	}, {
 		/* W25Q128JV-Q/N */
 		.id = SNOR_ID(0xef, 0x40, 0x18),

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
