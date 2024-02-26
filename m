Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2C8C54E49
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 01:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E31tGqt9xsejTXil9UA3boC3n+0xr4im8vYlhGrKlBY=; b=IyMf+ND4AH0aEd
	Z+04JUWxWyblmNPEQwwRmyuR2k2LEzj3jbfs2JSj0Fae1PG//aJ1DaeQwDlTqzuX4q6JssV8ulmSC
	iHsygD5U/31TKxhed0rs2/NISja5YFSkZ+/TRWP1FElDj3j3Y1at0K5Xg/JpCzsbTCIJsFCP838e9
	PKQeDoqWY7F4uPhFP6gFg+ba+NHJD31MwyKwJZYkrHQTLH1f6PQoZYVmLupaPxoTcNFP9fK/C8cq3
	UW1pKH3VRfC/Jo2bCk/Mbe0+BaxK3rtcH1GMDCPiAJn5MO/RDq/inG585bKwPx3Vjbxn5qQEagjX1
	BgFgrIzXXpyBP5oSDIYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rePpc-0000000G4pv-0x2Y;
	Mon, 26 Feb 2024 01:31:00 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reOmc-0000000G02W-3wd5
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 00:23:59 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1reOmW-0001qY-0d;
	Mon, 26 Feb 2024 00:23:44 +0000
Date: Mon, 26 Feb 2024 00:23:41 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 7/7] mtd: ubi: provide NVMEM layer over UBI volumes
Message-ID: <3ac88da4adc342af428b359cd27037b1498f6c91.1708906456.git.daniel@makrotopia.org>
References: <cover.1708906456.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1708906456.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_162351_267419_CCFCDD54 
X-CRM114-Status: GOOD (  24.82  )
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

In an ideal world we would like UBI to be used where ever possible on a
NAND chip. And with UBI support in ARM Trusted Firmware and U-Boot it
is possible to achieve an (almost-)all-UBI flash layout. Hence the need
for a way to also use UBI volumes to store board-level constants, such
as MAC addresses and calibration data of wireless interfaces.

Add UBI volume NVMEM driver module exposing UBI volumes as NVMEM
providers. Allow UBI devices to have a "volumes" firmware subnode with
volumes which may be compatible with "nvmem-cells".
Access to UBI volumes via the NVMEM interface at this point is
read-only, and it is slow, opening and closing the UBI volume for each
access due to limitations of the NVMEM provider API.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/Kconfig  |  13 +++
 drivers/mtd/ubi/Makefile |   1 +
 drivers/mtd/ubi/nvmem.c  | 191 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+)
 create mode 100644 drivers/mtd/ubi/nvmem.c

diff --git a/drivers/mtd/ubi/Kconfig b/drivers/mtd/ubi/Kconfig
index 7499a540121e8..e28a3af83c0eb 100644
--- a/drivers/mtd/ubi/Kconfig
+++ b/drivers/mtd/ubi/Kconfig
@@ -113,4 +113,17 @@ config MTD_UBI_FAULT_INJECTION
 	   testing purposes.
 
 	   If in doubt, say "N".
+
+config MTD_UBI_NVMEM
+	tristate "UBI virtual NVMEM"
+	default n
+	depends on NVMEM
+	help
+	   This option enabled an additional driver exposing UBI volumes as NVMEM
+	   providers, intended for platforms where UBI is part of the firmware
+	   specification and used to store also e.g. MAC addresses or board-
+	   specific Wi-Fi calibration data.
+
+	   If in doubt, say "N".
+
 endif # MTD_UBI
diff --git a/drivers/mtd/ubi/Makefile b/drivers/mtd/ubi/Makefile
index 543673605ca72..4b51aaf00d1a2 100644
--- a/drivers/mtd/ubi/Makefile
+++ b/drivers/mtd/ubi/Makefile
@@ -7,3 +7,4 @@ ubi-$(CONFIG_MTD_UBI_FASTMAP) += fastmap.o
 ubi-$(CONFIG_MTD_UBI_BLOCK) += block.o
 
 obj-$(CONFIG_MTD_UBI_GLUEBI) += gluebi.o
