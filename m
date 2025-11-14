Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D0FCE8D69
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Nov 2025 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KV8Io+OzylNT072LTUSniVuEWS+a9jXR0zzo03HiK8=; b=lxvNWkprWfvXSZ
	8SfH+GpuJUjrdih7r0/aBJSBgvaBVrBSt0ZqSFAoIlF6gbMGcxe/sKH1jtyzotYxPb/UXADN2yG8g
	eNgCUAjog6KERBDv4PwYw1B3P5pKm/GIm2mlF8Ui33h480Emp090DPGGPEBN1okcTwu87l6YcSO9K
	mWph9MNYSErN18IyiUlqvpW2MIeAOZ6jIUqc91dvv7akaW9l+PKFefwvY4E3drVCzrdzdXrepcPI2
	LmlH8tAQDjUyIB1WNcuQ3wxAr79vseqm4u6iWEKP3T3eLnoqZjXMhte73caWOsbg//tZnFsLvTrGk
	JsPfzQlovjsWhyadfgaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzR-0000000Ct8d-2Zxm;
	Fri, 14 Nov 2025 17:53:41 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJxzO-0000000Ct3M-3V8A
	for linux-mtd@lists.infradead.org;
	Fri, 14 Nov 2025 17:53:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6D05AC10F6B;
	Fri, 14 Nov 2025 17:53:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3AE0B6060E;
	Fri, 14 Nov 2025 17:53:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A727E103719A3;
	Fri, 14 Nov 2025 18:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763142816; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7h31LM+MRbnm0oOdutr/9XpiyhFu6lhMJ6i3VfNOrkU=;
	b=x702O+Qsh6axbb21kujL0osYZ37bOxvOk71ZBkOww5nHUFREpK9byratCj/Zg502MtSyc2
	nN+E/inoSuHO55Y2Qsme+nkt5vT1Y19OPJudeUR/I7AhkkUpDF7/SpGAY5ixkrF3ybEery
	VD9dtOkj8bKnac169vrr7nR61sf2SP7+OdR5TlazdDJB2ir5eu0pGIcGUJ8kCkFMvGB6tw
	/TS2kNCPzfhRtBxXGIAlPkGZ2B7IzpHCqYjI3UCCw65OhjQ8wwmvey41lj2dsA9XjYGPiL
	njWIHD7rXAnleMlDDPd8dqW2PCnUdUpUY3J0sWVHUv0V/XMwtmvYozDjCJk/nA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 14 Nov 2025 18:53:10 +0100
Subject: [PATCH 09/19] mtd: spi-nor: swp: Create a helper that writes SR,
 CR and checks
MIME-Version: 1.0
Message-Id: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-9-487bc7129931@bootlin.com>
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: Sean Anderson <sean.anderson@linux.dev>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_095339_576000_29D2584A 
X-CRM114-Status: GOOD (  14.66  )
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
index 20ea80450f222242761878ebdb3dcdcca1e8877a..f56c92fd405062d93b601e7096e82e9e456cd276 100644
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
index ceff412f7d65ab7b856795ca5c092cddbf598cd6..516ab19dc7b86a5c6ba8729d2ba18904b922df23 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -626,6 +626,7 @@ int spi_nor_read_cr(struct spi_nor *nor, u8 *cr);
 int spi_nor_write_sr(struct spi_nor *nor, const u8 *sr, size_t len);
 int spi_nor_write_sr_and_check(struct spi_nor *nor, u8 sr1);
 int spi_nor_write_16bit_cr_and_check(struct spi_nor *nor, u8 cr);
+int spi_nor_write_sr_cr_and_check(struct spi_nor *nor, const u8 *regs);
 
 ssize_t spi_nor_read_data(struct spi_nor *nor, loff_t from, size_t len,
 			  u8 *buf);

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
