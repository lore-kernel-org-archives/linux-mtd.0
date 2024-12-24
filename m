Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F75E7718D
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QppWYlvwlhTnc7L6Eo+0/Is9opiGIL3KhkOUS2BBW6o=; b=lNqfQPrcZ8xJm3
	8SSOwdFHjEfYInSLKrHWBtiqm4Mudm7OqrFokA3iLalsCmD6EqWK06dvpwJ4+umVHXnsv07Gko7CM
	Jj/P4LCl1SmvJiLatv/Ztmci1e1YARVQ+I7lH+qN6rqEIDcLGlOVS5O/93oAGiL9uCTmSnDyL5yjw
	ezeaWtxf2e4tBwLKAGnwLd23ZuYsYzjMlx0OQEGM0Nur7Nle6F07QHHwOgUL4DQxte2iulxEsi4t0
	dNOMGwbGMYHOp63bQuGWvL6BvJa1iNWmU9qzQ4L6m1T3Rtc4Z7MTZtVfJQgpQef4ONz4BryxJI1zs
	MVYiaKw+X6Kbk+BPtOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84e-0000000CLK5-3dbk;
	Tue, 24 Dec 2024 16:48:00 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84c-0000000CLIz-0Jlz
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 16:47:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91F0E1C0005;
	Tue, 24 Dec 2024 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735058876;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pNhPd8gY0LdJIIaXA25OzrOgCAUaztPc20vfkmYeTLo=;
	b=aLeZuKGUgccITaWqHrups2bWyFO6ycxeP8y9eBcehx0fz6U5DtDOaDXL9pk9HScKRBR48X
	Uvpexu265wQ0u7O2kR9p8zr6W2vWSHDigOt4QV1FsK2qodiE5HhPE7aPTiG7CVjrlq8LY7
	lciNxci0c53QtUUKHRBbrtg27TB4DQ1mfH51auUWMrRO5B59hED/2mrhvesSSjRZhrY+es
	iZ6zEe+K8awp6kHaiupuob6PWqmX3GM0FUpytZV6g925j2qP0i1BP438ZeJZUQqJopKuVs
	yCRbTjoRThsJaF+SCQwPf5zVbLw+hASxBdhSZk1BJvzBIRjW97Tg9DlSRPt3zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 17:47:42 +0100
Subject: [PATCH 2/2] mtd: spi-nor: winbond: Add support for w25q02jv
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-2-f7c4dff66182@bootlin.com>
References: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
In-Reply-To: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-0-f7c4dff66182@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_084758_408393_FFE06ABF 
X-CRM114-Status: UNSURE (   9.83  )
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

Add support for Winbond w25q02jv spi-nor chip which shares most of
w25q01jv's specificities as, this time, the chip is made of 4 different
dies.

Link: https://www.winbond.com/resource-files/W25Q02JV_DTR%20RevD%2007092024%20Plus.pdf
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Here is the basic test procedure output:

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
w25q02jv
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef7022
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff7f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
$ md5suum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
3e7da68579120c32a12517d2b6634c3c  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
$ dd if=/dev/urandom of=./qspi_test bs=1M count=1
1+0 records in
1+0 records out
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug erase /dev/mtd0 0 1048576
Erased 1048576 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0100000
$ mtd_debug write /dev/mtd0 0 1048576 qspi_test
Copied 1048576 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 1048576 qspi_read
Copied 1048576 bytes from address 0x00000000 in flash to qspi_read
$ sha1sum qspi_test qspi_read
c662ae4e6b1268e23d5a5e930995213d2e4044cc  qspi_test
c662ae4e6b1268e23d5a5e930995213d2e4044cc  qspi_read
---
 drivers/mtd/spi-nor/winbond.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 4691e7a27ba1d70c75932c4e6b60fe36102138be..888367a8ee9967b5d7c7886dd2c6a1024f659609 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -253,6 +253,11 @@ static const struct flash_info winbond_nor_parts[] = {
 	}, {
 		.id = SNOR_ID(0xef, 0x70, 0x19),
 		.name = "w25q256jvm",
+	}, {
+		.id = SNOR_ID(0xef, 0x70, 0x22),
+		.name = "w25q02jv",
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &w25q0xjv_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x71, 0x19),
 		.name = "w25m512jv",

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
