Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21070C982C1
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 01:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8iD3sAyKHH+yaW8hQzbGC8zpTzIE63xJV2n0hvoT8u8=; b=p3/dtvMSj3dgiS
	OmeHOSF0TBBSVaz8jOEKZ5/YFNeacCUtC0WLWu+Chr8SwQueaZEhqz8oHIqzBiBxn+yjReLdM0CHF
	MIDFdoqqjXZ6YtFrch65kHVoWHXAOG3Wmgs4CxQdzwSuCKW/AwTTHi3NyG5blZuRXN0c/cWMoRIwK
	yUVEmKn26i+qsOz5ayUFRJiHUKk8QQ0jtYzWCVLX0NnIF59tPL3VNXKBFFWYUV3ZAbdrtUWk4Bhwi
	pDrLwwqRmTYIeaL8mwtSJYSk8jdY1Dh/D7dEWfm/xqfzpgIkPeLGHd6zemo0cnV39D/tb+a/vnlph
	r1qh48qaZwnpNULloPhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70Ya-0000000ANrc-02sb;
	Thu, 17 Sep 2026 01:04:56 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70YX-0000000ANrH-1Qbp
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 01:04:54 +0000
Received: by mail-pz2-x10.google.com with SMTP id 41be03b00d2f7-cc1cea4bfd1so186283a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2026 18:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607092; x=1790211892; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E30uXXuhT74g97EPE8vegV38mCdQE9B1n1l0XxkaQk8=;
        b=SlFEx+Y1NN5KF92X44nhlku81JNmYqycrGPN3gogouSclgU2/AO2P0cHNhnaheIxdU
         ZC9iwbWJR4uTh4HJSRdoeQnCDA/8lKyCaNVdHiexp09/VWT9wdxsrdcUcQOch1KiAGkA
         k+VEF9DjHfZLJXMxqNaT+NxxW8P/hhSFBavHt5+8/0pPCWxQ7OYo2BYEeinzHciAnEen
         ujB/qoZ2ZFKJaMbhIqqIna6ON+pgn4uiTjWCXA1LrUXvJGqLR2X6y43DiRj11o0ebV6O
         5e2omitthSrAsHFTRSHoIXt/HAliRN9X73NhlihezqsgRUmo4N/BfKhCtuAlw8oA64BT
         3llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607092; x=1790211892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E30uXXuhT74g97EPE8vegV38mCdQE9B1n1l0XxkaQk8=;
        b=DfopC6HS31TsSEZfQWaN6/xeAp/EHv4r2n0oGZsyiu02rEPOkryoU+rP7y7tmBZbkl
         tmar01xHiYFI2T9N1zFfikuNI8xosEc/aN3sZPVBEMV7Iipg4ljxNA/pydzMWD1Qzioz
         n35MybAu4BKYeN8RqycthmmBadO5xPL9gRH5H60t4/68BIaKzYsKUfrJ1xeLbha57OOd
         y1oSJzqQemfcQJqWvVeYsmgFNDK1gxwbZ/NZuVrmcKPo2Bo6uQou7YtsA7pK/eremcIM
         JJdogz8u1jRze4qYEbY9nwfWiNOiOHu+Eil9spzKajzidb/Z1jHnHTubmVXf7oYPKNsf
         VTmw==
X-Gm-Message-State: AFuF++mg1/Wv/2+x7eKKfYFWe4DsVreh04zUBhEiB+lDffJWpA8DKAW1
	dccq9IUKG+dIyWaXFPwoZI2HDMPTg6F60OyMYlRdQQuL8OWVKBBeB5Tu++WeJyU9
