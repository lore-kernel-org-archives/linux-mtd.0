Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77C3606A8AD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hQFbn5Av;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Puexdqgz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6NeAgZtpC+BYCAqby6rQuQ4ZcKqhruuKfBW0mvZCPK8=; b=hQFbn5AvxhWfi9UyAb9AgfDTnh
	U+bVIyWLB7XrBCOFprhbLAUMxVfKjj1yom+ytyhQdFyoeXSTid13VYUkg7rE18kFNb4oNP1tKc/B6
	zf4DgKWjJeRhMICsbbTNDk6kwp2wmV5N/qNqM+QhnqOXe46rPnr+VprVfp1btbnBe78sSXEA27fUV
	Ymsxy4bNv5zOJ9xljnaNUJpKhWCHCPfbihsnOicJd/sxbn3RcoeuoQN1v9FEW/Rx1Bmb5AynHF+q9
	jceERlvMVgi1Hi54Acxp9CDCYbVcV4ifLKPDVJcZpWJUSDRwamnOOWO6U34/GA6oOwLijGMXZ6lkV
	5mibOdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvoC-0000000Dqjn-1Hea;
	Fri, 13 Nov 2026 18:15:32 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo1-0000000DqVq-1JQU
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:24 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-843ea301d60so1515507a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593720; x=1795198520; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/FhPWUdLG1qHDBbvBHhesyHiD6YUo9x8OX9klaiqEs=;
        b=PuexdqgzFhp86LNoKH8gpfb2oSHZyBIsgLYpJ0GuO++eo2Gf6yNw2ICKX4SKVbcbDO
         hIPcz9mE1cPUBS/jnAXV4C5NTpOE31IAcea/wCiZs5dsJ6kqT56XtEY6Z7F/4T1b1Pyp
         FOvt45OXKUG3c75L8X5cSaqXoikAjJOFxGRKwqFmjKrLIKjO+VZpavePXAMgfeYgzZFL
         bQG3Zhq21MGzM0fZMMJl8sILnhDav9859ms9BeJ8vBFbFI8NtKPPM9tepIjvn1XWdPtl
         zSQj6KjZ34AaZTz2kbmOpGvEpZtZPK459nomIkS+SLuK0GjFHYZ8CZhtRWjZlDbue7AO
         yTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593720; x=1795198520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/FhPWUdLG1qHDBbvBHhesyHiD6YUo9x8OX9klaiqEs=;
        b=kfOJF44g+ksnvebTNICOAD8e/sk4jgIkjaTjhqSP0TZ3gYGcVgrlXVgXKdLhShbup3
         8o1a3wBiqlCpl5lempjsGHcvqQjLqjYQOa+Q/lcb8PoI4XEjYuikbUUd15mNZkFHffTn
         iv9F6AKSUV0vuDNgMCrCZDsiJic31fVERcS9TtQ1+ARS09uQZqIeA6fFULs+FJz8bG3c
         8QAKbJVkoOEvboauag3uGmXSVUN4Gq9lEpGkUiQvv/mrQF4tn1UmazfEnWt8Rn99HggB
         NhWtXUZZXYl/bncEajneBnfiYGuXKiI/uEZPkiy7Excy8HlNp1tjZZgr4tYTFx3V2N4G
         4MTQ==
X-Gm-Message-State: APuU4Z8si4MiBRm6z1VYb3c/qjKMH8hSCqiWfRKj7eUKz792ZeIVtsmo
	+VM2D+Jrw968D5xdiP5CPRqAhABjsHINJCcUUn9MYg7JnCxhumjCGJU+
X-Gm-Gg: AYBFou0lwKnZlrJOlXCaUfECX38XQp0/sa0ZDtX3d/AYkIin/N9MnC0mzFd/qIS9U6X
	cjErs29t/JlJRhA/RQihlUT5f5/0JolMK0+4vurZNiHeVC+Z54UCr9PQ4kUBWMMRKZQEhNFtblR
	5vWHHuwMz0uqoVWjm+6KuQS6qKSpqso9qzFmZT/cSEvRraxqy438bk+EuR7gEDglzOSQaOD3xft
	eabq6xDkFZAiaslWr/RUhbfBxeXywrQBFei/XyyVMrRwXwS0LVqLMDD+/vFHjRV1ZZZLlr+4bzG
	NEWCx/JiVAU5NaaG1kd1yYJHBMZbzDx5ICZ2DPBQfNJVtqlPk2EHTxGqTq8XIKMZCao9kxTxNcW
	qRbqBwwZyirQWbfZJUrTTqbSpKtRakLpvbdgGagivkEHPP/oflX5pI3T6XByFDdtA77QjQp2OEW
	8howZZc2P53HLBwNnVg1KNJlfD/Gd5uqQjdlBX4DLZJKx/F6/TZEgGRwtjnMKSkkDsgHlopw7mj
	6dA/DjEYTAXk3T9nSqgGvB3EachRwRlSElvfd6Epm1Ivwo5FSK98p/RkI/H0mZ6vHfU0vWVTxM6
	CmY+dI+UVyEspTHenUOLOMEOsO3TJOxaJnyOjVkry0CHS0tvDaP31ClvSIpeJi51L4ZISOMM+o8
	DYLVvbK4+1zb+s8KDY5cLV07j15NdvHZpQ5mzHFpxK2II6qpYlrlFqT8pAd3+fnKbCPBSaaTgRF
	avz+YDHpKbgqEkAayLDjvLEG7TXJnyr7RQuf9CfvmStvjaLH0pdzI=
