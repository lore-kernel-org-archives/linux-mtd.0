Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A2F60A2615
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 16:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aZ7dgwK8;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNRpqx1z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I1+aSmCq6nEpNfk3VW81/j5Oe4T7Tdl9Vbg5jPLpWmw=; b=aZ7dgwK8iidCnzoS4CiY3vKoIN
	9QFLjmotaFANcsxanGAN74HCKLA+LShL3767xlr9Q1ciTxLY3RZLZjQ0UesU5mdPp99FP5e4lPfGJ
	LMKNO3jlbpuuZtRhHqS2BvO3Wkwdq/Dyh5LqlXklroozeWDhzNiYkoEQTrvGBYMIyUXsJ6a6hdFfw
	3txGaPosdDuyEmWzjcjh9emfJTcJHlPuxBTEdwq8luTuP9e1Toxo1iKEsI5M01Lda0vvqwucxs0Yc
	YyceXsFlz3w2N3Na8bPQibryB0UdKGLP/iJRvRpRieTw1OdoUZ9QNPOwAxNzWUcyGQ4Ej3jhwDM9J
	8gVwvMqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Dd-0000000Ch2R-3XcV;
	Thu, 19 Nov 2026 16:42:41 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5Da-0000000Cgvq-2hVL
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 16:42:40 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-71af0656bedso1610095eaf.0
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106558; x=1795711358; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=eNRpqx1z2smTwcs/RBSuK++N/mXgJYeyBwyOMihSFLtNo1PIa4Z+kpsGxrIPPw2/h4
         Cf6rkWqT6Cm21bq3LQbkEsWYpzocaNjS9SEVSDBTFpVf5KoZSVnHmEDBxmKx+DVGUESB
         h8GFZvokWeOlIFx53KFhvnpd30DTt1NZVW6Uw/9qsxSSm2LHrI4MqHX74kJVtMF94okD
         hjBcxKIbFFkBcTQCexPszxF7dj861UXUTQ8pPeaFJ4WM72XEB1O4ldGzzSVSkiOD4Trm
         6pyzVqMHnH4EEa8VBXXeTUviKKENM7J4M8QGVIGCyecWCzXsJTuZLIgD63N8m9/+/IuR
         bA+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106558; x=1795711358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6YziSWU9Vv/SSiOeWoNYhrCtlddrN7QMjXsUxwqwUE=;
        b=SZLdfXKTrRE5GFlImc6rzEbSOY52IfUmhRQ/YPEAMMotmj2l0baRw5fVmxXJkbA/fP
         Oq3nNIsNSuj2rAvzkbVxsRJdfc1VrRrR5Mom/xiM3i5Z5Le+w7CUZq6GZfHjEcqe4loE
         PizlJym4gV+yyvRsiepy8Dpj4URr0w0O5jcWKu+IXojNwjV/QsNOdQ7PCWlxopE7aja3
         5JHqGJHFoh3NuttqT/LxYOmJbE/KqZItx2RE7z93euW//rGbhIWfuA4XkVsjgLsiq4Zb
         ncUwP0/f/TgRGAG1b6JjXEgmH9LZcxhbh7uiO/aajCwqsn7wo8Fu81fepsXkQkMW58ce
         e+QA==
X-Forwarded-Encrypted: i=1; AL+hErETo4XHaB+dX3zCHPT/aJp8bCyf6YigdO0uUewXOGV1301zdMM7BAKO9BMwbEhWQq+VqtUnO+Q6clU=@lists.infradead.org
X-Gm-Message-State: APuU4Z861P7gLqGdPk0NmhdDjpOfW4a1BnJf5AanxByMxpX+ic/FqIwt
	W9mEvXAhCks8ecvu0rL3BJgJ5NxIoOaGIikmjjYZgUhNUrBGwUedO5dU
X-Gm-Gg: AYBFou3mlIzCX4ZgZPm0kZFVb1oDF+YO0ML/BFx9ynyLRLHjxf4AGojySja9slRZT8M
	Q2upgJBelNjYNKbOU1ZkA/twufbGx4j94Ide6ZJ0ThRBvOl2QLujQs1T8gtur9KrZ/bjizeXlNA
	2+ysgpUCrJUWmbSn6fzUWHDUrGsvMc2+Dlg85fbe3ivFTtkr/moS0ed9THLRdFj8p1NUn4PzYaw
	N6/yBMz/QrJ4t/M4F+CXD9wKbNt5yDYbuDhxCXe2yG7e6fV8/CgF+Wq/P2rrKM+A6YOOKNn6ty/
	YN7v5NspCDULi5fdyngIrDpdRXS/t7c2xW+PH0ADVGiXxHigRvWXR8SZEau7Hu828Y4iJOjPjNZ
	NJLozcEacsr1DOs5kVb/Q+l24Hi1EzXsJVS1250ltodUQ1ec79+JNoArW5ulfAb8vr2ckRc6COe
	LqfeNWYlarYhWbD2D4r2HbEYrWD9mjbQ38ZLqohQoOs2dRBMyvLv8fYhv3GJWUKeetnwoLNX4dO
	qPnRxuH3ke5jxBiL9lQJ29QoupZnqRpYJHrJxXflrts0nzhxB6VBhQxIiM8u7idKE4hCgiIRJSr
	veM3djF8T/ZeQMy8aRRygPvVH4wACcJfp0xD7rWFQbOPdt39eV98jmarOq8DJouNhD+wCpwzZG3
	OHdFMZ5wSfTF8hM/pzQoxt3UK7ZZDHHZ6Ng0ubkyzOrsm+RFcH+DykX3fcfNsHN5+jSUn+zkzxv
	K/ypSfyQcMdGrp8G1u1woSNeFKytQUjdwhCxYWmOddQUH97l44NzA=
