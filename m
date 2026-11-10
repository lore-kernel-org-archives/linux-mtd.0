Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDC60A2634
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Nov 2026 07:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fe2F0eS4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ziBKIlp7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/YKvyZIGsmb6UGe7Nkkj7vCoxhEfQ8wneJJuSpo5f2I=; b=fe2F0eS4AMxw6N/zfIFqsFeDu9
	wglTZA1Ej+D03K3FIFlVbCAWxUlSDOUVq0RDgNmFj2dXwpqjNnqMsLyDmaC+WS2Cb+lrhCqmfDmhx
	d0xs6iSlYp3s/6UAK8kBGve92Nta75nxS7XTcYEptj1g+v0wZ3ZHkRzQSKhe/VFeAuH+O9TpFxAsm
	LFhO0rk5KG/blz+wyzdKrh0lmEiyCkrT3JN84avqxfeyJ75Bm96ec6NktD1QAeKygEkUSOCSGyOC+
	IUDH490xSPiqVPdh8dxunzS42uaEIQKPgj5YPRaB1TDXds50T5c8AVSNpWpJ0jaLSkKJaYglaVAuR
	wwtH8SWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWp-00000002vld-3Wdx;
	Tue, 10 Nov 2026 07:44:27 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQgWm-00000002vig-1vn8
	for linux-mtd@lists.infradead.org;
	Tue, 10 Nov 2026 07:44:26 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-844a8bf7e25so1225091a34.1
        for <linux-mtd@lists.infradead.org>; Mon, 09 Nov 2026 23:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296663; x=1794901463; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uBO5z5i9rnDcZlHEY1YWIv7/CQoOu4BHG/HftOGk0ew=;
        b=ziBKIlp74jGKHbM/Hb3A7w1lPLakp7di+Nnq7sZnfhm5ODm6/PgUGTNkGk7o1cxDrD
         5Y5Dfo0yvVXCtZL3gdQFsY/DdHHlWtKfqjYd2bkEGg38spy+ILTv2x0Nj9wmuYYbvbUF
         qLjg1UrRFwkM6jo96j3/O5D5bXGY/Hyo3GH6idEQmfFb13njBfWslXkM/3kMBeCSVSE7
         KB4a04nrFpKk2lJoyvQcLHNUj3ENlpjA18d8eXcE+pyJWtUsyUEZMD3Ocn6/gPPbjyV3
         QQZo47eZ0S0LgpIpdNQJOhXEhinBPNXehD/GSD3VY4suadX+lWsTWooP/+Un2kXjguir
         Y5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296663; x=1794901463;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uBO5z5i9rnDcZlHEY1YWIv7/CQoOu4BHG/HftOGk0ew=;
        b=hzymVcD1K9H2xC7swMTwh8vq4YGJFOnS0j33eW3rtJXsJ0IoOSrQVa6S4wUV3FuHIN
         p7CvT2jcRWPjO9iENLEydESWWQBl40ZALJaQgppN9ll1dyaYDe7WEklFV+YjGZRdHhVd
         W7CTQvIkKI7xRyJAHyO+oJt+8VuFBQC1sEaXrFyFUFXv+K5U/v5eIncTKO1FM20qTpLm
         v0t/JY6tIlgG5T0D6PPolh9wLIuLtbouD0Rbke0uuwrSid0KvtKWkycSjvRzPaDdRFtD
         4YV3ffvWcSrijTBXpzPXgpyYEv+4rosLf5cJ0LQ4qfJRUxGSX7zBalMDvOLR6GEYOMlT
         GxZg==
X-Gm-Message-State: APuU4Z/WwqX03pXE+Gt9R2cyhzsXOQ3jjvwlFvYjdg+bXODZzQa6Gltm
	b2YsRjMtPoyjXTsL6W1A74cvbrPUT8HC39YaLXWM8K1FEqMUXVVUErTD
