Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A775BC61DD6
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Sep 2026 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TK5sDJiqPrq0+ALG7m+BHnVgU8gbPwD5bxY4bg6IOqk=; b=bwyQaBgJpvZy7X
	MY1ep+robLcxctiBYfwBNmE6E7OWJqkFHCf4rWcWKpRayB/vNKtNy0kA0L6IL2iMelQ24W81sODI/
	1svb65TjuBh19XpxV1IytvmzuPOBWlBMNfQzpex2+WB7tJJoP7knhR0u6rb1Aj/ShC9wgOKqeM4XV
	9mXJKAZmrwlpK7E5y1kvWUOR+HrB1PlOJ9LrJr/b/ay1iZ47OnychfuQvlJOX8KpxdHZwa1d2ZNFy
	KMNKelTXcs2aQBiabS0WxYZMz9kchjE/qI6pujLWQTkrqXrLs1/zlUGCjMUj1M/66KVtxOSt7S802
	JpOFOJ3kVc9pABZVQRkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJX-0000000FKLq-2OaQ;
	Wed, 02 Sep 2026 16:59:56 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1oJR-0000000FKGj-452Z;
	Wed, 02 Sep 2026 16:59:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 49B824E414EA;
	Wed,  2 Sep 2026 16:59:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1DB576053C;
	Wed,  2 Sep 2026 16:59:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3E9DF11C79A58;
	Wed,  2 Sep 2026 18:59:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788368382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KtarpVS7SUNCOETBM6jxRFA19d7c4Ngqmy3UZEbrPCU=;
	b=ohiXSpbqfD4bABsu2uRmNbvV/aQpUzrTZ/TJZwvsgehYd00zxuBbXVyr5bZ/Qg92FF9Ya2
	FQ38DAz+09qgCTjSloSJba0oVuIJSAgQ+AoeXO2lkn3mKZcMCDS1slCSwOBBOXirfkzBBv
	pWjlmVpPSWJE4gJQ4JPSLSfXhOHYhKv28n6pnE8k/s3LEJORTa1kYRIgyfBpDI86eaRTxs
	wcsCNJluOeM79V4mBR0D8Q1XIPW4mtX/U17qIPsgv+5jVSbBaM1yGl+WAVj0gu5PEoPTzf
	+IHNJyzl2wuZ5QWHlToO4QOX1YKIkQyj+Qf5wx77+cg4f0/XnrRoIhPtYoH2mw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 02 Sep 2026 18:59:17 +0200
Subject: [PATCH v4 03/25] mtd: spi-nor: Refactor Read Status/Write Status
 support
MIME-Version: 1.0
Message-Id: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-3-779d35303dff@bootlin.com>
References: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
In-Reply-To: <20260902-winbond-v7-1-spi-nor-rv-addition-v4-0-779d35303dff@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_095950_489042_74438296 
X-CRM114-Status: GOOD (  42.23  )
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

SPI NOR has a lot of history. Additions over additions, the subtleties
of the JESD216 specification, their implementations by the manufacturers
and the hardware mistakes have generated a gigantic maze, let's try to
understand what is really needed.

The specification explains the QE (Quad Enable) bitfield as describing
where the bit to enable the Quad capability is, but also how to set
it. Unfortunately, the specification is not precise about what opcodes
are supported exactly in all the cases. There is an introduction that
basically states:
- Opcode 0x05 reads SR1
- Opcode 0x35 reads SR2
- Opcode 0x01 writes SR1, and then SR2 if another byte is written

Then the bitfield, among indicating the location of the QE bit, may
indicate:
- Reading SR1 and SR2 in one operation is not possible (loops over the
  content of SR1)
- Reading SR2 directly is possible
- Only writing SR1 zeroes SR2.

One problem with the current implementation, is that it only focuses on
the QE bit. A quad_enable function was created for each case, even
though in practice, the logic was always the same: read, modify, write,
read back and verify. One problem comes when other features need to play
with the status registers, like software block protection or OTP: you
never know how to properly handle the QE bit, nor where it is, nor how
to read/write the Status registers. This lead to
approximations/guessing (in swp.c, otp.c and obviously in legacy
controller drivers like atmel.c) but also to the implementation of a
gazillon of helpers for reading/writing/checking the status registers.

In addition, I believe some design decisions had a negative impact over
the years.

- All possible situations had to be flagged by the core. This is likely
  wrong, because we no longer know why we need specific quirks. It was
  ineherent to the state of the SPI NOR core before the great cleanup
  that had happened the past few years. I believe this creates confusion
  in the core today, and we should push this to vendor fixups
  instead. As an example, in 2023 Hsin-Yi was facing an issue because
  his chip was setting the wrong QER value, leading to RDCR being
  prevented, thus falling into a condition blindly setting a random QE
  bit (I strongy believe it is done like that for wrong reasons). His
  chip actually had RDCR support! The correct fix should have been to
  mark the capability in a device fixup instead of handling this in the
  core.

  Link: https://lore.kernel.org/lkml/CAJMQK-hR0eaO0b4Vd0U8_KAndLyZapqdHjVLAoe42rWi9rdLkA@mail.gmail.com/

- SFDP parsing is over cautious. I believe
  BFPT_DWORD15_QER_SR2_BIT1_NO_RD is abusive (nothing states that RDCR is
  not supported), and BFPT_DWORD15_QER_SR2_BIT1 is also out of
  specification when forcing 16-bit Status writes.

- SNOR_F_HAS_16BIT_SR is only imposing 16bit Status writes, whereas
  reads can still be 8-bit wide.

- The usage of helpers verifying the writes was also spread for IMHO no
  really good reason. Why shouldn't we trust spi operations when it
  comes to Status Registers? We do not read back our page reads, so why
  status registers should be treated with so much care, if it's not
  because we are unsure of what is being done? My proposal includes a
  check when it comes to the QE bit (done once) but we don't need these
  checks otherwise. If the QE bit was written properly, there are high
  chances that the other register accesses will just be fine, no?

Asde from my main quest, I also observed no good reason to ask the
read/write status register callers to use nor->bouncebuf while the
low-level helpers could do it themselves (we are talking about one or
two bytes being copied).

So after these observations, my proposal is the following:
- Create private low level helpers that just read or write a status
  register. They are flexible, we can give the opcode (which varies
  based on the SFDP QER field) and the length (1 or 2).
- Create public generic accessors which will be used to read/write sr1
  and/or sr2. This is where all the cleverness shall be. The helpers use
  the available opcodes for a given chip in order to fullfill the
  request.
- Provide a single generic ->quad_enable() hook which generically does
  all the steps mentioned above (read, modify, write, read back and
  verify).
- Create a list of opcodes for all 6 possible situations:
  {read, write} {sr1, sr2, sr1 and sr2}. These opcodes are
  filled/cleared based on the QER field. An opcode set to 0 indicates
  the absence of support (there is no 0x00 opcode in SPI NOR).

I tried my best to analyze the current behavior and to mimic it as much
as possible, but this is a risky cleanup. However, if we go for this, it
will be *much* easier in the future to handle all kind of chip
variations. We won't be limited to a couple of flags anymore, but rather
we'll be able to just disable a read or write capability using a single
line.

Known deviations:
- The Atmel manufacturer driver drives non SFDP chips which by default
  were receiving the HAS_16B_WR flag, forcing SR2 writes all the times,
  but it was deliberately making single bytes writes to SR1 for its
  locking operations. The flag is likely wrong for them, so I removed
  it.
- I am proposing on purpose a single quad_enable helper. It should match
  all the cases, with 1 identified difference which I believe is
  harmless: in the SR2_BIT7 case, the helper would make an extra SR1
  read/write which was not done before. This entry explicitly supports
  reading and writing the two registers. Note: no manufacturer has been
  identified to actually use that entry yet.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
This is a really hard to review patch, it is big, full of changes
everywhere, but I cannot really split it further. The commit log is
really important, it tries to explain the steps I went through when
trying to refactor the whole QE/SR handling for which I received
feedback from Michael, Tudor and Sashiko.

