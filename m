Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EDC606A882
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=inVTicqo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U2N4GIbY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=68n4huWZqOQN6gjqirP42Ep5HsQln6Qi7VwpdPaTyfE=; b=inVTicqop2NRbi1+6waoesQp/2
	3Fw+sqXpOfDJSRaQ7Gy3oYko/uSVx9uxWt5M+T/dopXp33VByDOntzwasB8JC36v7k/ab7JU76f9N
	70ssWTR+xFJAXnU7RKabhFLv6+30qBoi1+uctd7gPO24UcSpjykLXcD3cf41sSiqM8TlK2Ecubncl
	j8bFtlZS2NkBO3CvPdZqsf4pcp5+Q6UqJ85BhzdiWzXpFX56h+CHNbJNVF0CAplRgfxyjxWuYLF4P
	c5SD323Pq6iLKrQA82CEg7cpWgWjnttdJpxJ9KU9JUOwjGM68F3Lo98ZwfvrTIhc40OLhIEEkuwUK
	XA9UTXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0t-00000006vQT-0aUQ;
	Tue, 17 Nov 2026 19:38:43 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0p-00000006vLb-2Lgc
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:40 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6d290b10a35so95676eaf.2
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944319; x=1795549119; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NZ1YswqeB2Jx0L5yqWiurGJZ9TtP6lnIvyd7e3kWs8=;
        b=U2N4GIbY76J2F1NZfW3OJRZrYzi4DVAgLlE4G51zgMM/+U+kwa7SSOjoiKKiQU/giq
         NFGLu86oz+hrTnYSn073nEhj80qLPZ9yEb0B0PVRIjflr3CIz3JQR/4xgLyq/oWTmnod
         yllVOr3khjsEAUCBsCGdyu0Ab3RXmG27U1cjVoQcn9DG/ltPBZR1iW4OpxeW54xOI7iq
         kPfdhL05GDcmdLM/lgJsKOkwPWtXrtc7zruqhPf7xy0v2X/dYRc6jWYwzHnF1Ng0mPlY
         LMzDpEuoNm6rRJ8KEfL81WSf2W459biNIt0p46gH8JdQb7/sRea5XlXg4s7kyIedgvM3
         ON3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944319; x=1795549119;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NZ1YswqeB2Jx0L5yqWiurGJZ9TtP6lnIvyd7e3kWs8=;
        b=ryft041geV/EvUonDwdhPLE+eafmikisXyxa2vcEyB7P0edBaBzkKZTEwaCwZ6s1Ad
         ZkvAdemOUG3ZxJ7wNnBHfUq4G5wuqbiuG/swbjvOw5Os4T8PmOerTmBcwBfbPgjnhvDV
         3i7l1ctc2bZdi8tpGMVb7fT+xYe4LuAV3kODJACYMbitpckq6/rHYp/FQsZI4vXd/Etu
         WE6HzhXbr+mtjKghuByUl/LtunWBJ7QHn/R77Uqj3RG9MLFa0SzMlTgzlwNR6Djtba8b
         a/Y21aUZBfGDi1S3rekvp3A82eiS03lJNvLRSY1ad7ifXZIN0TJ2WPRgA95vznvoifQR
         Jodg==
X-Forwarded-Encrypted: i=1; AL+hErH9DkdFDqufCkqVtv8Z3oIwVPpnsZI8dL2IqOJ8hzXPaXC0bpwHOPQ6v6QY/BecpcCauawd4duSbW0=@lists.infradead.org
X-Gm-Message-State: APuU4Z/D6Jxj/rl9wUfrNhA87CpRb0DIhtMjMDlKXaq2WT+EIv1d3tRy
	5eQVxTxF6xcSvKzxRPeFlPLKA6XyHN5bTHl91ATV6gaYRogD/IcX+9aC
