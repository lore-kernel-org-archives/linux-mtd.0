Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3496A606A8BF
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WGnQNHY2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SjpcJ7pb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=s1iVTg4K0TwmLuYCYemrSbzspoq9zRiS5ILcU61bIxw=; b=WGnQNHY2ZoDJEyaLPCmlpcKDzZ
	sugsWNEV+iUcwFDFMPZMSIKKPyBIjQb8THvLSD11z1zs9todqxbOhLN03wX1WuppvB5kZYtsy/SHn
	T6vO11pLB/ZnH2iSxaWSTc4GTPkurKCHukpmmraGpbe5P/8dIySnxGMN2GOkmoVjInc8H6i0uXPRJ
	dfEo0KGMmM+9KOBOYz9ORyaejrZT5hT1318T0NWC3/kaOLX1ky90zKWyp3CjzK7XyZt0XHfecQCbl
	tXqFT0n1UEhf6z0UqN4uz/y0kE8ndS4E4GvbxyIpnVOhtZgUVXjANA43Iz0Rn7KwOe3pt3Dhp96Ub
	YqfYYDzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0q-00000006vNh-3i8H;
	Tue, 17 Nov 2026 19:38:40 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0o-00000006vJR-0VQ7
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:39 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-71ac798b8bbso136326eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944317; x=1795549117; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ark13/PyXZ6Z68o4079LEbmv4Z7dIMRuCxObn4ZXF1U=;
        b=SjpcJ7pbVJT8YLOe9oGwG++gKuLSO7o3RBTvw5SvbEOqh63eiDbkAreDmPc6JfttLi
         CoXZ0s70kxMiCDu7M9qtL6JOx/LR6HuFpsta7yvYqRUORii8hG7Bs6KSa/z0/qCZiTuG
         R3IrnDUeQPFcrTyLmbAULe4QHklnc6FNqfcdMJC4aqcdiIJ77l1gPFyaGsNSr6cBZhHH
         seoESSSc8gaZhz+XSiXmiKUQdWjgXquKr0JLobbbX32hOPzRS5GbJVCsNXcAEOxdkj/4
         kmMEY5DXP9yADEw5ilmgz20VukSI6lbblSOZsiGd40/asvheV8bRuXFlQ6b827r9clIo
         A5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944317; x=1795549117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ark13/PyXZ6Z68o4079LEbmv4Z7dIMRuCxObn4ZXF1U=;
        b=EU7dZefSksiNHanlpjHKThXnPkqL3x3KWkxVVtP8TrZftw/aZ9p499LGmFhbelPp5t
         CTFOb+0suzZ0R4Pv7VAREkOZvDsho27ynLUjtDLTPVN75Inn+FrY9vO7jiClBcxXr9c3
         EIcNmc8GyxORfAtt+1O96fTPRNGDubcEqA4DXR/M23RP6SOHQvpJ3S2iJMufqmuXSQfv
         PdPPo6lYPHgEY+7CzfJgdJAy6pX2Jk/KldhckRt2UzkIdhQb6280Q4fPgH2XAF2gVs+V
         j3FdHnOyag+qUjNiSH5kquF+jhAo772zBZy94YPJfBSgzpK/99pa8/Z6YdAxfslD8LTY
         Nj+g==
X-Forwarded-Encrypted: i=1; AL+hErHspCIW9t4qTTWAkw91ZjhxE+cJBHlczJqMyByJ0NlVt2cFwczjPG25i/SKG0X5LogYhyEo8hSlA34=@lists.infradead.org
X-Gm-Message-State: APuU4Z9XugjemGDYzPiYNnjqROZyPnx2uvzC2F4cENPn6xfQslMUUHoM
	GEGmdGVJc8WXw9bNjaYhG40d4RmU+yug4q+LgfcZLH6QWl6L2PQVc8lA
