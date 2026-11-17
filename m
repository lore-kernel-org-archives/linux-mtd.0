Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178FD606A8A8
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=s/jY/FS6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRpf4noK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Kb1bQnU1QOyNUpjaYKOtiyNS6NpIokLMR3rkCplr564=; b=s/jY/FS63otRJ0TFaY7B5fgNJx
	gdeMbl/GinLd/6mWt2IlYyR7gMf0ZRa4/yMcdEQqLdZzHBEc36Y8/zHhW2YGPuwE47XbJzYXvgqZU
	+kJu1EoV5S7geUhAJkQ0EcsJ6hZ1VBYpFiWICvmJbEFCx5404tjs+nPzkO7jT4nU/en5PQuJLPxJ3
	FXX/TdlIL9HezqfoCyZu+gIqNgAQXcfs08s4LANsBbBZaITsp8jFwFpXPunvFjxwfmCTqWp1snR3o
	9Fmf+zIflUFTAfITCtYvnd4V6wTOtRq4GfLIdAz3cNyLYj/HB4rDStReP/FkRIpcx1lftfP6pPMFe
	V5L7B8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0z-00000006vYl-2z7i;
	Tue, 17 Nov 2026 19:38:49 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0w-00000006vTf-1Z19
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:49 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6e560e00a86so125855eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944325; x=1795549125; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MUImTTPP6H69Xlh8bMMdx+YlFGd8gVKneBJhC+vmpSc=;
        b=LRpf4noKzpm9VLWEBmgxz/oxGS/mq5IDgj8QZfiSxEgyxHfGguW9RijtQQAKyqqBGZ
         PQS8tMwr5UuvH+F7ZJb45t4hzTXU3lBgWVD3PV2l6jiQkl13GPyNngGCwfjkdm0z7ugt
         TFJXX2F4CbvgHUBaaNjS5dPSpSv2dtKC8fuHN9A5ivxfywuXftm4d3c7YGIsiAp1z5/L
         a8IojdGIw/nRKKqTTGoK9hhY0oGqLVDIZqzLOL06u3YQmQR8l52mpIRC7RZbJ16ZxM8e
         RNTQO0mDt9+XiXkpH9eL19eVesBu3dxM/lo7AP9kXvdtR2SgPncSrb3LLUXvqRfjzdtn
         19KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944325; x=1795549125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUImTTPP6H69Xlh8bMMdx+YlFGd8gVKneBJhC+vmpSc=;
        b=NguR3H+AHxD/hKdroyf27i9xbLxyLL09CEZcXNFqZKrid7MY8RTgnVrIQt5JgbFCJI
         27F/KDQNn2sLgsA/kHMgHyPyIV/eNfpiUzAbD0eWUoZg/wpoK3fRxaD7ZIO50W2zKnfN
         UPKkCcxi0fa9DHbUMTz2hZvNMIKOhB0P1vdegGunps0nEhlNGVjZePp5eepiOPVoWPks
         g9gWlwLn8KUI7G8X9DlvsaggClFMr/sHYuLD9qfExqGJAIKshGM7pIRrqIiOY0p9QsX2
         N/FJeryLPIoPhD2IxwPOhPC71yO19RwNxBUy3OYjDkDKc7TXnZ/gvN5AW0oMNUvy5Xii
         pSvA==
X-Forwarded-Encrypted: i=1; AL+hErGEF6LOdVHSZlzB+ZeeRiOJWoBsHMrQpkJf6QLs/BZmMPuRZFgSgbbXP4ya6aIKyk17+atfynGb0OA=@lists.infradead.org
X-Gm-Message-State: APuU4Z9hJmUCQVb6TcfumucZgNofCpcK6+W8IJLUPlLK31G197m2xUvk
	XGCHXscUUJ/OvHMq3hL55Als6Y9huda/L5H389bEKmPiblkfprHi3V6P
