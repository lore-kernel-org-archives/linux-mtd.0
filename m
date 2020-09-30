Return-Path: <SRS0=o/Ze=DH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00A8C47420
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF662071E
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Sep 2020 13:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1mijE+o";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=eclypsium.com header.i=@eclypsium.com header.b="dXXQG14t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EF662071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=eclypsium.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dt4MA/XyHa0mjt8j48guqtgFdifzybiivbfGeEktjMU=; b=S1mijE+ohv6rO+4dXxpUoxc4Ll
	cCaYwhhXccrCxJAfOBPdSdrIFQ/u74nKVr7bbeNJSq8+ohO5k6LcLn2TTbAl3VMiehP1uqd+OQD3S
	BFy87sFLyPTJC9jfQwBdiZiOk/iecrXOLZUZlFGWICFTql6xxNoAeRwRuVdtH1f3Y2jQ12Ab1kRaK
	VB6+lkjPu95qQ/S0wp/hms4ctWtLP2+nmqbbCeSacGXbVjkDfQH0tg4HUFs1DbNtuumpQ4QwdtO9G
	6Et/pKNIYku2M8NC/w9uNB//GY7IpvonGwPPOBIFTwaqpzV6/ZEIC4YJDDqTl1W7cQn5pNy70qSEY
	O0SVb4Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNcW9-00074R-Nr; Wed, 30 Sep 2020 13:51:37 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNcW3-00070D-VV
 for linux-mtd@lists.infradead.org; Wed, 30 Sep 2020 13:51:35 +0000
Received: by mail-qt1-x835.google.com with SMTP id a4so1218861qth.0
 for <linux-mtd@lists.infradead.org>; Wed, 30 Sep 2020 06:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=eclypsium.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4I3uX02Igjq18E7APS347132GnIV7mVYlpb51la7dFw=;
 b=dXXQG14tcvVm2kKeVN19uxT1NXyXk372I+SN2SbWmOSH6FNdHz9xSt/amFtaLvQamC
 NDMQs/570CKp7eNV3qS/KB+FgBpcHe2NzZDRQm14UmslFXj6mQTJw9pUI/OTg71SRGdW
 CQkXewCO3VBKh3piQZVuMPq4hcys/HQTTm+K0qsiTxQsjZ5eD4Keyq0ZbGifn2vVIyG7
 Nx+TXyse1zqtke907Q0YU2+Sg0PCJkya0bcHzaaVsjhYRy481a+gpNWY4Yex4cauXGFo
 KSxqXe9WrynCD3aVeWHfN9WOslFxn9ZQzg6MY0q8RdtckEU1PkaT1vJsd/PHqZ7z+ZFT
 Dj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4I3uX02Igjq18E7APS347132GnIV7mVYlpb51la7dFw=;
 b=g1lSMmx733ihzV4wLLuTdYIVx0jFBljZ3JCPytW4Ybgx5dGBDjugbBS4Kt3gaptOWn
 IabqiKqerHa1HWIIxSwoEpbRTxuqVt5YBQIQpwdDakaUNK/rXWRA5Z6NFxx/S09+tI56
 dJcMpZikOriyHccSafSaspcB3j16DyOc//+SrThHSQHi0MMd+gYCVC0YIBZRWYmgKaJb
 hYj6uXiZxfF60oY8XZYCVJ4YMAeFW0d+pmLDS/m4P/G85g7UEDOQlAQsLAye2unEAMNy
 t2XD99APPW9LikWbTUHYdhXtfW71+ZmOAOGbqK+zIB+uz7Oct5sBWMvwpwR4mSleRM9V
 DLgA==
X-Gm-Message-State: AOAM531zATpMd6X2YUcYx6sb/RSYU4AC0+SDOAq90LTQPI6CpAg8BXpQ
 N5CgoWYxXrpOaHsdtotuugRf7w==