X-Gm-Gg: AYBFou0cAocn5t7scpG0TdC+6D3DnHmqOAwsxSt0+7b64Z+QuyoRJQg8aXLBAF0vHiS
	HtDKg5E6C/TkGhPCXMnQwM+zZJcoY2Ptleg9EnXHQNF5CXAEU0KcraKt5CUGItrUfRl9SQ5NYCH
	Cl/fJD/imWW2iIuINkXpgx2FBOhgzrm5Iz3gIDG/1XHOwuk7V3XtzNqdlk7CVGkg3jefVYox31d
	nIbbeOw3pGV7RbMtfYj5CJmYEFAyx/+42urOyrIntgBO70bSJ3dVIp1lRLj1tb5XT+/R2JPlb4A
	NV2M9/Iyt5oeZ32MgMz+14Sy0F+3qwmYNQJ0PgVAn/Lg6chOEMT/AOmm0HWctZwOGZFHRvbdRAH
	UOPCYQ+rcOMW2XQCyQYFlHD17vTXgRV4sZGI98ZABNG44XCQuyG0raBecE3t+Dt/f/sIM2g7ywW
	qKGKUvUkAjuS8HsvCEVxQnchddO4YKlg75He1jBEuRV0414wcubEmGhgUt3iQuxC+OjAbTmTW/V
	SaIAtxCSPvNe97fcb/jW2tRmqr1xjCeZ5B/Bj6ZPURBEwcGwdj4Ytcq9HNUCJ9TfX0mdchiVI7n
	LiMzYsk95bQwYJPtaWPJrKyRYDXr6tbHjBYHEdBx7AhjO0Ws2x6MchaD+BenVogPLs0Vzrd/ylg
	YpvoWobdOQGf3PI+etdQb8j8+zeI1fu5dlYkboDyTtYoAatmgAYqC/XPctalYYnfJqoWbZhlKvH
	wLpLK6NL9BaLGpSNkot5/kw8yOF/fZBgnUZ4Ryoma1k9HkTz22pYc=
X-Received: by 2002:a05:6808:4f67:b0:55b:ea1c:3ce8 with SMTP id 5614622812f47-5683c940da4mr1602630b6e.21.1794296663200;
        Mon, 09 Nov 2026 23:44:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:06 -0700
Subject: [PATCH v2 03/58] mtd: add opt-in lifetime ownership for backing
 objects
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-3-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_234424_574841_E44794B7 
X-CRM114-Status: GOOD (  31.25  )
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

MTD references retain registered nodes, but do not retain the backing
object allocated by a controller driver. Keeping a partition open across
driver unbind can therefore leave its master and driver metadata freed.
Device references held outside get_mtd_device(), such as NVMEM
consumers, also need the backing object and the partition ancestry to
remain valid.

Add an optional master lifetime initialized by mtd_set_release(). The
driver owns the initial reference. Each registered node and acquired MTD
handle holds another reference. The node reference lasts through final
device release, and nested partitions retain their parent device until
then. mtd_put_master() drops the driver's reference after hardware has
been disconnected and the MTD devices unregistered.

Give OTP NVMEM providers their own backing-object references through the
NVMEM context callbacks. They are parented to the physical device rather
than the MTD node, so the node reference does not cover them. Keep these
references through final NVMEM device release, including after failed MTD
registration, and use the backing driver's module as the consumer owner.

Pin the release callback's module when the driver drops its reference.
If the module is initializing or unloading, wait for the remaining
references instead: failed module initialization can discard module text
despite reference pins, and unload cannot acquire a new pin. Keep the
MTD core module pinned through its device and OTP release callbacks too.
The device core owns the device callback reference and drops it after
the callback returns, including on registration failure.

Distinguish registration from retained references so an unregistered
node cannot be opened again. Balance master references for direct
opens even with MTD_PARTITIONED_MASTER disabled. Keep that decision
independent of later master publication, so an earlier partition
handle cannot drop an unacquired master reference.