X-Gm-Gg: AYBFou3UThexLO6oXYO59QZ2XozT0qbknyWC9yT+kAeSRaAw+KLKXjzHOK6KpIR2zhk
	d4X/53a/abj9vpky5r09lHo26N4XPUJAH8NMg4ZK2uxRHRX4gO6ZwfQxhxkJsonCBsRkGKtAa91
	ARVtm2MVpEOALZQyTS+BLoCLEy5Hp4u37YOazD5LGGRJPcQlJj4gity4LlFeYHJB1tGTOgTWdLa
	HFb3aUT+v3txIsn831GIFORaMPnr9MjC5an7Yyr+21wnThID38y/kA5O0KfWBxR0UMsE6A+ge+Y
	iCGz6Bx93mldlN40ybuJPOje2tquu1hWt9A66rkjO4wY16BLgAB9oxFugtnavw167Y4kdG9XIAU
	68SMD+n8tmrqtAehZTrLfE10VXQ074MIsjqsfpNRMHXzreVxTb8Euv1SqEsVx5nFSLbdXF9dii6
	ruIO1RFoPzIvwg479s0ftYq9clJf5Z62fia/tiZRmnxPvdf1xDMeV5qmTp0eEypAi/+L7fEdR7k
	dNYykcG2A0fkaB4eoRr794peX5u1mRO5NNck8NVdH0kwAQZiEu4fE5ldlDODCwiK33R8hJoO6yZ
	wPQTWAUXaSs1HGdGRPLZOVup/Y6jrMQBg6VCvvL8OLjQZPyTdsPMg/QF7vXhlMV+6bkW+8bJ1l0
	4gsGOyOm+aaDifN84U8Jw9YnNtB5Cr2kQfAfQm9uG1MZknCU6IztjopL6/rdSPqkaUhebdQzwzZ
	vZPTMJwIq6uKyXRsCeHxBACVhFfgrdPZrldqBu/HQX8loWWUgV4RY=
X-Received: by 2002:a05:6820:a298:20b0:71a:f794:49c7 with SMTP id 006d021491bc7-71b185bdbcfmr221200eaf.66.1794944325182;
        Tue, 17 Nov 2026 11:38:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:15 -0700
Subject: [PATCH 08/11] nvmem: disconnect cells before removing their layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-8-3cfbd48812b5@gmail.com>
References: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
In-Reply-To: <20261117-submit-nvmem-provider-lifetime-v1-v1-0-3cfbd48812b5@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
 Michael Walle <mwalle@kernel.org>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Paul Cercueil <paul@crapouillou.net>, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_113847_415563_8D7F0728 
X-CRM114-Status: GOOD (  20.17  )
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

A layout can be unbound while NVMEM consumers retain its cells. Keeping
the layout module loaded does not retain its binding or private data,
and looking up the module again at cell put can access a removed layout.

A failed add_cells callback can also leave cells registered even though
the layout never bound. The sysfs failure path instead removes every
cell, including cells supplied by the provider.

Remove the layout-owned cells from lookup and mark them disconnected.
Drain their sysfs attributes and SRCU-protected accesses before returning
to the layout driver. Old handles retain only cell metadata and reject
I/O; a later layout probe creates new cells. Use the same cleanup when
cell registration or sysfs population fails.

Replace the layout module get/put paths with this drain. Leave provider
cells registered and rebuild their attributes after layout removal.
Clear the provider-to-layout link when the layout device is unregistered.

Fixes: fc29fd821d9a ("nvmem: core: Rework layouts to become regular devices")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c    | 84 +++++++++++++++++++++++++++----------------------
 drivers/nvmem/layouts.c |  2 ++
 2 files changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 57c1da5ab547..f1a254a0a5cb 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -29,6 +29,7 @@
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
+	bool			disconnected;
 	struct nvmem_layout	*layout;
 	const char		*name;
 	int			offset;
@@ -671,6 +672,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     struct nvmem_cell_entry *cell)
 {
 	cell->nvmem = nvmem;
+	cell->disconnected = false;
 	cell->offset = info->offset;
 	cell->raw_len = info->raw_len ?: info->bytes;
 	cell->bytes = info->bytes;
@@ -991,23 +993,50 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 		ret = layout->add_cells(layout);
 	}
 	if (ret)
-		return ret;
+		goto err_unregister;
 
 #ifdef CONFIG_NVMEM_SYSFS
 	ret = nvmem_populate_sysfs_cells(layout->nvmem);
-	if (ret) {
-		nvmem_device_remove_all_cells(layout->nvmem);
-		return ret;
-	}
+	if (ret)
+		goto err_unregister;
 #endif
 
 	return 0;
