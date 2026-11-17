Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1EF606A333
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l9xAPEIu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQG9YTt0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=v+j1rQz0hltj4OzTMUArq9aNKpPUeAVQpLmzeGQpNuo=; b=l9xAPEIuOektsXJJeAX4Sif4Jw
	7hrEmjM91PiOOK80JxgYzUS0M0zr71/mkCP+F4WZDVNB4a4SOYD+oAb3VYWYp7hpn8RT+LeE7YGu0
	lg5JuazNwGPQyfCCqyHWiT/uARgeJpA8q4Ok+ZGWL2pVALd1Md3Dp38DjRQYL7+V9sgqyAp1CVONz
	67zsSNY2OdaeaZzVY60gSJeZQP+8Dum3S5m28n0TKAgYxHW0/uwvvqrmDLLVhTvBWV+c7wb0I/wYV
	jWgdsUlIiBG99ZAJxu7oZ5lO5m9wahyKz2JSTsP2jFGVA6OB160pDWVQTL8kxNExgBfD9kqWxLDAo
	SCTKmtJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0l-00000006vGr-1qdm;
	Tue, 17 Nov 2026 19:38:35 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTP0i-00000006vF8-0tsd
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 19:38:33 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-71ad5f20016so172024eaf.1
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794944311; x=1795549111; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4G14ey9cBLBk2X2B6diBYnPvevqumzkjH39N3CiTGc=;
        b=QQG9YTt0BUs+/nVbx2Wxp6nVN8rtPBaQwyDZ0IB+RH+lX+pY9nzY1na61CeleRxQNY
         UO/6CtyNX+VzSWjTvkiLfGIUGKDq5zTP5QoMup+Z7qbkNlt8TOwv3cqn4vzGXbYhmWRc
         Jd0dtiLOrHostt2Y1Ho8TREvaCbMGRs5Ml8zX+3Zc68G/b1ynalfU57pcwBeNiARtOq+
         PhjFdtKbkiD4j7QjJ8L1HVS2l1g7Gw+2Fy4I1+3biWpZNBejNO7iOtwk8PRp84BCgIVs
         7yb2yUhD9t3oXJkJyQQs7cCLG+lL4ib2BrABJ9zWnBriamGA/sYUpluDLPYqE+ZWO4mO
         S+bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944311; x=1795549111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4G14ey9cBLBk2X2B6diBYnPvevqumzkjH39N3CiTGc=;
        b=CvFXDkXUNkkPwzxaYjmtW8FzH1j3FqRFNG94mE9qyJGpm+WyCgALI6Bf0Co9ay7a/q
         F4nRsRACK+wrmbmZIQ+FXPUila92pCkxIcag+/bbldTaLofqx3+XlB3jvpAeRGlUIE71
         mPdsauTDpiZGyON3sr6xD5NvcL4PjAkjJ6sR8iLQtEyCqcDf+zK8jIIWmWPPhc7k8j8J
         REVjvwc7zSQNa/bAlBl+64WPk4nmp8U6gucppBHArpwqUfDBRpA2qpzKFFad2f/V88mm
         7Zo+n2XzyA5LycDQK5AhGLyeQWtbzaGdMJcQfI/4wHVQiX8p0RX9tX/O7iF1n17YxATX
         05/A==
X-Forwarded-Encrypted: i=1; AL+hErFnDirq1rD/01ae+mjwT14aOH1sYv8z0N3FhYTI2udrV7UVzaLDSDB4i0tksS6njjiegSmOrWah/z0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+Arbw18xRMg1rUwjHGlrAGaOGhZfWEeA1M7ib8avkLG7eqfIuF
	YAHT0sJXTBd1Ba1oT+zYFynGWCRmpyNQNt5v9dMiki8USI7qP+Jh+hRY