X-Gm-Gg: AYBFou0o5Dv4gveLARhyy1nC9Gz3MLtJFzK10XrdTQghrnQ1eduq1DqSaz5hZwK2bTs
	1zl8NVuon4R93SfgAD7qEcOlw8nXdBe5xwoCROMUaNhKlI7cE8UBQoP3JW9yET1AnNunPukhmv9
	Sbe3+HdW0KerGS7zLbg9PrCxmnDPrFIOizPlRI1jlaYzwlODgnuQBaTmdMRXgSa2i/oKieflbXV
	FWRNKWys5/bD3krWMnqopoxQ/5dHv/MkCFq/oGvcRfhoVYN5iJawxtoYAhWbqGdKlObSu+ZuZNw
	E1d8vxim8vaSy4l7JHi5+TzXrH9tzNEzvLnHNg5N3jj/L+yjkEpMyh6SxWB6BO/Lrx2ZLZuziik
	dDiyReEfN9w94Cn0pEYoxQj3j6pBRwrLW10qYZ4vvrCEuOdMdIU7V3wZrK4ArD86/hP0XVbk5JW
	PKb9/fFAEo/1G5NNRvkFEKAkdXYo2+WPOyvGgOGObc1ktpnpBFIhWg9lswhmViSffeWOapA0OPe
	oZa6iT+/z5SRWavUZLJuU6Rhrr/Uqs4qf4doA8yi27RubfwiyVKyUH87knkT+cbyomrjLsxfAGI
	9BV5MmR7ad4vYHNgG8XK2STuxUHqcqpy7JjUqpRban9ZEizcrPMSdVmCLfO0fgnE2CxNU0Zcpi1
	fVrJUJuA1D1Lxj5sDvqa4CtjfVllIZ16bMQHQzH9r/4sIuBAlJ3U5DHEPzLM14wnMsX4Iwya13O
	TBQ+sl5sI+wHCm1+HB3Stb+NWaNH6yivLwO/Jc41TJCi1EkjMzDF4=
X-Received: by 2002:a05:6820:1343:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-71b185aee89mr308329eaf.79.1794944316957;
        Tue, 17 Nov 2026 11:38:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:12 -0700
Subject: [PATCH 05/11] nvmem: reference cell entries independently of their
 provider list
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-5-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113838_178513_CA6DA195 
X-CRM114-Status: GOOD (  14.98  )
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
index 65d89498edeb..70b6126886d9 100644
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
 
 static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
 
+static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
+
 static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned int offset,
 			    void *val, size_t bytes)
 {
@@ -562,22 +565,30 @@ static void nvmem_sysfs_remove_compat(struct nvmem_device *nvmem)
 
 #endif /* CONFIG_NVMEM_SYSFS */
 
-static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
+static void nvmem_cell_entry_release(struct kref *ref)
 {
-	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
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
+		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE, cell);
+		scoped_guard(mutex, &nvmem_mutex)
+			list_del(&cell->node);
+		nvmem_cell_entry_put(cell);
+	}
 }
 
 static void nvmem_release(struct device *dev)
@@ -695,6 +706,7 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		return rval;
 	}
 
+	kref_init(&cell->refcnt);
 	nvmem_cell_entry_add(cell);
 
 	return 0;
@@ -761,6 +773,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 	list_for_each_entry(iter, &nvmem->cells, node) {
 		if (strcmp(cell_id, iter->name) == 0) {
 			cell = iter;
+			kref_get(&cell->refcnt);
 			break;
 		}
 	}
@@ -1408,8 +1421,10 @@ nvmem_cell_get_from_lookup(struct device *dev, const char *con_id)
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
@@ -1433,8 +1448,10 @@ nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct device_node *np
 	guard(mutex)(&nvmem_mutex);
 
 	list_for_each_entry(cell, &nvmem->cells, node) {
-		if (np == cell->np)
+		if (np == cell->np) {
+			kref_get(&cell->refcnt);
 			return cell;
+		}
 	}
 
 	return NULL;
@@ -1533,6 +1550,7 @@ struct nvmem_cell *of_nvmem_cell_get(struct device_node *np, const char *id)
 	cell = nvmem_create_cell(cell_entry, id, cell_index);
 	if (IS_ERR(cell)) {
 		nvmem_layout_module_put(nvmem);
+		nvmem_cell_entry_put(cell_entry);
 		nvmem_device_put(nvmem);
 	}
 
@@ -1646,6 +1664,7 @@ void nvmem_cell_put(struct nvmem_cell *cell)
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