+obj-$(CONFIG_MTD_UBI_NVMEM) += nvmem.o
diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
new file mode 100644
index 0000000000000..5820a170d2512
--- /dev/null
+++ b/drivers/mtd/ubi/nvmem.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2023 Daniel Golle <daniel@makrotopia.org>
+ */
+
+/* UBI NVMEM provider */
+#include "ubi.h"
+#include <linux/nvmem-provider.h>
+#include <asm/div64.h>
+
+/* List of all NVMEM devices */
+static LIST_HEAD(nvmem_devices);
+static DEFINE_MUTEX(devices_mutex);
+
+struct ubi_nvmem {
+	struct nvmem_device *nvmem;
+	int ubi_num;
+	int vol_id;
+	int usable_leb_size;
+	struct list_head list;
+};
+
+static int ubi_nvmem_reg_read(void *priv, unsigned int from,
+			      void *val, size_t bytes)
+{
+	uint32_t bytes_left, offs, to_read;
+	struct ubi_nvmem *unv = priv;
+	struct ubi_volume_desc *desc;
+	uint64_t lnum = from;
+	int err = 0;
+
+	desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	bytes_left = bytes;
+	offs = do_div(lnum, unv->usable_leb_size);
+	while (bytes_left) {
+		to_read = unv->usable_leb_size - offs;
+
+		if (to_read > bytes_left)
+			to_read = bytes_left;
+
+		err = ubi_read(desc, lnum, val, offs, to_read);
+		if (err)
+			break;
+
+		lnum += 1;
+		offs = 0;
+		bytes_left -= to_read;
+		val += to_read;
+	}
+	ubi_close_volume(desc);
+
+	if (err)
+		return err;
+
+	return bytes_left == 0 ? 0 : -EIO;
+}
+
+static int ubi_nvmem_add(struct ubi_volume_info *vi)
+{
+	struct device_node *np = dev_of_node(vi->dev);
+	struct nvmem_config config = {};
+	struct ubi_nvmem *unv;
+	int ret;
+
+	if (!np)
+		return 0;
+
+	if (!of_get_child_by_name(np, "nvmem-layout"))
+		return 0;
+
+	if (WARN_ON_ONCE(vi->usable_leb_size <= 0) ||
+	    WARN_ON_ONCE(vi->size <= 0))
+		return -EINVAL;
+
+	unv = kzalloc(sizeof(struct ubi_nvmem), GFP_KERNEL);
+	if (!unv)
+		return -ENOMEM;
+
+	config.id = NVMEM_DEVID_NONE;
+	config.dev = vi->dev;
+	config.name = dev_name(vi->dev);
+	config.owner = THIS_MODULE;
+	config.priv = unv;
+	config.reg_read = ubi_nvmem_reg_read;
+	config.size = vi->usable_leb_size * vi->size;
+	config.word_size = 1;
+	config.stride = 1;
+	config.read_only = true;
+	config.root_only = true;
+	config.ignore_wp = true;
+	config.of_node = np;
+
+	unv->ubi_num = vi->ubi_num;
+	unv->vol_id = vi->vol_id;
+	unv->usable_leb_size = vi->usable_leb_size;
+	unv->nvmem = nvmem_register(&config);
+	if (IS_ERR(unv->nvmem)) {
+		ret = dev_err_probe(vi->dev, PTR_ERR(unv->nvmem),
+				    "Failed to register NVMEM device\n");
+		kfree(unv);
+		return ret;
+	}
+
+	mutex_lock(&devices_mutex);
+	list_add_tail(&unv->list, &nvmem_devices);
+	mutex_unlock(&devices_mutex);
+
+	return 0;
+}
+
+static void ubi_nvmem_remove(struct ubi_volume_info *vi)
+{
+	struct ubi_nvmem *unv_c, *unv = NULL;
+
+	mutex_lock(&devices_mutex);
+	list_for_each_entry(unv_c, &nvmem_devices, list)
+		if (unv_c->ubi_num == vi->ubi_num && unv_c->vol_id == vi->vol_id) {
+			unv = unv_c;
+			break;
+		}
+
+	if (!unv) {
+		mutex_unlock(&devices_mutex);
+		return;
+	}
+
+	list_del(&unv->list);
+	mutex_unlock(&devices_mutex);
+	nvmem_unregister(unv->nvmem);
+	kfree(unv);
+}
+
+/**
+ * nvmem_notify - UBI notification handler.
+ * @nb: registered notifier block
+ * @l: notification type
+ * @ns_ptr: pointer to the &struct ubi_notification object
+ */
+static int nvmem_notify(struct notifier_block *nb, unsigned long l,
+			 void *ns_ptr)
+{
+	struct ubi_notification *nt = ns_ptr;
+
+	switch (l) {
+	case UBI_VOLUME_RESIZED:
+		ubi_nvmem_remove(&nt->vi);
+		fallthrough;
+	case UBI_VOLUME_ADDED:
+		ubi_nvmem_add(&nt->vi);
+		break;
+	case UBI_VOLUME_SHUTDOWN:
+		ubi_nvmem_remove(&nt->vi);
+		break;
+	default:
+		break;
+	}
+	return NOTIFY_OK;
+}
+
+static struct notifier_block nvmem_notifier = {
+	.notifier_call = nvmem_notify,
+};
+
+static int __init ubi_nvmem_init(void)
+{
+	return ubi_register_volume_notifier(&nvmem_notifier, 0);
+}
+
+static void __exit ubi_nvmem_exit(void)
+{
+	struct ubi_nvmem *unv, *tmp;
+
+	mutex_lock(&devices_mutex);
+	list_for_each_entry_safe(unv, tmp, &nvmem_devices, list) {
+		nvmem_unregister(unv->nvmem);
+		list_del(&unv->list);
+		kfree(unv);
+	}
+	mutex_unlock(&devices_mutex);
+
+	ubi_unregister_volume_notifier(&nvmem_notifier);
+}
+
+module_init(ubi_nvmem_init);
+module_exit(ubi_nvmem_exit);
+MODULE_DESCRIPTION("NVMEM layer over UBI volumes");
+MODULE_AUTHOR("Daniel Golle");
+MODULE_LICENSE("GPL");
-- 
2.44.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
