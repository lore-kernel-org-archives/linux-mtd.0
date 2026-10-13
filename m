Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBACC6B1F
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R+JULb8/IEGUYdCWOXJl/6JAgrPSV6ZpZXexpSg1FAE=; b=sMmrOmvyidyfCi
	A0uLiAL4dEZQ0SoyZbV2d/plftPVEw8UeKGgYNkX8kTZ36pZv4fN2fARb37S6oSXJOyWVn4s5vPmV
	LN0CQp+5tgiBVRCtLvCU9e2FQ5scYUfXKEuQKScIF6rH2fXkrS+B4Jq85Pp1kw+dcunLrqx/ifsf7
	SlsZ+JjOq/lD6JmdzNGNBJrhzoGpQJErl6A1TfGFuvRUZSdEsmRUnp7V0wSfFaidvxlKQL/0GTK29
	tilK6DzRblhvkEQD/d+/7JMBcQvwfzAM4irnLRvL1RG9NIdsn7xk5+A/bb5zUtZZlqyQOwJjDa08i
	SlPp4oRM9Conq9RQVRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSl-0000000DX7e-1ywY;
	Tue, 13 Oct 2026 16:34:51 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfSh-0000000DX1e-2zpt
	for linux-mtd@lists.infradead.org;
	Tue, 13 Oct 2026 16:34:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D1DEC653F6;
	Tue, 13 Oct 2026 16:35:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D1460362;
	Tue, 13 Oct 2026 16:34:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3167711D71810;
	Tue, 13 Oct 2026 18:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909285; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QKQ0m9xvm4tAOTCHQDD54jlJu0ye7Cl8MkYNQVNaAaI=;
	b=JcEcMAQqDjWeHuix36AtDDJNinMmjsSNENLvEHBKaH+yVts1a6pQ5tqE9ktX0xqzsqgODd
	6IUBECQFuJ+gRly3v3ApImDWkisQUfKa9HR/xNE4rYFXerHdtFqvWf/hMraspbWvrSQNxT
	8er+gfmLxeWfHPZ3auKeQKyOi7Rvrh3pwN2+L5fh6xbMW2OuubovT8IegxdrI1mo+YbFm/
	Mjuj1sfgwfqMBREVl60whClhtv4sryMsdx4P85nWYNhFSMKgHSpQXhS6EeGaaIMpV67XqB
	xQv3tidOsqFMX3zd2LFr44kJP2IX6n3akZytQBGY+gaCry7bHRqgs943rO0B8g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:59 +0200
Subject: [PATCH v3 09/17] mtd: spi-nor: Allow configuring the actual number
 of dummy cycles
MIME-Version: 1.0
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-9-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_093448_127024_333473E8 
X-CRM114-Status: GOOD (  16.59  )
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
index 8e55f12161d1..07364b0a742a 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2991,6 +2991,20 @@ static int spi_nor_init_params(struct spi_nor *nor)
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
@@ -3014,7 +3028,11 @@ static int spi_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
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
@@ -3091,6 +3109,10 @@ static int spi_nor_init(struct spi_nor *nor)
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
