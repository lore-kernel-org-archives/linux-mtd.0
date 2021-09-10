Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD0CC433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:16:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2AB061208
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 21:16:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2AB061208
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVDuS4ImNV8zhisNoIA8PLyPyk3LtoX8s5ZjCTFF4kI=; b=m+VKQbAQmvGymM
	FDWMn+T1yxZTseAQOJ7WCBRi5px94k0Cw0yKY8BNZ2EZWIb/NLDZjiOXyFp0XE4mopk0yBQ9twmkt
	MS/KFJmqUzerd0bSG8Cr7QPY3vov5iW8JakJS6fb1erXWpybNdzsgq857S0nb/Mlwq/qIEkLZkiIT
	HTosSF1kzqLl1E4GplgBb2lKdeDzSwQyywFYDRYPJ/FfCDT/f9jShZs9u6n5nzQc9oi/ioiaLmr4q
	bd3Kj1QhhNDtjBUMXfjVfgL+MJ758RpOf0PlxxQaZgXUkgKtairqjBTSnw20UA8UwuTU3yLLhyP7F
	UDhsjerw+Igrp41z/YNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOns3-00DpeN-Dg; Fri, 10 Sep 2021 21:15:39 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOnr3-00DpJu-1b
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 21:14:38 +0000
Received: by mail-qt1-x831.google.com with SMTP id b14so2805728qtb.0
 for <linux-mtd@lists.infradead.org>; Fri, 10 Sep 2021 14:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version; bh=87PNtsdeYnC8t5/JPJ88A4/N/BazyKRO2D3u06lDG0g=;
 b=hAZJujn835Lw8ghCWmOhsu6U7qNtHi8zV/ttdH9UMgy8buNYdg1m0huP/uWRgXykNG
 qgOwp6ntvzCACXU/iqlGwqnPMnLawtt2AVh5VRSpeM7bsTTA8nq3U0neagLk6vWQIJ7R
 bnmiBtonlTJm7m3nHaMlhDnmrO8PUqlERb0nJx6IPvw805Q9Z420W7+DcqH7IWD0GE8i
 m1ssF39MgRdKdMjHznRsLTxDU4IquEF5K8sj0mqzH7zqdA/9K0+Qf6pImBXhY7xITSFm
 bdJWxKd5aFDhUAE21RGL5tBCrpd4Ae9LYLDxK6f8bdtrbbhSzNZuqdGG1liyX6UdHzJX
 wHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version;
 bh=87PNtsdeYnC8t5/JPJ88A4/N/BazyKRO2D3u06lDG0g=;
 b=SO4YM1mvaVXkbZkX1NV0GJoziC0Zo7oxBFo0TMX+0NKsIdYd8N3Nv3w2VX7nfHdBBN
 5IbNMw1y8Q9rOc0SM4oaev/ddlvvO4Ud/40YJh5Ioba/C7rHX/oiRcIRMicDz17wQXHA
 1RyfVjcqmbovbzHQSg4kQ525B1G12d4Su/MPaXLdQuqnzPxBgxL4+hR9NptMwCZjub/R
 0RWYedGPV2ybzfsmht/FEiYt/SgUVPctN5lO7aI/QQCTBEkfihWi61Wx6kgV9u8F0bwU
 WrJY4ZkobPUiELttG31noJQQ9Z/m9uyOMOXqBCKpqGGYerBDYiu26IId/7eOnFGJnvHM
 i1gA==
X-Gm-Message-State: AOAM533aiTVQHN4XeeyFx+kC+RakI09M113G5G+kYo7buh6WqPsKYpl+
 lF8EJhKrHJTUwkCB8+SyCVU9ITcdNyPLlrRPlma0EDg/0FG6uNLSercf9GdOzHkw+3QjX/tdIct
 5zFpEl4xoI7Q4sSATDeLTILqnxGjWbBxDN1Df8081/mmq+uIT7Xxx8Dg844p77r5cCyMRPRxeeA
 ozdFNx/iMelw==
X-Google-Smtp-Source: ABdhPJzZNnWrKTHrYOK2uGW/fGK7zQc2HRRJaz1WEulWwl8qmE1xZRoYTM0eP0ApXAz3uX3HOkNTPg==
X-Received: by 2002:a05:622a:3d4:: with SMTP id
 k20mr9964147qtx.353.1631308475630; 
 Fri, 10 Sep 2021 14:14:35 -0700 (PDT)
Received: from localhost ([186.122.181.76])
 by smtp.gmail.com with UTF8SMTPSA id c2sm4539532qkd.57.2021.09.10.14.14.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 14:14:35 -0700 (PDT)
