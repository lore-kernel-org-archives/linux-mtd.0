Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047F2606A88A
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kQ8EQIWU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ddjzzziz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Yx1nGrhggvbHPv2dsx54zxz3lMwTFuO/GWuWvD9k7sk=; b=kQ8EQIWU+GjGJ7zEakv48KaJiX
	wtfE9kW68fRk8HoRTE22YU9ofSzKjsjx52nQwSl3y8O1Etf/81uURh4sQaRKoqJs83E38K0q8VbXh
	6XnUwEHD/GZ5pN6KwxfUH9zgiZSXlJqzPRhzAuDr0ID5fwDrrtByJ7Knw9LhSOf9KRDhW0li84udY
	oy7KTdeA9/sdhT1Aal6zHxajAbBK0F/khNHDfRB6n1BQ00ZzY+akIEgM6VVd+7U9nqKOw/TFvtJ14
	c386zuNhVsTv17tt9xdpmOIEgb8rQeTgc2rICIDOYycm6yklyckkn1C3zwFwjIwnMaeSzXl01C9A3
	vdzdc+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0x-00000006vVO-2DTv;
	Tue, 17 Nov 2026 19:38:47 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0t-00000006vPP-0Xtm
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:44 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-6e560e00a86so125818eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944322; x=1795549122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rFErE0i5Y2PWDxw+9q3X+0ibTPYPSnkikClXBrp3y4=;
        b=DdjzzzizHbtVgJZw+CrQD3ug7EZrnjOX13QwnCvHzrCEBOqMe2x3VJotE4mY9cUFJ5
         9V08llexho9bsjl1uL/e8r0JSpo/XUriEMvZG7XYXZyBCoejLQTPRHU6rCkOP2ERflo8
         NNzsjGr8ISiCXFPVsjOvjbqdD1gI5rFecvybA2LLCK21TCtMOTcNJQ9h4CKRKYPy3mei
         I433EkzetoXRFE5Cukbbz/S7YnAqq5JHsz5gPl393TX0ElAomEbdaNGwrDMseUue7oH5
         h7kDm5HGRKKCcZzWWZ1qGxBZgVVOmCzunG2PQtWqnGWpmxA9RA15k+rEXDZYyIQK+hHk
         fWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944322; x=1795549122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6rFErE0i5Y2PWDxw+9q3X+0ibTPYPSnkikClXBrp3y4=;
        b=AQ/PvN1cgOCIlKyClb5Gt2vqhCskNPVyFTHpRsY0yBLs+FTHERhC+8IlHlw5WZqFYf
         OPgo1Hea1WwtL7Qr7Hzc4VHF8pRPdwBZfPFLiQW69ZakzdCeVi8jBW8TSPv0upEXVBmQ
         oVVDcr9ELtHzZ9TTPnx27G5P2jj7OjD0rwrX+IDowlJwkaps1Gv7JBXQeicFpwgYi9ES
         vi6Hh9jayoK22EcbF2YWTvM6vUJg+MPJUNfghpPSKMgdxzOEcWFgMbJja/mResEgayLH
         DlH4awnEvOGOFIRPEQ7Hzl/mVYccu8hk8SMLjLWmPx4zhorMEAmnvRYNBSFoTYNi/YDu
         7wuQ==
X-Forwarded-Encrypted: i=1; AL+hErEEKmBKCUpoozkezwbVtjfl+Sktyv4w7AtCxH0VkfvspZTaIy1QRsL/e05JI4yXx84XNZT6RTitkYI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/SP9Ozl7bm0yA8he2svfaiI+DAYxsEq8ZJuZmSBUpPgn8j9rvU
	GZS0bZBu8kS20AOQiDLeYp01Hj5c4e178x+lmCQuGZ+nz5+YbEoOhUF/