X-Gm-Gg: AYBFou2h8aabyV2OQ0NXZKN5l9N2T/+lsHEpJFkIhMg88catrMX96ZUT7LGXapxIBbW
	Y71OmIp8d0IX1rRNLt0hhyCvtBJLyCzZ1rwHoYkOOIFDsVCu2tnZYIoJjJqMAou0TJQWTufJBrt
	TmlONuffAvkHaWb7e9/6AwovXYeIidX28miLYqSG7CVIDU3+Hi2oDzZKW8DClKWd6h4IcVsA4ic
	zUcsvlANiovS9ZoNdCibKxr9uFXv8TBcWRTegyRyzqsYQqXduZS5XeKSjZ+EEKfhZ8XyUOqPQrD
	fHPfdziVk7gh+gKNUuFUhWaZGUGEo9NTi1c6rWvUySu86rE7ibIFKLSicFasyz7Maxsni/fxhnl
	+e1el+P5qAqnefToFvOGYEhERoBWLFEJ5iofBzgZ+tpNExGi5Y/UBt2Di/yvnE+ieF0nATvlCmj
	8qdmk06MMmVCaaaWK+gjvLvZ5GAzPxevX592TMtoTeFLqYcIWTUOJ3wd/9Pqlqcdlfu99P4pbET
	D0FHBCLKaGyzNiUmQo/BeQYzLqCwZ/AyM3tkov7XNPzdgXg3RjTFPJcnJZlXPoTcYCXPnnGZ69R
	8X9z9tUydvYD8oaeuMn8
X-Received: by 2002:a17:90b:4d0e:b0:39e:17b:a13d with SMTP id 98e67ed59e1d1-39e1e539c36mr12176962a91.23.1789607091609;
        Wed, 16 Sep 2026 18:04:51 -0700 (PDT)
