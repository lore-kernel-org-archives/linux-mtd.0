Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD93260A5BC3
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2026 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Cwo4BdC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=exWIbblG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XAOJJqxyKyyjzlyxflX+tR+up/46tk5bg3v9VaAw9Mw=; b=4Cwo4BdChPfpHJQwlTHf3ayrRH
	3TckzxboQE4ZR7Owcs1S2S/mA6sydlS8BCc/rk1tqooASbbsJSuvQp7KpRn0Wu3dZCe34dyV4hTBl
	Fqar/uBHOfuUXyCXxLUtkmp6NUAlqdBCRJsM3Zk0JZM//e+SySjlnnpfWUkKJeyaa92zaKQhCVIhm
	YRwFaRjGvF04wZFThTDx1x+pc+j3jN20nuxHFEHNCb6cwNU/usBwhD+dkbigvX4OlUr7+V/1JsPiv
	XjDd38M8al+hIL5uS2NByrvRx9CSp4IMh1sqTa+puOpnLDOM/2tiX0JOs5TTxnJiNZ4a+O+YfOkaG
	KWnL6l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuh-0000000GBvF-13bm;
	Fri, 20 Nov 2026 20:08:51 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUuZ-0000000GBs5-2fGu
	for linux-mtd@lists.infradead.org;
	Fri, 20 Nov 2026 20:08:49 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-843cf077f10so1706704a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 12:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205322; x=1795810122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=exWIbblGc19VSUWcJa9eWczdEzi4GrPUvIIfsGDYxlBIhaFXKl+kaYBldKbbwJKqqm
         px73I/56nMPhE+x7bsQKTC9Ixtt0bhrBjEB5eZ0h6c+ZfuVVyrEoomg82lrDBqYVgRIF
         Xqdj7k9EAvavfiIBcp5W9IaM3sGqrZXMwXTCwVTsBNoKlJBXduI5pAkBNvM0XLQGgZSA
         J5X5wszhP5t3HbF2zEXsEAdXl4vzehU6MrsIQ2NQ0IFp6ZO5UqqYOiDOCxsIJ6vLNUSQ
         0iyVDX/XODmzpOYf9QI7fRe7tKGL+fQqoZdSusuOL/cv0oYAL8g7jWQzu4XVZpKc65oD
         5Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205322; x=1795810122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=k6XL55MTcNqI5aKOuZM5r/ptsCe2V3w8a98hOLfY61tTvlYne+3JY3oiv+lBslHCAW
         TgVD77LH0ochm+VI9wMZxlaP55Cs4VmcMHtnZ/nOxVdmCAEQlvRF7tgdLMpwjcRhDDOy
         4ngRvbtvtLb3eS4ovPpyc+DuI2LlT9geOFNzr2Qb4GN8te7aFnhCHyBuVT3MIzRTX/+O
         QLYQd1UUQdOg/XPb/Vn97oLN3aQOpxbQp5USJ88TOaxgZcII1cHbgYFzEaBgemCGo5po
         TlCZ2QJf9uNo48b0BFRceBpVIoaAJKD/cSEgPO8OCqHsV3GqkeI/pT9eIamGEJcdRoWw
         mBKQ==
X-Forwarded-Encrypted: i=1; AL+hErFN4yMXYLr+Dup0IMLD2/xzyK6tyBAsrMpeu8g6kcPxJM/iOY3JRCGjiT6mR4ms8PctHIjheKoLur0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8ny6qRdaxpG0wZSbPOGZR5L+x8TDndoKxqUHQ0hDSbwH46BysQ
	XLZM6IiTW1hYLDp9WsTm9octxxP1KRg0gmc5MVQ+Fxsb0xr1Jgjf+/Er
X-Gm-Gg: AYBFou3nfRwMG70/18Lov0K1oHyjcTePvlEa19lNAbKpEN9uBb3mQ3AoTe3j0Sdytwv
	qrNs7Gd3UjE35JsSkl0IHaAO3nyOhE226n1lP88SWNDPFRC3fCEN6k1yGlf23bVnV+Q4mxAkq8g
	LBmEkZHxebHHdQ0jbo2KZpwBXWe5rYMoGn1cZVJxHwApNG8ygKyz/9JhnOZmUM9aZ7qAVsPRyqP
	ImUCjltjxC57AjIARNgvohOBGGz1Dqn2IrQdDbbKhPQiCnRla96Hv5/W7QFMowQ9NWZ+qYklRyP
	HOugGcoPX/aE9BeI0r4UAoqZb4+10bDF7kY7XThwxWalRMXpcWxqcxc/KbCAuxCMSyg5WNvVf/I
	ySmSgSQhZAUuN4r2Vn5wT5jdDGNetiUGfsNHjSG5HewG5SILty9QLu6lkkQQ88Ix8EIdb0lR7J8
	DiExmPAtmjkhNl0vDgBxkT5wPaaPe+Xj3vC/8ASXKQ/zbHAAN0Eruy8rYnK9K8kHW3uzsnxIwTK
	aMPxDKQ38ecMli8LDAfrVhYNPlJCLsWEZRdHJoxiu00pwr1K6F1sKlb1FZ6D0yfZ8UTv6ntccPP
	ecrE454EUmOx1Fnx1AGbdxrmFUfAiU3g7HBclpF71rzIGPBH4fwUMa0/fzTZNy/psOmeQ9n6/OF
	uxHXhcbfeAdzTA8MRCrlOO2BJXse28DcgMXk8hrk0tHZpzh+oMNPHPvTYJXOHT6UVhTLaEwQu0E
	+l2dACePv/FweCT93ZGDpshzXtmJX2VzZnRY52xQ==