X-Received: by 2002:a05:6830:718c:b0:802:68c:1606 with SMTP id 46e09a7af769-8628974186bmr3041285a34.1.1794593720365;
        Fri, 13 Nov 2026 10:15:20 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:22 -0700
Subject: [PATCH v4 06/58] mtd: rawnand: share retained chip and controller
 ownership
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-6-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101521_536729_AA6052E2 
X-CRM114-Status: GOOD (  28.80  )
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

Retained MTD handles need chip locks and immutable metadata after their
controller is removed. Run NAND cleanup during disconnection, while
manufacturer, ECC and controller callbacks are still available. Leave
only core-owned allocation release for the final MTD put.

Copy the chip name and snapshot its OOB layout before publication.
Retained layout queries then use NAND-core callbacks and copied regions,
without touching driver-owned tables or working buffers freed by cleanup.
Use the NAND core as the MTD operation owner so an open handle does not
keep the hardware driver loaded.

Provide reference-counted controller storage with an initial managed
reference, acquired before hardware resources. Each chip holds another
reference, allowing devres teardown and the last chip put to release the
allocation independently. Support separate chips and chips embedded in a
shared allocation without controller-specific final-release callbacks.

Serialize complete bad-block marking with cleanup: its BBM and BBT steps
drop the chip lock between operations. Disconnect and wake suspended
waiters before waiting for that sequence to finish. Protect reserved-block
queries and secured-region checks before freeing their backing tables.

Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/Makefile        |   1 +
 drivers/mtd/nand/raw/nand_base.c     |  29 ++++-
 drivers/mtd/nand/raw/nand_lifetime.c | 246 +++++++++++++++++++++++++++++++++++
 include/linux/mtd/rawnand.h          |  28 ++++
 4 files changed, 297 insertions(+), 7 deletions(-)

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
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index 720da4174833..dec9615c2900 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -363,8 +363,8 @@ int nand_get_device(struct nand_chip *chip)
  * Unregister the MTD device first so removal notifiers can finish their I/O.
  * Call before releasing controller resources. Operations waiting for resume
  * are woken and fail with -ENODEV.
- * The chip, controller lock and NAND metadata must remain alive
- * until existing MTD handles are released; nand_cleanup() is a separate step.
+ * For chips with retained storage, run NAND cleanup before returning. Existing
+ * handles retain the disconnected chip and a core-owned OOB layout snapshot.
  */
 void nand_disconnect(struct nand_chip *chip)
 {
@@ -374,6 +374,11 @@ void nand_disconnect(struct nand_chip *chip)
 	mutex_unlock(&chip->controller->lock);
 	mutex_unlock(&chip->lock);
 	wake_up_all(&chip->resume_wq);
+	if (chip->lifetime) {
+		guard(mutex)(&chip->markbad_lock);
+
+		nand_cleanup(chip);
+	}
 }
 EXPORT_SYMBOL_GPL(nand_disconnect);
 
