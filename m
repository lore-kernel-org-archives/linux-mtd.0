Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C95CA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 12:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=28gy5dwz7IpQUvKMMiY6Ie5O2kz9PDL1id7YLAP8jYg=; b=N8i6MzVKgUYNG8
	DedXmkGVf3Hb1l6GAqP13Evm9Ri7s4Vo7tcpP0F448btO7bkaaJRszjL3jeX5hkqStXACN7p123Ce
	XEE6x+EChcd573/410uj6VGBsK7W/52hBhYL7BTiVX5yK9cmMbQ4Aa1S4w+y1qLl2gv/xHfBBTnZr
	fjMgvJX2GmcVxeVViYIgGJ2zUB9JFB5zMjWiTKBNuqsTlPqLBb0WfwKDiMpxowYNvjoV4TvhDc7nq
	1G+P+EcJDCKa19t2uVRYWeZjjAPhgr7CYWvWNUrYE7cjIktf5NBPcn9EbMr88EceWfNId284UhzLI
	FnUQZ335m8Y5j4UJE0Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGr-0000000BYd7-08RY;
	Fri, 02 Oct 2026 12:21:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCcGn-0000000BYYc-1h5S
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 12:21:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D5BE64E41111;
	Fri,  2 Oct 2026 12:21:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A93A0603DC;
	Fri,  2 Oct 2026 12:21:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A05410328202;
	Fri,  2 Oct 2026 14:21:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943702; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F8+VMoBjhGxFp/mfYKvgpqrWwYN/RkzKCtwvFsghv/g=;
	b=Gwd9QoEiWi/DLuC6TdElzWMrlgBHKwbOMKCLV4qysf/HWdAR9Nnm4X0atyotrJ9NWaOx+Q
	OccTtP5MubVlm/Rg6TWn21k5hNGYHl+ROgFd7FiRo9qBo9XQmzfaD7tGil2QbTbe6KhTtd
	9ErJ5UBYTthT2n3SkLyFMQ6M4W23tHkW3z4fYw2qgmBmIEsQ233+bpwFRaJj89ZUO45Vb9
	f9ByQ42wxwv9RwKsMUDppftCb+ooI83TchM6K3BJcz/2YDcv1U96gMHk2fX49Oo1d/0m8t
	EMtQv5vO7H1Y8GjsFxxgWFpw/14K3upzWPn8Ybd031/d1PRQWyC9f397CJjn+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:20 +0200
Subject: [PATCH 07/15] mtd: spi-nor: Allow configuring the actual number of
 dummy cycles
MIME-Version: 1.0
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-7-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_052145_589750_09A87348 
X-CRM114-Status: GOOD (  15.03  )
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

Crete a callback to configure the chip for expecting a specific number
of dummy cycles.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 12 +++++++++++-
 drivers/mtd/spi-nor/core.h |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 6e22342361c3..152add3834fc 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2627,7 +2627,17 @@ static int spi_nor_setup(struct spi_nor *nor,
 		return err;
 	}
 
-	return spi_nor_set_addr_nbytes(nor);
+	err = spi_nor_set_addr_nbytes(nor);
+	if (err)
+		return err;
+
+	if (nor->params->set_dummy) {
+		err = nor->params->set_dummy(nor, nor->read_dummy);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 bool spi_nor_fixup_match(const struct spi_nor *nor,
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