Ideally we could expect test coverage of each case:
- BFPT_DWORD15_QER_NONE: Probably not needed
- BFPT_DWORD15_QER_SR2_BIT1_BUGGY: Expected from Hsin-Yi (flag is being
  renamed _NO_1B_WR)
- BFPT_DWORD15_QER_SR2_BIT1_NO_RD: Tested with a chip re-enabling RDCR
  in a fixup
- BFPT_DWORD15_QER_SR1_BIT6: TBD
- BFPT_DWORD15_QER_SR2_BIT7: TBD
- BFPT_DWORD15_QER_SR2_BIT1: TBD
- BFPT_DWORD15_QER_SR2_BIT1_1B: Done.
There will probably be breakages on older chips. These cannot be
guessed because they are not properly listed in manufacturer
fixups (yet). If we want a cleanup/simplification, we will have to cope
with this risk.

I hope the diff stats will motivate people to have a look and report
their testing.

I will also eagerly monitor Sashiko's output which will probably be
very useful to catch niche weird cases where these changes might break.
---
 Documentation/driver-api/mtd/spi-nor.rst |   2 +-
 drivers/mtd/spi-nor/atmel.c              |  52 ++-
 drivers/mtd/spi-nor/core.c               | 774 +++++++++++--------------------
 drivers/mtd/spi-nor/core.h               |  59 +--
 drivers/mtd/spi-nor/debugfs.c            |   2 -
 drivers/mtd/spi-nor/gigadevice.c         |   6 +-
 drivers/mtd/spi-nor/issi.c               |   3 +-
 drivers/mtd/spi-nor/macronix.c           |  12 +-
 drivers/mtd/spi-nor/micron-st.c          |   4 +-
 drivers/mtd/spi-nor/otp.c                |  16 +-
 drivers/mtd/spi-nor/sfdp.c               |  41 +-
 drivers/mtd/spi-nor/spansion.c           |  16 +-
 drivers/mtd/spi-nor/sst.c                |   5 +-
 drivers/mtd/spi-nor/swp.c                |  97 ++--
 drivers/mtd/spi-nor/winbond.c            |   4 +-
 include/linux/mtd/spi-nor.h              |   4 -
 16 files changed, 447 insertions(+), 650 deletions(-)

diff --git a/Documentation/driver-api/mtd/spi-nor.rst b/Documentation/driver-api/mtd/spi-nor.rst
index 747a326fb6c0..5441fa7d4f04 100644
--- a/Documentation/driver-api/mtd/spi-nor.rst
+++ b/Documentation/driver-api/mtd/spi-nor.rst
@@ -118,7 +118,7 @@ section, after the ``---`` marker.
     write size		1
     page size		256
     address nbytes	3
-    flags		HAS_LOCK | HAS_16BIT_SR | SOFT_RESET | SWP_IS_VOLATILE
+    flags		HAS_LOCK | SOFT_RESET | SWP_IS_VOLATILE
 
     opcodes
      read		0xeb
diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
index 82c592f0a1e1..8741c0bda497 100644
--- a/drivers/mtd/spi-nor/atmel.c
+++ b/drivers/mtd/spi-nor/atmel.c
@@ -23,18 +23,28 @@ static int at25fs_nor_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 
 static int at25fs_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
+	/* Write 0x00 to the status register to disable write protection */
+	u8 sr = 0;
 	int ret;
 
 	/* We only support unlocking the whole flash array */
 	if (ofs || len != nor->params->size)
 		return -EINVAL;
 
-	/* Write 0x00 to the status register to disable write protection */
-	ret = spi_nor_write_sr_and_check(nor, 0);
+	ret = spi_nor_write_sr1(nor, &sr);
 	if (ret)
-		dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
+		return ret;
 
-	return ret;
+	ret = spi_nor_read_sr1(nor, &sr);
+	if (ret)
+		return ret;
+
+	if (sr) {
+		dev_dbg(nor->dev, "unable to clear BP bits, WP# asserted?\n");
+		return -EIO;
+	}
+
+	return 0;
 }
 
 static int at25fs_nor_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
@@ -50,6 +60,7 @@ static const struct spi_nor_locking_ops at25fs_nor_locking_ops = {
 
 static int at25fs_nor_late_init(struct spi_nor *nor)
 {
+	nor->params->opcodes.write_sr1 = SPINOR_OP_WRSR;
 	nor->params->locking_ops = &at25fs_nor_locking_ops;
 
 	return 0;
@@ -69,6 +80,7 @@ static const struct spi_nor_fixups at25fs_nor_fixups = {
  * Return: 0 on success, -error otherwise.
  */
 static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
+
 					   u64 len, bool is_protect)
 {
 	int ret;
@@ -78,19 +90,24 @@ static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
 	if (ofs || len != nor->params->size)
 		return -EINVAL;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1(nor, &sr);
 	if (ret)
 		return ret;
 
-	sr = nor->bouncebuf[0];
-
 	/* SRWD bit needs to be cleared, otherwise the protection doesn't change */
 	if (sr & SR_SRWD) {
 		sr &= ~SR_SRWD;
-		ret = spi_nor_write_sr_and_check(nor, sr);
-		if (ret) {
-			dev_dbg(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
+		ret = spi_nor_write_sr1(nor, &sr);
+		if (ret)
 			return ret;
+
+		ret = spi_nor_read_sr1(nor, &sr);
+		if (ret)
+			return ret;
+
+		if (sr & SR_SRWD) {
+			dev_dbg(nor->dev, "unable to clear SRWD bit, WP# asserted?\n");
+			return -EIO;
 		}
 	}
 
@@ -108,14 +125,7 @@ static int atmel_nor_set_global_protection(struct spi_nor *nor, loff_t ofs,
 		sr &= ~ATMEL_SR_GLOBAL_PROTECT_MASK;
 	}
 
-	nor->bouncebuf[0] = sr;
-
-	/*
-	 * We cannot use the spi_nor_write_sr_and_check() because this command
-	 * isn't really setting any bits, instead it is an pseudo command for
-	 * "Global Unprotect" or "Global Protect"
-	 */
-	return spi_nor_write_sr(nor, nor->bouncebuf, 1);
+	return spi_nor_write_sr1(nor, &sr);
 }
 
 static int atmel_nor_global_protect(struct spi_nor *nor, loff_t ofs, u64 len)
@@ -131,16 +141,17 @@ static int atmel_nor_global_unprotect(struct spi_nor *nor, loff_t ofs, u64 len)
 static int atmel_nor_is_global_protected(struct spi_nor *nor, loff_t ofs,
 					 u64 len)
 {
+	u8 sr;
 	int ret;
 
 	if (ofs >= nor->params->size || (ofs + len) > nor->params->size)
 		return -EINVAL;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1(nor, &sr);
 	if (ret)
 		return ret;
 
-	return ((nor->bouncebuf[0] & ATMEL_SR_GLOBAL_PROTECT_MASK) == ATMEL_SR_GLOBAL_PROTECT_MASK);
+	return ((sr & ATMEL_SR_GLOBAL_PROTECT_MASK) == ATMEL_SR_GLOBAL_PROTECT_MASK);
 }
 
 static const struct spi_nor_locking_ops atmel_nor_global_protection_ops = {
@@ -151,6 +162,7 @@ static const struct spi_nor_locking_ops atmel_nor_global_protection_ops = {
 
 static int atmel_nor_global_protection_late_init(struct spi_nor *nor)
 {
+	nor->params->opcodes.write_sr1 = SPINOR_OP_WRSR;
 	nor->params->locking_ops = &atmel_nor_global_protection_ops;
 
 	return 0;
diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 29b8fe3d1c65..020045c14c68 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -443,75 +443,6 @@ int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 	return ret;
 }
 
-/**
- * spi_nor_read_sr() - Read the Status Register.
- * @nor:	pointer to 'struct spi_nor'.
- * @sr:		pointer to a DMA-able buffer where the value of the
- *              Status Register will be written. Should be at least 2 bytes.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_RDSR_OP(sr);
-
-		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
-			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
-			op.dummy.nbytes = nor->params->rdsr_dummy;
-			/*
-			 * We don't want to read only one byte in DTR mode. So,
-			 * read 2 and then discard the second byte.
-			 */
-			op.data.nbytes = 2;
-		}
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR, sr,
-						      1);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d reading SR\n", ret);
-
-	return ret;
-}
-
-/**
- * spi_nor_read_cr() - Read the Configuration Register using the
- * SPINOR_OP_RDCR (35h) command.
- * @nor:	pointer to 'struct spi_nor'
- * @cr:		pointer to a DMA-able buffer where the value of the
- *              Configuration Register will be written.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_read_cr(struct spi_nor *nor, u8 *cr)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_RDCR_OP(cr);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDCR, cr,
-						      1);
-	}
-
-	if (ret)
-		dev_dbg(nor->dev, "error %d reading CR\n", ret);
-
-	return ret;
-}
-
 /**
  * spi_nor_set_4byte_addr_mode_en4b_ex4b() - Enter/Exit 4-byte address mode
  *			using SPINOR_OP_EN4B/SPINOR_OP_EX4B. Typically used by
@@ -617,12 +548,13 @@ int spi_nor_set_4byte_addr_mode_brwr(struct spi_nor *nor, bool enable)
 int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int ret;
+	u8 sr;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1(nor, &sr);
 	if (ret)
 		return ret;
 
-	return !(nor->bouncebuf[0] & SR_WIP);
+	return !(sr & SR_WIP);
 }
 
 /**
@@ -784,345 +716,287 @@ int spi_nor_global_block_unlock(struct spi_nor *nor)
 }
 
 /**
- * spi_nor_write_sr() - Write the Status Register.
+ * spi_nor_read_sr_ll() - Low-level Status Registers read.
  * @nor:	pointer to 'struct spi_nor'.
- * @sr:		pointer to DMA-able buffer to write to the Status Register.
- * @len:	number of bytes to write to the Status Register.
+ * @opcode:	opcode for the status register read operation.
+ * @sr:		pointer to buffer for storing the content of the status registers.
+ * @len:	number of status registers to read (1 or 2).
  *
  * Return: 0 on success, -errno otherwise.
  */
-int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len)
+int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
+		       unsigned int len)
 {
-	int ret;
+	int ret, i;
 
-	ret = spi_nor_write_enable(nor);
-	if (ret)
-		return ret;
+	if (len > 2)
+		return -EINVAL;
+
+	for (i = 0; i < len; i++)
+		nor->bouncebuf[i] = 0;
 
 	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_WRSR_OP(sr, len);
+		struct spi_mem_op op = SPI_NOR_RDSR_OP(opcode, nor->bouncebuf, len);
+
+		if (nor->reg_proto == SNOR_PROTO_8_8_8_DTR) {
+			op.addr.nbytes = nor->params->rdsr_addr_nbytes;
+			op.dummy.nbytes = nor->params->rdsr_dummy;
+			/*
+			 * We don't want to read only one byte in DTR mode. So,
+			 * read 2 and then discard the second byte.
+			 */
+			op.data.nbytes = 2;
+		}
 
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR, sr,
-						       len);
+		ret = spi_nor_controller_ops_read_reg(nor, opcode, nor->bouncebuf, len);
 	}
 
