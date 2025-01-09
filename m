Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C32CE7719B
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jan 2025 20:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AAt7cwjTD1OKwL6sQ4ALEb6g+exxD40DA/MJrvjIdw=; b=O4gfnsLtcO4TPG
	ybrD9Bp5+Xyl/V4RGoB5DmdBySkNNKrOE/bZuNT8ht7bGM8tWsY73BIkyBdibvqQ1N+qKkS8rGogK
	BoTHW9rjYD6fjnqNfLev2iH0GnJyfForv9zmNg1mTBuq8Dxu3hhvHc/RWhnGaNOzmlRaBDAPE4/3Z
	v0fde+Vpsyjvx9YgEP7t3DAAJmqIdppo8waK9qoLogH2zfdpqNlZTPKVqGT6kspF4pl5y5nqIwAkM
	y4AcPlzhkvO7cQ8FB8xyM2Z1/o7QwqJ9ahW1BOsgZnESf0me1FW8O7wVwYwjJZR/JxXxEttLlL6bw
	+amqtA2NQgcNUv1I8Fzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyya-0000000DCtv-3eZU;
	Thu, 09 Jan 2025 20:17:56 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyyW-0000000DCs9-1Unv
	for linux-mtd@lists.infradead.org;
	Thu, 09 Jan 2025 20:17:54 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4D5360009;
	Thu,  9 Jan 2025 20:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736453869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xGltmifpon82ZxZZBDnPUaTIcHtNJtDhdiVuzLAipjE=;
	b=m0uE9VuNPbN3N1KG8bdYT3D25nPTc7j80/ugP2xZr9RIEPBPik6AeVxx2np4R0zKjDgRgT
	R1qQFN49fmMJOgRwkJeKiUYLDZNVK5T4y4kFG/RG8hIuiC7U51eyL9fRcVAWyS5yZpB0RC
	nMRhGT96A0gpBK7mnfHtwyBi1sMO+RBYCCm6ZrcbIf5EtBZnz8IKSMjRZvQVMbvcfAP7fO
	lzaq9dbf9kvzmwnYDtG2YhatpxxoqJ2ubFjULtQiO9UxBYVgS4ZD260holOdBIn350Wl9A
	hWpFodt2hBRYC30bwlPTZAZtBTw66otyaFfLU3VHAiBKEvuyCdODiSer9dz4sg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 09 Jan 2025 21:17:24 +0100
