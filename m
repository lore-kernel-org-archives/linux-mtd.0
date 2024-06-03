Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8A2C25B76
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=klkcfm5PI1JRm2ovynGxVG6sthLfdOBqK4c9/KfGsas=; b=dog8bLlymWnW1u
	0GDrmkR21tFmvahZah2iONGz3v6r37VBDHlRz17sZJCJZ26NMl0nt4DnGzEdhprK0CdJzWJAN8S9T
	AvtmjtkEYZYufstqBiUgLM72Fhl85el8w2qFANLnk+NWUxgoA+HCiqKmD3qcJM3KyLoTcD5M29bD6
	T3T1c1PEonAbU+ESn98TXuuItiSTKZuzQMQuxIlJ6TjnpE0gt6Ek9KScxg8U7QYtU1o0TR2QNApMy
	74Fh7orFt/NQ6WJ8zJN7nEzZBvgo1VnpaS3hv0XCtIs1E8+iXkid8pYYXeRycBcsGYB/Iih8ezQDl
	154edbFS7NEC1Fu6CiSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RO-0000000GqmL-2wtg;
	Mon, 03 Jun 2024 13:09:34 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE7RJ-0000000GqkY-0jo8
	for linux-mtd@lists.infradead.org;
	Mon, 03 Jun 2024 13:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SkkYBGLBX5AMS6+4n3/iKbRmqntG4ThN501YL0l9GAg=; b=UADXYjTbQHNq1JlvmXGCNxTpA5
	JRs1fqjmLflVnfrfHddyibyPi9TfLHQO9K+QBVtGGsNuT94oTAfLRQlEmXPCXGEMwXjUXtOMmr20D
	EVle1XOUIRlwz/rlCqiZKZAWppdREx2U/Ex2AMF66Y2Wdr11L+8qtG/QIdawfM4cvCJhZsn/IuKcL
	aQaJ3cTrHmrsxqXOdZbqezPOlWTWLJ1cU2KUD4H+polMfL1zglWwrylRVXMUOcvRT9780ohhG0u8v
	ZEgm1sTHDGbixswNwn3aCRbIG+c62ZA4dQ47G7UMBQ1N0B7f6KzIOMDF9QA4aGe8Sd3prXoi8JAuq
	GQPXV6Ag==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1sE7RG-000Jpu-FN; Mon, 03 Jun 2024 15:09:22 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1sE7RC-000O95-22;
	Mon, 03 Jun 2024 15:09:22 +0200
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 03 Jun 2024 15:09:15 +0200
Subject: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
MIME-Version: 1.0
Message-Id: <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com>
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
In-Reply-To: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rasmus Villemoes <rasmus.villemoes@prevas.dk>, 
 Esben Haabendal <esben@geanix.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717420161; l=1626;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=gu0DnQSfTDhcc8YVz9dQ+rW0Ug+W3gS4CBp0FJUD1eY=;
 b=LVq4ZvCQ52/lfDLcEa7wZA3VvHM6rWkJzLZ3AY8vciC8VFmqw8E+MeplwLvc7oLoOcaK8f8IQ
 9AbF3Q3WekaA0tAiWBGugYTEUHOdFyizyN0XbT3nuB0mEca7502OKb4
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27295/Mon Jun  3 10:28:26 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_060929_699326_6545E4F0 
X-CRM114-Status: GOOD (  12.35  )
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

A dedicated flag for triggering call to
spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP read
and parse, with fallback to legacy flash parameters, without having dual,
quad or octal parameters set in the legacy flash parameters.

With this, spi-nor flash parts without SFDP that is replaced with a
different flash NOR flash part that does have SFDP, but shares the same
manufacturer and device ID is easily handled.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 drivers/mtd/spi-nor/core.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 3e1f1913536b..1c4d66fc993b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct spi_nor *nor)
 
 	spi_nor_manufacturer_init_params(nor);
 
-	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
+	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
+					SPI_NOR_DUAL_READ |
 					SPI_NOR_QUAD_READ |
 					SPI_NOR_OCTAL_READ |
 					SPI_NOR_OCTAL_DTR_READ))
diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
index 442786685515..77f61a984cb3 100644
--- a/drivers/mtd/spi-nor/core.h
+++ b/drivers/mtd/spi-nor/core.h
@@ -535,6 +535,7 @@ struct flash_info {
 	u8 no_sfdp_flags;
 #define SPI_NOR_SKIP_SFDP		BIT(0)
 #define SECT_4K				BIT(1)
+#define SPI_NOR_TRY_SFDP		BIT(2)
 #define SPI_NOR_DUAL_READ		BIT(3)
 #define SPI_NOR_QUAD_READ		BIT(4)
 #define SPI_NOR_OCTAL_READ		BIT(5)

-- 
2.45.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