+
+err_unregister:
+	nvmem_layout_unregister(layout);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_register);
 
 void nvmem_layout_unregister(struct nvmem_layout *layout)
 {
-	/* Keep the API even with an empty stub in case we need it later */
+	struct nvmem_device *nvmem = layout->nvmem;
+	struct nvmem_cell_entry *cell, *next;
+	LIST_HEAD(cells);
+
+	scoped_guard(mutex, &nvmem_mutex) {
+		list_for_each_entry_safe(cell, next, &nvmem->cells, node) {
+			if (cell->layout != layout)
+				continue;
+			WRITE_ONCE(cell->disconnected, true);
+			list_move_tail(&cell->node, &cells);
+		}
+	}
+
+	nvmem_sysfs_remove_cells(nvmem);
+
+	/* Old cell handles retain data, never a departing layout's callbacks. */
+	synchronize_srcu(&nvmem->srcu);
+	list_for_each_entry_safe(cell, next, &cells, node) {
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
+#ifdef CONFIG_NVMEM_SYSFS
+	if (rcu_access_pointer(nvmem->ops) && nvmem_populate_sysfs_cells(nvmem))
+		dev_warn(&nvmem->dev, "Failed to restore provider cell attributes\n");
+#endif
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
@@ -1521,12 +1550,6 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 	return cell;
 }
 
-static void nvmem_layout_module_put(struct nvmem_device *nvmem)
-{
-	if (nvmem->layout && nvmem->layout->dev.driver)
-		module_put(nvmem->layout->dev.driver->owner);
-}
-
 #if IS_ENABLED(CONFIG_OF)
 static struct nvmem_cell_entry *
 nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np)
@@ -1545,18 +1568,6 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	return NULL;
 }
 
-static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
-{
-	if (!nvmem->layout)
-		return 0;
-
-	if (!nvmem->layout->dev.driver ||
-	    !try_module_get(nvmem->layout->dev.driver->owner))
-		return -EPROBE_DEFER;
-
-	return 0;
-}
-
 /**
  * of_nvmem_cell_get() - Get a nvmem cell from given device node and cell id
  *
@@ -1619,25 +1630,16 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 		return ERR_CAST(nvmem);
 	}
 
-	ret = nvmem_layout_module_get_optional(nvmem);
-	if (ret) {
-		of_node_put(cell_np);
-		nvmem_device_put(nvmem);
-		return ERR_PTR(ret);
-	}
-
 	cell_entry = nvmem_find_cell_entry_by_node(nvmem, cell_np);
 	of_node_put(cell_np);
 	if (!cell_entry) {
-		nvmem_layout_module_put(nvmem);
-		ret = nvmem->layout ? -EPROBE_DEFER : -ENOENT;
+		ret = READ_ONCE(nvmem->layout) ? -EPROBE_DEFER : -ENOENT;
 		nvmem_device_put(nvmem);
 		return ERR_PTR(ret);
 	}
 
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
-		nvmem_layout_module_put(nvmem);
 		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
@@ -1754,7 +1756,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 
 	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
-	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
@@ -1809,7 +1810,8 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 	int rc;
 
 	guard(srcu)(&nvmem->srcu);
-	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu) ||
+	    READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	rc = nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
@@ -1926,7 +1928,15 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 	struct nvmem_device *nvmem = cell->nvmem;
 	int rc;
 
-	if (!nvmem || nvmem->read_only ||
+	if (!nvmem)
+		return -EINVAL;
+
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu) ||
+	    READ_ONCE(cell->disconnected))
+		return -ENODEV;
+
+	if (nvmem->read_only ||
 	    (cell->bit_offset == 0 && len != cell->bytes))
 		return -EINVAL;
 
diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
index 409909e3244f..442947873591 100644
--- a/drivers/nvmem/layouts.c
+++ b/drivers/nvmem/layouts.c
@@ -118,6 +118,7 @@ static int nvmem_layout_create_device(struct nvmem_device *nvmem,
 
 	ret = device_add(dev);
 	if (ret) {
+		nvmem->layout = NULL;
 		put_device(dev);
 		return ret;
 	}
@@ -203,6 +204,7 @@ void nvmem_destroy_layout(struct nvmem_device *nvmem)
 	dev = &nvmem->layout->dev;
 	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
 	device_unregister(dev);
+	WRITE_ONCE(nvmem->layout, NULL);
 }
 
 int nvmem_layout_bus_register(void)

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