@@ -639,6 +644,9 @@ static int nand_block_isreserved(struct mtd_info *mtd, loff_t ofs)
 {
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
+	guard(mutex)(&chip->lock);
+	if (chip->disconnected)
+		return -ENODEV;
 	if (!chip->bbt)
 		return 0;
 	/* Return info from the table */
@@ -4569,15 +4577,17 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 	if (check_offs_len(chip, instr->addr, instr->len))
 		return -EINVAL;
 
-	/* Check if the region is secured */
-	if (nand_region_is_secured(chip, instr->addr, instr->len))
-		return -EIO;
-
 	/* Grab the lock and see if the device is available */
 	ret = nand_get_device(chip);
 	if (ret)
 		return ret;
 
+	/* Check if the region is secured */
+	if (nand_region_is_secured(chip, instr->addr, instr->len)) {
+		nand_release_device(chip);
+		return -EIO;
+	}
+
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
 	chipnr = (int)(instr->addr >> chip->chip_shift);
@@ -4703,8 +4713,12 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
  */
 static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 {
+	struct nand_chip *chip = mtd_to_nand(mtd);
 	int ret;
 
+	/* The BBM and BBT updates acquire the chip lock separately. */
+	guard(mutex)(&chip->markbad_lock);
+
 	ret = nand_block_isbad(mtd, ofs);
 	if (ret) {
 		/* If it was bad already, return success and do nothing */
@@ -4713,7 +4727,7 @@ static int nand_block_markbad(struct mtd_info *mtd, loff_t ofs)
 		return ret;
 	}
 
-	return nand_block_markbad_lowlevel(mtd_to_nand(mtd), ofs);
+	return nand_block_markbad_lowlevel(chip, ofs);
 }
 
 /**
@@ -5617,6 +5631,7 @@ static int nand_scan_ident(struct nand_chip *chip, unsigned int maxchips,
 	chip->cur_cs = -1;
 
 	mutex_init(&chip->lock);
+	mutex_init(&chip->markbad_lock);
 	init_waitqueue_head(&chip->resume_wq);
 
 	/* Enforce the right timings for reset/detection */
diff --git a/drivers/mtd/nand/raw/nand_lifetime.c b/drivers/mtd/nand/raw/nand_lifetime.c
new file mode 100644
index 000000000000..f2746ef9ea65
--- /dev/null
+++ b/drivers/mtd/nand/raw/nand_lifetime.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Storage lifetime for disconnected NAND controllers and chips. */
+
+#include <linux/device.h>
+#include <linux/kref.h>
+#include <linux/module.h>
+#include <linux/mtd/rawnand.h>
+#include <linux/slab.h>
+
+struct nand_lifetime {
+	void *allocation;
+	struct nand_storage *storage;
+	unsigned int ecc_sections;
+	unsigned int free_sections;
+	int ecc_end;
+	int free_end;
+	struct mtd_oob_region regions[];
+};
+
+static void nand_storage_release(struct kref *ref)
+{
+	struct nand_storage *storage = container_of(ref, struct nand_storage, refcnt);
+
+	kfree(storage->allocation);
+}
+
+/**
+ * nand_storage_init - initialize shared allocation ownership
+ * @storage: reference count embedded in the allocation
+ * @allocation: allocation to free with kfree() after the final put
+ */
+void nand_storage_init(struct nand_storage *storage, void *allocation)
+{
+	kref_init(&storage->refcnt);
+	storage->allocation = allocation;
+}
+EXPORT_SYMBOL_GPL(nand_storage_init);
+
+void nand_storage_get(struct nand_storage *storage)
+{
+	kref_get(&storage->refcnt);
+}
+EXPORT_SYMBOL_GPL(nand_storage_get);
+
+void nand_storage_put(void *data)
+{
+	struct nand_storage *storage = data;
+
+	kref_put(&storage->refcnt, nand_storage_release);
+}
+EXPORT_SYMBOL_GPL(nand_storage_put);
+
+/**
+ * devm_nand_storage_init - retain an allocation through managed teardown
+ * @dev: device whose managed resources use the allocation
+ * @storage: reference count embedded in the allocation
+ * @allocation: allocation to free with kfree() after the final put
+ *
+ * Call before acquiring resources that use the allocation. Takes ownership
+ * even on failure. Chips can hold additional references after driver unbind.
+ */
+int devm_nand_storage_init(struct device *dev, struct nand_storage *storage,
+			   void *allocation)
+{
+	nand_storage_init(storage, allocation);
+	return devm_add_action_or_reset(dev, nand_storage_put, storage);
+}
+EXPORT_SYMBOL_GPL(devm_nand_storage_init);
+
+/**
+ * devm_nand_controller_init - initialize retained controller storage
+ * @dev: controller device
+ * @controller: controller embedded in non-devm storage
+ * @allocation: allocation containing the controller, freed with kfree()
+ *
+ * Call before acquiring managed hardware resources. Device teardown drops its
+ * reference after releasing those resources. Takes ownership even on failure.
+ */
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void *allocation)
+{
+	nand_controller_init(controller);
+	return devm_nand_storage_init(dev, &controller->storage, allocation);
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
+static int nand_retained_ooblayout_ecc(struct mtd_info *mtd, int section,
+				     struct mtd_oob_region *region)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+
+	if (section >= lifetime->ecc_sections)
+		return lifetime->ecc_end;
+	*region = lifetime->regions[section];
+	return 0;
+}
+
+static int nand_retained_ooblayout_free(struct mtd_info *mtd, int section,
+				      struct mtd_oob_region *region)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+
+	if (section >= lifetime->free_sections)
+		return lifetime->free_end;
+	*region = lifetime->regions[lifetime->ecc_sections + section];
+	return 0;
+}
+
+static const struct mtd_ooblayout_ops nand_retained_ooblayout = {
+	.ecc = nand_retained_ooblayout_ecc,
+	.free = nand_retained_ooblayout_free,
+};
+
+static void nand_mtd_release(struct mtd_info *mtd)
+{
+	struct nand_lifetime *lifetime = mtd_to_nand(mtd)->lifetime;
+	struct nand_storage *storage = lifetime->storage;
+	struct device *parent = mtd->parent_dev;
+
+	of_node_put(mtd_get_of_node(mtd));
+	kfree(mtd->name);
+	kfree(lifetime->allocation);
+	kfree(lifetime);
+	if (storage)
+		nand_storage_put(storage);
+	put_device(parent);
+}
+
+static int nand_prepare_lifetime(struct nand_chip *chip, void *allocation,
+				 struct nand_storage *storage)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct nand_lifetime *lifetime;
+	struct mtd_oob_region region;
+	unsigned int ecc_sections, free_sections;
+	const char *name = mtd->name;
+	int ecc_end, free_end, ret;
+	char *copy;
+
+	/* Keep layout queries independent of controller-owned code and data. */
+	for (ecc_sections = 0; ; ecc_sections++) {
+		ecc_end = mtd_ooblayout_ecc(mtd, ecc_sections, &region);
+		if (ecc_end)
+			break;
+	}
+	if (ecc_end != -ERANGE && ecc_end != -ENOTSUPP)
+		return ecc_end;
+	for (free_sections = 0; ; free_sections++) {
+		free_end = mtd_ooblayout_free(mtd, free_sections, &region);
+		if (free_end)
+			break;
+	}
+	if (free_end != -ERANGE && free_end != -ENOTSUPP)
+		return free_end;
+
+	lifetime = kzalloc(struct_size(lifetime, regions, ecc_sections + free_sections),
+			   GFP_KERNEL);
+	if (!lifetime)
+		return -ENOMEM;
+	for (unsigned int i = 0; i < ecc_sections; i++) {
+		ret = mtd_ooblayout_ecc(mtd, i, &lifetime->regions[i]);
+		if (ret)
+			goto free_lifetime;
+	}
+	for (unsigned int i = 0; i < free_sections; i++) {
+		ret = mtd_ooblayout_free(mtd, i, &lifetime->regions[ecc_sections + i]);
+		if (ret)
+			goto free_lifetime;
+	}
+
+	if (!name)
+		name = dev_name(mtd->parent_dev);
+	copy = kstrdup(name, GFP_KERNEL);
+	if (!copy) {
+		ret = -ENOMEM;
+		goto free_lifetime;
+	}
+
+	lifetime->allocation = allocation;
+	lifetime->storage = storage;
+	lifetime->ecc_sections = ecc_sections;
+	lifetime->free_sections = free_sections;
+	lifetime->ecc_end = ecc_end;
+	lifetime->free_end = free_end;
+	chip->lifetime = lifetime;
+	mtd->name = copy;
+	mtd->owner = THIS_MODULE;
+	mtd->_get_device = nand_mtd_get_device;
+	mtd_set_ooblayout(mtd, &nand_retained_ooblayout);
+	get_device(mtd->parent_dev);
+	of_node_get(nand_get_flash_node(chip));
+	if (storage)
+		nand_storage_get(storage);
+	mtd_set_release(mtd, nand_mtd_release);
+
+	return 0;
+
+free_lifetime:
+	kfree(lifetime);
+	return ret;
+}
+
+/**
+ * nand_set_lifetime - retain a scanned chip until its final MTD reference
+ * @chip: successfully scanned, unpublished NAND chip
+ * @allocation: chip allocation, or NULL if embedded in retained controller storage
+ *
+ * Copies the name and OOB layout and retains the parent, flash node and managed
+ * controller allocation. On success, unregister MTD, call nand_disconnect() to
+ * drain operations and run NAND cleanup, then call mtd_put_master(). Use the
+ * same disconnect/put sequence on registration failure. Final release only
+ * frees data in the NAND core; it never calls back into the controller driver.
+ *
+ * Return: zero on success or a negative error, leaving ownership unchanged.
+ */
+int nand_set_lifetime(struct nand_chip *chip, void *allocation)
+{
+	struct nand_storage *storage = &chip->controller->storage;
+
+	if (!storage->allocation)
+		storage = NULL;
+	return nand_prepare_lifetime(chip, allocation, storage);
+}
+EXPORT_SYMBOL_GPL(nand_set_lifetime);
+
+/**
+ * nand_set_shared_lifetime - retain a chip embedded in a shared allocation
+ * @chip: successfully scanned, unpublished NAND chip
+ * @storage: shared allocation containing the chip
+ *
+ * Like nand_set_lifetime(), but for a chip whose allocation is independent of
+ * its controller, and must also outlive other device-managed resources.
+ */
+int nand_set_shared_lifetime(struct nand_chip *chip, struct nand_storage *storage)
+{
+	return nand_prepare_lifetime(chip, NULL, storage);
+}
+EXPORT_SYMBOL_GPL(nand_set_shared_lifetime);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 90b2169cc745..e6b78d0f2deb 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -22,6 +22,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/types.h>
+#include <linux/kref.h>
 
 struct nand_chip;
 struct gpio_desc;