-	if (ret) {
-		dev_dbg(nor->dev, "error %d writing SR\n", ret);
-		return ret;
-	}
-
-	return spi_nor_wait_till_ready(nor);
-}
-
-/**
- * spi_nor_write_sr1_and_check() - Write one byte to the Status Register 1 and
- * ensure that the byte written match the received value.
- * @nor:	pointer to a 'struct spi_nor'.
- * @sr1:	byte value to be written to the Status Register.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_write_sr1_and_check(struct spi_nor *nor, u8 sr1)
-{
-	int ret;
-
-	nor->bouncebuf[0] = sr1;
-
-	ret = spi_nor_write_sr(nor, nor->bouncebuf, 1);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] != sr1) {
-		dev_dbg(nor->dev, "SR1: read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/**
- * spi_nor_write_16bit_sr_and_check() - Write the Status Register 1 and the
- * Status Register 2 in one shot. Ensure that the byte written in the Status
- * Register 1 match the received value, and that the 16-bit Write did not
- * affect what was already in the Status Register 2.
- * @nor:	pointer to a 'struct spi_nor'.
- * @sr1:	byte value to be written to the Status Register 1.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_write_16bit_sr_and_check(struct spi_nor *nor, u8 sr1)
-{
-	int ret;
-	u8 *sr_cr = nor->bouncebuf;
-	u8 cr_written;
-
-	/* Make sure we don't overwrite the contents of Status Register 2. */
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-		ret = spi_nor_read_cr(nor, &sr_cr[1]);
-		if (ret)
-			return ret;
-	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
-		    spi_nor_get_protocol_width(nor->write_proto) == 4) &&
-		   nor->params->quad_enable) {
-		/*
-		 * If the Status Register 2 Read command (35h) is not
-		 * supported, we should at least be sure we don't
-		 * change the value of the SR2 Quad Enable bit.
-		 *
-		 * When the Quad Enable method is set and the buswidth is 4, we
-		 * can safely assume that the value of the QE bit is one, as a
-		 * consequence of the nor->params->quad_enable() call.
-		 *
-		 * According to the JESD216 revB standard, BFPT DWORDS[15],
-		 * bits 22:20, the 16-bit Write Status (01h) command is
-		 * available just for the cases in which the QE bit is
-		 * described in SR2 at BIT(1).
-		 */
-		sr_cr[1] = SR2_QUAD_EN_BIT1;
-	} else {
-		sr_cr[1] = 0;
-	}
-
-	sr_cr[0] = sr1;
-
-	ret = spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	if (sr1 != sr_cr[0]) {
-		dev_dbg(nor->dev, "SR: Read back test failed\n");
-		return -EIO;
-	}
-
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		return 0;
-
-	cr_written = sr_cr[1];
-
-	ret = spi_nor_read_cr(nor, &sr_cr[1]);
-	if (ret)
-		return ret;
-
-	if (cr_written != sr_cr[1]) {
-		dev_dbg(nor->dev, "CR: read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/**
- * spi_nor_write_16bit_cr_and_check() - Write the Status Register 1 and the
- * Configuration Register in one shot. Ensure that the byte written in the
- * Configuration Register match the received value, and that the 16-bit Write
- * did not affect what was already in the Status Register 1.
- * @nor:	pointer to a 'struct spi_nor'.
- * @cr:		byte value to be written to the Configuration Register.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
-{
-	int ret;
-	u8 *sr_cr = nor->bouncebuf;
-	u8 sr_written;
-
-	/* Keep the current value of the Status Register 1. */
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	sr_cr[1] = cr;
-
-	ret = spi_nor_write_sr(nor, sr_cr, 2);
-	if (ret)
-		return ret;
-
-	sr_written = sr_cr[0];
-
-	ret = spi_nor_read_sr(nor, sr_cr);
-	if (ret)
-		return ret;
-
-	if (sr_written != sr_cr[0]) {
-		dev_dbg(nor->dev, "SR: Read back test failed\n");
-		return -EIO;
-	}
-
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		return 0;
-
-	ret = spi_nor_read_cr(nor, &sr_cr[1]);
-	if (ret)
-		return ret;
-
-	if (cr != sr_cr[1]) {
-		dev_dbg(nor->dev, "CR: read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/**
- * spi_nor_write_16bit_sr_cr_and_check() - Write the Status Register 1 and the
- * Configuration Register in one shot. Ensure that the bytes written in both
- * registers match the received value.
- * @nor:	pointer to a 'struct spi_nor'.
- * @regs:	two-byte array with values to be written to the status and
- *		configuration registers.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
-{
-	u8 written_regs[2];
-	int ret;
-
-	written_regs[0] = regs[0];
-	written_regs[1] = regs[1];
-	nor->bouncebuf[0] = regs[0];
-	nor->bouncebuf[1] = regs[1];
-
-	ret = spi_nor_write_sr(nor, nor->bouncebuf, 2);
-	if (ret)
-		return ret;
-
-	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
-	if (ret)
-		return ret;
-
-	if (written_regs[0] != nor->bouncebuf[0]) {
-		dev_dbg(nor->dev, "SR: Read back test failed\n");
-		return -EIO;
-	}
-
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		return 0;
-
-	ret = spi_nor_read_cr(nor, &nor->bouncebuf[1]);
-	if (ret)
-		return ret;
-
-	if (written_regs[1] != nor->bouncebuf[1]) {
-		dev_dbg(nor->dev, "CR: read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
-/**
- * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
- * the byte written match the received value without affecting other bits in the
- * Status Register 1 and 2.
- * @nor:	pointer to a 'struct spi_nor'.
- * @sr1:	byte value to be written to the Status Register.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
-{
-	if (nor->flags & SNOR_F_HAS_16BIT_SR)
-		return spi_nor_write_16bit_sr_and_check(nor, sr1);
-
-	return spi_nor_write_sr1_and_check(nor, sr1);
-}
-
-/**
- * spi_nor_write_sr_cr_and_check() - Write the Status Register 1 and ensure that
- * the byte written match the received value. Same for the Control Register if
- * available.
- * @nor:	pointer to a 'struct spi_nor'.
- * @regs:	byte array to be written to the registers.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
-{
-	if (nor->flags & SNOR_F_HAS_16BIT_SR)
-		return spi_nor_write_16bit_sr_cr_and_check(nor, regs);
-
-	return spi_nor_write_sr1_and_check(nor, regs[0]);
-}
-
-/**
- * spi_nor_write_sr2() - Write the Status Register 2 using the
- * SPINOR_OP_WRSR2 (3eh) command.
- * @nor:	pointer to 'struct spi_nor'.
- * @sr2:	pointer to DMA-able buffer to write to the Status Register 2.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
-{
-	int ret;
-
-	ret = spi_nor_write_enable(nor);
-	if (ret)
-		return ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_WRSR2_OP(sr2);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_write_reg(nor, SPINOR_OP_WRSR2,
-						       sr2, 1);
-	}
-
-	if (ret) {
-		dev_dbg(nor->dev, "error %d writing SR2\n", ret);
-		return ret;
-	}
-
-	return spi_nor_wait_till_ready(nor);
-}
-
-/**
- * spi_nor_read_sr2() - Read the Status Register 2 using the
- * SPINOR_OP_RDSR2 (3fh) command.
- * @nor:	pointer to 'struct spi_nor'.
- * @sr2:	pointer to DMA-able buffer where the value of the
- *		Status Register 2 will be written.
- *
- * Return: 0 on success, -errno otherwise.
- */
-static int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
-{
-	int ret;
-
-	if (nor->spimem) {
-		struct spi_mem_op op = SPI_NOR_RDSR2_OP(sr2);
-
-		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
-
-		ret = spi_mem_exec_op(nor->spimem, &op);
-	} else {
-		ret = spi_nor_controller_ops_read_reg(nor, SPINOR_OP_RDSR2, sr2,
-						      1);
-	}
+	memcpy(sr, nor->bouncebuf, len);
 
 	if (ret)
-		dev_dbg(nor->dev, "error %d reading SR2\n", ret);
+		dev_dbg(nor->dev, "Error %d reading Status Registers\n", ret);
 
 	return ret;
 }
 
+/**
+ * spi_nor_write_sr_ll() - Low-level Status Registers write.
+ * @nor:	pointer to 'struct spi_nor'.
+ * @opcode:	opcode for the status register write operation.
+ * @sr:		pointer to status registers buffer to write.
+ * @len:	number of status registers to write.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode,	const u8 *sr,
+			       unsigned int len)
+{
+	int ret, i;
+
+	if (len > 2)
+		return -EINVAL;
+
+	ret = spi_nor_write_enable(nor);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < len; i++)
+		nor->bouncebuf[i] = sr[i];
+
+	if (nor->spimem) {
+		struct spi_mem_op op = SPI_NOR_WRSR_OP(opcode,
+						       nor->bouncebuf, len);
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
+		ret = spi_mem_exec_op(nor->spimem, &op);
+	} else {
+		ret = spi_nor_controller_ops_write_reg(nor, opcode,
+						       nor->bouncebuf, len);
+	}
+
+	if (ret) {
+		dev_dbg(nor->dev, "Error %d writing Status Registers\n", ret);
+		return ret;
+	}
+
+	return spi_nor_wait_till_ready(nor);
+}
+
+/**
+ * spi_nor_read_sr1() - Read SR1 only
+ * Useful for:
+ *   - The core to offer a generic "read SR1 and SR2" capability
+ *   - Manufacturer drivers (since they know the chip SR layout)
+ *   - Polling the BUSY bit in the core
+ *
+ * @nor: the spi_nor structure
+ * @sr1: pointer to a valid SR1 buffer
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_read_sr1(struct spi_nor *nor, u8 *sr1)
+{
+	return spi_nor_read_sr_ll(nor, nor->params->opcodes.read_sr1, sr1, 1);
+}
+
+/**
+ * spi_nor_read_sr2() - Read SR2 only
+ * Useful for:
+ *   - The core to offer a generic "read SR1 and SR2" capability
+ *   - Manufacturer drivers (since they know the chip SR layout)
+ *   - SR2 based OTP configuration
+ *
+ * @nor: the spi_nor structure
+ * @sr2: pointer to a valid SR2 buffer
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+
+	if (!params->opcodes.read_sr2)
+		return -EINVAL;
+
+	return spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
+}
+
+/**
+ * spi_nor_read_sr1_and_sr2() - Read SR1 then SR2
+ * General purpose helper.
+ *
+ * @nor: the spi_nor structure
+ * @sr: pointer to a valid 2-byte array
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr)
+{
+	int ret;
+
+	ret = spi_nor_read_sr1(nor, &sr[0]);
+	if (ret)
+		return ret;
+
+	return spi_nor_read_sr2(nor, &sr[1]);
+}
+
+/**
+ * spi_nor_write_sr1() - Write SR1 only
+ * Useful for:
+ *   - Manufacturer drivers (since they know the chip SR layout)
+ *
+ * @nor: the spi_nor structure
+ * @sr1: pointer to a valid SR1 buffer
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_write_sr1(struct spi_nor *nor, const u8 *sr1)
+{
+	if (WARN_ONCE(!nor->params->opcodes.write_sr1,
+		      "Restricted helper use, write SR1 not supported"))
+		return -EIO;
+
+	return spi_nor_write_sr_ll(nor, nor->params->opcodes.write_sr1, sr1, 1);
+}
+
+/**
+ * spi_nor_write_sr2() - Write SR2 only
+ * Useful for:
+ *   - Manufacturer drivers (since they know the chip SR layout)
+ *   - SR2 based OTP configuration
+ *
+ * @nor: the spi_nor structure
+ * @sr2: pointer to a valid SR2 buffer
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2)
+{
+	if (WARN_ONCE(!nor->params->opcodes.write_sr2,
+		      "Restricted helper use, write SR2 not supported"))
+		return -EIO;
+
+	return spi_nor_write_sr_ll(nor, nor->params->opcodes.write_sr2, sr2, 1);
+}
+
+/**
+ * spi_nor_write_sr1_and_sr2() - Write SR1 then SR2
+ * General purpose helper, always safe to call. Will expectedly ignore
+ * SR2 on certain chips.
+ *
+ * @nor: the spi_nor structure
+ * @sr: pointer to a valid 2-byte array
+ *
+ * Return 0 or errno.
+ */
+static int spi_nor_write_sr1_and_sr2(struct spi_nor *nor, const u8 *sr)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
+
+	if (params->opcodes.write_sr1_and_sr2)
+		return spi_nor_write_sr_ll(nor,
+					   params->opcodes.write_sr1_and_sr2,
+					   sr, 2);
+
+	ret = spi_nor_write_sr1(nor, &sr[0]);
+	if (ret)
+		return ret;
+
+	if (params->opcodes.write_sr2)
+		return spi_nor_write_sr2(nor, &sr[1]);
+
+	return 0;
+}
+
+/**
+ * spi_nor_write_sr1_and_sr2_and_check() - Write SR1 then SR2, then read
+ *					   them back and verifies
+ * General purpose helper, always safe to call. Will expectedly ignore
+ * SR2 on certain chips.
+ *
+ * @nor: the spi_nor structure
+ * @sr: pointer to a valid 2-byte array
+ *
+ * Return 0 or errno.
+ */
+int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr)
+{
+	u8 tmp[2];
+	int ret;
+
+	ret = spi_nor_write_sr1_and_sr2(nor, sr);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_sr1_and_sr2(nor, tmp);
+	if (ret)
+		return ret;
+
+	if (sr[0] != tmp[0] || sr[1] != tmp[1])
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * spi_nor_generic_quad_enable() - Read the status registers,
+ *				   apply the QE bit mask,
+ *				   write the status registers,
+ *				   read them back and check the content.
+ *
+ * @nor:	pointer to 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_generic_quad_enable(struct spi_nor *nor)
+{
+	u8 *qe_mask = nor->params->qe_mask;
+	u8 sr[2] = {};
+	int ret;
+
+	if (!qe_mask[0] && !qe_mask[1])
+		return 0;
+
+	ret = spi_nor_read_sr1_and_sr2(nor, sr);
+	if (ret)
+		return ret;
+
+	if (sr[0] & qe_mask[0] || sr[1] & qe_mask[1])
+		return 0;
+
+	sr[0] |= qe_mask[0];
+	sr[1] |= qe_mask[1];
+
+	return spi_nor_write_sr1_and_sr2_and_check(nor, sr);
+}
+
 /**
  * spi_nor_erase_die() - Erase the entire die.
  * @nor:	pointer to 'struct spi_nor'.
@@ -1904,106 +1778,6 @@ static int spi_nor_erase(struct mtd_info *mtd, struct erase_info *instr)
 	return ret;
 }
 
-/**
- * spi_nor_sr1_bit6_quad_enable() - Set the Quad Enable BIT(6) in the Status
- * Register 1.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Bit 6 of the Status Register 1 is the QE bit for Macronix like QSPI memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor)
-{
-	int ret;
-
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SR1_QUAD_EN_BIT6)
-		return 0;
-
-	nor->bouncebuf[0] |= SR1_QUAD_EN_BIT6;
-
-	return spi_nor_write_sr1_and_check(nor, nor->bouncebuf[0]);
-}
-
-/**
- * spi_nor_sr2_bit1_quad_enable() - set the Quad Enable BIT(1) in the Status
- * Register 2.
- * @nor:       pointer to a 'struct spi_nor'.
- *
- * Bit 1 of the Status Register 2 is the QE bit for Spansion like QSPI memories.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor)
-{
-	int ret;
-
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		return spi_nor_write_16bit_cr_and_check(nor, SR2_QUAD_EN_BIT1);
-
-	ret = spi_nor_read_cr(nor, nor->bouncebuf);
-	if (ret)
-		return ret;
-
-	if (nor->bouncebuf[0] & SR2_QUAD_EN_BIT1)
-		return 0;
-
-	nor->bouncebuf[0] |= SR2_QUAD_EN_BIT1;
-
-	return spi_nor_write_16bit_cr_and_check(nor, nor->bouncebuf[0]);
-}
-
-/**
- * spi_nor_sr2_bit7_quad_enable() - set QE bit in Status Register 2.
- * @nor:	pointer to a 'struct spi_nor'
- *
- * Set the Quad Enable (QE) bit in the Status Register 2.
- *
- * This is one of the procedures to set the QE bit described in the SFDP
- * (JESD216 rev B) specification but no manufacturer using this procedure has
- * been identified yet, hence the name of the function.
- *
- * Return: 0 on success, -errno otherwise.
- */
-int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor)
-{
-	u8 *sr2 = nor->bouncebuf;
-	int ret;
-	u8 sr2_written;
-
-	/* Check current Quad Enable bit value. */
-	ret = spi_nor_read_sr2(nor, sr2);
-	if (ret)
-		return ret;
-	if (*sr2 & SR2_QUAD_EN_BIT7)
-		return 0;
-
-	/* Update the Quad Enable bit. */
-	*sr2 |= SR2_QUAD_EN_BIT7;
-
-	ret = spi_nor_write_sr2(nor, sr2);
-	if (ret)
-		return ret;
-
-	sr2_written = *sr2;
-
-	/* Read back and check it. */
-	ret = spi_nor_read_sr2(nor, sr2);
-	if (ret)
-		return ret;
-
-	if (*sr2 != sr2_written) {
-		dev_dbg(nor->dev, "SR2: Read back test failed\n");
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static const struct spi_nor_manufacturer *manufacturers[] = {
 	&spi_nor_atmel,
 	&spi_nor_eon,
@@ -2494,6 +2268,7 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 {
 	struct spi_nor_flash_parameter *params = nor->params;
 	unsigned int cap;
+	u8 opcode;
 
 	/* X-X-X modes are not supported yet, mask them all. */
 	*hwcaps &= ~SNOR_HWCAPS_X_X_X;
@@ -2525,14 +2300,14 @@ spi_nor_spimem_adjust_hwcaps(struct spi_nor *nor, u32 *hwcaps)
 			*hwcaps &= ~BIT(cap);
 	}
 
-	/* Some SPI controllers might not support CR read opcode. */
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-		struct spi_mem_op op = SPI_NOR_RDCR_OP(nor->bouncebuf);
-
+	/* Some SPI controllers might not support reading SR2 */
+	opcode = nor->params->opcodes.read_sr2;
+	if (opcode) {
+		struct spi_mem_op op = SPI_NOR_RDSR_OP(opcode, nor->bouncebuf, 1);
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		if (!spi_mem_supports_op(nor->spimem, &op))
-			nor->flags |= SNOR_F_NO_READ_CR;
+			nor->params->opcodes.read_sr2 = 0;
 	}
 }
 
@@ -3107,11 +2882,14 @@ static void spi_nor_init_default_params(struct spi_nor *nor)
 	const struct flash_info *info = nor->info;
 	struct device_node *np = spi_nor_get_flash_node(nor);
 
-	params->quad_enable = spi_nor_sr2_bit1_quad_enable;
-	params->otp.org = info->otp;
+	/* Default to 16-bit Read/Write Status commands */
+	params->opcodes.read_sr1 = SPINOR_OP_RDSR;
+	params->opcodes.read_sr2 = SPINOR_OP_RDCR;
+	params->opcodes.write_sr1_and_sr2 = SPINOR_OP_WRSR;
+	params->quad_enable = spi_nor_generic_quad_enable;
+	params->qe_mask[1] = BIT(1);
 
-	/* Default to 16-bit Write Status (01h) Command */
-	nor->flags |= SNOR_F_HAS_16BIT_SR;
+	params->otp.org = info->otp;
 
 	/* Set SPI NOR sizes. */
 	params->writesize = 1;
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 2cc0c80da3fa..8b05371655f4 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -37,36 +37,18 @@
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_NO_DATA)
 
-#define SPI_NOR_RDSR_OP(buf)						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR, 0),			\
+#define SPI_NOR_RDSR_OP(opcode, buf, len)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_DATA_IN(1, buf, 0))
+		   SPI_MEM_OP_DATA_IN(len, buf, 0))
 
-#define SPI_NOR_WRSR_OP(buf, len)					\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR, 0),			\
+#define SPI_NOR_WRSR_OP(opcode, buf, len)				\
+	SPI_MEM_OP(SPI_MEM_OP_CMD(opcode, 0),				\
 		   SPI_MEM_OP_NO_ADDR,					\
 		   SPI_MEM_OP_NO_DUMMY,					\
 		   SPI_MEM_OP_DATA_OUT(len, buf, 0))
 
-#define SPI_NOR_RDSR2_OP(buf)						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDSR2, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
-
-#define SPI_NOR_WRSR2_OP(buf)						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WRSR2, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_DATA_OUT(1, buf, 0))
-
-#define SPI_NOR_RDCR_OP(buf)						\
-	SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_RDCR, 0),			\
-		   SPI_MEM_OP_NO_ADDR,					\
-		   SPI_MEM_OP_NO_DUMMY,					\
-		   SPI_MEM_OP_DATA_IN(1, buf, 0))
-
 #define SPI_NOR_EN4B_EX4B_OP(enable)					\
 	SPI_MEM_OP(SPI_MEM_OP_CMD(enable ? SPINOR_OP_EN4B : SPINOR_OP_EX4B, 0),	\
 		   SPI_MEM_OP_NO_ADDR,					\
@@ -129,8 +111,6 @@ enum spi_nor_option_flags {
 	SNOR_F_4B_OPCODES	= BIT(3),
 	SNOR_F_HAS_4BAIT	= BIT(4),
 	SNOR_F_HAS_LOCK		= BIT(5),
-	SNOR_F_HAS_16BIT_SR	= BIT(6),
-	SNOR_F_NO_READ_CR	= BIT(7),
 	SNOR_F_HAS_SR_TB_BIT6	= BIT(8),
 	SNOR_F_HAS_4BIT_BP      = BIT(9),
 	SNOR_F_HAS_SR_BP3_BIT6  = BIT(10),
@@ -345,9 +325,19 @@ struct spi_nor_otp {
  * List of variable opcodes used by the chip.
  *
  * @die_erase: opcode for erasing a die, defaults to SPINOR_OP_CHIP_ERASE
+ * @read_sr1: opcode for reading SR1 alone
+ * @read_sr2: opcode for reading SR2 alone
+ * @write_sr1: opcode for writing SR1 alone
+ * @write_sr2: opcode for writing SR2 alone
+ * @write_sr1_and_sr2: opcode for writing SR1 then SR2 in one operation
  */
 struct spi_nor_opcodes {
 	u8 die_erase;
+	u8 read_sr1;
+	u8 read_sr2;
+	u8 write_sr1;
+	u8 write_sr2;
+	u8 write_sr1_and_sr2;
 };
 
 /**
@@ -384,6 +374,7 @@ struct spi_nor_opcodes {
  * @otp:		SPI NOR OTP info.
  * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
  * @quad_enable:	enables SPI NOR quad mode.
+ * @qe_mask:		two bytes mask used to set/clear the QE bit
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
  * @ready:		(optional) flashes might use a different mechanism
  *			than reading the status register to indicate they
@@ -413,6 +404,7 @@ struct spi_nor_flash_parameter {
 
 	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
 	int (*quad_enable)(struct spi_nor *nor);
+	u8				qe_mask[2];
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);
 	int (*ready)(struct spi_nor *nor);
 
@@ -641,18 +633,17 @@ int spi_nor_wait_till_ready(struct spi_nor *nor);
 int spi_nor_global_block_unlock(struct spi_nor *nor);
 int spi_nor_prep_and_lock(struct spi_nor *nor);
 void spi_nor_unlock_and_unprep(struct spi_nor *nor);
-int spi_nor_sr1_bit6_quad_enable(struct spi_nor *nor);
-int spi_nor_sr2_bit1_quad_enable(struct spi_nor *nor);
-int spi_nor_sr2_bit7_quad_enable(struct spi_nor *nor);
 int spi_nor_read_id(struct spi_nor *nor, u8 naddr, u8 ndummy, u8 *id,
 		    enum spi_nor_protocol reg_proto);
-int spi_nor_read_sr(struct spi_nor *nor, u8 *sr);
 int spi_nor_sr_ready(struct spi_nor *nor);
-int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
-int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
-int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
-int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
-int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs);
+int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
+		       unsigned int len);
+int spi_nor_read_sr1(struct spi_nor *nor, u8 *sr1);
+int spi_nor_read_sr2(struct spi_nor *nor, u8 *sr2);
+int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 *sr);
+int spi_nor_write_sr1(struct spi_nor *nor, const u8 *sr1);
+int spi_nor_write_sr2(struct spi_nor *nor, const u8 *sr2);
+int spi_nor_write_sr1_and_sr2_and_check(struct spi_nor *nor, const u8 *sr);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);
diff --git a/drivers/mtd/spi-nor/debugfs.c b/drivers/mtd/spi-nor/debugfs.c
index ef6f0ffcd6bb..512825c3fc85 100644
--- a/drivers/mtd/spi-nor/debugfs.c
+++ b/drivers/mtd/spi-nor/debugfs.c
@@ -19,8 +19,6 @@ static const char *const snor_f_names[] = {
 	SNOR_F_NAME(4B_OPCODES),
 	SNOR_F_NAME(HAS_4BAIT),
 	SNOR_F_NAME(HAS_LOCK),
-	SNOR_F_NAME(HAS_16BIT_SR),
-	SNOR_F_NAME(NO_READ_CR),
 	SNOR_F_NAME(HAS_SR_TB_BIT6),
 	SNOR_F_NAME(HAS_4BIT_BP),
 	SNOR_F_NAME(HAS_SR_BP3_BIT6),
diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index ef1edd0add70..4070a692e968 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -23,8 +23,10 @@ gd25q256_post_bfpt(struct spi_nor *nor,
 	 *      GD25Q256E      | SFDP_JESD216_MAJOR | SFDP_JESD216B_MINOR
 	 */
 	if (bfpt_header->major == SFDP_JESD216_MAJOR &&
-	    bfpt_header->minor == SFDP_JESD216_MINOR)
-		nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	    bfpt_header->minor == SFDP_JESD216_MINOR) {
+		nor->params->qe_mask[0] = BIT(6);
+		nor->params->qe_mask[1] = 0;
+	}
 
 	return 0;
 }
diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
index 18d9a00aa22e..04db42b5141e 100644
--- a/drivers/mtd/spi-nor/issi.c
+++ b/drivers/mtd/spi-nor/issi.c
@@ -131,7 +131,8 @@ static const struct flash_info issi_nor_parts[] = {
 
 static void issi_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	nor->params->qe_mask[0] = BIT(6);
+	nor->params->qe_mask[1] = 0;
 }
 
 static const struct spi_nor_fixups issi_fixups = {
diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index e97f5cbd9aad..55612237c1ef 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -65,11 +65,12 @@ mx25l3255e_late_init_fixups(struct spi_nor *nor)
 
 	/*
 	 * SFDP of MX25L3255E is JESD216, which does not include the Quad
-	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing,
-	 * the quad_enable method is not set to spi_nor_sr1_bit6_quad_enable.
-	 * Therefore, it is necessary to correct this setting by late_init.
+	 * Enable bit Requirement in BFPT. As a result, during BFPT parsing
+	 * the quad_enable mask is reset. Therefore, it is necessary to
+	 * correct this setting by late_init.
 	 */
-	params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	params->qe_mask[0] = BIT(6);
+	params->qe_mask[1] = 0;
 
 	/*
 	 * In addition, MX25L3255E also supports 1-4-4 page program in 3-byte
@@ -314,7 +315,8 @@ static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 
 static void macronix_nor_default_init(struct spi_nor *nor)
 {
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+	nor->params->qe_mask[0] = BIT(6);
+	nor->params->qe_mask[1] = 0;
 }
 
 static int macronix_nor_late_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron-st.c
index 031cf887318c..344539d2a36a 100644
--- a/drivers/mtd/spi-nor/micron-st.c
+++ b/drivers/mtd/spi-nor/micron-st.c
@@ -229,7 +229,7 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor *nor,
 				      const struct sfdp_parameter_header *bfpt_header,
 				      const struct sfdp_bfpt *bfpt)
 {
-	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->opcodes.write_sr1 = 0;
 	return 0;
 }
 
@@ -633,7 +633,7 @@ static int micron_st_nor_ready(struct spi_nor *nor)
 static void micron_st_nor_default_init(struct spi_nor *nor)
 {
 	nor->flags |= SNOR_F_HAS_LOCK;
-	nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+	nor->params->opcodes.write_sr1 = 0;
 	nor->params->quad_enable = NULL;
 }
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 7d0b145d78d8..1eeb33a20091 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -175,24 +175,24 @@ static int spi_nor_otp_lock_bit_cr(unsigned int region)
  */
 int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
 {
-	u8 *cr = nor->bouncebuf;
 	int ret, lock_bit;
+	u8 sr[2];
 
 	lock_bit = spi_nor_otp_lock_bit_cr(region);
 	if (lock_bit < 0)
 		return lock_bit;
 
-	ret = spi_nor_read_cr(nor, cr);
+	ret = spi_nor_read_sr1_and_sr2(nor, sr);
 	if (ret)
 		return ret;
 
 	/* no need to write the register if region is already locked */
-	if (cr[0] & lock_bit)
+	if (sr[1] & lock_bit)
 		return 0;
 
-	cr[0] |= lock_bit;
+	sr[1] |= lock_bit;
 
-	return spi_nor_write_16bit_cr_and_check(nor, cr[0]);
+	return spi_nor_write_sr1_and_sr2_and_check(nor, sr);
 }
 
 /**
@@ -207,18 +207,18 @@ int spi_nor_otp_lock_sr2(struct spi_nor *nor, unsigned int region)
  */
 int spi_nor_otp_is_locked_sr2(struct spi_nor *nor, unsigned int region)
 {
-	u8 *cr = nor->bouncebuf;
 	int ret, lock_bit;
+	u8 sr2;
 
 	lock_bit = spi_nor_otp_lock_bit_cr(region);
 	if (lock_bit < 0)
 		return lock_bit;
 
-	ret = spi_nor_read_cr(nor, cr);
+	ret = spi_nor_read_sr2(nor, &sr2);
 	if (ret)
 		return ret;
 
-	return cr[0] & lock_bit;
+	return sr2 & lock_bit;
 }
 
 static loff_t spi_nor_otp_region_start(const struct spi_nor *nor, unsigned int region)
diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 526763c79f55..1d799f02b8e5 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -561,10 +561,21 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 	val >>= BFPT_DWORD11_PAGE_SIZE_SHIFT;
 	params->page_size = 1U << val;
 
+	/*
+	 * The standard declares various read and write status methods, some of
+	 * them will be overloaded based on the QER field.
+	 */
+	params->opcodes.read_sr1 = SPINOR_OP_RDSR;
+	params->opcodes.read_sr2 = SPINOR_OP_RDCR;
+	params->opcodes.write_sr1 = SPINOR_OP_WRSR;
+	params->opcodes.write_sr1_and_sr2 = SPINOR_OP_WRSR;
+
+	params->qe_mask[0] = 0;
+	params->qe_mask[1] = 0;
+
 	/* Quad Enable Requirements. */
 	switch (bfpt.dwords[SFDP_DWORD(15)] & BFPT_DWORD15_QER_MASK) {
 	case BFPT_DWORD15_QER_NONE:
-		params->quad_enable = NULL;
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR:
@@ -572,23 +583,28 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * Writing only one byte to the Status Register has the
 		 * side-effect of clearing Status Register 2.
 		 */
+		fallthrough;
 	case BFPT_DWORD15_QER_SR2_BIT1_NO_RD:
 		/*
 		 * Read Configuration Register (35h) instruction is not
-		 * supported.
+		 * supported. 16-bit writes expected.
 		 */
-		nor->flags |= SNOR_F_HAS_16BIT_SR | SNOR_F_NO_READ_CR;
-		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
+		params->opcodes.read_sr2 = 0;
+		params->opcodes.write_sr1 = 0;
+		params->qe_mask[1] = BIT(1);
 		break;
 
 	case BFPT_DWORD15_QER_SR1_BIT6:
-		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
-		params->quad_enable = spi_nor_sr1_bit6_quad_enable;
+		params->opcodes.read_sr2 = 0;
+		params->opcodes.write_sr1_and_sr2 = 0;
+		params->qe_mask[0] = BIT(6);
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT7:
-		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
-		params->quad_enable = spi_nor_sr2_bit7_quad_enable;
+		params->opcodes.read_sr2 = SPINOR_OP_RDSR2;
+		params->opcodes.write_sr1_and_sr2 = 0;
+		params->opcodes.write_sr2 = SPINOR_OP_WRSR2;
+		params->qe_mask[1] = BIT(7);
 		break;
 
 	case BFPT_DWORD15_QER_SR2_BIT1:
@@ -598,9 +614,8 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		 * Register 2, so let's be cautious and keep the default
 		 * assumption of a 16-bit Write Status (01h) command.
 		 */
-		nor->flags |= SNOR_F_HAS_16BIT_SR;
-
-		params->quad_enable = spi_nor_sr2_bit1_quad_enable;
+		params->opcodes.write_sr1 = 0;
+		params->qe_mask[1] = BIT(1);
 		break;
 
 	default:
@@ -608,6 +623,10 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		break;
 	}
 
+	/* opcodes sanity check */
+	WARN_ON(!params->opcodes.read_sr1 ||
+		(!params->opcodes.write_sr1 && !params->opcodes.write_sr1_and_sr2));
+
 	dword = bfpt.dwords[SFDP_DWORD(16)] & BFPT_DWORD16_4B_ADDR_MODE_MASK;
 	if (SFDP_MASK_CHECK(dword, BFPT_DWORD16_4B_ADDR_MODE_BRWR))
 		params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_brwr;
diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansion.c
index 2a8238c707e1..ca2703a5a338 100644
--- a/drivers/mtd/spi-nor/spansion.c
+++ b/drivers/mtd/spi-nor/spansion.c
@@ -399,8 +399,9 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
 					  nor->bouncebuf);
 	bool is3byte, is4byte;
 	int ret;
+	u8 sr;
 
-	ret = spi_nor_read_sr(nor, &nor->bouncebuf[1]);
+	ret = spi_nor_read_sr1(nor, &sr);
 	if (ret)
 		return ret;
 
@@ -408,7 +409,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	is3byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+	is3byte = (nor->bouncebuf[0] == sr);
 
 	op = (struct spi_mem_op)
 		CYPRESS_NOR_RD_ANY_REG_OP(4, SPINOR_REG_CYPRESS_STR1V, 0,
@@ -417,7 +418,7 @@ static int cypress_nor_determine_addr_mode_by_sr1(struct spi_nor *nor,
 	if (ret)
 		return ret;
 
-	is4byte = (nor->bouncebuf[0] == nor->bouncebuf[1]);
+	is4byte = (nor->bouncebuf[0] == sr);
 
 	if (is3byte == is4byte)
 		return -EIO;
@@ -1103,13 +1104,14 @@ static const struct flash_info spansion_nor_parts[] = {
 static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 {
 	int ret;
+	u8 sr;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1(nor, &sr);
 	if (ret)
 		return ret;
 
-	if (nor->bouncebuf[0] & (SR_E_ERR | SR_P_ERR)) {
-		if (nor->bouncebuf[0] & SR_E_ERR)
+	if (sr & (SR_E_ERR | SR_P_ERR)) {
+		if (sr & SR_E_ERR)
 			dev_err(nor->dev, "Erase Error occurred\n");
 		else
 			dev_err(nor->dev, "Programming Error occurred\n");
@@ -1129,7 +1131,7 @@ static int spansion_nor_sr_ready_and_clear(struct spi_nor *nor)
 		return -EIO;
 	}
 
-	return !(nor->bouncebuf[0] & SR_WIP);
+	return !(sr & SR_WIP);
 }
 
 static int spansion_nor_late_init(struct spi_nor *nor)
diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
index db02c14ba16f..77a0bc41d4e5 100644
--- a/drivers/mtd/spi-nor/sst.c
+++ b/drivers/mtd/spi-nor/sst.c
@@ -21,16 +21,17 @@ static int sst26vf_nor_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 static int sst26vf_nor_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 {
 	int ret;
+	u8 cr;
 
 	/* We only support unlocking the entire flash array. */
 	if (ofs != 0 || len != nor->params->size)
 		return -EINVAL;
 
-	ret = spi_nor_read_cr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr2(nor, &cr);
 	if (ret)
 		return ret;
 
-	if (!(nor->bouncebuf[0] & SST26VF_CR_BPNV)) {
+	if (!(cr & SST26VF_CR_BPNV)) {
 		dev_dbg(nor->dev, "Any block has been permanently locked\n");
 		return -EINVAL;
 	}
diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
index 235070b215d1..f0032785dd21 100644
--- a/drivers/mtd/spi-nor/swp.c
+++ b/drivers/mtd/spi-nor/swp.c
@@ -36,7 +36,7 @@ static u8 spi_nor_get_sr_tb_mask(struct spi_nor *nor)
 
 static u8 spi_nor_get_sr_cmp_mask(struct spi_nor *nor)
 {
-	if (!(nor->flags & SNOR_F_NO_READ_CR) &&
+	if (nor->params->opcodes.read_sr2 &&
 	    nor->flags & SNOR_F_HAS_SR2_CMP_BIT6)
 		return SR2_CMP_BIT6;
 	else
@@ -194,6 +194,45 @@ static int spi_nor_build_sr(struct spi_nor *nor, const u8 *old_sr, u8 *new_sr,
 	return 0;
 }
 
+/*
+ * Make sure we do our best to guess SR2. This has historically only be needed
+ * for swp.c, so let's keep this extra carefulness in this file.
+ */
+static int spi_nor_read_sr2_careful(struct spi_nor *nor, u8 *sr2)
+{
+	struct spi_nor_flash_parameter *params = nor->params;
+	int ret;
+
+	if (params->opcodes.read_sr2) {
+		ret = spi_nor_read_sr_ll(nor, params->opcodes.read_sr2, sr2, 1);
+		if (ret)
+			return ret;
+	} else if ((spi_nor_get_protocol_width(nor->read_proto) == 4 ||
+		   spi_nor_get_protocol_width(nor->write_proto) == 4) &&
+		   nor->params->quad_enable) {
+		/*
+		 * Make sure the QE bit is persistently kept. qe_mask[1] will be
+		 * 0 if the QE bit is in SR1.
+		 */
+		*sr2 = params->qe_mask[1];
+	} else {
+		return 0;
+	}
+
+	return 0;
+}
+
+static int spi_nor_read_sr1_and_sr2_careful(struct spi_nor *nor, u8 *sr)
+{
+	int ret;
+
+	ret = spi_nor_read_sr1(nor, &sr[0]);
+	if (ret)
+		return ret;
+
+	return spi_nor_read_sr2_careful(nor, &sr[1]);
+}
+
 /*
  * Keep a local cache containing all lock-related bits for debugfs use only.
  * This way, debugfs never needs to access the flash directly.
@@ -207,17 +246,9 @@ void spi_nor_cache_sr_lock_bits(struct spi_nor *nor, u8 *sr)
 
 
 	if (!sr) {
-		if (spi_nor_read_sr(nor, nor->bouncebuf))
+		if (spi_nor_read_sr1_and_sr2_careful(nor, sr_cr))
 			return;
 
-		sr_cr[0] = nor->bouncebuf[0];
-
-		if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-			if (spi_nor_read_cr(nor, nor->bouncebuf))
-				return;
-		}
-
-		sr_cr[1] = nor->bouncebuf[0];
 		sr = sr_cr;
 	}
 
@@ -273,20 +304,10 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 pow;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1_and_sr2_careful(nor, status_old);
 	if (ret)
 		return ret;
 
-	status_old[0] = nor->bouncebuf[0];
-
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-		ret = spi_nor_read_cr(nor, nor->bouncebuf);
-		if (ret)
-			return ret;
-
-		status_old[1] = nor->bouncebuf[0];
-	}
-
 	/* If nothing in our range is unlocked, we don't need to do anything */
 	if (spi_nor_is_locked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -378,10 +399,7 @@ static int spi_nor_sr_lock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_old < ofs_new || (ofs_new + len_new) < (ofs_old + len_old)))
 		return -EINVAL;
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
-	else
-		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
@@ -409,20 +427,10 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	int ret;
 	u8 pow;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1_and_sr2_careful(nor, status_old);
 	if (ret)
 		return ret;
 
-	status_old[0] = nor->bouncebuf[0];
-
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-		ret = spi_nor_read_cr(nor, nor->bouncebuf);
-		if (ret)
-			return ret;
-
-		status_old[1] = nor->bouncebuf[0];
-	}
-
 	/* If nothing in our range is locked, we don't need to do anything */
 	if (spi_nor_is_unlocked_sr(nor, ofs, len, status_old))
 		return 0;
@@ -512,10 +520,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, loff_t ofs, u64 len)
 	    (ofs_new < ofs_old || (ofs_old + len_old) < (ofs_new + len_new)))
 		return -EINVAL;
 
-	if (nor->flags & SNOR_F_NO_READ_CR)
-		ret = spi_nor_write_sr_and_check(nor, best_status_new[0]);
-	else
-		ret = spi_nor_write_sr_cr_and_check(nor, best_status_new);
+	ret = spi_nor_write_sr1_and_sr2_and_check(nor, best_status_new);
 	if (ret)
 		return ret;
 
@@ -536,20 +541,10 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor, loff_t ofs, u64 len)
 	u8 sr_cr[2] = {};
 	int ret;
 
-	ret = spi_nor_read_sr(nor, nor->bouncebuf);
+	ret = spi_nor_read_sr1_and_sr2_careful(nor, sr_cr);
 	if (ret)
 		return ret;
 
-	sr_cr[0] = nor->bouncebuf[0];
-
-	if (!(nor->flags & SNOR_F_NO_READ_CR)) {
-		ret = spi_nor_read_cr(nor, nor->bouncebuf);
-		if (ret)
-			return ret;
-
-		sr_cr[1] = nor->bouncebuf[0];
-	}
-
 	return spi_nor_is_locked_sr(nor, ofs, len, sr_cr);
 }
 
diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 593429bd6cdf..01a693033448 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -520,12 +520,12 @@ static int winbond_nor_late_init(struct spi_nor *nor)
 	 * been to declare CR reads as unsupported, whereas the Jedec
 	 * specification doesn't clearly state that. In practice, all these
 	 * chips do support reading back the CR, which is needed for SWP support,
-	 * so make sure that capability remains enabled (needed for SWP).
+	 * so make sure that capability remains enabled.
 	 * In practice, only exclude the old W25X family (JEDEC ID: EF 30 xx)
 	 * which actually does not support this feature.
 	 */
 	if (nor->id[1] > 0x30)
-		nor->flags &= ~SNOR_F_NO_READ_CR;
+		params->opcodes.read_sr2 = SPINOR_OP_RDCR;
 
 	/*
 	 * Winbond has reused many IDs, up to four times at this
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 4b92494827b1..f0b5a1989881 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -113,20 +113,16 @@
 #define SR_E_ERR		BIT(5)
 #define SR_P_ERR		BIT(6)
 
-#define SR1_QUAD_EN_BIT6	BIT(6)
-
 #define SR_BP_SHIFT		2
 
 /* Enhanced Volatile Configuration Register bits */
 #define EVCR_QUAD_EN_MICRON	BIT(7)	/* Micron Quad I/O */
 
 /* Status Register 2 bits. */
-#define SR2_QUAD_EN_BIT1	BIT(1)
 #define SR2_LB1			BIT(3)	/* Security Register Lock Bit 1 */
 #define SR2_LB2			BIT(4)	/* Security Register Lock Bit 2 */
 #define SR2_LB3			BIT(5)	/* Security Register Lock Bit 3 */
 #define SR2_CMP_BIT6		BIT(6)
-#define SR2_QUAD_EN_BIT7	BIT(7)
 
 /* Supported SPI protocols */
 #define SNOR_PROTO_INST_MASK	GENMASK(23, 16)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
