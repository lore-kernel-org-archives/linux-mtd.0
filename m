Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B692606A339
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iytKHsAS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fHR6XY/d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XgDmuMkCFdk9jZ7SIyK9icE4xKorQtIPHr/ghiu1rO4=; b=iytKHsASnr8XEdvlrOk473K4rw
	xKeQtpsNxl+OqYg4P+U41hEXb0DWVBKRZUI2Ieouvic3ywrfxsJiOkkpjFMiuEgrj7J41W4OQI29T
	qw5Rwz+UKaLpeN9BH2IJ32LqwIN0e9pESG+4y/17q2DC/LD0Kff4I2SBl+6xpbQCjW21mMTyRzDIZ
	XX20mVddjRL1olplB9KaNpy6yTsfFYU9bsMsy3d0koDd4DCzXjj8GNvzgjYW5pL1eSJe7mCGNBz30
	Dx4XJyvRAOY0HkFwUzCjpqeXcEz3WMO3NHt+F8n/gW85nre7wL+EFMM1o/8nybvhEggvj0aOtv+md
	r89JG3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSDX-0000000Fean-0AQU;
	Fri, 20 Nov 2026 17:16:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSCX-0000000Fe6f-0roV
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 17:15:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ADE071A1754;
	Fri, 20 Nov 2026 17:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 824A1601B9;
	Fri, 20 Nov 2026 17:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97D3811BC05A8;
	Fri, 20 Nov 2026 18:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=31+QEQkTdBsAyjdQylHnzUm9tPSei/fUeG542zDh7q0=;
	b=fHR6XY/dsAuwkq49kqO1G1gpUJP18bQnFEHtqr2pY7KpDvCdkr87Rwh7YZhIvsLktmfC04
	kcNsvcVM5iVKZdKENVsIDsam65sE40JjUcsLgDMSQXITFGRD0nof1letJMJyRE/R/jt9Bg
	2UW+K39vOD8hY04ZbMcWizS4qb+A1PDRUGnlpjCGf0DTT6SoCbl5K6ICBHqF9ji0qwz3a8
	IcogV3nNRdxH9BOr9E0u3Ph8TuPjQ331sMkiRAapC7yXlyRhH6LRHReaMjkM4bOIHEaaUd
	PS9MRvB5O0vxPONabqGAyNVLpb0McN0fsI7kcDwBuedREZNdrDFwHjImOx1SYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:36 +0100
Subject: [PATCH v4 10/11] mtd: spi-nand: Set the DQS spi-mem capability if
 available
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_091505_655752_3CD2D4B4 
X-CRM114-Status: GOOD (  11.72  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check whether the NAND is capable of generating a DQS signal and advertise
the capability through the spi-mem layer. Do it as soon as the chip is
identified and before the SSDR/ODTR operation variants are negotiated, so
that controllers can take the capability into account when they need it.

Whether the DQS line is actually wired is described by the
spi-dqs-not-wired DT property and handled by the spi-mem layer, which
only reports DQS as available when the chip supports it, the line is
wired and the controller can use it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fee4a48b4c7f..6e1b7976d237 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1797,6 +1797,9 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			}
 		}
 
+		if (spinand->flags & SPINAND_HAS_DQS)
+			spi_mem_set_dqs_pin_available(spinand->spimem);
+
 		/* I/O variants selection with octo-spi DDR commands (optional) */
 
 		ret = spinand_init_odtr_instruction_set(spinand);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 87107f0955eb..990d3e9ac3fe 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -492,6 +492,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_HAS_DQS					BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
