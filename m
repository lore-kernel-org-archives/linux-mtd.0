Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DBCCD5BB1
	for <linux-mtd@archiver.kernel.org>; Tue, 26 May 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yk9UMOUBiJBgN6wkCcklxX40dEVyq+0WcctC38LneEE=; b=t+3fQesAIQd0DO
	IaPBM+C2P9G+RRXwY9N5slbhAIWXM8nIh0WDjkuuPh4TxJT8+sHRHBjBI2i/LcHoAiYTKB2mH6r3l
	q/DYGgctWXOJYd1i/ChsleWrKEK6+jB5N8GGe+XsEfglZqABlS5sTa4YPXMiE4vxughwDd0o7EGUW
	MA9vxM1Ki6Q2YKMvQyH9/YcwK1k1woORZWwz9GFN+bf3RQkoqAgyU+8fWp6SwPVEccIkPvsvpNoQt
	43flJ7KOYl7Rsc6mlHCnulPNZWRBM53KL3sQbFaKfSC8Kk2z9KnAit2JxzT0ofNsblOQeyb98GfMY
	sNgRE05WFTnoORVvXktw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDU-00000002FZE-0Px9;
	Tue, 26 May 2026 14:57:12 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtDS-00000002FVq-0KAc
	for linux-mtd@lists.infradead.org;
	Tue, 26 May 2026 14:57:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AE0B51A363F;
	Tue, 26 May 2026 14:57:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7C1F760733;
	Tue, 26 May 2026 14:57:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8B2E108888CE;
	Tue, 26 May 2026 16:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779807427; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c54SBPmc1/TosVcdK/PJb5zKdGWJlYw/ZXBJnTYebAY=;
	b=C9qpZQE/znOXCdZaTAOVj14+2vS2mvvXgKH0/qeGDzgOZlsp2Nv6WLVCQvAspb0wJw+fRQ
	c0E1jM1UCbQcItRVnaOtc7csXOoaOvPsZmxXxxqX3UELGZOmBanoA4hlO914KrhVDRWMJB
	JXM7IFlq7VQyv07rhC7CpA783P21FxLWSkqJ3TiWxnC5QH2U5S9DmqmXRuAF8x73i4qmnx
	UYHjxpXBmxZzBWrv7Q+2tTk4rfMK0JE+xdgRhGHVPbq8RmQkLX9Gnv89Soyz8o59rRKJU4
	LJm3clrJ4+kQzXtxmN5MAZOknsR1n7sC0hvD5xpGXjlmAtRSrX3miyLuxD4grQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 26 May 2026 16:56:35 +0200
Subject: [PATCH v6 11/28] mtd: spi-nor: swp: Create a helper that writes
 SR, CR and checks
MIME-Version: 1.0
Message-Id: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-11-4092f1419f8f@bootlin.com>
References: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
In-Reply-To: <20260526-winbond-v6-18-rc1-spi-nor-swp-v6-0-4092f1419f8f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_075710_711066_A6ACF61A 
X-CRM114-Status: GOOD (  14.42  )
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

There are many helpers already to either read and/or write SR and/or CR,
as well as sometimes check the returned values. In order to be able to
switch from a 1 byte status register to a 2 bytes status register while
keeping the same level of verification, let's introduce a new helper
that writes them both (atomically) and then reads them back (separated)
to compare the values.

In case 2 bytes registers are not supported, we still have the usual
fallback available in the helper being exported to the rest of the core.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/mtd/spi-nor/core.h |  1 +
 2 files changed, 66 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 394c27de02d6..2799c21d0b67 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -976,6 +976,54 @@ int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr)
 	return 0;
 }
 
+/**
+ * spi_nor_write_16bit_sr_cr_and_check() - Write the Status Register 1 and the
+ * Configuration Register in one shot. Ensure that the bytes written in both
+ * registers match the received value.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @regs:	two-byte array with values to be written to the status and
+ *		configuration registers.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_write_16bit_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
+{
+	u8 written_regs[2];
+	int ret;
+
+	written_regs[0] = regs[0];
+	written_regs[1] = regs[1];
+	nor->bouncebuf[0] = regs[0];
+	nor->bouncebuf[1] = regs[1];
+
+	ret = spi_nor_write_sr(nor, nor->bouncebuf, 2);
+	if (ret)
+		return ret;
+
+	ret = spi_nor_read_sr(nor, &nor->bouncebuf[0]);
+	if (ret)
+		return ret;
+
+	if (written_regs[0] != nor->bouncebuf[0]) {
+		dev_dbg(nor->dev, "SR: Read back test failed\n");
+		return -EIO;
+	}
+
+	if (nor->flags & SNOR_F_NO_READ_CR)
+		return 0;
+
+	ret = spi_nor_read_cr(nor, &nor->bouncebuf[1]);
+	if (ret)
+		return ret;
+
+	if (written_regs[1] != nor->bouncebuf[1]) {
+		dev_dbg(nor->dev, "CR: read back test failed\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
 /**
  * spi_nor_write_sr_and_check() - Write the Status Register 1 and ensure that
  * the byte written match the received value without affecting other bits in the
@@ -993,6 +1041,23 @@ int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1)
 	return spi_nor_write_sr1_and_check(nor, sr1);
 }
 
+/**
+ * spi_nor_write_sr_cr_and_check() - Write the Status Register 1 and ensure that
+ * the byte written match the received value. Same for the Control Register if
+ * available.
+ * @nor:	pointer to a 'struct spi_nor'.
+ * @regs:	byte array to be written to the registers.
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs)
+{
+	if (nor->flags & SNOR_F_HAS_16BIT_SR)
+		return spi_nor_write_16bit_sr_cr_and_check(nor, regs);
+
+	return spi_nor_write_sr1_and_check(nor, regs[0]);
+}
+
 /**
  * spi_nor_write_sr2() - Write the Status Register 2 using the
  * SPINOR_OP_WRSR2 (3eh) command.
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 65bb4b5e1e2b..0753d0a6f8b8 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -637,6 +637,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
+int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
