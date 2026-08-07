Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E96C5AC7C
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Aug 2026 10:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pd/Cv6cIPTlEPvEl+Uob5LyZmSJU0Y7rWHL8Z5dzE8Y=; b=VatJf9HBh/0oBn
	NpOzqKezlVywpP4K8xQe4sb3X9kDY2OQk+MmLsOCIafxfjb3E02jVu8yUREmTc/Brio/X8KQYGumG
	WwzucBoTVFYGQORekJhJNWQjzgmxBm0NSMOn6EF6URkGKn0kLRfEHWOqwPeAhMcitTgnq7OWpdcUT
	5CeAqFJrlOeN+6pN1Qubg4/Uc7KmwJIr+3moo6H6jveRwJ6u+hiKsXBfVKSptxaw0YZsHdfZRYgKu
	xk8enw6HBFgslcke0Xm9UmQVfa+yoOXxqZP940+Cf28mw3W+AxDTzzEVf4Pc5K+CIA5mcd0C7spTt
	SwkhPpop9crdSgoZk3+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHaj-00000007bKs-1vcd;
	Fri, 07 Aug 2026 10:14:17 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHah-00000007bJ9-0CZ4
	for linux-mtd@lists.infradead.org;
	Fri, 07 Aug 2026 10:14:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 956601A149D;
	Fri,  7 Aug 2026 10:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69CF4603F0;
	Fri,  7 Aug 2026 10:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D3E9311C3751D;
	Fri,  7 Aug 2026 12:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786097648; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tCkzLUO8jupK5Bfyyo1EzqUcURHcXok2YUcg3cdLeVA=;
	b=hp2W1KId3Rp9Ta0F0jXoMfoi+RizYcnFwR+2ExycT6+ZudcGdgVf7wTfqcj7yxDgT/92Io
	RlRcDbikH/UrxdSL++vv9OwPFJpLwnJP/7GPIZ+0YQHGPJHVWCcUcLLc+DNtJoHbP5i9UJ
	Qqit5+Y745tvFVOPDwxrOtvCCIM+06oKUnCF1mP/oIkCgWajB/9YAGpRQq0Qggrr4ZizcC
	6wNYtnZ+LI8N2wgXVna6LaskWi/zPd0rXebH0TVJ2lL/u+S04QRnJ36oGcvISMpHRKQbuE
	heH2egYiahZZLPTegSTIxuJcpWE9zNvcdMvPGQxnYMrNrgVUP0aUJ/QpsNxnKw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 07 Aug 2026 12:13:53 +0200
Subject: [PATCH v2 01/18] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
MIME-Version: 1.0
Message-Id: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-1-7797642dfc40@bootlin.com>
References: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
In-Reply-To: <20260807-winbond-v7-1-spi-nor-rv-addition-v2-0-7797642dfc40@bootlin.com>
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
X-CRM114-CacheID: sfid-20260807_031415_248731_CCA6AA1C 
X-CRM114-Status: GOOD (  12.42  )
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

The _BUGGY suffix is not super accurate. There is a behavior that indeed
seems strange, but it is somewhat documented. The fact is, with this QER
field the status register is considered 16-bit wide and if one writes
the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
SR2 will be assumed to be 0x00 and will be cleared.

Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
namings (_NO_RD) and clarify the meaning of this field.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 drivers/mtd/spi-nor/sfdp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index cf0e2dc7c120..526763c79f55 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -567,7 +567,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		params->quad_enable = NULL;
 		break;
 
-	case BFPT_DWORD15_QER_SR2_BIT1_BUGGY:
+	case BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR:
 		/*
 		 * Writing only one byte to the Status Register has the
 		 * side-effect of clearing Status Register 2.
diff --git a/drivers/mtd/spi-nor/sfdp.h b/drivers/mtd/spi-nor/sfdp.h
index f74a0eb339ea..d976c6c9a4ad 100644
--- a/drivers/mtd/spi-nor/sfdp.h
+++ b/drivers/mtd/spi-nor/sfdp.h
@@ -84,7 +84,7 @@ struct sfdp_bfpt {
  */
 #define BFPT_DWORD15_QER_MASK			GENMASK(22, 20)
 #define BFPT_DWORD15_QER_NONE			(0x0UL << 20) /* Micron */
-#define BFPT_DWORD15_QER_SR2_BIT1_BUGGY		(0x1UL << 20)
+#define BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR	(0x1UL << 20)
 #define BFPT_DWORD15_QER_SR1_BIT6		(0x2UL << 20) /* Macronix */
 #define BFPT_DWORD15_QER_SR2_BIT7		(0x3UL << 20)
 #define BFPT_DWORD15_QER_SR2_BIT1_NO_RD		(0x4UL << 20)

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