X-Gm-Gg: AYBFou3jsIYzZLh4/AjhFrJU3ffipzNamlpU9PgzyUoH440Q16/5dadh9M7wL2eIzZp
	PNGUSa4eyZJ5mc9ltpgQc+h+njkIT+dp/G4e6WQbPkmd0eNnkF3TEGOwBXn0xX9MceDXuMs6JdI
	9/M41FBMN4EV7GW+aIfoLtoWBBa8uE2YockW6NulhKcg8z473ONHi3yh+SSIBcO5A4ilC2xExl1
	VSyxrOi8Dt9go65XNrFaTgfEXXuNDdRWvsJZ94PReUgMzYnmo+iwgb5jpyjbQ52mnJ1PdKDXjxL
	O/LkTjvhQ34BgkvdJEFVIJlMKKdXr6YUlJK01ac1CzNTXYJE0/x4GzF7dnMFLfztWCWoHywYUZE
	FSgI6N9js3toKnac+SpOiM/By3kMx9OpsuOasPrWYGQZZeOnlaQXyG0Vi+wVQ/xtUHQ9FY1bWCx
	yZIhC5dl+TnIzhEkhxgL53fqyodF8vUjoTHC+vJzDr8fIuJ0AscMTqmR/kdTA4WcAaGmMC598S7
	lAyJtGOzp+s8w2++xKSBeEcXwdwzifOc6Z/11FjfjJ+rD4VNAYAgdQg7vnXFT72+Mjk9ix+LvYq
	3eBlhecckZfij1yw43HzZUBhlRYl4wHVttu9XoCN3U+463/rWX1xLfVt/5P3ozPIaOi0qXSwrYW
	KemA28zL/iz8a3hAV7TBVOkr/WIXpTLj8Nas1mOyIotyR67YvpPFxzbL9zzvHQQFklL5x1A6GAs
	OdrHIvKOvzqLA/1rhNLjnde6clpuvHFM3+6dyrECeCJqunHzKYsRg=
X-Received: by 2002:a05:6820:a747:10b0:716:d143:46b5 with SMTP id 006d021491bc7-71b1846e9b2mr216447eaf.29.1794944318682;
        Tue, 17 Nov 2026 11:38:38 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:13 -0700
Subject: [PATCH 06/11] nvmem: manage cell attributes independently of
 device resources
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-6-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113839_622899_BDAA1086 
X-CRM114-Status: GOOD (  22.13  )
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

Cell attributes are populated once and remain until device deletion. A
layout bound after provider registration therefore cannot publish its
cells through an existing group, and the group cannot be refreshed when
cells are removed.

Keep the group in the NVMEM device and explicitly allocate and release
its attributes. Each attribute holds a cell reference until sysfs has
drained its readers. Rebuild the group from the current cell list, and
unwind partial allocations if population fails.

Serialize group replacement separately from cell-list updates so removal
can wait for sysfs readers without holding nvmem_mutex. Remove the group
before device deletion on both unregister and registration failure.

Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c      | 127 ++++++++++++++++++++++++++++++++--------------
 drivers/nvmem/internals.h |   3 ++
 2 files changed, 92 insertions(+), 38 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 70b6126886d9..14cc70e8ce78 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -13,6 +13,7 @@
 #include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/kref.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
@@ -496,59 +497,102 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
 }
 