X-Gm-Gg: AYBFou046FhEthJ9KFzJ3bKLmkPgmxIZn4ur7nUC6QGqFYAkenjsaUlZ96WyRo3EM9b
	AQ2Xiu8oSJH0suNhbjG+cpjj5DYXdPPaqqBqT2wU9zfNxzsOxjHdUGcoRa7kU3BeNLh5kn9IZIi
	FhBJm8B5bq2N6xXWS6MBwV5L+6reA50zDEdPb3ntzuHinveBjmCxb/z+/Ivv+/c5/WprOdgsmYl
	cSDsdmIEhBC7wVrYeKUXKqMQ0Akf9h2wxNhEgmimQ6k2Fd30Illt7nYiGnDv5XKaa1MoYDbNoA0
	TjO1zjg5SZ8EZIvmaDo8MJTgC5ezEmLuNbC0TcYJOG8eynQHfPCUAq1hE/wWOJTicIuoV3G5J/n
	9RfPYqQzVBPUmroHGDWfeGUDur+I8WT//AyGM+qdY/c7aZx3Xxcj7aQ0INmtuJW7RbsBabu6ibN
	3a6XZsOFOx3obfhMNA7yh1vUW5kU97CmwCHGl/ywoZnMyc5z7oeSrxH5alRTrr4PF11Fupazia9
	ZyphpR0XehcMKl0pPVQ4ZqENFqhUWHVEbL9FctCBDRz5RW1h77DsNPMro5GN7R0WBYJjQbfBScg
	PIDtzO3PH/SlfxHGs0aiMJTLv3roIHNvT6cZOEb9GCjvBTc8VSqRh1ZuPTmcVgXo26CAe43l5+o
	EY62naaUwSFjGYDXEVimtv7snwpuPz2wjA8wpntM9SKgoibujdR/rbKBvVPGt/pKAVeZyqGWNG+
	VnYpZQ5fshJwe5R0Q1ip8MOIMvOrkPz2+nKDgN7qIs374SpUS4LMI=
X-Received: by 2002:a05:6820:410d:b0:70b:a287:72b5 with SMTP id 006d021491bc7-71b18476f73mr234539eaf.20.1794944321863;
        Tue, 17 Nov 2026 11:38:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:14 -0700
Subject: [PATCH 07/11] nvmem: distinguish layout cells from provider cells
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-7-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113843_234893_8E361857 
X-CRM114-Status: GOOD (  22.40  )
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

Layouts and providers currently add cells through the same interface.
Record the owner when a layout adds a cell so removing that layout can
leave independently registered provider cells intact.

Add layout-specific registration helpers and convert all layout drivers.
Keep the shared U-Boot environment parser usable by both its layout
driver and the legacy provider, recording layout ownership only for the
layout caller.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c                 | 61 +++++++++++++++++++++++++++++-------
 drivers/nvmem/internals.h            |  1 +
 drivers/nvmem/layouts/fixed-layout.c |  2 +-
 drivers/nvmem/layouts/onie-tlv.c     | 19 +++++------
 drivers/nvmem/layouts/sl28vpd.c      |  2 +-
 drivers/nvmem/layouts/u-boot-env.c   | 22 +++++++++----
 include/linux/nvmem-provider.h       | 10 +++++-
 7 files changed, 87 insertions(+), 30 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 14cc70e8ce78..57c1da5ab547 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -29,6 +29,7 @@
 #define FLAG_COMPAT		BIT(0)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
+	struct nvmem_layout	*layout;
 	const char		*name;
 	int			offset;
 	size_t			raw_len;
@@ -726,16 +727,9 @@ static int nvmem_cell_info_to_nvmem_cell_entry(struct nvmem_device *nvmem,
 	return 0;
 }
 
-/**
- * nvmem_add_one_cell() - Add one cell information to an nvmem device
- *
- * @nvmem: nvmem device to add cells to.
- * @info: nvmem cell info to add to the device
- *
- * Return: 0 or negative error code on failure.
- */
-int nvmem_add_one_cell(struct nvmem_device *nvmem,
-		       const struct nvmem_cell_info *info)
+static int __nvmem_add_one_cell(struct nvmem_device *nvmem,
+				const struct nvmem_cell_info *info,
+				struct nvmem_layout *layout)
 {
 	struct nvmem_cell_entry *cell;
 	int rval;
@@ -755,12 +749,43 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	}
 
 	kref_init(&cell->refcnt);
+	cell->layout = layout;
 	nvmem_cell_entry_add(cell);
 
 	return 0;
 }
+
+/**
+ * nvmem_add_one_cell() - Add one cell information to an nvmem device
+ *
+ * @nvmem: nvmem device to add cells to.
+ * @info: nvmem cell info to add to the device
+ *
+ * Return: 0 or negative error code on failure.
+ */
+int nvmem_add_one_cell(struct nvmem_device *nvmem,
+		       const struct nvmem_cell_info *info)
+{
+	return __nvmem_add_one_cell(nvmem, info, NULL);
+}
 EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
 