Remove the lookup entry under mtd_table_mutex at the last MTD put, but
reserve its number until final device release. A retained NVMEM provider
still uses that number in its device name, so reusing it earlier would
make rebind fail with -EEXIST.

On registration failure, wait for the overridden device release callback
before returning ownership to the caller. This also covers delayed
kobject release, when an immediate caller free would be premature.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   | 194 +++++++++++++++++++++++++++++++++++++++++-------
 include/linux/mtd/mtd.h |  16 ++++
 2 files changed, 183 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 30b16f135f07..1c31e2a5fbe0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -31,6 +31,7 @@
 #include <linux/nvmem-provider.h>
 #include <linux/root_dev.h>
 #include <linux/error-injection.h>
+#include <linux/completion.h>
 
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
@@ -70,6 +71,7 @@ static struct class mtd_class = {
 };
 
 static DEFINE_IDR(mtd_idr);
+static DEFINE_IDA(mtd_ids);
 
 /* These are exported solely for the purpose of mtd_blkdevs.c. You
    should not use them for _anything_ else */
@@ -78,7 +80,15 @@ EXPORT_SYMBOL_GPL(mtd_table_mutex);
 
 struct mtd_info *__mtd_next_device(int i)
 {
-	return idr_get_next(&mtd_idr, &i);
+	struct mtd_info *mtd;
+
+	while ((mtd = idr_get_next(&mtd_idr, &i))) {
+		if (mtd->registered)
+			return mtd;
+		i++;
+	}
+
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(__mtd_next_device);
 
@@ -87,37 +97,117 @@ static LIST_HEAD(mtd_notifiers);
 
 #define MTD_DEVT(index) MKDEV(MTD_CHAR_MAJOR, (index)*2)
 
-/* REVISIT once MTD uses the driver model better, whoever allocates
- * the mtd_info will probably want to use the release() hook...
+static void mtd_master_release(struct kref *ref)
+{
+	struct mtd_info *master = container_of(ref, struct mtd_info,
+					     master.life_refcnt);
+	struct completion *done = master->master.release_done;
+	struct module *owner = master->master.release_owner;
+
+	master->master.release(master);
+	if (done)
+		complete(done);
+	else
+		module_put(owner);
+}
+
+static void mtd_get_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_get(&master->master.life_refcnt);
+}
+
+static void mtd_put_lifetime(struct mtd_info *master)
+{
+	if (master->master.release)
+		kref_put(&master->master.life_refcnt, mtd_master_release);
+}
+
+/**
+ * mtd_set_release - initialize the lifetime of a dynamically allocated master
+ * @master: master MTD device
+ * @release: free the backing object and its retained metadata
+ *
+ * Call once before registration. The driver owns the initial reference and
+ * drops it with mtd_put_master() after unregistering and disconnecting hardware.
+ * Registered MTD devices and acquired handles retain the backing object too.
+ * The release callback must not access resources released by driver unbind.
+ */
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd))
+{
+	kref_init(&master->master.life_refcnt);
+	master->master.release = release;
+}
+EXPORT_SYMBOL_GPL(mtd_set_release);
+
+/**
+ * mtd_put_master - drop the driver's initial lifetime reference
+ * @master: master initialized by mtd_set_release()
+ *
+ * Hardware access must already be disconnected and drained. Unbind may return
+ * while handles retain metadata. Keep the release callback's module loaded
+ * until that metadata is freed. If the module is already unloading, wait for
+ * the remaining references instead of scheduling a callback into the departing
+ * module. Also wait during module initialization, which may fail and discard
+ * the module despite pins.
  */
