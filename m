Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C9B60A5BE5
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+84Lzsp;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUJukf4J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=36jsy3wP6nwB26w4263VHfbcykwYmnr33TtUSWbfUV0=; b=q+84LzspbU1X4OVtJSL8rLpSQx
	ZZlk/vpi3KH0/50YTmJlnbTsda1fbDaOuAGO0U1dKCM3fVDy9dp/ehTONUcW4LKPqQ+5epYj/ULXZ
	aW8Jo7Cv/ojDB9gY8Fvu+9LVaUof/XmtFxbaJLJTBv5E5uQ4QnGPs2RxJqGB1MXA8zgUXRRLSTmdo
	N6MoYXJmtSHBWCb0TvJWOBS4VOemtGJODrX6OqMJCK939SRrvTOAx9MtDLd+BULwQYB+3Ay0WMTaS
	2c6Lfnt4Mu0dPxI3Ld5ie5TeH7JGVmF+KoicJq184pLKAZ/L+QtXvNKYSt+yEMk2uSb7Yscmd1OHg
	8PMqsSZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUun-0000000GByt-2M4N;
	Fri, 20 Nov 2026 20:08:57 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUud-0000000GBsx-2x2Y
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:51 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-8629ef48703so750194a34.3
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205326; x=1795810126; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=RUJukf4JgIUbM/STi96eoHIH2ySto2fpkJIiSPwby5x03qQ8tBTNkBtCUkjmFRpSfU
         OIZrn0RLIm2fgLQ8vrt+msvoDd4ldvzbZrGs79yOaB56U9CNc/Rfz2TuC6R53emsW9gV
         K3fNCw5JgTUCjvBq6HrjxFD5dHv1xKqIPV/tZdJVwqaGfls7QFEwVt3+Bm1Oh5x+YSJi
         SIVHpOCc/3CL2FrwTsBchoH0HkEsVTKp8VVKYHtIxKmkbxeT7UxIoAdwGZbGhptUjTHr
         6grgVzd3JQaACauGgXoCialw/C+JvQbGuCwSeHt6X+03/Y2itdHyNbvJtXkfq15DGEfF
         dzZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205326; x=1795810126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYu3SjHwdMXAbFGNDToBWPsdFI28fb8memjlT/fnNdQ=;
        b=yI13dqLXwZ1MJm90qb7tLIkOg8hpCTEHgNS4XTX2TuUv+ljpJQZN/ihY1YANfAbjSP
         e2Gzd9oHT/2Kh/sZLysD+Ns0rS9ZNzzeENOvl/KwpvTrpPXFDeGNPoKKjrdE3J4ddStM
         6G5KIMyedkgYO5JPyC9WGNvVnWIuNdQnvfFePS2Z5yMGv0z0krolvwFEx5agFzXww57s
         5i4jJGKU2AUApvejxgRidA6Q5XLHQO3Jf2tBgdTdbSRo0PFqilClzQik9zhNnabjXVco
         uIfI2KYJ5hZv2FMtq2QrV0z4vBYBgXn1+IBtJNAgw2THDaoOti6G/4aQ7nA7i14ynFBJ
         lpjA==
X-Forwarded-Encrypted: i=1; AL+hErECRpuf+QvZU+YIxseF/Vvwqi11TzQZcWNKYlZQdrmW6MF2Adrg3Um2gDWAeUSNTwwWxSjd7ltBuKQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z+fzG9Bm5Fh+3qz42/QOit7oswtqCzADGB0rlvfN1IlmzJ5tKJ4
	QaoqdA2O/Msvt2/GqER+AAd1/HcexFMPQ+6FmFT3AULFrba3WbXmBfnKUnC53jNC
