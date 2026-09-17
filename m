Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C7C982CC
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 01:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Iu90LGBe6+giYBHVgG3v0Up+inqAlhIPonyD9S1CnQ=; b=IHG0ml/GZsgcOU
	jpE+hPVHULV3flKL2WSVWR1/FJEQ0pW1nPwhMDbGOgHWTgbXwb5uaRqbVU/5Q3Nosn9R6g8ownHZa
	NNbolaHNi8kFaCGwwODmBE24KF/VzE3kEGmWYRx3BsbTt4jQY/OszG5OLlN7EH/nCXTr7ZBzBcCVz
	3Q6hzCwUzToFoxTj3dHKgFBw1VZZrUz5piu1T1wYgSmCHrEoHIY1+X7nIWIg14ACX53keNv1XS3dt
	MeNCmJ6wAS1FcNOPBU0lc/eE6AbaBFCfRz9uD/SoOwwSQM/WVVtTw0NO2B1LNOS7MiuEjCiyYFEO/
	3eGIb/+tKue4xE69qHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70ol-0000000APDB-0MuM;
	Thu, 17 Sep 2026 01:21:39 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70oi-0000000APCo-3Ett
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 01:21:37 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-396ccb65437so208621a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 16 Sep 2026 18:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789608096; x=1790212896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tWcJvALC/G6slaVF+ZhqTbjSG1O1peV92vH1r64zREM=;
        b=qLZ1CE0KNHaUTXH98KrEYsMsG3eA9NoPjBT0IFL2Lrlc/nSkeKup0ajTkXeqxl+SHR
         rp5FJN20Cw2hmRpd4LYTnuRfQOSwkyANKQ5bxSVdYXpJ6zGJSP+sWarhYbtgODyOQOa8
         E4FRj6DBoix97sdJcKZ/sX48i7EIEAkIOpveh8nXPQ28bReQdwR84WiyPGx9Yv+aVi++
         xHh/lDl3u20sb7aC1L1xnRIfQhO7rl1nckx6NWkXkW+CFSyoc85Gkrv6BXtJgHotmzVT
         V6PWY4mEvK28EcV5QejRXyUEk9yGSKEq0EzlJOKaUWZi7lC7kEsiLYiwe+Kh5qYxHcad
         hIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608096; x=1790212896;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tWcJvALC/G6slaVF+ZhqTbjSG1O1peV92vH1r64zREM=;
        b=wahG9JYWNAxu1QzeXnxDWPCZo2eYDk5EINZwl5PxJiGKpfCJI0Dae1r1MuOpuPnSIL
         VEqyDln9VovvMI+xCe9+63rp2bEMfgbVrOFliW+mnNdYyriM879rZye/x7xck6nRt8U3
         pAMefAGcJ/OqaVkzdV87T6Z1HRqOoUH1KgwyjIsVOlScOX+jg0MldzP096Yq1GifHof2
         L3TSClWXoYB8mOGBnIKy6p931tOdpAhkPrbPMqL40+QGR0HHG51IDk2hHqdaYr+X/a40
         H7IjtmCFMMCZwNDD8mVrBcFSPVXNIksOPaDn9Ii0z9QAde42+OVF9ayOu9AgWzf9aeGg
         LumQ==
X-Gm-Message-State: AFuF++kO89m7efeb6MWg9HoyleFbNdHZiLOdVE4ecMe1TL1cPl/crYcF
	tiRBfVKHeEQXPEB22hUOeeRMsWaSaE6Jlm2RXBLiVLLVOOWnhlXXScWgGnpqeh0B
X-Gm-Gg: AYBFou24G5YKQWd8iLcWiGKBT4YDqmyudt1I1iwrlERUNGFPDTeU3A1fyk84S6080U5
	xY3UClWTKkSEIMorxaCYeJTHnV3itVAQmm6iDBa9skc5DclYd0B9zt37r4GxXA75QTNJ12CoX6g
	/1Tuc8N/neH7OlcxL91lwXm6x5OKydy7KWwq643FAygR1ad9/Jeh68wZ55BqnqoFHsWiTmPHxMH
	/J0pRiysynMGn593KtK4H6ZL0Yy9kTAiVaGYk5Bu0gfMVTHNfphfMJb/o0KMm2bRsZtlcs60uVB
	FogfkND64rC6q0DOaUOTLnG263Qi3rABHaFGlXfv+Y7zP2W3tNDQb7Hu4lKcaUoXBuI8yU43uMY
	94KGwb87stgwGn7YK2VrXr5U1TOL2FFfY38tkG+8k3Z0zS7i/0swi41Uec7MbvKbPNGVPOzlLqJ
	I88fvFYitbTgDx8unVdeX3sE/SC5M/2u1oHfF0vcy/2PjURF0Nub6u15uJA+lLC2fq7Pci+V3g1
	rhRYzykCaCGkmWWPtuDdgHzwoFSxFsprwE5ZwiYQFOdrdU5NcrbUym+1or5WrcUazixdlufhOow
	XRTr7DABAjYiJStgn+sB