X-Received: by 2002:a05:6820:c5c1:20b0:71a:ef8b:4765 with SMTP id 006d021491bc7-71b394b825fmr83275eaf.47.1795106557798;
        Thu, 19 Nov 2026 08:42:37 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm341975eaf.13.2026.11.19.08.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 19 Nov 2026 09:42:07 -0700
Subject: [PATCH v2 09/11] nvmem: disconnect published devices before
 registration rollback
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261119-submit-nvmem-provider-lifetime-v1-v2-9-8fca3ec5f18c@gmail.com>
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
X-CRM114-CacheID: sfid-20261119_084238_744105_79443903 
X-CRM114-Status: GOOD (  14.59  )
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

Registration can fail after the NVMEM device is visible and a layout has
published cells. Disconnect the provider before destroying that layout
and deleting the device, just as for normal unregister. This prevents
layout removal from rebuilding attributes while rollback removes them.

Reuse nvmem_unregister() for failures after device_add(). Track whether
the registration notification was emitted so an unsuccessful registration
does not generate an unmatched removal notification.

Document when providers may release their callback state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 22 ++++++++++++----------
 include/linux/nvmem-provider.h |  3 +++
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index edc2f61e6e0a..e878931f375f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -27,6 +27,7 @@
 #define to_nvmem_device(d) container_of(d, struct nvmem_device, dev)
 
 #define FLAG_COMPAT		BIT(0)
+#define FLAG_REGISTERED		BIT(1)
 struct nvmem_cell_entry {
 	struct kref		refcnt;
 	bool			disconnected;
@@ -1181,7 +1182,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	rval = nvmem_populate_layout(nvmem);
 	if (rval)
-		goto err_remove_dev;
+		goto err_unregister;
 
 	/* If the device has WP GPIO, default to read-only */
 	if (nvmem->wp_gpio)
@@ -1190,20 +1191,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 #ifdef CONFIG_NVMEM_SYSFS
 	rval = nvmem_populate_sysfs_cells(nvmem);
 	if (rval)
-		goto err_destroy_layout;
+		goto err_unregister;
 #endif
 
+	nvmem->flags |= FLAG_REGISTERED;
 	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
 
 	return nvmem;
 
-#ifdef CONFIG_NVMEM_SYSFS
-err_destroy_layout:
-	nvmem_destroy_layout(nvmem);
-#endif
-err_remove_dev:
-	nvmem_sysfs_remove_cells(nvmem);
-	device_del(&nvmem->dev);
+err_unregister:
+	nvmem_unregister(nvmem);
+	return ERR_PTR(rval);
 err_remove_compat:
 	nvmem_sysfs_remove_compat(nvmem);
 err_put_device:
@@ -1218,6 +1216,9 @@ EXPORT_SYMBOL_GPL(nvmem_register);
  * nvmem_unregister() - Unregister previously registered nvmem device
  *
  * @nvmem: Pointer to previously registered nvmem device.
+ *
+ * Stop and drain provider callbacks before returning. Existing consumers keep
+ * their core-owned metadata, but further access returns -ENODEV.
  */
 void nvmem_unregister(struct nvmem_device *nvmem)
 {
@@ -1225,7 +1226,8 @@ void nvmem_unregister(struct nvmem_device *nvmem)
 		return;
 
 	nvmem_disconnect(nvmem);
-	srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
+	if (nvmem->flags & FLAG_REGISTERED)
+		srcu_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
 
 	nvmem_sysfs_remove_compat(nvmem);
 	nvmem_destroy_layout(nvmem);
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index e0638bd50d1f..ba11c807593b 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -107,6 +107,9 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Provider callbacks and @priv must remain valid until nvmem_unregister()
+ * returns, or until a failed nvmem_register() returns.
  */
 struct nvmem_config {
 	struct device		*dev;

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
