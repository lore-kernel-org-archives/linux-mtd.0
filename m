Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD5DC4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 21:45:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E46D246CD
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 21:45:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dW0jjKKc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="Meq4xraQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E46D246CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P+2+5rXB5FVOPEZ5q2vcmYo3Q1dJUQ8bZb69Cp5U760=; b=dW0jjKKcoZ8eJHySmCxcyvDjhu
	s/zpmyL74AXU2t/KPxRbRev+0rU17ojJUxXC9kDKyGLEv1scwIiObmHvQS5Y0j0CubITokltjKCfB
	0uzFEBdyC91pf+H5II4KoEhVzxm244m7lhO25zMd9GlHoL9YhtHYLQpPPJjpDGF+k6MX9G8JKxB5s
	Yr++/aCpkOxFFuNS3m6knBs5Tt/DPs9hiuz8qjwSW7WPpGH6SEuBwmOD9K9N5uMkEBm1CS45P+mib
	0dVz4POPzpjCCl5GXiZHJsLD3r1YeHSxKtNjUDuWC/zlXSvCCkJs23tm99DIFfUZBlXG6tCUUlxdZ
	p5NkmXIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXtF2-0008Cm-Gz; Wed, 28 Oct 2020 21:44:24 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXtEw-00089J-L1
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 21:44:22 +0000
Received: by mail-qt1-x844.google.com with SMTP id c5so657667qtw.3
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3/ic8OrjoDKmQmHTz6BlbiXsmNSocXsV5IfSMKXiao=;
 b=Meq4xraQC6HPSphKKaYQJ7ytRmCjZ2ScJNeqHg+SnW/ek3Fq7/PoNjK4TQkUIodSn1
 u/6C8xFY+65YB+kufssP9OT9/A7FrT1/3aRDUBQBJC+6oDFlJdXG/91Y+Ys9WJe6Xm2o
 YUmND+CJWSDcZjRg2kG2iiEPZEKF+vGGmkQDtrZIoxGmC0Vqv7YxyJf2BI/ycp+ilJkZ
 36buVYQ+eDZkzOXJrFGygHbMtV3APWNeoGBH78FhE1APU2OM5NY4cLnR0FfR6iwQesk9
 m4o80/zMELksLZCp7DyDVccWPej+NMi3oDTpq2Vy+huPBBPZUKhMAk20kM0AOTFli8jB
 b0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g3/ic8OrjoDKmQmHTz6BlbiXsmNSocXsV5IfSMKXiao=;
 b=MjVVEHR/Dohfc4PkEXzVaGCwfgDeFCbc1Vu9zaMT6XLScP3QZBjRwFvDnrSYfFwW7S
 jq5hY9BNl6ZmJiMLKyLPEFUqFcNHz7k/RVk04K1kXLmhlO5+3nCQ5DDEMQQ8B94kNisG
 B4KFmmAlo/rzjkhRhI3xTskf+Ln6GQRUAvZ6pDiqAsh+hYOB5VnEMwyKqECFrkZuYZtU
 1ShfwMjk7SEqHtkTzGV1dY+lewXfQoszYLDT2p0ZZf1vyr99iYv/QARFA9xjrSRHgi9P
 lv+HJsi+UchIjjceGkTRVt0OstKlf3BrdZYCuvMGj4JhPp1Z2NLlNk7HAUT2rd51O+3+
 Nqvw==
X-Gm-Message-State: AOAM532BEzl15k+JXP8knqR1Gb8RIP4c5qVJhmQBLR71cfPhe0avpSht
 81k49ntIfd6nS5kUCBOs1I9RGQ==
X-Google-Smtp-Source: ABdhPJyHnOpf1IaFbVjmq/hiAC+w5EEILCtV5qRHcu78WhXx97XnxnZzhhtyC5AaAynfqXVPhJ/x+Q==
X-Received: by 2002:ac8:46c1:: with SMTP id h1mr901158qto.361.1603921455680;
 Wed, 28 Oct 2020 14:44:15 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id 22sm313023qtw.61.2020.10.28.14.44.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Oct 2020 14:44:15 -0700 (PDT)
From: Daniel Gutson <daniel.gutson@eclypsium.com>
To: Daniel Gutson <daniel.gutson@eclypsium.com>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Richard Hughes <hughsient@gmail.com>,
 Alex Bazhaniuk <alex@eclypsium.com>, linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: spi-nor: intel-spi: Split intel-spi reading from writing
