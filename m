Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA67C3DA64
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Aug 2024 22:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W5KNa10c/s3FEdxh+d5S1MQfRRfS6uA/FxV7b6ZFhUE=; b=wG1z9sTgkVTNgR
	eC8ThdViZ9VRIzzMnvgEgnTaJMPp8HvcZRtAAYqmfX91ZQnbuicFceltmBir8Caa2eJNi1uBgO7r5
	NN4ztJ2YGi9vg14rq0hhFJrin5yfM57xsAckOxICr5zuuT1N8eWcuI+DYr5IfVSs9CYAUHZ9/zNaL
	OXvJFstWHBJxwDwY+GW5WPwrnDVnxExLZFK2VDHzGZbDU1WlFPlLabcwMQtE+x7O+2ktVPL1mnNIq
	AmjaUvJuRI4mNahrKR2js5fHH+lX0eyZY3zmcvkqlU06W2J63hj9bNtb4wCsNnZRV9UVSMtmt0vFG
	1TAArvqx9a7iMdjt/LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sajWA-0000000E3BJ-2IlF;
	Sun, 04 Aug 2024 22:15:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sajW7-0000000E3Aj-0MAm
	for linux-mtd@lists.infradead.org;
	Sun, 04 Aug 2024 22:15:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 549E460AF5;
	Sun,  4 Aug 2024 22:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A31A1C32786;
	Sun,  4 Aug 2024 22:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722809751;
	bh=1oqBZkcUEQ5WhhiwYcCFSLchEbm56fpcYEkTVNO0njk=;
	h=From:To:Cc:Subject:Date:From;
	b=ZThOapIBT6ysrJlvawL9S3SQCMkW0eIBREoUOcPxTWdCwi1iGMj76dmbT9m86J6vm
	 aFEgu+w1Flwdy47l7NmEK16QkqxIPEoc4oSWCdNxC9DNDt715FRRqsQ2tlc25sw00p
	 DKYPYkE5W6A03EdSPQ2Tsd0QJ8XG75nRgVvTDBMTtkW/6Ppx82EzueUNwoPMrE/aCe
	 1jib62FmmekImw27rTaIMWpZz7eRVMBf+XtPX0Pi8oTT2gu1YoRYEIRULKvZvNRq90
	 DIGSgwNRJP2NYx+JlO5vWaX2fRGrfTOc9nTDseYmOjymsrjBEoUN/aR/IrPbw+1XgU
	 k0jpC4qJR8hyA==
From: Michael Walle <mwalle@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: winbond: add Zetta ZD25Q128C support
Date: Mon,  5 Aug 2024 00:15:35 +0200
Message-Id: <20240804221535.291923-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240804_151555_288680_88DC43F3 
X-CRM114-Status: GOOD (  15.63  )
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

Zetta normally uses BAh as its vendor ID. But for the ZD25Q128C they
took the one from Winbond and messed up the size parameters in SFDP.
Most functions seem compatible with the W25Q128, we just have to fix up
the size.

Link: http://www.zettadevice.com/upload/file/20150821/DS_Zetta_25Q128_RevA.pdf
Link: https://www.lcsc.com/datasheet/lcsc_datasheet_2312081757_Zetta-ZD25Q128CSIGT_C19626875.pdf
Signed-off-by: Michael Walle <mwalle@kernel.org>
---
$ cat /sys/class/spi_master/spi0/spi0.0/spi-nor/jedec_id
ef4018

$ md5sum /sys/class/spi_master/spi0/spi0.0/spi-nor/sfdp
f19e214c6709a259511bac4bd9c87407  /sys/class/spi_master/spi0/spi0.0/spi-nor/sfdp

$ xxd -p /sys/class/spi_master/spi0/spi0.0/spi-nor/sfdp
53464450000101ff00000109300000ffb3000103600000ffffffffffffff
ffffffffffffffffffffffffffffffffffffe520f9ffffffff0044eb086b
083b80bbeeffffffffff00ffffff00ff0c200f5210d80881ffffffffffff
ffffffffffff003600279ff97764fccbffff

