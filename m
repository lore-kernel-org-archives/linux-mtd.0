Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CB660A3823
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o9HWEcqn;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kQespCRK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fQr4uyqNm+hmy5dL1MESw5jG33xoIJDDcrCLenmjz8k=; b=o9HWEcqnvyTRQ/sRPHf+dNUNq3
	XiM0fhVGStnG0hGAhZDtmF6vQqy/Pxt+zsAOCEBzk/nMdRORlYehY3zPFQbyjqKHmwDgefu1fOAlk
	OdYzivHDLB/PEy5+9ryclRn3WyPZjzn/nmrksFR+gqqHYwu5GzqhL0tQY8tsw+JHdnrdxDSLFWRnv
	HpnnxDtCuL8qrgt/wPvuAC5vFGxpftSfR8vE6ANCsEbFmpglDJRKXyk6QvdyIqCLhjXOE6wBMjy2e
	tmSuatDU30i+ZW0qgVUov3aLt9UP8edW+y+fh71sKDlq/6WYpE1RLoSjDqDeu5XLW0wZ7pyUfQXPz
	PglIh3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUun-0000000GC0L-3fX4;
	Fri, 20 Nov 2026 20:08:57 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuX-0000000GBrC-3VWn
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:53 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-862b090e41eso756646a34.0
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205321; x=1795810121; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=kQespCRKklAsalHEVRhLKK7gVPHkNbbr8gU5I7qkT0qe+66t7RaH+wlXtT+CO+BRIG
         uhiOsVLqH5v4V1qXCuBa0Foy/jk97gbG0JSQda1BAeUKyBcNO4zPX1K5QPkL8RmdgC+3
         uuP1Ec4wMxH+QgetEBBLEyY4vbm3AdCzwLE8rbDsg+MU9Fyxh+zs3MZaEJ4TrOIImwaN
         SlnFJVnWm6sgKpv5gUeiQWBmUToT3XRbHiIslUnjFSJEAPmOstoYK8uxAbtRMXSV8O1Z
         QfeX46ysgtoxsleYCpxlfxNFk2GvO+tuvtfxv8Y5xhIdfljtitqbWdEPdO9V+34PSr2s
         i2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205321; x=1795810121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yo3W1XWEBrk0wDzNKNxvV9i2I/SXNLi7Zr3ZH7KKHzg=;
        b=P8OB2qzfjyjf0EHm7vpIy12SRuigVFe9CgRBKPPcHgK/NHAGiV+g8THMsy1COF6Ssa
         ZJRb8OuymahAmHataR6De6V1npRbxO0Gs9gny3mzYa57ce2zO38zAcV+OM+w+Yb6PM1o
         VfqYChNxM7vKVZujrmZp9HXQlANE2z9m/K1gDmqTDou6K10Tk7L0DqBU8yS/NmNwYL0Z
         KNJPVbpa+PQ7CPvKakh8S0PnwtD3ZTvykoj4EUiRGHWeSQ1bO/NE4IKPbXFXm6AQzXOS
         cPVDUMzNP3dhrEc79N85f966bUIpaCSPfTv3EZ8sYu2t0ZxN2ERjglF1jxTnjSPK0vp8
         Ykhw==
X-Forwarded-Encrypted: i=1; AL+hErFZtUo5I0S/egpOzToj7WmMj763zsZZKCoPig372nze7oa/bKG5e1uXGdnXBCb+6u1YRj/NBeOeA1c=@lists.infradead.org
X-Gm-Message-State: APuU4Z+uikUniTy3CSBAYPn47umlZ0AK+8d2RfjCoj1gb68PuRrjMgCV
	ufQo7xIHUaALSaYDzwHmo9NRq9m3CK/gJ04jZh1US3MrhPTSbhJNA9xt
