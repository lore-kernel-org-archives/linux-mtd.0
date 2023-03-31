Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDAFC76196
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Mar 2023 19:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQa+Ip88DvJfSlWZNvKcCOp5xFMFgOCpjJi17chDnUc=; b=Tdl295xODBzvtA
	HKa+IqONBzagiFDitmXYHkOq0AwHmNkx2vsZgBROArfNepBD0ZfbMDCNyemI0f3F2ppMyDo1a0FGp
	lTYmFl8CpOwK21FqsL0EADQvc/IGWrO2/WwVl8CcwYRsctKc0CciYXRLBazppri+WTDRgfmldvFMn
	Z9KVuXrsQbZNKiRiA4tFU2qFdbL3fvpWd0qzDS5YSPQzpPaEVy3l8d1tbMdketBrH0w5H7dDySYyS
	xkqwIUfnClTcpIarbl4I3Qp1tHPSB1dRkyHpJz+ulVtp2DEhv8wSuY9wcdvkFv19k4EIz/tHJA9gM
	W+bkBDUfcHxaod0RJiLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piKhk-008exG-2C;
	Fri, 31 Mar 2023 19:46:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piKhg-008evW-1l
	for linux-mtd@lists.infradead.org;
	Fri, 31 Mar 2023 19:46:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C0650E0003;
	Fri, 31 Mar 2023 19:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680291986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Lpl1Wi3Gis65t3NlRCdlkUv5QF/skzVa58OoamEGrJE=;
	b=CQBIIlAUi8VMTsLdSUYjX5XCFuJvI/uz+d/KgSFBQ1NjB3AkUjBNTfcYCJgKuGJpcBc+1v
	ifl/d7oyla5qVdAz9/MDPSZPrN/N8VTG4pQPQi1QprqUyK7IfJH567j0Kr4dPnMf0/+iGk
	sR3v2rUuiKoMaBmN23a+Qolxk4Ndbvd0AtaVT89Wioe3uz+qZErCRnuwGV6U4c06IZTKTx
	iH28IG2RiVlYRT7CANrsp8j5JGKOnsQ9O5yTTjW+Z89mFQGEizqTDlHjz9bQMxDywh+wLj
	/p2rxFe5dbQ5hSnAcvBuml5TnEDFmdWtXkKBx04rB6nH0T+tOpJKXxppS1rFgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Julien Su <juliensu@mxic.com.tw>,
	Jaime Liao <jaimeliao@mxic.com.tw>,
	Jaime Liao <jaimeliao.tw@gmail.com>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v6 2/2] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
Date: Fri, 31 Mar 2023 21:46:20 +0200
Message-Id: <20230331194620.839899-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331194620.839899-1-miquel.raynal@bootlin.com>
References: <20230331194620.839899-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_124628_851126_B2A912A4 
X-CRM114-Status: GOOD (  10.75  )
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

Describe this new part and provide the RWW flag for it.

There is no public datasheet, but here are the sfdp tables plus base
testing to show it works.

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
mx25uw51245g
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
c2813a
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
macronix
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450080104fd00070114400000ff8701011c900000ff0a0001080001
00ff05000105200100ff84000102340100ff0000000000000000ffffffff
ffffffffe5208affffffff1f00ff00ff00ff00ffeeffffffffff00ffffff
00ff0c2010d800ff00ff87790100821200e27704674630b030b0f4bdd55c
000000ff101000200000000000007ca14800000000008888000000000000
00400fd1fff30fd1fff300050090000500b1002b0095002b0096727103b8
727103b80000000090a3188200c069960000000000000000727100987271
00b8727100990000000072710098727100f872710099727100f900000000
00000000011501d0727106d8000086500000060100000000020001030002
00000000060100000000000072060002000000eec0697272717100d8f7f6
000a00001445988043060f0021dcffff
$ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

$ dd if=/dev/urandom of=./qspi_test bs=1M count=6
6+0 records in
6+0 records out
$ mtd_debug write /dev/mtd1 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug erase /dev/mtd1 0 6291456
Erased 6291456 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd1 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
$ hexdump qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
$ mtd_debug write /dev/mtd1 0 6291456 qspi_test
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
$ mtd_debug read /dev/mtd1 0 6291456 qspi_read
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
$ sha1sum qspi_test qspi_read
d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..7db1a1a6a1fb 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -82,6 +82,9 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFOB(0xc2813a, 0, 0, 0, 4)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_RWW) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