@@ -1104,6 +1105,22 @@ struct nand_controller_ops {
 			       const struct nand_interface_config *conf);
 };
 
+/**
+ * struct nand_storage - allocation retained by disconnected NAND devices
+ * @refcnt: references to the allocation
+ * @allocation: allocation freed by the NAND core after the final put
+ */
+struct nand_storage {
+	struct kref refcnt;
+	void *allocation;
+};
+
+void nand_storage_init(struct nand_storage *storage, void *allocation);
+void nand_storage_get(struct nand_storage *storage);
+void nand_storage_put(void *storage);
+int devm_nand_storage_init(struct device *dev, struct nand_storage *storage,
+			   void *allocation);
+
 /**
  * struct nand_controller - Structure used to describe a NAND controller
  *
@@ -1116,6 +1133,7 @@ struct nand_controller_ops {
  *			changing the column.
  * @supported_op.cont_read: The controller supports sequential cache reads.
  * @controller_wp:	the controller is in charge of handling the WP pin.
+ * @storage:		optional retained controller allocation
  */
 struct nand_controller {
 	struct mutex lock;
@@ -1125,6 +1143,7 @@ struct nand_controller {
 		unsigned int cont_read: 1;
 	} supported_op;
 	bool controller_wp;
+	struct nand_storage storage;
 };
 
 static inline void nand_controller_init(struct nand_controller *nfc)