X-Gm-Gg: AYBFou0VlvH/qiQfNXFMZyLNJ/EdrNwsdv735Knx/2poofLTj5cicFpExlA7Yh311DX
	IrWHLsumrAbvyYd6LPafYWed1mOhB5dYXHaYNKVYyvTEBqgFYOpXGqDmWAkELrlltS+Xw/mKMxs
	uFdqrNJIeU0Ksu5TKUXXOcVRHIfrXhd2UjJ1jV3GK3EZ76pwyDZQ5XUnZcT1l2WllRi9lvTH4Kh
	26dXxNaiE7j/GVJyniwdUAKTZzn32A8lnfrLcR1ptcAhWifpBfTWPTEVNuFvzeY5XIr2azgg3/U
	e/5SCikdIgKCQeDSyBDFHqsNOv+AoJ32274hmAOwQbg27/z9HgH4uD6JmNm+YPx0bJozrq2bT8z
	LTq8ipW2r0iwR+Jqv1k00fhhUc/I1O6C3D8C0X8T2rdXbrjGz/CFVHZQ4/DGtq9xfkgykYz/6E2
	YtZWWiXqlDOKYNelIlpW6FDysLhh/RQjoMcQF8tCbFDfitZ8IhHknb/WSTgP9DOm2V0M5s8WFos
	u0uMmfX07UiVe3LDLOv8+JOFaIBRkOx2uFDWfu6HFf7fLCJqNZJIpXlEIMuYH3seBvH53P9nubQ
	z0gWg8H8abnBIpcJq/aj/qSuj2eZCrTh6sD0T6c95ElOLhVdaUQ/RwbgsErAWOLX+TjTwzZOKb7
	KcrsSc0R3BUuWI4jeV6CERN/UdCugpf/CjH05fcldVNjcKJ7j5yXfKmDoh+hphbAjIUSTS3kJFR
	xSxtSVSusKbaxhsodZVJQ8irEWvLoALcgrG5O7L7utMXPWc+oKTPRo
X-Received: by 2002:a05:6830:4487:b0:82a:bf47:a080 with SMTP id 46e09a7af769-86315a869dbmr5519853a34.27.1795205320625;
        Fri, 20 Nov 2026 12:08:40 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:33 -0700
Subject: [PATCH v3 03/11] nvmem: exclude disconnected providers from
 callback admission
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-3-523610652402@gmail.com>
References: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
In-Reply-To: <20261120-submit-nvmem-provider-lifetime-v1-v3-0-523610652402@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michael Walle <michael@walle.cc>, Linus Walleij <linusw@kernel.org>, 
 Khouloud Touil <ktouil@baylibre.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120842_264178_CA5332AB 
X-CRM114-Status: GOOD (  20.34  )
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

A provider remains visible until device_unregister(), after its operations
have been disconnected. Device matching can still call into it during
that interval, and consumer acquisition can use its module pointer after
unregister has returned. Cell registration and DT fixups also lack a
callback drain.

Cover matching, cell addition, DT fixups and layout population with the
provider SRCU domain. Serialize acquiring the module reference and
publishing new cells with disconnection under nvmem_mutex. Check sysfs
permissions under SRCU as well.

Cell addition notifies listeners while it is still covered by the
provider drain. A listener such as cp500 can register a different NVMEM
device or unwind its registration. Use a separate SRCU notifier chain so
nested notifications do not block on a waiting notifier writer. Notify
listeners of removal only after admitted cell additions have finished.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Link: https://lore.kernel.org/r/sashiko-outbox-219563@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 112 +++++++++++++++++++++++++++++++++++++--------------
 1 file changed, 81 insertions(+), 31 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 32d36ca904cd..7d75076cda49 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -52,7 +52,7 @@ static DEFINE_IDA(nvmem_ida);
 static DEFINE_MUTEX(nvmem_lookup_mutex);
 static LIST_HEAD(nvmem_lookup_list);
 