$ cat /sys/kernel/debug/spi-nor/spi0.0/capabilities
Supported read modes by the flash
 1S-1S-1S
  opcode	0x03
  mode cycles	0
  dummy cycles	0
 1S-1S-1S (fast read)
  opcode	0x0b
  mode cycles	0
  dummy cycles	8
 1S-1S-2S
  opcode	0x3b
  mode cycles	0
  dummy cycles	8
 1S-2S-2S
  opcode	0xbb
  mode cycles	4
  dummy cycles	0
 1S-1S-4S
  opcode	0x6b
  mode cycles	0
  dummy cycles	8
 1S-4S-4S
  opcode	0xeb
  mode cycles	2
  dummy cycles	4

Supported page program modes by the flash
 1S-1S-1S
  opcode	0x02

$ cat /sys/kernel/debug/spi-nor/spi0.0/params
name		w25q128
id		ef 40 18 ef 40 18
size		16.0 MiB
write size	1
page size	256
address nbytes	3
flags		HAS_SR_TB | HAS_LOCK | HAS_16BIT_SR

opcodes
 read		0x0b
  dummy cycles	8
 erase		0x20
 program	0x02
 8D extension	none

protocols
 read		1S-1S-1S
 write		1S-1S-1S
 register	1S-1S-1S

erase commands
 81 (256 B) [0]
 20 (4.00 KiB) [1]
 52 (32.0 KiB) [2]
 d8 (64.0 KiB) [3]
 c7 (16.0 MiB)

sector map
 region (in hex)   | erase mask | overlaid
 ------------------+------------+----------
 00000000-00ffffff |     [ 1  ] | no

$ dd if=/dev/urandom of=spi_test bs=1M count=2
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
90145978caa36e84ecc07734d193c97a54ae601884a5ff4e0b90ff8c1f540a03  spi_read
90145978caa36e84ecc07734d193c97a54ae601884a5ff4e0b90ff8c1f540a03  spi_test
$ mtd_debug erase /dev/mtd0 0 2097152
Erased 2097152 bytes from address 0x00000000 in flash
$ mtd_debug read /dev/mtd0 0 2097152 spi_read
Copied 2097152 bytes from address 0x00000000 in flash to spi_read
$ sha256sum spi*
4bda3a28f4ffe603c0ec1258c0034d65a1a0d35ab7bd523a834608adabf03cc5  spi_read
90145978caa36e84ecc07734d193c97a54ae601884a5ff4e0b90ff8c1f540a03  spi_test

$ mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 16777216 (16M)
mtd.erasesize = 4096 (4K)
mtd.writesize = 1
mtd.oobsize = 0
regions = 0
---
 drivers/mtd/spi-nor/winbond.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index e065e4fd42a3..9f7ce5763e71 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -17,6 +17,31 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
+static int
+w25q128_post_bfpt_fixups(struct spi_nor *nor,
+			 const struct sfdp_parameter_header *bfpt_header,
+			 const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * Zetta ZD25Q128C is a clone of the Winbond device. But the encoded
+	 * size is really wrong. It seems that they confused Mbit with MiB.
+	 * Thus the flash is discovered as a 2MiB device.
+	 */
+	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
+	    bfpt_header->minor == SFDP_JESD216_MINOR &&
+	    nor->params->size == SZ_2M &&
+	    nor->params->erase_map.regions[0].size == SZ_2M) {
+		nor->params->size = SZ_16M;
+		nor->params->erase_map.regions[0].size = SZ_16M;
+	}
+
+	return 0;
+}
+
+static const struct spi_nor_fixups w25q128_fixups = {
+	.post_bfpt = w25q128_post_bfpt_fixups,
+};
+
 static int
 w25q256_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -108,6 +133,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.size = SZ_16M,
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &w25q128_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x40, 0x19),
 		.name = "w25q256",
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