X-Gm-Gg: AYBFou2hgl/sPxf724qsZUNsH7MKEsZiZPhJmioxEw1d+gB/y+LlRxIzRBylpuY60UX
	KQaptuNSJB4y/DeDfOXSjEb9iD2I0kceS5AY0xUO29N7fLD/GddFHxGBAvU5ID+QjPAq/wxZiUA
	IezmPUwaH3jZ2dmmnHViBnLKdDD2mCIOk7zdpIsYmuOXQeft6V39ERVnkUhp+NZXLzNeglgEYaa
	yOjM6ZbNGzF+FXM/TQpEsiCH8yr1750a4DocFRmzJG5+e1rGX5vkGVWbez7t0Y3z5nKQuU4EUgn
	BPcGn6rJAy2nXq4pbo7+a4LZVv7VgTai7ASCvJYB2kjvbNhD273hjeWmndmhkv6cJLysjMLG7Wc
	cNlgD1o7vIA/sT12xL6g+zapVfHMm9F5zYw1lqO5kJffAQ2Xd3/j252EsI5UfR0s+gFJPAsOS/G
	fsJBUAK+y4lz/dUdT58D+QhHs2MLqNupYVHU3JfD3X0PxpLzTQSZizECNQavofUsFPJLn9DQNKl
	3LVRe3jximAv7u07CdSvkpHNO/ewOSZMcr85Iy/jXl3hWR9qTgmnlz+F5q3t+1Ag1p7pM9tBQu8
	OrngFfmnM6XzCK67toG74zuE5w3tsJIOih3SnprorvwTpL3YMCuVeaxfqiyVbzg5qh3QI/7eUMS
	lGFcaHlgMfl0g48C6ihzhxfYD1dCjbX/sKcSqqhuqBVM9g42SGwg1aurAsFQUhQXYZ4NsPIOydP
	4SV4Sww7/uGcurotpTYGCIxpFtRQO2kHWDV6j/+ybrz509CoyrZlOuWlCS8DzOkmiY6braEXTfy
	Q==
X-Received: by 2002:a05:6830:448d:b0:862:a901:2202 with SMTP id 46e09a7af769-86315657d67mr4632724a34.17.1795205325715;
        Fri, 20 Nov 2026 12:08:45 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:38 -0700
Subject: [PATCH v3 08/11] nvmem: disconnect cells before removing their
 layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-8-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120847_888874_097BECDB 
X-CRM114-Status: GOOD (  18.92  )
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
 drivers/nvmem/core.c    | 78 +++++++++++++++++++++++--------------------------
 drivers/nvmem/layouts.c |  2 ++
 2 files changed, 38 insertions(+), 42 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 49e80389e198..edc2f61e6e0a 100644
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
@@ -652,6 +653,7 @@ static int nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
 						     struct nvmem_cell_entry *cell)
 {
 	cell->nvmem = nvmem;
+	cell->disconnected = false;
 	cell->offset = info->offset;
 	cell->raw_len = info->raw_len ?: info->bytes;
 	cell->bytes = info->bytes;
@@ -976,24 +978,44 @@ int nvmem_layout_register(struct nvmem_layout *layout)
 			return -ENODEV;
 		ret = layout->add_cells(layout);
 	}
-	if (ret)
-		return ret;
-
 #ifdef CONFIG_NVMEM_SYSFS
-	ret = nvmem_populate_sysfs_cells(layout->nvmem);
-	if (ret) {
-		nvmem_device_remove_all_cells(layout->nvmem);
-		return ret;
-	}
+	if (!ret)
+		ret = nvmem_populate_sysfs_cells(layout->nvmem);
 #endif
-
-	return 0;
+	if (ret)
+		nvmem_layout_unregister(layout);
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
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
+#ifdef CONFIG_NVMEM_SYSFS
+	if (rcu_access_pointer(nvmem->ops) && nvmem_populate_sysfs_cells(nvmem))
+		dev_warn(&nvmem->dev, "Failed to restore provider cell attributes\n");
+#endif
 }
 EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
 
@@ -1506,12 +1528,6 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
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
@@ -1530,18 +1546,6 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
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
@@ -1604,25 +1608,16 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
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
@@ -1739,7 +1734,6 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 
 	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
-	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);
 }
 EXPORT_SYMBOL_GPL(nvmem_cell_put);
@@ -1796,7 +1790,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
 
 	guard(srcu)(&nvmem->srcu);
 	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
+	if (!ops || READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	rc = nvmem_access_locked(nvmem, ops, cell->offset, buf, cell->raw_len, false);
@@ -1919,7 +1913,7 @@ static int __nvmem_cell_entry_write(struct nvmem_cell_entry *cell, void *buf, si
 
 	guard(srcu)(&nvmem->srcu);
 	ops = srcu_dereference(nvmem->ops, &nvmem->srcu);
-	if (!ops)
+	if (!ops || READ_ONCE(cell->disconnected))
 		return -ENODEV;
 
 	if (nvmem->read_only || (cell->bit_offset == 0 && len != cell->bytes))
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
