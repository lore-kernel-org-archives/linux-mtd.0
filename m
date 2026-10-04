Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826CFCA5FF0
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2026 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VTowxAF1HkQxtFSab0Io9cFZFOEWgnRGWbfhqTU61pM=; b=juENPswyyJbAFs
	lcjkUIXhEA+I5HkqQETi2N+vnnyDsSLlJyU6Se4bnNKf7Q1vA3LUZAdlknYfDECubFnUj/3Y3rkHh
	naVFDYSRzwBu13z9s1846Mqmvy0fydl5gorbk3IZts19PYDtse1cba3/B+W6lpJ0BME/axALXQlPZ
	rkvCSQVe0DS2DKWZ77/T8x9H4vbHIbICQXQIHoZ2LxlxWNgxDfpK1CWH32CFzp1+AklPDhoBH9Fse
	r+TurUf5xl97G4Q9l1AhK8rYOiEiY2S6hiouuc3FqTgXPJHf6SafMfmGeASVTsaoiwzHmdOWmVcx/
	hichsROyWwexkJA8I45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToO-0000000FMsS-2krP;
	Sun, 04 Oct 2026 21:32:00 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDToG-0000000FMkF-1rvp
	for linux-mtd@lists.infradead.org;
	Sun, 04 Oct 2026 21:31:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E6EC11A113A;
	Sun,  4 Oct 2026 21:31:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC92604FE;
	Sun,  4 Oct 2026 21:31:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 953441032820F;
	Sun,  4 Oct 2026 23:31:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149510; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bn7MzMTlkcOXD7N3ZVZLc4yFMI6vN6F+0M97YqOBEZM=;
	b=l/YfZO/n51TiS08pZ0PL9HzMUBaBxsB6CKbaPeB0UFYLyBsSiWzxe6hOpFOGRVykBmM3gG
	xeqRpdf02eFK2AmW7gy/e1p+5yXcRY6z4fLP7efcDi8yQigK3bF0STHjTHGvSY6OayrUAu
	Q7B0+VGfv/wQazRgqvz51S77niTR3knpBmuBhaSnkSDNBevxwzAAyni3lcUb6R+3s4r92B
	BBprysG4BTWM84oqt7Wknl2iz9vUmsHJK+ajOd4A/yXqfCMiBKuAlb+xl+rkHM8ug53NM8
	inJ6mK75eKyvOfYLRlw821RM2e7IRwH6wvT+7Ej4GkjKES4wjfz5fXncJ9IsFw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Sun, 04 Oct 2026 23:31:22 +0200
Subject: [PATCH v2 08/17] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
MIME-Version: 1.0
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-8-592f3300a70f@bootlin.com>
References: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
In-Reply-To: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_143152_665401_B7E374CC 
X-CRM114-Status: GOOD (  16.11  )
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

The SPI NOR core selects the fastest read variant advertised by the SFDP
tables. This may or may not be a wise choice but at least it is simpler
as any bus frequency will just work. There is however a downside: the
number of dummy cycles is maximized (in case the bus frequency is really
fast, this is how the chip enforces a sufficient delay). Maximizing the
number of dummy cycles means that, if the amount of cycles is
configurable in the chip, we might not take its default value. When this
happens, we need to make sure that the chip is configured accordingly.

Create a callback to configure the chip for a specific number of dummy
cycles. This callback is used:
- after deciding how to communicate with the device,
- in case of error when switching into ODTR mode, we shall negociate
  another configuration,
- upon resume.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 24 +++++++++++++++++++++++-
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6e22342361c3..56d8f95da0d4 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2993,6 +2993,20 @@ static int spi_nor_init_params(struct spi_nor *nor)
 	return 0;
 }
 
+/**
+ * spi_nor_set_dummy() - configure chip for a given number of dummy cycles
+ * @nor:                pointer to a 'struct spi_nor'
+ *
+ * Return: 0 on success, -errno otherwise.
+ */
+static int spi_nor_set_dummy(struct spi_nor *nor)
+{
+	if (!nor->params->set_dummy)
+		return 0;
+
+	return nor->params->set_dummy(nor, nor->read_dummy);
+}
+
 /** spi_nor_set_octal_dtr() - enable or disable Octal DTR I/O.
  * @nor:                 pointer to a 'struct spi_nor'
  * @enable:              whether to enable or disable Octal DTR
@@ -3016,7 +3030,11 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 		hwcaps.mask &= ~(SNOR_HWCAPS_READ_8_8_8_DTR |
 				 SNOR_HWCAPS_PP_8_8_8_DTR);
 
-		return spi_nor_setup(nor, &hwcaps);
+		ret = spi_nor_setup(nor, &hwcaps);
+		if (ret)
+			return ret;
+
+		return spi_nor_set_dummy(nor);
 	}
 
 	ret = nor->params->set_octal_dtr(nor, enable);
@@ -3093,6 +3111,10 @@ static int spi_nor_init(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 	int err;
 
+	err = spi_nor_set_dummy(nor);
+	if (err)
+		return err;
+
 	err = spi_nor_set_octal_dtr(nor, true);
 	if (err) {
 		dev_dbg(nor->dev, "octal mode not supported\n");
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 670182b3c2ad..b64f26b69c05 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -377,6 +377,7 @@ struct spi_nor_opcodes {
  *                      Table.
  * @otp:		SPI NOR OTP info.
  * @set_octal_dtr:	enables or disables SPI NOR octal DTR mode.
+ * @set_dummy:		configure the number of read dummy cycles.
  * @quad_enable:	enables SPI NOR quad mode.
  * @qe_mask:		two bytes mask used to set/clear the QE bit
  * @set_4byte_addr_mode: puts the SPI NOR in 4 byte addressing mode.
@@ -410,6 +411,7 @@ struct spi_nor_flash_parameter {
 	struct spi_nor_otp		otp;
 
 	int (*set_octal_dtr)(struct spi_nor *nor, bool enable);
+	int (*set_dummy)(struct spi_nor *nor, u8 dummy_cycles);
 	int (*quad_enable)(struct spi_nor *nor);
 	u8				qe_mask[2];
 	int (*set_4byte_addr_mode)(struct spi_nor *nor, bool enable);

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
