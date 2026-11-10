Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE560A263B
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvKz1gaV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nzLv/loB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CUiLnZXUBgpA8wtQtE6wCQI57ljVaIIdHrJ8JYG+4WI=; b=uvKz1gaV6FIBN64+EZ07MArwEs
	vJatWqFhKt4nUJ0lbTlb2w018+YsI/5gasbPbxqXY9+5o2joqlAz0HCrUztWQ8v5osjCcMANHlH7r
	CSzcF/ryB6zkOWYbu8SoTO45sMwK6WGB2xL/OVnT4QLYIpP5h4bnanTeI9GgTAWieDOa7bTBQFTNS
	H/Ftwks+vU9BGsHs9lZW5IL6YEJWZ+Sv9kwDVxH1oo+tIBR/arB5cUzCHK9xNmnWMRCTfuectZK6D
	UorTgQaNSADv49bxeOq+rftpgQc55lovgBgdgdNiM/kITbFEdJzMVsOouXDfLE9BFozayCbPO3K6+
	Ioez43Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWs-00000002vqO-3KQK;
	Tue, 10 Nov 2026 07:44:30 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWp-00000002vlA-3a6N
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:29 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-5641f26ce05so663228b6e.2
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296667; x=1794901467; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIby35zT50yU+I8wiHG/mbaVDPcpxbeKRvU9uf9/5TA=;
        b=nzLv/loB9RJ59ART6o1GOYaoE9A0BK2YSedWgWtavRnYci9XZJtDBEz2s7B0KcP5G5
         M+E+AWRgO0OBdZYKHiFmjfk0EJbq+qdfHbNz6AsUfDcf6fmbs0pC5hpZU246PT5YUa8z
         6mOrZ9xnc5AzciyqnDwsgzsOYPvQndvpXVLYFw19Pj75Wx85ycPSBvmipz+cnncYnpHo
         NP0SF3eazq/TaapVclRcWACxNx2JfyvAB2WO949KrrUoC4gTHtMzW/OOyuiQKGP5Z1VH
         T77b7tW/eo9M2mWRZWg8EYoSy+NiklXUv2iPEx21yotQZS8k8D4vFSxb9ct6AVa+CzeT
         eg7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296667; x=1794901467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIby35zT50yU+I8wiHG/mbaVDPcpxbeKRvU9uf9/5TA=;
        b=NAZebXKM757QcoB1725F0XEWu99dX6KTGctMEVprcHeqDAAKx0SuZYdFA0XRTW3Wy1
         NB79gEanqdUl7AEZmUYFCAUuJvzmrCDiXn8c7FN2d+w/mDrtFDsTxBqCSJQF3afYvv+2
         oR5Z/RdcoOz2aoqTBRhAeHWnEBYmfdp4mrSfIfTBxFgWjjJFBAJUP/+KHAUZywScel3j
         BjXyvLHHt0u8aHyvQU0xWIUA34EnqOS+cfqJ8BFexkhzMdQ7dBSnCrdxS+XACckaE0us
         ww4lYy1zsrBwmIH9QasIo/EjAUMns+d4S98U3XBpIWkryVi0e2PjR2S2pY9UKgVq360r
         rBng==
X-Gm-Message-State: APuU4Z+0QYICIA7innSf27bXdQ/s7sKj7Fuz6STvObHybEMEqnPOLQij
	dAWTXnDebtGDHg5kGIK1FzNuylm2QDESEhueEFKOnH8l2CysIyrpwvSe
X-Gm-Gg: AYBFou3Yipg6HwycXMxYcTZXHOsPmeLl979hbsEpQMRkVJuRsGv7FqEh/695c+N0Ciw
	HmIsH8vG5YbZfcAzQd0geJgD9mbPvZV0sDjZJTswtHKdJaP7hp+JHRTi/XWLwMGZfhVYaFjwZTJ
	3KhgF35JnAPgyyeWKxBitOc8dpPdW4yhSXzz3kvXdjiCxPc0kNNeJmQdx4/l97M8TIDawfiEbww
	mNzKy1v+TgtgQznA2L8eW16fP3DFA9upRzbi5uM8/5mAshP8pl4Nh8+/WjJZmz3f9kUwC1Ijy+H
	IMgwA7orReKSrlqvP7d1kQHYoLBYs+kgCXe+3L8fJJYlvLVw9i8qkMClPpBXZFmMrwmALyZQsfz
	QLO1hvn+1r7Dn6oyD7Fn78FLQD4oGO5upK/3MNH7f2bWOBfInLFt5LZKOBUDj5N6y3F0+c4k1Bx
	rZHErQ3HFGieIjgTXxxWvPGZ4TsnW0zRI9m0VOSxeghZv5E94kqElnPowKGQ7+/uCXOcQB7MRZ4
	OSXBBoDTjxVBpZXyPNyuEj+PGYK7ak3PoOoZUrhq4kYruq1O/tElJSnXiomcZC6yomhw7BRSyLp
	VN3kvsxYGAY/IpLTahg38rqoT5dPXHL9JLgmmgQVQhSeDwHhvTAras8AogqhiDnkxIlMU0VUMYn
	8Gub4SAynh2YZuQNl1uCQZYnA6RULuz73HQpGOFFKFokpmMHWkJg1Gkzx1rzD9cMSv7tPntJQGd
	ndqMRPfrfxpTCFznDBR832sXkel5JBIG6u5fq4N8zRRvvf8eTnwOg=