Date: Wed, 28 Oct 2020 18:43:59 -0300
Message-Id: <20201028214359.384918-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_174418_971930_D7E38CD7 
X-CRM114-Status: GOOD (  22.10  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
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

This patch separates the writing part of the intel-spi drivers
so the 'dangerous' part can be set/unset independently.
This way, the kernel can be configured to include the reading
parts of the driver which can be used without
the dangerous write operations that can turn the system
unbootable.

Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/Kconfig     | 39 ++++++++++++---------
 drivers/mtd/spi-nor/controllers/intel-spi.c | 12 +++++--
 2 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 5c0e0ec2e6d1..491c755fea49 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -31,34 +31,41 @@ config SPI_INTEL_SPI
 	tristate
 
 config SPI_INTEL_SPI_PCI
-	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
+	tristate "Intel PCH/PCU SPI flash PCI driver"
 	depends on X86 && PCI
 	select SPI_INTEL_SPI
 	help
-	  This enables PCI support for the Intel PCH/PCU SPI controller in
-	  master mode. This controller is present in modern Intel hardware
-	  and is used to hold BIOS and other persistent settings. Using
-	  this driver it is possible to upgrade BIOS directly from Linux.
-
-	  Say N here unless you know what you are doing. Overwriting the
-	  SPI flash may render the system unbootable.
+	  This enables read only PCI support for the Intel PCH/PCU SPI
+	  controller in master mode. This controller is present in modern
+	  Intel hardware and is used to hold BIOS and other persistent settings.
+	  Using this driver it is possible to read the SPI chip directly
+	  from Linux.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel-spi-pci.
 
 config SPI_INTEL_SPI_PLATFORM
-	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
+	tristate "Intel PCH/PCU SPI flash platform driver"
 	depends on X86
 	select SPI_INTEL_SPI
 	help
-	  This enables platform support for the Intel PCH/PCU SPI
+	  This enables read only platform support for the Intel PCH/PCU SPI
 	  controller in master mode. This controller is present in modern
-	  Intel hardware and is used to hold BIOS and other persistent
-	  settings. Using this driver it is possible to upgrade BIOS
-	  directly from Linux.
+	  Intel hardware and is used to hold BIOS and other persistent settings.
+	  Using this driver it is possible to read the SPI chip directly
+	  from Linux.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-spi-pci.
+
+config SPI_INTEL_SPI_WRITE
+	bool "Intel PCH/PCU SPI flash drivers write operations (DANGEROUS)"
+	depends on SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
+	help
+	  This enables full read/write support for the Intel PCH/PCU SPI
+	  controller.
+	  Using this option it may be possible to upgrade BIOS directly
+	  from Linux.
 
 	  Say N here unless you know what you are doing. Overwriting the
 	  SPI flash may render the system unbootable.
-
-	  To compile this driver as a module, choose M here: the module
-	  will be called intel-spi-platform.
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi.c b/drivers/mtd/spi-nor/controllers/intel-spi.c
index b54a56a68100..8d8053395c3d 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi.c
+++ b/drivers/mtd/spi-nor/controllers/intel-spi.c
@@ -266,6 +266,7 @@ static int intel_spi_read_block(struct intel_spi *ispi, void *buf, size_t size)
 	return 0;
 }
 
+#ifdef CONFIG_SPI_INTEL_SPI_WRITE
 /* Writes max INTEL_SPI_FIFO_SZ bytes to the device fifo */
 static int intel_spi_write_block(struct intel_spi *ispi, const void *buf,
 				 size_t size)
@@ -286,6 +287,7 @@ static int intel_spi_write_block(struct intel_spi *ispi, const void *buf,
 
 	return 0;
 }
+#endif /* CONFIG_SPI_INTEL_SPI_WRITE */
 
 static int intel_spi_wait_hw_busy(struct intel_spi *ispi)
 {
@@ -576,6 +578,7 @@ static int intel_spi_read_reg(struct spi_nor *nor, u8 opcode, u8 *buf,
 	return intel_spi_read_block(ispi, buf, len);
 }
 
+#ifdef CONFIG_SPI_INTEL_SPI_WRITE
 static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 			       size_t len)
 {
@@ -633,6 +636,7 @@ static int intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
 					  OPTYPE_WRITE_NO_ADDR);
 	return intel_spi_hw_cycle(ispi, opcode, len);
 }
+#endif /* CONFIG_SPI_INTEL_SPI_WRITE */
 
 static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 			      u_char *read_buf)
@@ -705,6 +709,7 @@ static ssize_t intel_spi_read(struct spi_nor *nor, loff_t from, size_t len,
 	return retlen;
 }
 
+#ifdef CONFIG_SPI_INTEL_SPI_WRITE
 static ssize_t intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
 			       const u_char *write_buf)
 {
@@ -829,6 +834,7 @@ static int intel_spi_erase(struct spi_nor *nor, loff_t offs)
 
 	return 0;
 }
+#endif /* CONFIG_SPI_INTEL_SPI_WRITE */
 
 static bool intel_spi_is_protected(const struct intel_spi *ispi,
 				   unsigned int base, unsigned int limit)
@@ -897,10 +903,12 @@ static void intel_spi_fill_partition(struct intel_spi *ispi,
 
 static const struct spi_nor_controller_ops intel_spi_controller_ops = {
 	.read_reg = intel_spi_read_reg,
-	.write_reg = intel_spi_write_reg,
 	.read = intel_spi_read,
+#ifdef CONFIG_SPI_INTEL_SPI_WRITE
+	.write_reg = intel_spi_write_reg,
 	.write = intel_spi_write,
-	.erase = intel_spi_erase,
+	.erase = intel_spi_erase
+#endif
 };
 
 struct intel_spi *intel_spi_probe(struct device *dev,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