Received: from Gracelands.reavernet (180-150-12-158.b4960c.syd.static.aussiebb.net. [180.150.12.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35df6112sm1873564a91.7.2026.09.16.18.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:04:50 -0700 (PDT)
From: Stephen Bancroft <stevereaver@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Stephen Bancroft <stevereaver@gmail.com>
Subject: [PATCH] mtd: maps: add INT0800 firmware-flash map driver
Date: Thu, 17 Sep 2026 11:04:31 +1000
Message-ID: <20260917010431.29714-1-stevereaver@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180453_415241_F2580588 
X-CRM114-Status: GOOD (  25.19  )
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

Add a read-only mapping driver that binds the ACPI INT0800 "Intel
82802 firmware hub" device and exposes the system firmware flash as an
MTD ROM device.

On x86 machines the boot flash is decoded into the physical address
space below 4 GB, so a plain ioremap() of the declared resource window
is sufficient for reads - no SPI or LPC controller access is needed.
The window may be larger than the real flash; undecoded holes read as
0xff.

This gives userspace a clean, safe way to read firmware flash contents
without flashrom or relaxed /dev/mem access - for firmware analysis,
and for extracting option ROMs stored inside EFI firmware volumes
(e.g. the NVIDIA VBIOS on EFI-booted Apple machines, which can then be
fed to nouveau via nouveau.config=NvBios=). There is deliberately no
write or erase support.

Tested on a MacBookPro4,1 (ICH8M): /dev/mtd0 reads are byte-identical
to a flashrom dump of the 2 MiB SST25VF016B, except for live NVRAM
variable-store regions.
---
 drivers/mtd/maps/Kconfig   | 17 +++++++
 drivers/mtd/maps/Makefile  |  1 +
 drivers/mtd/maps/int0800.c | 96 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/mtd/maps/int0800.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 1bb3dba..649fd14 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -161,6 +161,23 @@ config MTD_AMD76XROM
 
 	  BE VERY CAREFUL.
 
+config MTD_INT0800
+	tristate "Read-only BIOS/firmware flash via ACPI INT0800"
+	depends on X86 && ACPI
+	select MTD_ROM
+	help
+	  Support for reading the system firmware (BIOS/EFI) flash chip
+	  through the memory window described by the ACPI INT0800
+	  "82802 firmware hub" device, present on most x86 machines.
+
+	  The flash is exposed read-only via the ROM chip driver, e.g.
+	  for firmware analysis or extracting option ROMs (such as
+	  video BIOS images embedded in EFI firmware volumes). There is
+	  no write or erase support.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called int0800.
+
 config MTD_ICHXROM
 	tristate "BIOS flash chip on Intel Controller Hub 2/3/4/5"
 	depends on X86 && MTD_JEDECPROBE
diff --git a/drivers/mtd/maps/Makefile b/drivers/mtd/maps/Makefile
index 01745ec..2f1a737 100644
--- a/drivers/mtd/maps/Makefile
+++ b/drivers/mtd/maps/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_MTD_L440GX)	+= l440gx.o
 obj-$(CONFIG_MTD_AMD76XROM)	+= amd76xrom.o
 obj-$(CONFIG_MTD_ESB2ROM)	+= esb2rom.o
 obj-$(CONFIG_MTD_ICHXROM)	+= ichxrom.o
+obj-$(CONFIG_MTD_INT0800)	+= int0800.o
 obj-$(CONFIG_MTD_CK804XROM)	+= ck804xrom.o
 obj-$(CONFIG_MTD_TSUNAMI)	+= tsunami_flash.o
 obj-$(CONFIG_MTD_PXA2XX)	+= pxa2xx-flash.o
diff --git a/drivers/mtd/maps/int0800.c b/drivers/mtd/maps/int0800.c
new file mode 100644
index 0000000..2438d97
--- /dev/null
+++ b/drivers/mtd/maps/int0800.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Read-only MTD access to the system firmware flash behind the ACPI
+ * INT0800 "Intel 82802 firmware hub" device.
+ *
+ * On x86 systems the boot flash is decoded into the physical address
+ * space below 4 GB, so a plain ioremap() is sufficient to read it -
+ * no SPI or LPC controller access is required.  The declared _CRS
+ * window may be larger than the real flash (the whole top-16MiB
+ * decode range is commonly claimed); undecoded holes read as 0xff.
+ *
+ * The device is exposed read-only via the ROM chip driver; there is
+ * deliberately no write or erase support.
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/io.h>
+#include <linux/mtd/mtd.h>
+#include <linux/mtd/map.h>
+#include <linux/platform_device.h>
+
+/* top-of-4GB firmware decode, used when _CRS reports no window */
+#define INT0800_DEFAULT_PHYS	0xffe00000UL
+#define INT0800_DEFAULT_SIZE	SZ_2M
+
+static struct map_info int0800_map = {
+	.name		= "int0800",
+	.bankwidth	= 1,
+};
+
+static struct mtd_info *int0800_mtd;
+
+static int int0800_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res) {
+		int0800_map.phys = res->start;
+		int0800_map.size = resource_size(res);
+	} else {
+		int0800_map.phys = INT0800_DEFAULT_PHYS;
+		int0800_map.size = INT0800_DEFAULT_SIZE;
+	}
+
+	/*
+	 * Plain ioremap on purpose: the window is already claimed by the
+	 * ACPI/pnp resource reservation, so devm_ioremap_resource() would
+	 * fail with -EBUSY.
+	 */
+	int0800_map.virt = ioremap(int0800_map.phys, int0800_map.size);
+	if (!int0800_map.virt)
+		return -ENOMEM;
+
+	simple_map_init(&int0800_map);
+	int0800_mtd = do_map_probe("map_rom", &int0800_map);
+	if (!int0800_mtd) {
+		iounmap(int0800_map.virt);
+		return -ENODEV;
+	}
+	int0800_mtd->dev.parent = &pdev->dev;
+
+	dev_info(&pdev->dev, "mapped firmware window 0x%lx-0x%lx\n",
+		 int0800_map.phys,
+		 int0800_map.phys + int0800_map.size - 1);
+
+	return mtd_device_register(int0800_mtd, NULL, 0);
+}
+
+static void int0800_remove(struct platform_device *pdev)
+{
+	mtd_device_unregister(int0800_mtd);
+	map_destroy(int0800_mtd);
+	iounmap(int0800_map.virt);
+}
+
+static const struct acpi_device_id int0800_ids[] = {
+	{ "INT0800", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, int0800_ids);
+
+static struct platform_driver int0800_driver = {
+	.probe	= int0800_probe,
+	.remove	= int0800_remove,
+	.driver	= {
+		.name		= "int0800",
+		.acpi_match_table = int0800_ids,
+	},
+};
+module_platform_driver(int0800_driver);
+
+MODULE_AUTHOR("Devin");
+MODULE_DESCRIPTION("Read-only MTD map over the INT0800 firmware flash window");
+MODULE_LICENSE("GPL");
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
