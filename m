Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8702AC5B572
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Aug 2026 15:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l3mrYN43agdB/DqUs6uhFob7v1Q7ZJe8iJwR1+dLnJo=; b=KOeTfRIag9SfJV
	msGTfMxSJLIH25KATRWUpIWcbzu4dmKRzBgyu8Pj3FrVz+86NxJHgUlc1TjsJsRptJpgVwOySfWjd
	Qd3PilNivdPug/Z4zvApJJzYqreyiRfBfRAwSALN6J2l1ZxfOurUnTs2ZBLWW0+CfDVOcdwUNqCVK
	Hdmla5JGCnWmVF30pbUNUA5cjDsHBZyjNNupAskFb6sFZbpTt5OXgmfwSjimUYiSQAoR61BnBBaw7
	PHMawjA853T6DXxASKNGf6phHhLF1499JNBLoWlK5mv/KcETymj6t03NEIkqVzSZDqMKebNtcMl3y
	Owr2SlYHj8LJqTFsFONw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDk-00000000x6t-3qnM;
	Thu, 13 Aug 2026 15:19:52 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuXDh-00000000x01-0U53;
	Thu, 13 Aug 2026 15:19:50 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7AB7E4E41208;
	Thu, 13 Aug 2026 15:19:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4EA58602B8;
	Thu, 13 Aug 2026 15:19:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7B8711C4E073;
	Thu, 13 Aug 2026 17:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786634382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8H1VVwSKk3XEDr9JwDpjqSYS4Cl0vczRL6VvMtOqe9U=;
	b=m/v5jHuXXsi9HhExpRI256GjJR7Ie5sYYkIfeMVA8jEMNA0qMR2Mr0nhrQwC4joavrBSYK
	WaphBCrcmhB4ZQ/OhWMWhyQGI4WCk7QecUQ46TLoPhCvpjumeD/cepXhkaa2IiUI1VG2+d
	CAILvEH2n1+n2GGxpYKlPqBFp4ztjp4xvOtQMp+ZOiUNC4tVtOYnY3FvUbJmhFtbwJhE+r
	IVj55XjCdRvNUE5qEPG4lDB7fVFt7Y3weYMXZDRK1QLpYnwQhCDnGkZ1ttHYpf3Ru86HWL
	5SbLl+t/RLhBKnWQExvFnQqxANVMI4gCQd48OaIIt5EYfv4FQWxtUa+PaLSEqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 17:19:04 +0200
Subject: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216 rev
 F QER field
MIME-Version: 1.0
Message-Id: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_081949_304410_0D3B9940 
X-CRM114-Status: GOOD (  14.08  )
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

Revision F of the JEDEC JESD216 standard includes yet another
supported setting in the QER 3-bit bitfield: 110b.

This setting implies that the QE bit is bit 1 of SR2 (which is an
already supported case) but this time it makes it very clear that both
reading and writing to SR2 is supported, but not with the usual
opcodes. The write operation uses an alternate WRSR2 opcode:
0x31 (instead of 0x3E) and both the reads and writes manipulate a single
register at a time.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c  | 6 ++++++
 drivers/mtd/spi-nor/sfdp.h  | 8 ++++++++
 include/linux/mtd/spi-nor.h | 1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 1d799f02b8e5..285ac781fba8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -618,6 +618,12 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->qe_mask[1] = BIT(1);
 		break;
 
+	case BFPT_DWORD15_QER_SR2_BIT1_1B:
+		params->qe_mask[1] = BIT(1);
+		params->opcodes.write_sr1_and_sr2 = 0;
+		params->opcodes.write_sr2 = SPINOR_OP_WRSR2_ALT;
+		break;
+
 	default:
 		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
 		break;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index d976c6c9a4ad..e8ed814c6530 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -12,6 +12,7 @@
 #define SFDP_JESD216_MINOR	0
 #define SFDP_JESD216A_MINOR	5
 #define SFDP_JESD216B_MINOR	6
+#define SFDP_JESD216F_MINOR	10
 
 /* SFDP DWORDS are indexed from 1 but C arrays are indexed from 0. */
 #define SFDP_DWORD(i)		((i) - 1)
@@ -81,6 +82,12 @@ struct sfdp_bfpt {
  *         instruction 35h. QE is set via Write Status instruction 01h with
  *         two data bytes where bit 1 of the second byte is one.
  *         [...]
+ * (from JESD216 rev F)
+ * - 110b: QE is bit 1 of status register 2. Status register 1 is read using
+ *         Read Status instruction 05h. Status register2 is read using
+ *         instruction 35h, and status register 3 is read using instruction 15h.
+ *         QE is set via Write Status Register instruction 31h with one data
+ *         byte.
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
@@ -89,6 +96,7 @@ struct sfdp_bfpt {
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1		(0x5UL << 20) /* Spansion */
+#define BFPT_DWORD15_QER_SR2_BIT1_1B		(0x6UL << 20) /* Winbond */
 
 #define BFPT_DWORD16_EN4B_MASK			GENMASK(31, 24)
 #define BFPT_DWORD16_EN4B_ALWAYS_4B		BIT(30)
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f0b5a1989881..3a55d76ea77d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -25,6 +25,7 @@
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
 #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
 #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
+#define SPINOR_OP_WRSR2_ALT	0x31	/* Write status register 2 (alternative) */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
