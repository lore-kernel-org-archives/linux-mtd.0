Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93B60A3802
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZrUzvZvb;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sIKTeYip
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XAOJJqxyKyyjzlyxflX+tR+up/46tk5bg3v9VaAw9Mw=; b=ZrUzvZvbSsik5WZvbADBFkfqEA
	HDxdTH5RYRNH1oG4KnWHl1K9jfJyyFVEHOy8GPwCEmP0C2Narrnc0pqWWrorMwbQIAw7g9H9i+xSi
	E0/VYRKp4ZsTYy5+lPrV1rw1rUdilzSajmdDsXwXuyLpv5mLx+WLcs8JX1RX6JGx3n99LH5c8Z9uI
	QUDRLJxzzFwCw83jcANCJztpSOn/ln6Y/e5dLnefWhSUocVbURalryx9qwKNnmUAl8OMvqELOsH1G
	+9vZ9uRy+a41TNcThMtRu/fR13yRz4q0j3oKfLKStyG9TrPqXl53XkhvTLTdSX+zTqJ66uFJI7daz
	v5zGoN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DZ-0000000Cgt2-0hsw;
	Thu, 19 Nov 2026 16:42:37 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5DW-0000000CgqO-2IAY
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:35 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-71ac798b8bbso1527597eaf.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106554; x=1795711354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=sIKTeYipL1RIsqAplI/oZIGHeByvigtLPuOI2FtaXjTnvtQyqIhtQn4ws1tSVPVpy5
         f74Xx3PJxhIKBg773IiM+URwb9DngACag57q9cyHckVYaCu+dht8ZfnAHIBwAb2dn5Wn
         9fYT9gsc3kgC6ND3LRAMx7LCkzH6tOOzcUEZLtsyrM8QWK2zDQ+kHKbA7vWkzUeZMIup
         xCi2+1POHCqUJF1Pxbw9UBwo1Ga29q+JojAHPwUkYDu0XmdxN4urXn/crbF8vjACbci+
         I6QrWDYilC+HYa1nHPtszzt7UQk2nIyy2QwzR4wzubfBetVEH4cvWmK4I1a3wQ9chByI
         x2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106554; x=1795711354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsukE2hzrDyY0pBT/cVWmR7uND2w7AnPFwrDXQRHILM=;
        b=0p/lWNIzTMSwOwi5gYNxCOwx1nxAM3TgIsDAtItjsjexrWEtrB8kbV14xMMY4t7x1D
         daeVAyaV8jBhsq9FNOMekRKvtobf2SWHhxNwMJMLW44WBPEme7wrx8QmjStNgkAWUHKh
         0II3xBjXVSRsp3vjPlpYQ6fglQR9sbhlTOLPTWOS1sY0vXFwYfOgNhR6kvyOOggIkdGQ
         SMysd57x8MfK9aSh+KYRQryeQdr0k6xyu1VzAXRUPUO2gcqf06G8vSFmADkuSM+9s7nK
         gyCI+zoC7VPKcON8USDuzFK0Z+pN9+Gk1Q/n5LWRUEyAnXWYGUQpo74KEIlRGx75BmkJ
         Yo6Q==
X-Forwarded-Encrypted: i=1; AL+hErFL7Xroq7/t10tmVqbQ6JUiLtOcfKA1s6RUpptijCfgLNc9SaNppigaC0t6ht3SLdxg70LWl/35xDY=@lists.infradead.org
X-Gm-Message-State: APuU4Z/bfWzpOBfnJjMTkhlaA8cSiZQLW84qWfbKcmiPRw+9eHLvJ5Ya
	nfANXIEtHL+ndb1GGwcwNLsjzE3xstYzA5AI8rKMuQ63QDXaqp3E6mkh
X-Gm-Gg: AYBFou1kp7D/FyjfKCUX/adXrf5/PeIEAmHUWSPyl5BmZN+h2LsB9BqU7XE2wqgqYdI
	freW/ngzGjx1jEN5403YWP7dajpMO627AvP8mJrxZ7J4ixC9xHPWlFdvL/EMWBBzkSbObyMFucG
	O7ToKUbORH9sZoLm3qWY+8IPCBNmAwdrhUO3dMJEt2zQlgigbh71PgvbjkjIMH2z6LEdOOHxHT6
	DMJVaC8Qj+7vcqzsTOMj1MVHsFZw/P+JzV42464Yt5LhA8+ueAzSSUJBc6RjKlVSYG7sxdvocNG
	kIpj5pcVhpnXgns2RuN130ddOcMGH0Lv7pSg2FIrU0dP/JsjP1MBvNzFymtr7ITAlKT7sv/QB/z
	NTjidEr2lQ+ThTeMHwpQ6mq6t64CttJAxa9U0VgVXsmWr83xjNS45AAfTWjDwsW4VwuXdGNjAwS
	mVssLQ1iA4JIkUbN/5wZh31OLFOG6Bj5RxJukdjBiU7XbKwNfYS52CleAg/7GNY1p5qWUlVlt/R
	2XEoWfPPNNNHYlJnNbg4babTFRqhtHoI1Xr45eRKXPJBUJkV/GjQRQNWw0s74viG/F2cAA7250Y
	pD2V78F5UR4xCEmn0Ns3XrBdlt/ESOU/dhQl5hb/5+K8vd+C9DIKQuXpbYGIGD6C56O2abA/Yiy
	fChVPqp16K55UP1wWRoC2kREuyons+pK7Loddfvf6dYQTsNdktsG7uHSGlNadzrNBQZe4Kq0VKA
	8XihcR638CJdEAYQDtHiFDbqPJhKLKZrkmJ3MyMG+10GikfLvav54=
X-Received: by 2002:a05:6820:a75c:20b0:71a:fdba:b5c with SMTP id 006d021491bc7-71b395c5a8emr68544eaf.53.1795106553752;
        Thu, 19 Nov 2026 08:42:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:33 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:03 -0700
Subject: [PATCH v2 05/11] nvmem: reference cell entries independently of
 their provider list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-5-8fca3ec5f18c@gmail.com>
References: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
In-Reply-To: <20261119-submit-nvmem-provider-lifetime-v1-v2-0-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084234_616789_8B196F30 
X-CRM114-Status: GOOD (  15.27  )
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