X-Received: by 2002:a05:6808:13d3:b0:4f4:3790:6615 with SMTP id 5614622812f47-5683c9472bfmr1566292b6e.11.1794296666790;
        Mon, 09 Nov 2026 23:44:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:26 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:09 -0700
Subject: [PATCH v2 06/58] mtd: rawnand: share retained chip and controller
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-6-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234427_953296_19C92EEB 
X-CRM114-Status: GOOD (  22.06  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Controller drivers need to keep chip metadata and serialization locks
alive after unregistering MTD, without retaining their hardware
resources. Share the name, firmware-node and parent-device references,
the final NAND cleanup, and the disconnected-device open check.

Provide reference-counted controller storage with an initial
device-managed reference. Register that reference before managed
hardware resources so their teardown finishes before the controller can
be freed. Each retained chip pins the controller independently, allowing
multi-chip controllers and embedded chip structures to use the same
lifetime rules.

Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_lifetime.c | 118 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  12 ++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
index 619760138d32..7ea275a40fcd 100644
--- a/drivers/mtd/nand/raw/Makefile
+++ b/drivers/mtd/nand/raw/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_MTD_NAND_NUVOTON_MA35)	+= nuvoton-ma35d1-nand-controller.o
 obj-$(CONFIG_MTD_NAND_LOONGSON)		+= loongson-nand-controller.o
 
 nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
+nand-objs += nand_lifetime.o
 nand-objs += nand_onfi.o
 nand-objs += nand_jedec.o
 nand-objs += nand_amd.o
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..9518c9a4bc63
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+static void nand_controller_release(struct kref *ref)
+{
+	struct nand_controller *controller;
+
+	controller = container_of(ref, struct nand_controller, refcnt);
+	controller->release(controller);
+}
+
+static void nand_controller_put(void *data)
+{
+	struct nand_controller *controller = data;
+
+	kref_put(&controller->refcnt, nand_controller_release);
+}
+
+/**
+ * devm_nand_controller_init - initialize reference-counted controller storage
+ * @dev: controller device
+ * @controller: controller embedded in driver-owned, non-devm storage
+ * @release: callback freeing that storage, without accessing hardware
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * storage reference after releasing those resources. Chips prepared with
+ * nand_set_release() hold additional references until their final MTD put.
+ *
+ * Takes ownership of the storage even on failure.
+ * Return: zero on success or a negative error code.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller))
+{
+	nand_controller_init(controller);
+	kref_init(&controller->refcnt);
+	controller->release = release;
+
+	return devm_add_action_or_reset(dev, nand_controller_put, controller);
+}
+EXPORT_SYMBOL_GPL(devm_nand_controller_init);
+
+static int nand_mtd_get_device(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd_get_master(mtd));
+
+	guard(mutex)(&chip->lock);
+	return chip->disconnected ? -ENODEV : 0;
+}
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct nand_controller *controller = chip->controller;
+	struct device *parent = mtd->dev.parent;
+	struct device_node *np = nand_get_flash_node(chip);
+	const char *name = mtd->name;
+
+	if (!controller->release)
+		controller = NULL;
+	nand_cleanup(chip);
+	of_node_put(np);
+	kfree(name);
+	if (chip->release)
+		chip->release(chip);
+	if (controller)
+		nand_controller_put(controller);
+	put_device(parent);
+}
+
+/**
+ * nand_set_release - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @release: callback freeing chip storage, or NULL for a controller-embedded chip
+ *
+ * Copies the MTD name and pins the parent device, flash node and, when managed
+ * with devm_nand_controller_init(), controller storage. The original name stays
+ * owned by its original allocator. The caller must set the name or parent before
+ * calling this function, and preserve any other metadata used by MTD callbacks.
+ *
+ * After success, unregister MTD, call nand_disconnect(), and drop the driver's
+ * initial reference with mtd_put_master(). Do the same disconnect/put on MTD
+ * registration failure. nand_cleanup() runs at final release, so controller
+ * detach callbacks must not depend on resources released during removal.
+ *
+ * Return: zero on success or -ENOMEM, leaving ownership unchanged on failure.
+ */
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip))
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	const char *name = mtd->name;
+	char *copy;
+
+	if (!name)
+		name = dev_name(mtd->dev.parent);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	mtd->name = copy;
+	mtd->_get_device = nand_mtd_get_device;
+	get_device(mtd->dev.parent);
+	of_node_get(nand_get_flash_node(chip));
+	if (chip->controller->release)
+		kref_get(&chip->controller->refcnt);
+	chip->release = release;
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(nand_set_release);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..313e0d88e19a 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1116,6 +1117,8 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @refcnt:		controller storage references for managed lifetimes
+ * @release:		free controller storage after the last chip is released
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1128,8 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct kref refcnt;
+	void (*release)(struct nand_controller *controller);
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1137,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void (*release)(struct nand_controller *controller));
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1285,6 +1293,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @release: Free chip storage after the last MTD reference is dropped
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1345,6 +1354,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	void (*release)(struct nand_chip *chip);
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1608,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_release(struct nand_chip *chip,
+		     void (*release)(struct nand_chip *chip));
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