+void mtd_put_master(struct mtd_info *master)
+{
+	DECLARE_COMPLETION_ONSTACK(done);
+
+	if ((!master->owner || READ_ONCE(master->owner->state) == MODULE_STATE_LIVE) &&
+	    try_module_get(master->owner)) {
+		master->master.release_owner = master->owner;
+		mtd_put_lifetime(master);
+	} else {
+		master->master.release_done = &done;
+		mtd_put_lifetime(master);
+		wait_for_completion(&done);
+	}
+}
+EXPORT_SYMBOL_GPL(mtd_put_master);
+
 static void mtd_release(struct device *dev)
 {
 	struct mtd_info *mtd = dev_get_drvdata(dev);
-	dev_t index = MTD_DEVT(mtd->index);
+	struct mtd_info *master = mtd->ref_master;
+	struct mtd_info *parent = mtd->parent;
 
-	idr_remove(&mtd_idr, mtd->index);
+	/* Retained NVMEM providers use the MTD number in their device name. */
+	ida_free(&mtd_ids, mtd->index);
 	of_node_put(mtd_get_of_node(mtd));
 
 	if (mtd_is_partition(mtd))
 		release_mtd_partition(mtd);
 
-	/* remove /dev/mtdXro node */
-	device_destroy(&mtd_class, index + 1);
+	if (master) {
+		/* Nested partitions can outlive device_del() of their parents. */
+		if (parent && parent != master)
+			put_device(&parent->dev);
+		mtd_put_lifetime(master);
+	}
 }
 
 /*
- * No-op device release used in add_mtd_device() error paths.
+ * Hand failed registrations back to their caller only after device release.
  * Prevents mtd_release() from being called via device_release(),
  * which would free the mtd_info that the caller still manages.
  */
-static void mtd_dev_release_nop(struct device *dev)
+static void mtd_dev_release_done(struct device *dev)
 {
+	complete(dev_get_drvdata(dev));
 }
 
 static void mtd_device_release(struct kref *kref)
 {
 	struct mtd_info *mtd = container_of(kref, struct mtd_info, refcnt);
 	bool is_partition = mtd_is_partition(mtd);
+	bool managed = mtd->ref_master;
+
+	/* The table mutex is held by the registration or handle put path. */
+	idr_remove(&mtd_idr, mtd->index);
+	device_destroy(&mtd_class, MTD_DEVT(mtd->index) + 1);
 
 	debugfs_remove_recursive(mtd->dbg.dfs_dir);
 
@@ -131,10 +221,8 @@ static void mtd_device_release(struct kref *kref)
 	 *  Should not be done for partition,
 	 *  as it was already destroyed in device_unregister().
 	 */
-	if (!is_partition)
+	if (!is_partition && !managed)
 		memset(&mtd->dev, 0, sizeof(mtd->dev));
-
-	module_put(THIS_MODULE);
 }
 
 #define MTD_DEVICE_ATTR_RO(name) \
@@ -612,7 +700,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.id = NVMEM_DEVID_NONE;
 	config.dev = &mtd->dev;
 	config.name = dev_name(&mtd->dev);
-	config.owner = THIS_MODULE;
+	config.owner = mtd_get_master(mtd)->owner;
 	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
