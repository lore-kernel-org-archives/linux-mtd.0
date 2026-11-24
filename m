Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF7260A2607
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=er3qU0qL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfJnWicB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AZusIcCs46xTPFzBQZ7BnLvt4ewx4gxnlxeisp1dsfk=; b=er3qU0qLTgnK0TaalkZia9HSUt
	TlVW4K0//FNjRRpWFMgbWp/wHQbjRRAOIq256hH767mlZuF5akJm0T5/rSNk9OB2zA/LzIxW2viHy
	8SRdycNUs6Ix6vRRnwMey2KYB1WpodmMRhhqdXYlyEX1neMI9oSwMfB+8XKkWGf4gMVGkoxpQ2iZQ
	VcTHUpWQ2Jn4CdRjIwhvEgd50OWiJXxSuQ07Llcf29QCZBD67sJUhKJUHc1LAGU661gA02lVoz0nd
	0cg5PWzuv2qqhK/TgV1w1iedIZ3mFv4fqPzZadv+VAvTgC9y/+bZOT0IBkbcxMGX57teJllBmThH8
	sZfnqkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkI-00000006nMT-3AJg;
	Tue, 24 Nov 2026 14:43:46 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrkA-00000006nHs-04qZ
	for linux-mtd@lists.infradead.org;
	Tue, 24 Nov 2026 14:43:42 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 007C2C2C661;
	Tue, 24 Nov 2026 14:43:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8329B601E1;
	Tue, 24 Nov 2026 14:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63B7711E69988;
	Tue, 24 Nov 2026 15:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=clymHxqzJ4VZD82QYRjmyNxk5goaCZ4HHr8eN5h2/Tg=;
	b=TfJnWicBDSkAK4y8+3G+IzvXGuzIaA9tTyQhjE74U0RaS1c8uLdbSXb/pofnb/6YvBuW6a
	UDqdIy2d829bstKrJ8TlI4QH1n2l/2iSx7kyTnIqZsirO/Jlgl4CM0NdkFO7omamsjVXF1
	kfzOmLTCUN6rtFmAXCk3pWipnePf4KIUMTonHg0V/HANDB/9lds9+MLH3UcM6Wxl5JLAFW
	kPTJnpJ+u1bh8+h1yQ3xdJ/QzItjAhW1ckKMMMvTTScfk3v5U+eRL6KHjgQCts2fq4Tbdh
	NrsUy12KfLBCOZpXzxFXK/Zcr8iEyoTATAprmRy3sBUalCr0Hc+fhclmOA8riw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:03 +0100
Subject: [PATCH v5 2/6] spi: spi-mem: Clarify the conditions upon which DQS
 is usable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-2-261e0e712857@bootlin.com>
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
X-CRM114-CacheID: sfid-20261124_064339_145188_93422821 
X-CRM114-Status: GOOD (  13.94  )
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

The helper currently only captures the chip capability. Let's rename it
to capture the fact that it is going to reports whether DQS is usable
end-to-end through the upcoming changes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 12 ++++++------
 include/linux/spi/spi-mem.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 65956cf62156..76674750237e 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -556,8 +556,7 @@ EXPORT_SYMBOL_GPL(spi_mem_get_name);
  * Mitigating this limitation is possible with the addition of a data strobe
  * signal, commonly named DQS.
  *
- * Set the DQS boolean if the feature is available and configured at the chip
- * level. Controllers may query this value.
+ * Set the DQS pin boolean if the feature is available.
  */
 void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 {
@@ -566,16 +565,17 @@ void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
 
 /**
- * spi_mem_has_dqs() - Query whether the DQS is available or not
+ * spi_mem_dqs_is_usable() - Query whether the DQS is usable or not
  * @mem: the SPI memory
  *
- * Return: a boolean indicating whether the DQS signal is available or not.
+ * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
+ * usable when the memory supports it.
  */
-bool spi_mem_has_dqs(struct spi_mem *mem)
+bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
 	return mem->dqs_pin;
 }
-EXPORT_SYMBOL_GPL(spi_mem_has_dqs);
+EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
 /**
  * spi_mem_adjust_op_size() - Adjust the data size of a SPI mem operation to
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 55de48c277ac..82c417a661e0 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -464,7 +464,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 #endif /* CONFIG_SPI_MEM */
 
 void spi_mem_set_dqs_pin_available(struct spi_mem *mem);
-bool spi_mem_has_dqs(struct spi_mem *mem);
+bool spi_mem_dqs_is_usable(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.56.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
