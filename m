Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FBDE7718E
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Dec 2024 16:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dRuJq7WkGUfdaiXy460KiaSv+mDgtlCvn1Jk/fZ0eIs=; b=Z+dcstxbSlaYfJ
	G3GzVz2jaopTGM7Thrcb/kTdXCdlPiBCXQLTcsOXRusDPOhVjtp92UTjkJ3oVxb69HLs+xeBGmcsf
	61VJpxIwB/dKXuHic7KM/WupSg/3o5oiieK7vUUnERfZkDZuzBE4g2+4I2w0PyApifqF6lscYrOD/
	TyTjAnrisIwJbudG8N0pYaLexcyPWjjeWGFZOT+TD2gRYeLYoUJJ45Fr+nnsnJJZDWpsHCj6UJCX4
	ynOlxkFwsi46nVKyNcdQG0BfcdIlxz/oBki0RoOCjEe1AmS+NNrvIp/I/iOKhr8cpvqxE1sY7V0nQ
	WQGAW6eo+KVCVNNCtOdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84e-0000000CLJq-1NIs;
	Tue, 24 Dec 2024 16:48:00 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ84b-0000000CLIh-0YGm
	for linux-mtd@lists.infradead.org;
	Tue, 24 Dec 2024 16:47:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4A9D91C0006;
	Tue, 24 Dec 2024 16:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735058875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RPUNU8k3CaKZFk028633f4TgCsXKqufS1tewP4nLaeU=;
	b=izuvoJ1VUVREJxOtgpIoGhW7Z2BbQA2pqLt5NAlpFYQCnfwM4OIYePQEFq6An/rhuYjpCc
	VkxJqmg4zVvIk/5kj2jsHRg4GJG2p5jISe6rKxfaj/Dln7Pvh39W/TzTv1ri9piYz1It7R
	Xqcjzkwu6rqHvR7SJhoELcB3qWSHcQfacp2Y+oWLKvfhMkSJZ50MIsxxt4B3C+fWBAjwaD
	bVc9Ghob2k1arp7Cqedku+lrTnnbWLIjjDhHqRXLIrNiGdFFYlphOfaTvYvt0Cy5ChlEDt
	MTGgWe2KOp7bMzu0EY2do24QnwVGBvG+PnW1AdW1HuRq/MiWSHpm2XWHTOUZKA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Dec 2024 17:47:41 +0100
Subject: [PATCH 1/2] mtd: spi-nor: winbond: Add support for w25q01jv
MIME-Version: 1.0
Message-Id: <20241224-winbond-6-12-rc1-nor-volatile-bit-v1-1-f7c4dff66182@bootlin.com>
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
X-CRM114-CacheID: sfid-20241224_084757_448290_0D492BD5 
X-CRM114-Status: GOOD (  28.54  )
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
- Either we wait about 200us after getting a first status ready
feedback, to cover possible internal deviations.
- Or we always check all internal dies (which takes about 30us per die).

This second option being always faster and also being totally safe, we
implement a specific hook for the status register read. flash_speed
benchmarks show no difference with this implementation, compared to the
regular status read core function, the difference being part of the
natural deviation with this benchmark:

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

As there are very few situations where this can actually happen, a
status register write being the most likely one, another possibility
might have been to use volatile writes instead of non-volatile writes,
as most of the deviation comes from the action of writing the bit. But
this would overlook other possible actions where both dies can be used
at the same time like a chip erase (or any erase over the die boundary
in general). This last approach would have the least impact but because
it does not feel like it is totally safe to use and because the impact
of the second solution presented above is also negligible, we keep this
second approach for now (which can be further tuned later if it appears
to be too impacting in the end).

However, the fixup, whatever which one we pick, must be applied on
multi-die chips, which hence must be properly flagged. The SFDP tables
implemented give a lot of information but the die details are part of an
optional table that is not implemented, hence we use a post parsing
fixup hook to set the params->n_dice value manually.

Link: https://www.winbond.com/resource-files/W25Q01JV%20SPI%20RevE%2003042024%20Plus.pdf
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Here is the basic test procedure output:

$ cat /sys/bus/spi/devices/spi0.0/spi-nor/partname
w25q01jv
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
 drivers/mtd/spi-nor/winbond.c | 82 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 8d0a00d69e1233988876a15479d73c5fe899c542..4691e7a27ba1d70c75932c4e6b60fe36102138be 100644
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
@@ -66,6 +73,26 @@ static const struct spi_nor_fixups w25q256_fixups = {
 	.post_bfpt = w25q256_post_bfpt_fixups,
 };
 
+static int
+w25q0xjv_post_bfpt_fixups(struct spi_nor *nor,
+			  const struct sfdp_parameter_header *bfpt_header,
+			  const struct sfdp_bfpt *bfpt)
+{
+	/*
+	 * SFDP supports dice numbers, but this information is only available in
+	 * optional additional tables which are not provided by these chips.
+	 * Dice number has an impact though, because these devices need extra
+	 * care when reading the busy bit.
+	 */
+	nor->params->n_dice = nor->params->size / SZ_64M;
+
+	return 0;
+}
+
+static const struct spi_nor_fixups w25q0xjv_fixups = {
+	.post_bfpt = w25q0xjv_post_bfpt_fixups,
+};
+
 static const struct flash_info winbond_nor_parts[] = {
 	{
 		.id = SNOR_ID(0xef, 0x30, 0x10),
@@ -146,6 +173,11 @@ static const struct flash_info winbond_nor_parts[] = {
 		.name = "w25q512jvq",
 		.size = SZ_64M,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+	}, {
+		.id = SNOR_ID(0xef, 0x40, 0x21),
+		.name = "w25q01jv",
+		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
+		.fixups = &w25q0xjv_fixups,
 	}, {
 		.id = SNOR_ID(0xef, 0x50, 0x12),
 		.name = "w25q20bw",
@@ -289,6 +321,37 @@ static int winbond_nor_write_ear(struct spi_nor *nor, u8 ear)
 	return ret;
 }
 
+/**
+ * winbond_nor_select_die() - Set active die.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @die:	die to set active.
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
 /**
  * winbond_nor_set_4byte_addr_mode() - Set 4-byte address mode for Winbond
  * flashes.
@@ -322,6 +385,22 @@ static int winbond_nor_set_4byte_addr_mode(struct spi_nor *nor, bool enable)
 	return spi_nor_write_disable(nor);
 }
 
+static int winbond_multi_die_ready(struct spi_nor *nor)
+{
+	int ret, i;
+
+	for (i = 0; i < nor->params->n_dice; i++) {
+		ret = winbond_nor_select_die(nor, i);
+		if (ret)
+			return ret;
+
+		if (!spi_nor_sr_ready(nor))
+			return 0;
+	}
+
+	return 1;
+}
+
 static const struct spi_nor_otp_ops winbond_nor_otp_ops = {
 	.read = spi_nor_otp_read_secr,
 	.write = spi_nor_otp_write_secr,
@@ -334,6 +413,9 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 
+	if (params->n_dice > 1)
+		params->ready = winbond_multi_die_ready;
+
 	if (params->otp.org)
 		params->otp.ops = &winbond_nor_otp_ops;
 

-- 
2.47.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