X-Received: by 2002:a17:90b:2885:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39e1e502f25mr11317761a91.21.1789608095564;
        Wed, 16 Sep 2026 18:21:35 -0700 (PDT)
Received: from Gracelands.reavernet (180-150-12-158.b4960c.syd.static.aussiebb.net. [180.150.12.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36115cc8sm1870445a91.3.2026.09.16.18.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:21:34 -0700 (PDT)
From: Stephen Bancroft <stevereaver@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	Stephen Bancroft <stevereaver@gmail.com>
Subject: [PATCH v2] mtd: maps: add INT0800 firmware-flash map driver
Date: Thu, 17 Sep 2026 11:21:23 +1000
Message-ID: <20260917012123.33685-1-stevereaver@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_182136_817841_1E26EE09 
X-CRM114-Status: GOOD (  26.52  )
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

Signed-off-by: Stephen Bancroft <stevereaver@gmail.com>
---
Changes in v2:
- Per-device state via devm_kzalloc instead of globals (fixes shared
  state corruption with multiple INT0800 devices)
- Clean up map probe on mtd_device_register() failure (fixes
  memory/mapping leak)
- Use %pa for resource_size_t in dev_info (fixes format string on
  32-bit)
- Add missing Signed-off-by

 drivers/mtd/maps/Kconfig   |  17 ++++++
 drivers/mtd/maps/Makefile  |   1 +
 drivers/mtd/maps/int0800.c | 108 +++++++++++++++++++++++++++++++++++++
 3 files changed, 126 insertions(+)
 create mode 100644 drivers/mtd/maps/int0800.c

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index 1bb3dba2631d..649fd145e15d 100644
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
index 01745eca1f73..2f1a7375e13c 100644
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
index 000000000000..a32e1fcf8d8c
--- /dev/null
+++ b/drivers/mtd/maps/int0800.c
@@ -0,0 +1,108 @@
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
+#include <linux/slab.h>
+
+/* top-of-4GB firmware decode, used when _CRS reports no window */
+#define INT0800_DEFAULT_PHYS	0xffe00000UL
+#define INT0800_DEFAULT_SIZE	SZ_2M
+
+struct int0800 {
+	struct map_info		map;
+	struct mtd_info		*mtd;
+};
+
+static int int0800_probe(struct platform_device *pdev)
+{
+	struct resource *res;
+	struct int0800 *fw;
+	resource_size_t end;
+	int ret;
+
+	fw = devm_kzalloc(&pdev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return -ENOMEM;
+
+	fw->map.name = dev_name(&pdev->dev);
+	fw->map.bankwidth = 1;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (res) {
+		fw->map.phys = res->start;
+		fw->map.size = resource_size(res);
+	} else {
+		fw->map.phys = INT0800_DEFAULT_PHYS;
+		fw->map.size = INT0800_DEFAULT_SIZE;
+	}
+
+	/*
+	 * Plain ioremap on purpose: the window is already claimed by the
+	 * ACPI/pnp resource reservation, so devm_ioremap_resource() would
+	 * fail with -EBUSY.
+	 */
+	fw->map.virt = devm_ioremap(&pdev->dev, fw->map.phys, fw->map.size);
+	if (!fw->map.virt)
+		return -ENOMEM;
+
+	simple_map_init(&fw->map);
+	fw->mtd = do_map_probe("map_rom", &fw->map);
+	if (!fw->mtd)
+		return -ENODEV;
+	fw->mtd->dev.parent = &pdev->dev;
+	platform_set_drvdata(pdev, fw);
+
+	end = fw->map.phys + fw->map.size - 1;
+	dev_info(&pdev->dev, "mapped firmware window %pa-%pa\n",
+		 &fw->map.phys, &end);
+
+	ret = mtd_device_register(fw->mtd, NULL, 0);
+	if (ret)
+		map_destroy(fw->mtd);
+	return ret;
+}
+
+static void int0800_remove(struct platform_device *pdev)
+{
+	struct int0800 *fw = platform_get_drvdata(pdev);
+
+	mtd_device_unregister(fw->mtd);
+	map_destroy(fw->mtd);
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