+/**
+ * nvmem_layout_add_cell() - Add a cell owned by an NVMEM layout
+ * @layout: Layout registering the cell from its add_cells callback.
+ * @info: Cell description.
+ *
+ * Associate the cell with the layout rather than the provider.
+ *
+ * Return: 0 or a negative error code.
+ */
+int nvmem_layout_add_cell(struct nvmem_layout *layout,
+			  const struct nvmem_cell_info *info)
+{
+	return __nvmem_add_one_cell(layout->nvmem, info, layout);
+}
+EXPORT_SYMBOL_GPL(nvmem_layout_add_cell);
+
 /**
  * nvmem_add_cells() - Add cell information to an nvmem device
  *
@@ -882,7 +907,8 @@ static int nvmem_validate_keepouts(struct nvmem_device *nvmem)
 	return 0;
 }
 
-int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+static int __nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np,
+				     struct nvmem_layout *layout)
 {
 	struct device *dev = &nvmem->dev;
 	const __be32 *addr;
@@ -924,7 +950,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 		if (nvmem->fixup_dt_cell_info)
 			nvmem->fixup_dt_cell_info(nvmem, &info);
 
-		ret = nvmem_add_one_cell(nvmem, &info);
+		ret = __nvmem_add_one_cell(nvmem, &info, layout);
 		kfree(info.name);
 		if (ret) {
 			of_node_put(info.np);
@@ -934,8 +960,19 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 
 	return 0;
 }
+
+int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
+{
+	return __nvmem_add_cells_from_dt(nvmem, np, NULL);
+}
 EXPORT_SYMBOL_GPL(nvmem_add_cells_from_dt);
 
+int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct device_node *np)
+{
+	return __nvmem_add_cells_from_dt(layout->nvmem, np, layout);
+}
+EXPORT_SYMBOL_GPL(nvmem_layout_add_cells_from_dt);
+
 static int nvmem_add_cells_from_legacy_of(struct nvmem_device *nvmem)
 {
 	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 79ea56822ebe..667955893b5c 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -44,6 +44,7 @@ struct nvmem_device {
 };
 
 int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np);
+int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct device_node *np);
 
 #if IS_ENABLED(CONFIG_OF)
 int nvmem_layout_bus_register(void);
diff --git a/drivers/nvmem/layouts/fixed-layout.c b/drivers/nvmem/layouts/fixed-layout.c
index 635d448b3dd2..b97f39897a75 100644
--- a/drivers/nvmem/layouts/fixed-layout.c
+++ b/drivers/nvmem/layouts/fixed-layout.c
@@ -19,7 +19,7 @@ static int fixed_layout_add_cells(struct nvmem_layout *layout)
 	if (!np)
 		return -ENOENT;
 
-	ret = nvmem_add_cells_from_dt(layout->nvmem, np);
+	ret = nvmem_layout_add_cells_from_dt(layout, np);
 	of_node_put(np);
 
 	return ret;
diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/onie-tlv.c
index 4da3a704388e..99e7a5406b4c 100644
--- a/drivers/nvmem/layouts/onie-tlv.c
+++ b/drivers/nvmem/layouts/onie-tlv.c
@@ -95,18 +95,19 @@ static nvmem_cell_post_process_t onie_tlv_read_cb(u8 type, u8 *buf)
 	return NULL;
 }
 
-static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
+static int onie_tlv_add_cells(struct nvmem_layout *layout,
 			      size_t data_len, u8 *data)
 {
+	struct device *dev = &layout->dev;
 	struct nvmem_cell_info cell = {};
-	struct device_node *layout;
+	struct device_node *layout_np;
 	struct onie_tlv tlv;
 	unsigned int hdr_len = sizeof(struct onie_tlv_hdr);
 	unsigned int offset = 0;
 	int ret;
 
-	layout = of_nvmem_layout_get_container(nvmem);
-	if (!layout)
+	layout_np = of_nvmem_layout_get_container(layout->nvmem);
+	if (!layout_np)
 		return -ENOENT;
 
 	while (offset < data_len) {
@@ -123,13 +124,13 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 
 		cell.offset = hdr_len + offset + sizeof(tlv.type) + sizeof(tlv.len);
 		cell.bytes = tlv.len;
-		cell.np = of_get_child_by_name(layout, cell.name);
+		cell.np = of_get_child_by_name(layout_np, cell.name);
 		cell.read_post_process = onie_tlv_read_cb(tlv.type, data + offset + sizeof(tlv));
 
-		ret = nvmem_add_one_cell(nvmem, &cell);
+		ret = nvmem_layout_add_cell(layout, &cell);
 		if (ret) {
 			of_node_put(cell.np);
-			of_node_put(layout);
+			of_node_put(layout_np);
 			return ret;
 		}
 
@@ -137,7 +138,7 @@ static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *nvmem,
 		offset += sizeof(tlv) + tlv.len;
 	}
 
-	of_node_put(layout);
+	of_node_put(layout_np);
 
 	return 0;
 }
@@ -222,7 +223,7 @@ static int onie_tlv_parse_table(struct nvmem_layout *layout)
 		return -EINVAL;
 
 	data = table + hdr_len;
-	ret = onie_tlv_add_cells(dev, nvmem, data_len, data);
+	ret = onie_tlv_add_cells(layout, data_len, data);
 	if (ret)
 		return ret;
 
diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl28vpd.c
index 79de1e6947d0..1e65a0b6c61f 100644
--- a/drivers/nvmem/layouts/sl28vpd.c
+++ b/drivers/nvmem/layouts/sl28vpd.c
@@ -124,7 +124,7 @@ static int sl28vpd_add_cells(struct nvmem_layout *layout)
 		info.read_post_process = pinfo->read_post_process;
 		info.np = of_get_child_by_name(layout_np, pinfo->name);
 
-		ret = nvmem_add_one_cell(nvmem, &info);
+		ret = nvmem_layout_add_cell(layout, &info);
 		if (ret) {
 			of_node_put(info.np);
 			of_node_put(layout_np);
diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u-boot-env.c
index 33ec2350386f..f1fb206846ff 100644
--- a/drivers/nvmem/layouts/u-boot-env.c
+++ b/drivers/nvmem/layouts/u-boot-env.c
@@ -49,7 +49,8 @@ static int u_boot_env_read_post_process_ethaddr(void *context, const char *id, i
 	return 0;
 }
 
-static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem, uint8_t *buf,
+static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem,
+				  struct nvmem_layout *layout, uint8_t *buf,
 				  size_t data_offset, size_t data_len)
 {
 	char *data = buf + data_offset;
@@ -78,14 +79,17 @@ static int u_boot_env_parse_cells(struct device *dev, struct nvmem_device *nvmem
 			info.read_post_process = u_boot_env_read_post_process_ethaddr;
 		}
 
-		nvmem_add_one_cell(nvmem, &info);
+		if (layout)
+			nvmem_layout_add_cell(layout, &info);
+		else
+			nvmem_add_one_cell(nvmem, &info);
 	}
 
 	return 0;
 }
 
-int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
-		     enum u_boot_env_format format)
+static int __u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
+			      struct nvmem_layout *layout, enum u_boot_env_format format)
 {
 	size_t crc32_data_offset;
 	size_t crc32_data_len;
@@ -156,13 +160,19 @@ int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
 	}
 
 	buf[dev_size - 1] = '\0';
-	err = u_boot_env_parse_cells(dev, nvmem, buf, data_offset, data_len);
+	err = u_boot_env_parse_cells(dev, nvmem, layout, buf, data_offset, data_len);
 
 err_kfree:
 	kfree(buf);
 err_out:
 	return err;
 }
+
+int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
+		     enum u_boot_env_format format)
+{
+	return __u_boot_env_parse(dev, nvmem, NULL, format);
+}
 EXPORT_SYMBOL_GPL(u_boot_env_parse);
 
 static int u_boot_env_add_cells(struct nvmem_layout *layout)
@@ -172,7 +182,7 @@ static int u_boot_env_add_cells(struct nvmem_layout *layout)
 
 	format = (uintptr_t)device_get_match_data(dev);
 
-	return u_boot_env_parse(dev, layout->nvmem, format);
+	return __u_boot_env_parse(dev, layout->nvmem, layout, format);
 }
 
 static int u_boot_env_probe(struct nvmem_layout *layout)
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..e0638bd50d1f 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -144,7 +144,7 @@ struct nvmem_config {
  * @nvmem:		The underlying NVMEM device
  * @add_cells:		Will be called if a nvmem device is found which
  *			has this layout. The function will add layout
- *			specific cells with nvmem_add_one_cell().
+ *			specific cells with nvmem_layout_add_cell().
  *
  * A nvmem device can hold a well defined structure which can just be
  * evaluated during runtime. For example a TLV list, or a list of "name=val"
@@ -173,6 +173,8 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
 
 int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		       const struct nvmem_cell_info *info);
+int nvmem_layout_add_cell(struct nvmem_layout *layout,
+			  const struct nvmem_cell_info *info);
 
 int nvmem_layout_register(struct nvmem_layout *layout);
 void nvmem_layout_unregister(struct nvmem_layout *layout);
@@ -214,6 +216,12 @@ static inline int nvmem_layout_register(struct nvmem_layout *layout)
 
 static inline void nvmem_layout_unregister(struct nvmem_layout *layout) {}
 
+static inline int nvmem_layout_add_cell(struct nvmem_layout *layout,
+				       const struct nvmem_cell_info *info)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline int nvmem_add_cells_from_dt(struct nvmem_device *nvmem,
 					  struct device_node *np)
 {

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
