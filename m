Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28375C6FD18
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Mar 2023 15:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ms4s+GgdAroMYvaa47tEst0rVUtmocqELyLTJ/nbBT4=; b=CaiDLOKhU+E27q
	CNYTNLKoi6l9A5zACM4LxrHEpbjb8furG8dEb+SLHU2Mnf7eh3ZQK7MwoNnUTVNmGrLzjVpE+kuGx
	bK0kxb3mgy5g38xTEkZIzDiz84eNl2dWswDfBNpBqGt7wbMa9B1ZItdiJNzXwqCM55kaFiWBmaNQ0
	pN6+kYBo7hnQWEVgUxAMjL74QQZtRFP7h71WKFTwtMBzIDghgBMtq2pE3IeYQrc1pEhuVQ1KFMycq
	NkSzBkv4xOxWQ7Bo9xU3UAnjfFFhF3SE66iC4jbLs/3+1XOeuooaMP/LagFPvHw+bETxXhmYVbz05
	KIeiMjvl27iB37okhivg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phBSv-00EzZs-0u;
	Tue, 28 Mar 2023 15:42:29 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phBRt-00Eyk3-1D;
	Tue, 28 Mar 2023 15:41:26 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1355960005;
	Tue, 28 Mar 2023 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680018083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9E7Cfw8PjSH7IBExwFg02Sat12AoGtk1zeyWxu1XsQM=;
	b=H7nan/xp7GAHMEJAzLszlQ/HTdCLS+hA+vOoSyBIaMrIy1j+Wr7wlpB6bhhX2KrHhr9orW
	qolnhuABusLammZDyeJjBdO05wbzlwaShWN2Y70k8glzVHn1GR3ySa9zM1qanUcUoylfY8
	xU5c2NYuk/PXjoWNzLgVxG/4jygILL1ezuLsdL8M756nT8dQpUBlh3/lawcSQKOcma8UoK
	LYH5WXGOow2TtA8YnI8sU8SE9LRkiN6Rtqk7ylOjNWNT5OT3jPrJz53WBt8ajO6jOgJj1F
	1gGMNrP2n+ltwMh9V7Ziqw/JQ6BjonEZhaZHdOuA1/MhROSYmZaNMXCY8/tUEg==
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
	Michal Simek <monstr@monstr.eu>,
	<linux-arm-kernel@lists.infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v5 8/8] mtd: spi-nor: macronix: Add support for mx25uw51245g with RWW
Date: Tue, 28 Mar 2023 17:41:05 +0200
Message-Id: <20230328154105.448540-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328154105.448540-1-miquel.raynal@bootlin.com>
References: <20230328154105.448540-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_084125_718326_2B1D9FC5 
X-CRM114-Status: GOOD (  10.42  )
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

mx25uw51245g
c2813a
macronix
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
047a884cf44d9ffc2a94d3ab37b48c63  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp

6+0 records in
6+0 records out
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Erased 6291456 bytes from address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
0000000 ffff ffff ffff ffff ffff ffff ffff ffff
*
0600000
Copied 6291456 bytes from qspi_test to address 0x00000000 in flash
Copied 6291456 bytes from address 0x00000000 in flash to qspi_read
d24a9523db829a0df688f34b8dc76a1383b74024  qspi_test
d24a9523db829a0df688f34b8dc76a1383b74024  qspi_read

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/macronix.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 6853ec9ae65d..b65d41e5f749 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -82,6 +82,10 @@ static const struct flash_info macronix_nor_parts[] = {
 	{ "mx25u51245g", INFO(0xc2253a, 0, 64 * 1024, 1024)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
+	{ "mx25uw51245g", INFOB(0xc2813a, 0, 16 * 1024, 1024, 4)
+		PARSE_SFDP
+		FLAGS(SPI_NOR_RWW)
+		FIXUP_FLAGS(SPI_NOR_4B_OPCODES) },
 	{ "mx25v8035f",  INFO(0xc22314, 0, 64 * 1024,  16)
 		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ |
 			      SPI_NOR_QUAD_READ) },
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