X-Google-Smtp-Source: ABdhPJxw5FvmBoDmwJKiVyHp2IapB/dsg3Zs+mG5QzBpmJvucHtKYh3JgWwKPcg55xirNwOX0Vjq9w==
X-Received: by 2002:ac8:5194:: with SMTP id c20mr2382493qtn.344.1601473889967; 
 Wed, 30 Sep 2020 06:51:29 -0700 (PDT)
Received: from localhost ([190.190.138.51])
 by smtp.gmail.com with ESMTPSA id d10sm2028290qko.32.2020.09.30.06.51.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 06:51:29 -0700 (PDT)
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
Subject: [PATCH 1/2] Platform integrity information in sysfs (version 9)
Date: Wed, 30 Sep 2020 10:51:22 -0300
Message-Id: <20200930135122.5566-1-daniel.gutson@eclypsium.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_095132_060548_80DC3151 
X-CRM114-Status: GOOD (  23.37  )
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
Cc: Richard Hughes <richard@hughsie.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This patch provides a driver and an API for exporting
information about the platform integrity
firmware configuration in the sysfs filesystem.

The goal is that the attributes are avilable to fwupd.

Signed-off-by: Daniel Gutson <daniel.gutson@eclypsium.com>
Tested-by: Richard Hughes <richard@hughsie.com>
---
 .../ABI/stable/sysfs-class-platform-integrity | 23 ++++++++
 MAINTAINERS                                   |  7 +++
 drivers/misc/Kconfig                          | 11 ++++
 drivers/misc/Makefile                         |  1 +
 drivers/misc/platform-integrity.c             | 56 +++++++++++++++++++
 include/linux/platform-integrity.h            | 19 +++++++
 6 files changed, 117 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-class-platform-integrity
 create mode 100644 drivers/misc/platform-integrity.c
 create mode 100644 include/linux/platform-integrity.h

diff --git a/Documentation/ABI/stable/sysfs-class-platform-integrity b/Documentation/ABI/stable/sysfs-class-platform-integrity
new file mode 100644
index 000000000000..0978079bde50
--- /dev/null
+++ b/Documentation/ABI/stable/sysfs-class-platform-integrity
@@ -0,0 +1,23 @@
+What:		/sys/class/platform-integrity/intel-spi/bioswe
+Date:		September 2020
+KernelVersion:	5.10
+Contact:	Daniel Gutson <daniel.gutson@eclypsium.com>
+Description:	If the system firmware set BIOS Write Enable.
+		0: writes disabled, 1: writes enabled.
+Users:		https://github.com/fwupd/fwupd
+
+What:		/sys/class/platform-integrity/intel-spi/biosle
+Date:		September 2020
+KernelVersion:	5.10
+Contact:	Daniel Gutson <daniel.gutson@eclypsium.com>
+Description:	If the system firmware set BIOS Lock Enable.
+		0: SMM lock disabled, 1: SMM lock enabled.
+Users:		https://github.com/fwupd/fwupd
+
+What:		/sys/class/platform-integrity/intel-spi/smm_bioswp
+Date:		September 2020
+KernelVersion:	5.10
+Contact:	Daniel Gutson <daniel.gutson@eclypsium.com>
+Description:	If the system firmware set SMM BIOS Write Protect.
+		0: writes disabled unless in SMM, 1: writes enabled.
+Users:		https://github.com/fwupd/fwupd
diff --git a/MAINTAINERS b/MAINTAINERS
index d746519253c3..98bd26cd1adc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13774,6 +13774,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/chemical/plantower,pms7003.yaml
 F:	drivers/iio/chemical/pms7003.c
 