From: Mauro Lima <mauro.lima@eclypsium.com>
To: linux-mtd@lists.infradead.org
Cc: daniel.gutson@eclypsium.com, richard@hughsie.com,
 tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, mika.westerberg@linux.intel.com, mauro.lima@eclypsium.com
Subject: [PATCH 4/4] mtd: intel-spi: add read only stubs
Date: Fri, 10 Sep 2021 18:13:48 -0300
Message-Id: <20210910211348.642103-5-mauro.lima@eclypsium.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910211348.642103-1-mauro.lima@eclypsium.com>
References: <20210910211348.642103-1-mauro.lima@eclypsium.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_141437_135786_2F4AB577 
X-CRM114-Status: GOOD (  19.61  )
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

Add read only stub functions (as __weak) in read only mode,
so they can be override on read-write mode.
Remove the (DANGEROUS) tag in read only mode.
Add write mode option if pci or platform driver is selected.
Change the intel-spi recepie to be able to build read only
or read-write mode.

Suggested-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Suggested-by: Richard Hughes <richard@hughsie.com>
Signed-off-by: Mauro Lima <mauro.lima@eclypsium.com>
---
 drivers/mtd/spi-nor/controllers/Kconfig       | 50 +++++++++++++------
 drivers/mtd/spi-nor/controllers/Makefile      |  4 +-
 .../mtd/spi-nor/controllers/intel-spi-ro.c    | 50 +++++++++++++++++++
 .../mtd/spi-nor/controllers/intel-spi-rw.h    |  1 +
 4 files changed, 88 insertions(+), 17 deletions(-)
 create mode 100644 drivers/mtd/spi-nor/controllers/intel-spi-ro.c

diff --git a/drivers/mtd/spi-nor/controllers/Kconfig b/drivers/mtd/spi-nor/controllers/Kconfig
index 5c0e0ec2e6d1..c4f2505c9302 100644
--- a/drivers/mtd/spi-nor/controllers/Kconfig
+++ b/drivers/mtd/spi-nor/controllers/Kconfig
@@ -30,35 +30,53 @@ config SPI_NXP_SPIFI
 config SPI_INTEL_SPI
 	tristate
 
+config SPI_INTEL_SPI_RO
+	bool
+	default y if !SPI_INTEL_SPI_W
+	select SPI_INTEL_SPI
+
 config SPI_INTEL_SPI_PCI
-	tristate "Intel PCH/PCU SPI flash PCI driver (DANGEROUS)"
+	tristate
+
+config SPI_INTEL_SPI_PLATFORM
+	tristate
+
+config SPI_INTEL_SPI_PCI_RO
+	tristate "Intel PCH/PCU SPI flash PCI driver"
 	depends on X86 && PCI
-	select SPI_INTEL_SPI
+	select SPI_INTEL_SPI_RO
+	select SPI_INTEL_SPI_PCI
 	help
 	  This enables PCI support for the Intel PCH/PCU SPI controller in
-	  master mode. This controller is present in modern Intel hardware
-	  and is used to hold BIOS and other persistent settings. Using
-	  this driver it is possible to upgrade BIOS directly from Linux.
-
-	  Say N here unless you know what you are doing. Overwriting the
-	  SPI flash may render the system unbootable.
+	  read only mode. This controller is present in modern Intel
+	  hardware and is used to hold BIOS and other persistent settings.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called intel-spi-pci.
 
-config SPI_INTEL_SPI_PLATFORM
-	tristate "Intel PCH/PCU SPI flash platform driver (DANGEROUS)"
+config SPI_INTEL_SPI_PLATFORM_RO
+	tristate "Intel PCH/PCU SPI flash platform driver"
 	depends on X86
+	select SPI_INTEL_SPI_RO
+	select SPI_INTEL_SPI_PLATFORM
+	help
+	  This enables PCI support for the Intel PCH/PCU SPI controller in
+	  read only mode. This controller is present in modern Intel
+	  hardware and is used to hold BIOS and other persistent settings.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called intel-spi-pci.
+
+config SPI_INTEL_SPI_W
+	bool "Enable Intel PCH/PCU SPI controller in write mode (DANGEROUS)"
 	select SPI_INTEL_SPI
+	default n if SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
+	depends on SPI_INTEL_SPI_PCI || SPI_INTEL_SPI_PLATFORM
 	help
