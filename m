Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F8FCD6E52
	for <linux-mtd@archiver.kernel.org>; Fri, 29 May 2026 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rh2LaVHCAx7ZIQXyBQMqWa64rt7ISU1p9X3LD3XzeJY=; b=EZ5sGJsyyU2qlb
	qr3ZOFakWdCUZSHuzTQoK6oWQbdLKFNALkhJUBMfX/ErZ7NbAXtIyJ34K96F/psjT6sQqmAnKVftq
	7I3/mMf3MeQbAOu//GiTFzrnOJMZFFaRww0QyDuNb3wO09VeAzT56tQ356rrIGu+t0A88ivc640lQ
	+Funy5SIVJoDQzmVuEawkeUFDZwREbPnR+bpIL7+XF/PwAGjr4reHeJUn91YO3lr1ofAxgcTvyWL7
	aOn4oiwtCt5xNCz6lMaOlMmGhq7aiz9dpKCUl25UuuqgbhP2AHJwCMBPZdjExZtzIMX+frgtdInl7
	dJtNfxJUNZHRQpd0Swcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzjE-00000007pZm-0X95;
	Fri, 29 May 2026 16:06:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSzjA-00000007pVq-1EGr
	for linux-mtd@lists.infradead.org;
	Fri, 29 May 2026 16:06:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 507A5C6245F;
	Fri, 29 May 2026 16:06:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92ED4601FA;
	Fri, 29 May 2026 16:06:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D8EC10888CC2;
	Fri, 29 May 2026 18:06:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780070785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VPqlRCv4E0Skod+lFZWbdOPCHpUOODKJM6zUyPTQVIA=;
	b=KHts23c6B+5HRKt47AxjuLpAAr9Qwkf+iFefZV239Zv8SAaf0RkLeXLqmObYQfWMLxmfUo
	HQA6AmiSui9LCV50aQoXb/kIbfQhtIB5OlxTfHjksObKWo42jyxZbEX8hceBBHG+vcHDsi
	HYXkAI5js5z97WXO3TWluMs+w+s2/uSHdS08RtaHQdasBTajlphj1kfA2RyVmViNpLKH4V
	TH9wUwGYpV6WF/sDARvPjO8+sKuu+tf7NHXn3fi4is6vJnBMVUrFDAcXetvQ6c6zoLFN0R
	HBbXlF80Id7gEP1Xal4/f/UMwmOBFuJG/TUsPP4e0zFro2XTvJ3cT6I1yqaEJg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 29 May 2026 18:05:47 +0200
Subject: [PATCH 2/5] mtd: spi-nor: Add support for the new JESD216 rev F
 QER field
MIME-Version: 1.0
Message-Id: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-2-f3ae18502d5a@bootlin.com>
References: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
In-Reply-To: <20260529-winbond-v7-1-spi-nor-rv-addition-v1-0-f3ae18502d5a@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Steam Lin <STLin2@winbond.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_090628_669712_445222F4 
X-CRM114-Status: GOOD (  14.87  )
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
 drivers/mtd/spi-nor/sfdp.c  | 9 +++++++++
 drivers/mtd/spi-nor/sfdp.h  | 8 ++++++++
 include/linux/mtd/spi-nor.h | 1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 23b809cc958f..04580f78b62b 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -626,6 +626,15 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->qe_mask[1] = BIT(1);
 		break;
 
+	case BFPT_DWORD15_QER_SR2_BIT1_1B:
+		nor->flags &= ~SNOR_F_HAS_16BIT_SR;
+		params->qe_mask[0] = 0;
+		params->qe_mask[1] = BIT(1);
+		params->read_srs_opcode = 0;
+		params->write_srs_opcode = 0;
+		params->write_sr2_opcode = SPINOR_OP_WRSR2_ALT;
+		break;
+
 	default:
 		dev_dbg(nor->dev, "BFPT QER reserved value used\n");
 		break;
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index f74a0eb339ea..7e52e00cbae0 100644
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
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