+PLATFORM INTEGRITY DATA MODULE
+M:	Daniel Gutson <daniel.gutson@eclypsium.com>
+S:	Supported
+F:	Documentation/ABI/sysfs-class-platform-integrity
+F:	drivers/misc/platform-integrity.c
+F:	include/linux/platform-integrity.h
+
 PLDMFW LIBRARY
 M:	Jacob Keller <jacob.e.keller@intel.com>
 S:	Maintained
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index ce136d685d14..8602049bd0ad 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -456,6 +456,17 @@ config PVPANIC
 	  a paravirtualized device provided by QEMU; it lets a virtual machine
 	  (guest) communicate panic events to the host.
 
+config PLATFORM_INTEGRITY_DATA
+	bool "Platform integrity information in the sysfs"
+	depends on SYSFS
+	help
+	  This kernel module is a helper driver to provide information about
+	  platform integrity settings and configuration.
+	  This module is used by other device drivers -such as the intel-spi-
+	  to publish the information in /sys/class/platform-integrity which is
+	  consumed by software such as fwupd which can verify the platform
+	  has been configured in a secure way.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index c7bd01ac6291..97ebb997fc47 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -57,3 +57,4 @@ obj-$(CONFIG_PVPANIC)   	+= pvpanic.o
 obj-$(CONFIG_HABANA_AI)		+= habanalabs/
 obj-$(CONFIG_UACCE)		+= uacce/
 obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
+obj-$(CONFIG_PLATFORM_INTEGRITY_DATA)	+= platform-integrity.o
diff --git a/drivers/misc/platform-integrity.c b/drivers/misc/platform-integrity.c
new file mode 100644
index 000000000000..e17d27850a3b
--- /dev/null
+++ b/drivers/misc/platform-integrity.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Platform integrity data kernel module
+ *
+ * Copyright (C) 2020 Daniel Gutson <daniel.gutson@eclypsium.com>
+ * Copyright (C) 2020 Eclypsium Inc.
+ */
+#include <linux/sysfs.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/kdev_t.h>
+#include <linux/platform-integrity.h>
+
+static struct class platform_integrity_class = {
+	.name = "platform-integrity",
+	.owner = THIS_MODULE,
+};
+
+struct device *
+create_platform_integrity_device(struct device *parent, const char *name,
+				 const struct attribute_group **groups)
+{
+	return device_create_with_groups(&platform_integrity_class, parent,
+					 MKDEV(0, 0), groups, groups, "%s",
+					 name);
+}
+EXPORT_SYMBOL_GPL(create_platform_integrity_device);
+
+void destroy_platform_integrity_device(struct device *pi_device)
+{
+	device_remove_groups(pi_device,
+		(const struct attribute_group **)dev_get_drvdata(pi_device));
+	device_unregister(pi_device);
+}
+EXPORT_SYMBOL_GPL(destroy_platform_integrity_device);
+
+static int __init platform_integrity_init(void)
+{
+	int status;
+
+	status = class_register(&platform_integrity_class);
+	if (status < 0)
+		return status;
+
+	return 0;
+}
+
+static void __exit platform_integrity_exit(void)
+{
+	class_unregister(&platform_integrity_class);
+}
+
+module_init(platform_integrity_init);
+module_exit(platform_integrity_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Daniel Gutson <daniel.gutson@eclypsium.com>");
diff --git a/include/linux/platform-integrity.h b/include/linux/platform-integrity.h
new file mode 100644
index 000000000000..56eb1a1190e8
--- /dev/null
+++ b/include/linux/platform-integrity.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Platform integrity data kernel module
+ *
+ * Copyright (C) 2020 Daniel Gutson <daniel.gutson@eclypsium.com>
+ * Copyright (C) 2020 Eclypsium Inc.
+ */
+#ifndef PLATFORM_INTEGRITY_H
+#define PLATFORM_INTEGRITY_H
+
+#include <linux/device.h>
+
+struct device *
+create_platform_integrity_device(struct device *parent, const char *name,
+				 const struct attribute_group **groups);
+
+extern void destroy_platform_integrity_device(struct device *pi_device);
+
+#endif /* PLATFORM_INTEGRITY_H */
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
