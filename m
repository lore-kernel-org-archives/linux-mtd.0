Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EFA606A6B7
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=22DVwfjC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TXs9AF5g
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=B0xqT7q2o5yy9B0AyGqmyhYJzbp8S8FBW8iD+ZIE2xw=; b=22DVwfjCjaLS0ZfPx5QoGLM81m
	Mvbk55MKwN3RZ0p+5JjNoppZGCfsLvV8pnhnHNbqPAt5jGmWL7a9KG6mXqCrqM1koYLoSKfn3Fsbz
	hmlsoHyqJos4m191KZoRreLf+l1fyob8ejL4MJfNPRH2ImMPP5C5HxaeN+EU2Stv7/SiVpQRLes7U
	ngwpg5QXX4lBeB/k3p3csl/vKdP9iE7NWihiLNmoK7qffJZOZaotdTM/QTxNGNMtc/RZb/AapOfqd
	Xinopg7LZB0W16XPRY6vWuC/c/XmDZXGmGZ4XKxYjnaTMTHETQHMvKBILg0qNp6gl3jdF0ZVwtepG
	JD0KerFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkL-00000006nOn-1Xe4;
	Tue, 24 Nov 2026 14:43:49 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkH-00000006nL9-35dG
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:43:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40A404E41768;
	Tue, 24 Nov 2026 14:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15C16601E1;
	Tue, 24 Nov 2026 14:43:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 879ED11E6997A;
	Tue, 24 Nov 2026 15:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531422; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j3UMb6Tq8TxZ/5efwis1lZEKc4crhPUm96cd/FT1lQc=;
	b=TXs9AF5gBNTAshSzYH+Eh1PEKvaUaoZtVIzkUqNZ+gIOdByWoBs9wV9t7TPYRFEnoD/QyJ
	uxOHMjm69h+QnXEHDKgd41sCPJmAGeBchnfPsMEdGucwIsaouE2Ys80QKM46HVlbiCM5Z2
	AR5/NKMKXoSGXc8fAl+FQc7imB+mVdOobuJzT6jIw4XeE9Qr4HjfE+HdUmaJ6x6OZGuPuV
	z4DQ5/6GpAWUeBX+f2NqoeqbVkqBJRv+z5Ub9V7qw5qZWY8CzLu1YPwuIxsdazXXHR762Q
	3KXGHFT48Qip4qGSWehi1TK/+YKuwkBfHANRZv6Py+D/TRl42HnZszyfXhvcGA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:06 +0100
Subject: [PATCH v5 5/6] spi: spi-mem: Take the controller DQS support into
 account
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-5-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
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
X-CRM114-CacheID: sfid-20261124_064345_920761_35A87486 
X-CRM114-Status: GOOD (  15.51  )
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

Require the controller to advertise DQS support through the new
mem_caps.dqs capability. A controller that cannot use the strobe would
otherwise leave the memory driving a signal that is ignored, which costs
power and EMC pollution.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 8 ++++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 9537756e5afc..f6aa46d37f5c 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -570,11 +570,15 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it and the line is wired.
+ * usable when the memory supports it, the line is wired and the controller is
+ * capable of using it.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin && mem->dqs_wired;
+	struct spi_controller *ctlr = mem->spi->controller;
+
+	return mem->dqs_pin && mem->dqs_wired &&
+	       spi_mem_controller_is_capable(ctlr, dqs);
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index ed581a4d4e9a..d524b2862e11 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -394,6 +394,7 @@ struct spi_controller_mem_ops {
  *                   is a pause in the transfer (eg. internal bus contention or
  *                   DMA arbitration on an interconnect). Features such as NAND
  *                   continuous reads shall not be leveraged.
+ * @dqs: The controller can use the DQS signal provided by the memory
  */
 struct spi_controller_mem_caps {
 	bool dtr;
@@ -402,6 +403,7 @@ struct spi_controller_mem_caps {
 	bool per_op_freq;
 	bool secondary_op_tmpl;
 	bool no_cs_assertion;
+	bool dqs;
 };
 
 #define spi_mem_controller_is_capable(ctlr, cap)	\

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