-	  This enables platform support for the Intel PCH/PCU SPI
-	  controller in master mode. This controller is present in modern
-	  Intel hardware and is used to hold BIOS and other persistent
-	  settings. Using this driver it is possible to upgrade BIOS
+	  This enables {PCI|PLATFORM} support for the Intel PCH/PCU controller
+	  in master mode. Enabling this mode it is possible to upgrade BIOS
 	  directly from Linux.
 
 	  Say N here unless you know what you are doing. Overwriting the
 	  SPI flash may render the system unbootable.
 
-	  To compile this driver as a module, choose M here: the module
-	  will be called intel-spi-platform.
diff --git a/drivers/mtd/spi-nor/controllers/Makefile b/drivers/mtd/spi-nor/controllers/Makefile
index 1933a7c2c30b..a4faeace67fc 100644
--- a/drivers/mtd/spi-nor/controllers/Makefile
+++ b/drivers/mtd/spi-nor/controllers/Makefile
@@ -3,6 +3,8 @@ obj-$(CONFIG_SPI_ASPEED_SMC)	+= aspeed-smc.o
 obj-$(CONFIG_SPI_HISI_SFC)	+= hisi-sfc.o
 obj-$(CONFIG_SPI_NXP_SPIFI)	+= nxp-spifi.o
 obj-$(CONFIG_SPI_INTEL_SPI)	+= intel-spi.o
-intel-spi-y := intel-spi-base.o intel-spi-w.o
+intel-spi-y := intel-spi-base.o
+intel-spi-$(CONFIG_SPI_INTEL_SPI_RO) += intel-spi-ro.o
+intel-spi-$(CONFIG_SPI_INTEL_SPI_W) += intel-spi-w.o
 obj-$(CONFIG_SPI_INTEL_SPI_PCI)	+= intel-spi-pci.o
 obj-$(CONFIG_SPI_INTEL_SPI_PLATFORM)	+= intel-spi-platform.o
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-ro.c b/drivers/mtd/spi-nor/controllers/intel-spi-ro.c
new file mode 100644
index 000000000000..4c52c2bb65ef
--- /dev/null
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-ro.c
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include "intel-spi-rw.h"
+
+bool __weak is_write_enabled(void)
+{
+	return false;
+}
+
+int __weak __intel_spi_erase(struct spi_nor *nor, loff_t offs)
+{
+	return -EINVAL;
+}
+
+ssize_t __weak __intel_spi_write(struct spi_nor *nor, loff_t to, size_t len,
+				 const u_char *write_buf)
+{
+	return -EINVAL;
+}
+
+int __weak __intel_spi_write_reg(struct spi_nor *nor, u8 opcode, const u8 *buf,
+				 size_t len)
+{
+	return -EINVAL;
+}
+
+/* We don't need erase op */
+int __weak __configure_lvscc_uvscc(struct intel_spi *ispi)
+{
+	ispi->erase_64k = false;
+	return 0;
+}
+
+void __weak __intel_bxt_rw_config(struct intel_spi *ispi)
+{
+	(void)ispi;
+}
+
+void __weak __intel_byt_rw_config(struct intel_spi *ispi)
+{
+	(void)ispi;
+}
+
+int __weak __intel_sw_cycle_write(struct intel_spi *ispi, int optype, u8 atomic_preopcode)
+{
+	/* not supported op */
+	return -EINVAL;
+}
+
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/mtd/spi-nor/controllers/intel-spi-rw.h b/drivers/mtd/spi-nor/controllers/intel-spi-rw.h
index 46c6461a8a7b..b682db03f17a 100644
--- a/drivers/mtd/spi-nor/controllers/intel-spi-rw.h
+++ b/drivers/mtd/spi-nor/controllers/intel-spi-rw.h
@@ -10,6 +10,7 @@ int intel_spi_sw_cycle(struct intel_spi *ispi, u8 opcode, size_t len, int optype
 int intel_spi_wait_hw_busy(struct intel_spi *ispi);
 int intel_spi_hw_cycle(struct intel_spi *ispi, u8 opcode, size_t len);
 
+void check_mode(void);
 bool is_write_enabled(void);
 int  __intel_spi_erase(struct spi_nor *nor, loff_t offs);
 ssize_t  __intel_spi_write(struct spi_nor *nor, loff_t to, size_t len, const u_char *write_buf);
-- 
2.31.1


-- 


This e-mail and any attachments may contain information that is 
privileged, confidential,  and/or exempt from disclosure under applicable 
law.  If you are not the intended recipient, you are hereby notified that 
any disclosure, copying, distribution or use of any information contained 
herein is strictly prohibited. If you have received this transmission in 
error, please immediately notify the sender and destroy the original 
transmission and any attachments, whether in electronic or hard copy 
format, without reading or saving.













______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