@@ -1132,6 +1151,9 @@ static inline void nand_controller_init(struct nand_controller *nfc)
 	mutex_init(&nfc->lock);
 }
 
+int devm_nand_controller_init(struct device *dev, struct nand_controller *controller,
+			      void *allocation);
+
 /**
  * struct nand_legacy - NAND chip legacy fields/hooks
  * @IO_ADDR_R: address to read the 8 I/O lines of the flash device
@@ -1266,6 +1288,7 @@ struct nand_secure_region {
  * @buf_align: Minimum buffer alignment required by a platform
  * @lock: Lock protecting the suspended and disconnected fields. Also serializes
  *        accesses to the NAND device
+ * @markbad_lock: Serializes complete BBM/BBT updates with disconnect cleanup
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
  * @disconnected: Controller resources are unavailable; reject hardware access
  * @resume_wq: wait queue to sleep if rawnand is in suspended state.
@@ -1285,6 +1308,7 @@ struct nand_secure_region {
  *              independent devices
  * @ecc: The ECC controller structure
  * @priv: Chip private data
+ * @lifetime: Core-owned metadata and allocation references for retained handles
  */
 struct nand_chip {
 	struct nand_device base;
@@ -1327,6 +1351,7 @@ struct nand_chip {
 
 	/* Internals */
 	struct mutex lock;
+	struct mutex markbad_lock;
 	bool suspended;
 	bool disconnected;
 	wait_queue_head_t resume_wq;
@@ -1345,6 +1370,7 @@ struct nand_chip {
 	struct nand_controller *controller;
 	struct nand_ecc_ctrl ecc;
 	void *priv;
+	struct nand_lifetime *lifetime;
 };
 
 static inline struct nand_chip *mtd_to_nand(struct mtd_info *mtd)
@@ -1598,6 +1624,8 @@ void nand_wait_ready(struct nand_chip *chip);
  */
 void nand_cleanup(struct nand_chip *chip);
 void nand_disconnect(struct nand_chip *chip);
+int nand_set_lifetime(struct nand_chip *chip, void *allocation);
+int nand_set_shared_lifetime(struct nand_chip *chip, struct nand_storage *storage);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