+static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * const *attrs)
+{
+	if (!attrs)
+		return;
+
+	for (int i = 0; attrs[i]; i++) {
+		nvmem_cell_entry_put(attrs[i]->private);
+		kfree(attrs[i]->attr.name);
+		kfree(attrs[i]);
+	}
+	kfree(attrs);
+}
+
+static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	lockdep_assert_held(&nvmem->sysfs_mutex);
+
+	if (!nvmem->sysfs_cells_populated)
+		return;
+
+	device_remove_group(&nvmem->dev, &nvmem->cells_group);
+	nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
+	nvmem->cells_group.bin_attrs = NULL;
+	nvmem->sysfs_cells_populated = false;
+}
+
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+	guard(mutex)(&nvmem->sysfs_mutex);
+	__nvmem_sysfs_remove_cells(nvmem);
+}
+
 static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 {
-	struct attribute_group group = {
-		.name	= "cells",
-	};
 	struct nvmem_cell_entry *entry;
-	const struct bin_attribute **pattrs;
-	struct bin_attribute *attrs;
-	unsigned int ncells = 0, i = 0;
-	int ret;
+	const struct bin_attribute **attrs = NULL;
+	unsigned int i = 0;
+	int ret = 0;
 
-	guard(mutex)(&nvmem_mutex);
+	guard(mutex)(&nvmem->sysfs_mutex);
 
-	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
-		return 0;
+	__nvmem_sysfs_remove_cells(nvmem);
 
-	/* Allocate an array of attributes with a sentinel */
-	ncells = list_count_nodes(&nvmem->cells);
-	pattrs = devm_kcalloc(&nvmem->dev, ncells + 1,
-			      sizeof(*pattrs), GFP_KERNEL);
-	if (!pattrs)
-		return -ENOMEM;
-
-	attrs = devm_kcalloc(&nvmem->dev, ncells, sizeof(struct bin_attribute), GFP_KERNEL);
-	if (!attrs)
-		return -ENOMEM;
+	scoped_guard(mutex, &nvmem_mutex) {
+		if (!rcu_access_pointer(nvmem->ops))
+			return -ENODEV;
+		if (list_empty(&nvmem->cells))
+			return 0;
 
-	/* Initialize each attribute to take the name and size of the cell */
-	list_for_each_entry(entry, &nvmem->cells, node) {
-		sysfs_bin_attr_init(&attrs[i]);
-		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x,%x", entry->name,
-						    entry->offset,
-						    entry->bit_offset);
-		attrs[i].attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
-		attrs[i].size = entry->bytes;
-		attrs[i].read = &nvmem_cell_attr_read;
-		attrs[i].private = entry;
-		if (!attrs[i].attr.name)
+		attrs = kcalloc(list_count_nodes(&nvmem->cells) + 1,
+				sizeof(*attrs), GFP_KERNEL);
+		if (!attrs)
 			return -ENOMEM;
 
-		pattrs[i] = &attrs[i];
-		i++;
+		list_for_each_entry(entry, &nvmem->cells, node) {
+			struct bin_attribute *attr;
+
+			attr = kzalloc_obj(*attr);
+			if (!attr) {
+				ret = -ENOMEM;
+				break;
+			}
+			sysfs_bin_attr_init(attr);
+			attr->attr.name = kasprintf(GFP_KERNEL, "%s@%x,%x",
+						   entry->name, entry->offset,
+						   entry->bit_offset);
+			if (!attr->attr.name) {
+				kfree(attr);
+				ret = -ENOMEM;
+				break;
+			}
+			attr->attr.mode = 0444 & nvmem_bin_attr_get_umode(nvmem);
+			attr->size = entry->bytes;
+			attr->read = nvmem_cell_attr_read;
+			attr->private = entry;
+			kref_get(&entry->refcnt);
+			attrs[i++] = attr;
+		}
 	}
+	if (ret)
+		goto err_free;
 
-	group.bin_attrs = pattrs;
+	nvmem->cells_group.name = "cells";
+	nvmem->cells_group.bin_attrs = attrs;
 
-	ret = device_add_group(&nvmem->dev, &group);
-	if (ret)
-		return ret;
+	ret = device_add_group(&nvmem->dev, &nvmem->cells_group);
+	if (ret) {
+		nvmem->cells_group.bin_attrs = NULL;
+		goto err_free;
+	}
 
 	nvmem->sysfs_cells_populated = true;
+	return 0;
 
+err_free:
+	nvmem_sysfs_free_cell_attrs(attrs);
 	return ret;
 }
 
@@ -563,6 +607,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 {
 }
 
+static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
+{
+}
+
 #endif /* CONFIG_NVMEM_SYSFS */
 
 static void nvmem_cell_entry_release(struct kref *ref)
@@ -1000,6 +1048,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	rcu_assign_pointer(nvmem->ops, ops);
 
 	device_initialize(&nvmem->dev);
+	mutex_init(&nvmem->sysfs_mutex);
 
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
@@ -1108,6 +1157,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem_destroy_layout(nvmem);
 #endif
 err_remove_dev:
+	nvmem_sysfs_remove_cells(nvmem);
 	device_del(&nvmem->dev);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
@@ -1136,6 +1186,7 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
 
+	nvmem_sysfs_remove_cells(nvmem);
 	device_unregister(&nvmem->dev);
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index bc7a99f5aefb..79ea56822ebe 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -4,6 +4,7 @@
 #define _LINUX_NVMEM_INTERNALS_H
 
 #include <linux/device.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/nvmem-provider.h>
 #include <linux/srcu.h>
@@ -37,7 +38,9 @@ struct nvmem_device {
 	struct nvmem_layout	*layout;
 	struct nvmem_operations __rcu *ops;
 	void *priv;
+	struct mutex		sysfs_mutex;
 	bool			sysfs_cells_populated;
+	struct attribute_group cells_group;
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