X-Gm-Gg: AYBFou02XDoEdXj/mBXs32xGtRRi/lT1qpeHLMJBSsLnXQP+wXQFeygi51PUYWQB1AR
	ZA23sW6CisgrmQSiTpAW/jTS6PvfIGKswTx65J0m52jdCR1JnVVKQJzdyYQI3M9CmdoXfz9D+an
	e9SfaPSG1sZQXsMcPqy3wDlCZw/AgtSEDoDjpNUGIrTNhOyZQ86uhWozJvU3q9R4ioAuU4yXpU5
	Wry4YJLJShMboPCPjazwiQLn52UMtoEmgVbRF2H4iHRy0DWY+6mY1Of/EuAwM2SQCgE6SyTfhPF
	eIW5/iECCJDFx6htVUYf4x9xOQs9LswfhmZcC74uHcDOHRv7zOE88Z5Ihx5afcyW5GWxA0kB8lK
	u3GpM/2nXnUq67cnzgFa8Tu1XqLtt9wZQXEI99S3KYn1+2wWDh/3VNonNL/u51yLDULvRKAv1aA
	EB09N/PAIzrqoFS8A4Cg1nNbwyrw+XIr/t593dZNFs/WJ75fnr/Y1D4OU1MetlLFELaMzDrlllt
	JWM54NOW1SKcry0Vr4sEWmFpTZtUIAg7Xj2BxCaAu2R2wo+1KiYWWPc9y3CvYz/L+gcRhkt47Nd
	LtPi+MH7UmtevD5yzT8ahLp9LqZqja3u+kKRpDGc+4wJj8Nd4qM1OnyFfTu3V12D/3lylQmvArB
	lhs2W6hA3NCrU6wst9z2kL43DR9mmg+4KIsgriJScqqskO5cfBnLEMltfPLCAdy0xvEh1uCF8HD
	k0q13N2Vqa/8CQ/tex4sX2c5d/4zEtF14bvhekLAsV3aJbl700ZnU=
X-Received: by 2002:a05:6820:504c:b0:6f7:c0ec:1a66 with SMTP id 006d021491bc7-71b1853c1f3mr255396eaf.29.1794944311378;
        Tue, 17 Nov 2026 11:38:31 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b192272ffsm146281eaf.2.2026.11.17.11.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 11:38:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Nov 2026 12:38:10 -0700
Subject: [PATCH 03/11] nvmem: exclude disconnected providers from callback
 admission
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261117-submit-nvmem-provider-lifetime-v1-v1-3-3cfbd48812b5@gmail.com>
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
X-CRM114-CacheID: sfid-20261117_113832_452920_85D35836 
X-CRM114-Status: GOOD (  17.24  )
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
existing SRCU domain. Serialize disconnection with consumer acquisition
under nvmem_mutex, keeping the module-reference acquisition inside that
critical section. Check sysfs permissions under SRCU as well, since the
operations pointer may already have been cleared.

Share the disconnect sequence between unregister and registration unwind.

Fixes: 6a7b4134fb7a ("nvmem: protect nvmem_device::ops with SRCU")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c | 77 ++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 18 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 73aa53145f0b..c41266241f3f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -307,10 +307,14 @@ static ssize_t bin_attr_nvmem_write(struct file *filp, struct kobject *kobj,
 
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
 
@@ -351,7 +355,12 @@ static umode_t nvmem_attr_is_visible(struct kobject *kobj,
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
@@ -673,6 +682,10 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
 	struct nvmem_cell_entry *cell;
 	int rval;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	cell = kzalloc_obj(*cell);
 	if (!cell)
 		return -ENOMEM;
@@ -815,6 +828,10 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_node *np)
 	const __be32 *addr;
 	int len, ret;
 
+	guard(srcu)(&nvmem->srcu);
+	if (!srcu_dereference(nvmem->ops, &nvmem->srcu))
+		return -ENODEV;
+
 	for_each_child_of_node_scoped(np, child) {
 		struct nvmem_cell_info info = {0};
 
@@ -871,8 +888,11 @@ int nvmem_layout_register(struct nvmem_layout *layout)
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
 
@@ -894,6 +914,17 @@ void nvmem_layout_unregister(struct nvmem_layout *layout)
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
@@ -1067,10 +1098,8 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
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
@@ -1083,19 +1112,15 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
-	struct nvmem_operations *ops;
-
 	if (!nvmem)
 		return;
 
 	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
-	ops = rcu_replace_pointer(nvmem->ops, NULL, true);
-	synchronize_srcu(&nvmem->srcu);
+	nvmem_disconnect(nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
-	kfree(ops);
 
 	device_unregister(&nvmem->dev);
 }
@@ -1135,17 +1160,33 @@ struct nvmem_device *devm_nvmem_register(struct device *dev,
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