-static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
+SRCU_NOTIFIER_HEAD_STATIC(nvmem_notifier);
 
 static int nvmem_access_chunk(struct nvmem_device *nvmem,
 			      const struct nvmem_operations *ops,
@@ -287,10 +287,14 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
 static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
-
+	struct nvmem_operations *ops;
 	umode_t mode = 0400;
 
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
+
 	if (!nvmem->root_only)
 		mode |= 0044;
 
@@ -331,7 +335,12 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nvmem_device *nvmem = to_nvmem_device(dev);
-	struct nvmem_operations *ops = rcu_dereference_raw(nvmem->ops);
+	struct nvmem_operations *ops;
+
+	guard(srcu)(&nvmem->srcu);
+	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
+	if (!ops)
+		return 0;
 
 	/*
 	 * If the device has no .reg_write operation, do not allow
@@ -535,7 +544,7 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
 {
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
 	scoped_guard(mutex, &nvmem_mutex)
 		list_del(&cell->node);
 	of_node_put(cell->np);
@@ -571,11 +580,15 @@ static const struct bus_type nvmem_bus_type = {
 	.name		= "nvmem",
 };
 
-static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
+static int nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 {
-	scoped_guard(mutex, &nvmem_mutex)
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(cell->nvmem->ops))
+			return -ENODEV;
 		list_add_tail(&cell->node, &cell->nvmem->cells);
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
+	}
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
+	return 0;
 }
 
 static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
@@ -653,6 +666,10 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	struct nvmem_cell_entry *cell;
 	int rval;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	cell = kzalloc_obj(*cell);
 	if (!cell)
 		return -ENOMEM;
@@ -663,9 +680,12 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
-	nvmem_cell_entry_add(cell);
-
-	return 0;
+	rval = nvmem_cell_entry_add(cell);
+	if (rval) {
+		kfree_const(cell->name);
+		kfree(cell);
+	}
+	return rval;
 }
 EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
 
@@ -698,11 +718,14 @@ static int nvmem_add_cells(struct nvmem_device *nvmem,
  *
  * @nb: notifier block to be called on nvmem events.
  *
+ * A cell-add notification runs as part of the operation that unregister
+ * drains. Do not synchronously unregister that provider from its callback.
+ *
  * Return: 0 on success, negative error number on failure.
  */
 int nvmem_register_notifier(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_register(&nvmem_notifier, nb);
+	return srcu_notifier_chain_register(&nvmem_notifier, nb);
 }
 EXPORT_SYMBOL_GPL(nvmem_register_notifier);
 
@@ -715,7 +738,7 @@ EXPORT_SYMBOL_GPL(nvmem_register_notifier);
  */
 int nvmem_unregister_notifier(struct notifier_block *nb)
 {
-	return blocking_notifier_chain_unregister(&nvmem_notifier, nb);
+	return srcu_notifier_chain_unregister(&nvmem_notifier, nb);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
 
@@ -795,6 +818,10 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 	const __be32 *addr;
 	int len, ret;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
 
@@ -851,8 +878,11 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 	if (!layout->add_cells)
 		return -EINVAL;
 
-	/* Populate the cells */
-	ret = layout->add_cells(layout);
+	scoped_guard(srcu, &layout->nvmem->srcu) {
+		if (!srcu_dereference(layout->nvmem->ops, &layout->nvmem->srcu))
+			return -ENODEV;
+		ret = layout->add_cells(layout);
+	}
 	if (ret)
 		return ret;
 
@@ -874,6 +904,17 @@ void nvmem_layout_unregister(struct nvmem_layout *layout)
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
+static void nvmem_disconnect(struct nvmem_device *nvmem)
+{
+	struct nvmem_operations *ops;
+
+	scoped_guard(mutex, &nvmem_mutex)
+		ops = rcu_replace_pointer(nvmem->ops, NULL,
+					 lockdep_is_held(&nvmem_mutex));
+	synchronize_srcu(&nvmem->srcu);
+	kfree(ops);
+}
+
 /**
  * nvmem_register() - Register a nvmem device for given nvmem_config.
  * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/nvmem
@@ -1034,7 +1075,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		goto err_destroy_layout;
 #endif
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
@@ -1047,10 +1088,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
 	put_device(&nvmem->dev);
-	kfree(ops);
 
 	return ERR_PTR(rval);
 }
@@ -1063,19 +1102,14 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops;
-
 	if (!nvmem)
 		return;
 
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
-
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
+	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
-	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
@@ -1115,17 +1149,33 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_nvmem_register);
 
+struct nvmem_match_data {
+	void *data;
+	int (*match)(struct device *dev, const void *data);
+};
+
+static int nvmem_match_device(struct device *dev, const void *data)
+{
+	const struct nvmem_match_data *match = data;
+	struct nvmem_device *nvmem = to_nvmem_device(dev);
+
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return 0;
+	return match->match(dev, match->data);
+}
+
 static struct nvmem_device *nvmem_device_match(void *data,
 			int (*match)(struct device *dev, const void *data))
 {
+	struct nvmem_match_data match_data = { .data = data, .match = match };
 	struct nvmem_device *nvmem = NULL;
 	struct device *dev;
 
-	scoped_guard(mutex, &nvmem_mutex) {
-		dev = bus_find_device(&nvmem_bus_type, NULL, data, match);
-		if (dev)
-			nvmem = to_nvmem_device(dev);
-	}
+	guard(mutex)(&nvmem_mutex);
+	dev = bus_find_device(&nvmem_bus_type, NULL, &match_data, nvmem_match_device);
+	if (dev)
+		nvmem = to_nvmem_device(dev);
 	if (!nvmem)
 		return ERR_PTR(-EPROBE_DEFER);
 

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