Subject: [PATCH v2 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
MIME-Version: 1.0
Message-Id: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-1-e8cd0812fe4e@bootlin.com>
References: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
In-Reply-To: <20250109-winbond-6-12-rc1-nor-volatile-bit-v2-0-e8cd0812fe4e@bootlin.com>
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
X-CRM114-CacheID: sfid-20250109_121752_661902_30D92D5B 
X-CRM114-Status: GOOD (  28.42  )
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

Add support for Winbond w25q01jv spi-nor chip.

This chip is internally made of two dies with linear addressing
capabilities to make it transparent to the user that two dies were
used. There is one drawback however, the read status operation is racy
as the status bit only gives the active die status and not the status of
the other die. For commands affecting the two dies, it means if another
command is sent too fast after the first die has returned a valid status
(deviation can be up to 200us), the chip will get corrupted/in an
unstable state.

This chip hence requires a better status register read. There are three
solutions here:

1- If we assume that the most common situation producing this problem is
status register writes, maybe we could change the "non-volatile"
status register write commands to become "volatile" status register
writes. In practice, what takes time is the write operation of the bits
themselves, and not the activation of the feature in the internal
circuitry. Enabling "volatile" status register writes would make the
writes nearly instant.

This approach, besides probably being the less impacting one, could
overlook other possible actions where both dies can be used at the same
time like a chip erase (or any erase over die boundaries in general).

2- Wait about 200us after getting a first status ready feedback. This
200us is about the maximum possible deviation between dies and would
cover all cases.

3- We iterate manually over all internal dies (which takes about 30us
per die) until all are ready. This approach will always be faster than
a blind delay which represents the maximum deviation, while also being
totally safe.

This third approach has been adopted. A flash-specific hook for the
status register read had to be implemented. Testing with the flash_speed
benchmark shown no difference with the existing performances (using the
regular status read core function). In practice there are difference in
the experimental results below, but they are part of the natural
deviation of the benchmark:

	> Without the fixup
	$ flash_speed /dev/mtd0 -c100 -d
	eraseblock write speed is 442 KiB/s
	eraseblock read speed is 1606 KiB/s
	page write speed is 439 KiB/s
	page read speed is 1520 KiB/s
	2 page write speed is 441 KiB/s
	2 page read speed is 1562 KiB/s
	erase speed is 68 KiB/s

	> With the fixup
	$ flash_speed /dev/mtd0 -c100 -d
	eraseblock write speed is 428 KiB/s
	eraseblock read speed is 1626 KiB/s
	page write speed is 426 KiB/s
	page read speed is 1538 KiB/s
	2 page write speed is 426 KiB/s
	2 page read speed is 1574 KiB/s
	erase speed is 66 KiB/s

However, the fixup, whatever which one we pick, must be applied on
multi-die chips, which hence must be properly flagged. The SFDP tables
implemented give a lot of information but the die details are part of an
optional table that is not implemented, hence we use a post parsing
fixup hook to set the params->n_dice value manually.

Link: https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Here is the basic test procedure output:

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/jedec_id
ef4021
$ cat /sys/bus/spi/devices/spi0.0/spi-nor/manufacturer
winbond
$ xxd -p /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
53464450060101ff00060110800000ff84000102d00000ff03000102f000
00ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffe520fbffffffff3f44eb086b083b42bbfeffffffffff
0000ffff40eb0c200f5210d800003602a60082ea14e2e96376337a757a75
f7a2d55c19f74dffe970f9a5ffffffffffffffffffffffffffffffffff0a
f0ff21ffdcff
$ md5sum /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
a7b9dbf76e99a33db99e557b6676588a  /sys/bus/spi/devices/spi0.0/spi-nor/sfdp
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
becf3097c0bbff0dd6f204ffe5bf575e6c43f792  qspi_test
becf3097c0bbff0dd6f204ffe5bf575e6c43f792  qspi_read
---
 drivers/mtd/spi-nor/winbond.c | 84 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e1233988876a15479d73c5fe899c542..a4c0d99dde4fcd2b123eb7ded4f7822110c6a4ae 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -10,6 +10,7 @@
 
 #define WINBOND_NOR_OP_RDEAR	0xc8	/* Read Extended Address Register */
 #define WINBOND_NOR_OP_WREAR	0xc5	/* Write Extended Address Register */
+#define WINBOND_NOR_OP_SELDIE	0xc2	/* Select active die */
 
 #define WINBOND_NOR_WREAR_OP(buf)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_WREAR, 0),		\
@@ -17,6 +18,12 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
 
+#define WINBOND_NOR_SELDIE_OP(buf)					\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(WINBOND_NOR_OP_SELDIE, 0),		\
+		   SPI_MEM_OP_NO_ADDR,					\
+		   SPI_MEM_OP_NO_DUMMY,					\
+		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
+
 static int
 w25q128_post_bfpt_fixups(struct spi_nor *nor,
 			 const struct sfdp_parameter_header *bfpt_header,
@@ -66,6 +73,79 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
+/**
+ * winbond_nor_select_die() - Set active die.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @die:	die to set active.
+ *
+ * Certain Winbond chips feature more than a single die. This is mostly hidden
+ * to the user, except that some chips may experience time deviation when
+ * modifying the status bits between dies, which in some corner cases may
+ * produce problematic races. Being able to explicitly select a die to check its
+ * state in this case may be useful.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int winbond_nor_select_die(struct spi_nor *nor, u8 die)
+{
+	int ret;
+
+	nor->bouncebuf[0] = die;
+
+	if (nor->spimem) {
+		struct spi_mem_op op = WINBOND_NOR_SELDIE_OP(nor->bouncebuf);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor,
+						       WINBOND_NOR_OP_SELDIE,
+						       nor->bouncebuf, 1);
+	}
+
+	if (ret)
+		dev_dbg(nor->dev, "error %d selecting die %d\n", ret, die);
+
+	return ret;
+}
+
+static int winbond_nor_multi_die_ready(struct spi_nor *nor)
+{
+	int ret, i;
+
+	for (i = 0; i < nor->params->n_dice; i++) {
+		ret = winbond_nor_select_die(nor, i);
+		if (ret)
+			return ret;
+
+		ret = spi_nor_sr_ready(nor);
+		if (ret <= 0)
+			return ret;
+	}
+
+	return 1;
+}
+
+static int
+winbond_nor_multi_die_post_sfdp_fixups(struct spi_nor *nor)
+{
+	/*
+	 * SFDP supports dice numbers, but this information is only available in
+	 * optional additional tables which are not provided by these chips.
+	 * Dice number has an impact though, because these devices need extra
+	 * care when reading the busy bit.
+	 */
+	nor->params->n_dice = nor->params->size / SZ_64M;
+	nor->params->ready = winbond_nor_multi_die_ready;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups winbond_nor_multi_die_fixups = {
+	.post_sfdp = winbond_nor_multi_die_post_sfdp_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -146,6 +226,10 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		/* W25Q01JV */
+		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.fixups = &winbond_nor_multi_die_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