@@ -700,10 +788,13 @@ static struct device_node *mtd_find_of_node(struct mtd_info *mtd)
 
 int add_mtd_device(struct mtd_info *mtd)
 {
+	DECLARE_COMPLETION_ONSTACK(released);
 	struct device_node *np = mtd_get_of_node(mtd);
 	struct mtd_info *master = mtd_get_master(mtd);
 	struct mtd_notifier *not;
 	int i, error, ofidx;
+	u32 id;
+	bool wait_for_release = false;
 
 	/*
 	 * May occur, for instance, on buggy drivers which call
@@ -746,16 +837,28 @@ int add_mtd_device(struct mtd_info *mtd)
 	if (np)
 		ofidx = of_alias_get_id(np, "mtd");
 	if (ofidx >= 0)
-		i = idr_alloc(&mtd_idr, mtd, ofidx, ofidx + 1, GFP_KERNEL);
+		i = ida_alloc_range(&mtd_ids, ofidx, ofidx, GFP_KERNEL);
 	else
-		i = idr_alloc(&mtd_idr, mtd, 0, 0, GFP_KERNEL);
+		i = ida_alloc(&mtd_ids, GFP_KERNEL);
 	if (i < 0) {
 		error = i;
 		goto fail_locked;
 	}
+	id = i;
+	error = idr_alloc_u32(&mtd_idr, mtd, &id, id, GFP_KERNEL);
+	if (error) {
+		ida_free(&mtd_ids, i);
+		goto fail_locked;
+	}
 
 	mtd->index = i;
 	kref_init(&mtd->refcnt);
+	if (master->master.release) {
+		mtd_get_lifetime(master);
+		mtd->ref_master = master;
+		if (mtd->parent && mtd->parent != master)
+			get_device(&mtd->parent->dev);
+	}
 
 	/* default value if not set by driver */
 	if (mtd->bitflip_threshold == 0)
@@ -802,6 +905,7 @@ int add_mtd_device(struct mtd_info *mtd)
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.release_owner = THIS_MODULE;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_set_of_node(mtd, mtd_find_of_node(mtd));
 	error = device_register(&mtd->dev);
@@ -819,6 +923,7 @@ int add_mtd_device(struct mtd_info *mtd)
 		      "mtd%dro", i);
 
 	pr_debug("mtd: Giving out device %d to %s\n", i, mtd->name);
+	mtd->registered = true;
 	/* No need to get a refcount on the module containing
 	   the notifier, since we hold the mtd_table_mutex */
 	list_for_each_entry(not, &mtd_notifiers, list)
@@ -836,29 +941,38 @@ int add_mtd_device(struct mtd_info *mtd)
 		}
 	}
 
-	/* We _know_ we aren't being removed, because
-	   our caller is still holding us here. So none
-	   of this try_ nonsense, and no bitching about it
-	   either. :) */
-	__module_get(THIS_MODULE);
 	return 0;
 
 fail_nvmem_add:
 	device_del(&mtd->dev);
 fail_added:
 	/*
-	 * Clear type and set nop release to prevent mtd_release() ->
+	 * Clear type and override release to prevent mtd_release() ->
 	 * release_mtd_partition() -> free_partition() from freeing mtd.
 	 * The caller handles cleanup on failure.
 	 */
 	mtd->dev.type = NULL;
-	mtd->dev.release = mtd_dev_release_nop;
+	mtd->dev.release = mtd_dev_release_done;
+	dev_set_drvdata(&mtd->dev, &released);
+	wait_for_release = true;
 	put_device(&mtd->dev);
 	of_node_put(mtd_get_of_node(mtd));
 fail_devname:
 	idr_remove(&mtd_idr, i);
+	ida_free(&mtd_ids, i);
+	if (mtd->ref_master) {
+		mtd->ref_master = NULL;
+		if (mtd->parent && mtd->parent != master)
+			put_device(&mtd->parent->dev);
+		mtd_put_lifetime(master);
+	}
 fail_locked:
 	mutex_unlock(&mtd_table_mutex);
+	if (wait_for_release) {
+		wait_for_completion(&released);
+		mtd->dev.release = NULL;
+		dev_set_drvdata(&mtd->dev, mtd);
+	}
 	return error;
 }
 
@@ -879,7 +993,7 @@ int del_mtd_device(struct mtd_info *mtd)
 
 	mutex_lock(&mtd_table_mutex);
 
-	if (idr_find(&mtd_idr, mtd->index) != mtd) {
+	if (idr_find(&mtd_idr, mtd->index) != mtd || !mtd->registered) {
 		ret = -ENODEV;
 		goto out_error;
 	}
@@ -889,6 +1003,7 @@ int del_mtd_device(struct mtd_info *mtd)
 	list_for_each_entry(not, &mtd_notifiers, list)
 		not->remove(mtd);
 
+	mtd->registered = false;
 	kref_put(&mtd->refcnt, mtd_device_release);
 	ret = 0;
 
@@ -950,6 +1065,16 @@ static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 	return ret == -ENODATA ? 0 : ret;
 }
 