X-Received: by 2002:a05:6830:680c:b0:823:e626:2764 with SMTP id 46e09a7af769-863156221c3mr5320264a34.5.1795205322490;
        Fri, 20 Nov 2026 12:08:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86316822ad4sm2746249a34.3.2026.11.20.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:08:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 13:08:35 -0700
Subject: [PATCH v3 05/11] nvmem: reference cell entries independently of
 their provider list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-nvmem-provider-lifetime-v1-v3-5-523610652402@gmail.com>
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
X-CRM114-CacheID: sfid-20261120_120844_520708_5D593970 
X-CRM114-Status: GOOD (  14.47  )
X-Spam-Score: -1.8 (-)
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

Cell handles currently borrow entries from the provider list. Give each
list entry a reference and acquire another during lookup, before releasing
nvmem_mutex. Return that reference when the consumer releases its handle
or handle allocation fails.

This separates cell metadata lifetime from list membership, so a cell can
be unpublished while existing consumers retain its description.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 35 +++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 8c9dfd2e2a63..d9f1bb64a4a5 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
+	struct kref		refcnt;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -54,6 +55,8 @@ static LIST_HEAD(nvmem_lookup_list);
 
 SRCU_NOTIFIER_HEAD_STATIC(nvmem_notifier);
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
+
 static int nvmem_access_chunk(struct nvmem_device *nvmem,
 			      const struct nvmem_operations *ops,
 			      unsigned int offset, void *val, size_t bytes, bool write)
@@ -542,22 +545,30 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
+static void nvmem_cell_entry_release(struct kref *ref)
 {
-	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
-	scoped_guard(mutex, &nvmem_mutex)
-		list_del(&cell->node);
+	struct nvmem_cell_entry *cell = container_of(ref, struct nvmem_cell_entry, refcnt);
+
 	of_node_put(cell->np);
 	kfree_const(cell->name);
 	kfree(cell);
 }
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
+{
+	kref_put(&cell->refcnt, nvmem_cell_entry_release);
+}
+
 static void nvmem_device_remove_all_cells(const struct nvmem_device *nvmem)
 {
 	struct nvmem_cell_entry *cell, *p;
 
-	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
-		nvmem_cell_entry_drop(cell);
+	list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		scoped_guard(mutex, &nvmem_mutex)
+			list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
 }
 
 static void nvmem_release(struct device *dev)
@@ -584,6 +595,7 @@ static int nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
 	scoped_guard(mutex, &nvmem_mutex) {
 		if (!rcu_access_pointer(cell->nvmem->ops))
 			return -ENODEV;
+		kref_init(&cell->refcnt);
 		list_add_tail(&cell->node, &cell->nvmem->cells);
 	}
 	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_ADD, cell);
@@ -751,6 +763,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 	list_for_each_entry(iter, &nvmem->cells, node) {
 		if (strcmp(cell_id, iter->name) == 0) {
 			cell = iter;
+			kref_get(&cell->refcnt);
 			break;
 		}
 	}
@@ -1397,8 +1410,10 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
 				cell = ERR_PTR(-ENOENT);
 			} else {
 				cell = nvmem_create_cell(cell_entry, con_id, 0);
-				if (IS_ERR(cell))
+				if (IS_ERR(cell)) {
+					nvmem_cell_entry_put(cell_entry);
 					nvmem_device_put(nvmem);
+				}
 			}
 			break;
 		}
@@ -1422,8 +1437,10 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	guard(mutex)(&nvmem_mutex);
 
 	list_for_each_entry(cell, &nvmem->cells, node) {
-		if (np == cell->np)
+		if (np == cell->np) {
+			kref_get(&cell->refcnt);
 			return cell;
+		}
 	}
 
 	return NULL;
@@ -1522,6 +1539,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
 		nvmem_layout_module_put(nvmem);
+		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
 
@@ -1635,6 +1653,7 @@ void nvmem_cell_put(struct nvmem_cell *cell)
 	if (cell->id)
 		kfree_const(cell->id);
 
+	nvmem_cell_entry_put(cell->entry);
 	kfree(cell);
 	nvmem_layout_module_put(nvmem);
 	nvmem_device_put(nvmem);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