+static void mtd_otp_nvmem_get(void *priv)
+{
+	mtd_get_lifetime(priv);
+}
+
+static void mtd_otp_nvmem_put(void *priv)
+{
+	mtd_put_lifetime(priv);
+}
+
 static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 						   const char *compatible,
 						   int size,
@@ -966,7 +1091,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.dev = mtd->dev.parent;
 	config.name = compatible;
 	config.id = NVMEM_DEVID_AUTO;
-	config.owner = THIS_MODULE;
+	config.owner = mtd->owner;
 	config.add_legacy_fixed_of_cells = !mtd_type_is_nand(mtd);
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
@@ -975,6 +1100,11 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.size = size;
 	config.of_node = np;
 	config.priv = mtd;
+	if (mtd->master.release) {
+		config.priv_get = mtd_otp_nvmem_get;
+		config.priv_put = mtd_otp_nvmem_put;
+		config.priv_owner = THIS_MODULE;
+	}
 
 	nvmem = nvmem_register(&config);
 	/* Just ignore if there is no NVMEM support in the kernel */
@@ -1332,8 +1462,12 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
+	if (!mtd->registered)
+		return -ENODEV;
+
 	if (master->_get_device) {
 		err = master->_get_device(mtd);
 		if (err)
@@ -1346,13 +1480,14 @@ int __get_mtd_device(struct mtd_info *mtd)
 		return -ENODEV;
 	}
 
+	mtd_get_lifetime(master);
 	while (mtd) {
 		if (mtd != master)
 			kref_get(&mtd->refcnt);
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1437,8 +1572,10 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	/* master can be freed in _put_device */
 	struct module *owner = master->owner;
+	bool managed = master->master.release;
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1449,12 +1586,14 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
-	/* must be the last use of master */
+	/* Legacy _put_device() callbacks can free an unmanaged master. */
 	if (master->_put_device)
 		master->_put_device(master);
+	if (managed)
+		mtd_put_lifetime(master);
 
 	/* _put_device() runs code from @owner, so drop the module last */
 	module_put(owner);
@@ -2671,6 +2810,7 @@ static void __exit cleanup_mtd(void)
 	bdi_unregister(mtd_bdi);
 	bdi_put(mtd_bdi);
 	idr_destroy(&mtd_idr);
+	ida_destroy(&mtd_ids);
 }
 
 module_init(init_mtd);
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd7b4671c456..eb9fd9ea0c79 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -187,6 +187,7 @@ struct mtd_pairing_scheme {
 };
 
 struct module;	/* only needed for owner field in mtd_info */
+struct completion;
 
 /**
  * struct mtd_debug_info - debugging information for an MTD device.
@@ -225,6 +226,10 @@ struct mtd_part {
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
  * @unregistering: removal has started; protected by partitions_lock
+ * @life_refcnt: optional lifetime reference count for the backing object
+ * @release: free the backing object after its last lifetime reference
+ * @release_owner: module reference held during deferred release
+ * @release_done: completion used when the owner module is already unloading
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -235,6 +240,10 @@ struct mtd_master {
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
 	bool unregistering;
+	struct kref life_refcnt;
+	void (*release)(struct mtd_info *mtd);
+	struct module *release_owner;
+	struct completion *release_done;
 };
 
 struct mtd_info {
@@ -382,6 +391,10 @@ struct mtd_info {
 	struct module *owner;
 	struct device dev;
 	struct kref refcnt;
+	/* Protected by mtd_table_mutex; false after del_mtd_device(). */
+	bool registered;
+	/* Lifetime reference held until the device release callback. */
+	struct mtd_info *ref_master;
 	struct mtd_debug_info dbg;
 	struct nvmem_device *nvmem;
 	struct nvmem_device *otp_user_nvmem;
@@ -683,6 +696,9 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 #define mtd_device_register(master, parts, nr_parts)	\
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
+void mtd_set_release(struct mtd_info *master,
+		     void (*release)(struct mtd_info *mtd));
+void mtd_put_master(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
